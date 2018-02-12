module Main where

import Control.Monad.Eff
import Control.Monad.Eff.Console
import Control.Monad.State.Trans
import Data.Array
import Data.Identity
import Data.Tuple
import Prelude

foreign import doS :: forall eff. String -> Array String -> Eff eff (Tuple String (Array String))

sm :: forall eff . String -> StateT (Array String) (Eff eff ) String
sm x = StateT $ doS x

mod s = map (\x -> x <> " stateMonad") s


fn x = do
  _ <- sm x
  newState <- get
  put ["hi"]
  modify mod

main = do
  Tuple a s <- runStateT (fn "init") []
  logShow s
