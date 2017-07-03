module Main where

import Prelude

import Common (log)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Unsafe (unsafePerformEff)
import DOM (DOM)
import DOM.Event.EventTarget (EventListener, addEventListener)
import DOM.Event.Types (EventType(EventType))
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Types (documentToEventTarget)

foreign import onClick :: forall e. EventListener e

main :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
main = do
  log "hello"
  d <- window >>= document
  addEventListener (EventType "click") onClick false (documentToEventTarget $ htmlDocumentToDocument d)

u :: Unit
u = unsafePerformEff main
