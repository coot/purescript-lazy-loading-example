module Common
  ( log
  , Promise
  , then_
  ) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console (log) as Eff
import Prelude (class Functor, class Show, Unit, show, (<>))

log :: forall a e. Show a => a -> Eff (console :: CONSOLE | e) Unit
log a = Eff.log ("Common: " <> show a)

foreign import data Promise :: Type -> Type -> Type

foreign import then_ :: forall a b err. (a -> b) -> Promise err a -> Promise err b

instance functorPromise :: Functor (Promise e) where
  map f p = then_ f p
