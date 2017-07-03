module Click ( onClick ) where

import Common (log)
import Control.Monad.Eff.Console (CONSOLE)
import DOM.Event.EventTarget (EventListener, eventListener)

onClick :: forall e. EventListener ( console :: CONSOLE | e)
onClick = eventListener (\_ -> log "Hello World!")
