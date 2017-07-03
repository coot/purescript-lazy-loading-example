module Common ( log ) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console (log) as Eff
import Prelude (class Show, Unit, show, (<>))

log :: forall a e. Show a => a -> Eff (console :: CONSOLE | e) Unit
log a = Eff.log ("Common: " <> show a)
