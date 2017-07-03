module Main where

import Prelude

import Common (Promise)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Unsafe (unsafePerformEff)
import DOM (DOM)
import DOM.Event.EventTarget (EventListener, addEventListener, eventListener)
import DOM.Event.Types (Event, EventType(EventType))
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Types (documentToEventTarget)
import Unsafe.Coerce (unsafeCoerce)

foreign import clickFn :: forall e err eff. Event -> Eff eff (Promise err { onClick :: EventListener e })

main :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
main = do
  d <- window >>= document
  addEventListener
    (EventType "click")
    (eventListener (\event -> do
        promise <- clickFn event
        pure $ runClick event promise
      )
    )
    false
    (documentToEventTarget $ htmlDocumentToDocument d)

 where
   runListener :: forall e1. EventListener e1 -> Event -> Unit
   runListener fn e = unsafeCoerce fn e

   runClick :: forall e2 err. Event -> Promise err { onClick :: EventListener e2 } -> Promise err Unit
   runClick event promise = (\{onClick} -> runListener onClick event) <$> promise

u :: Unit
u = unsafePerformEff main
