module Main where

import Control.Monad.Eff
import Control.Monad.Eff.Class
import Control.Monad.Eff.Console
import Control.Monad.State.Trans
import Data.Array
import Data.Identity
import Data.Tuple
import Prelude


fn :: forall eff. String -> StateT (Array String) (Eff (console :: CONSOLE | eff)) Unit
fn x = do
  put [x]
  newState <- get
  liftEff $ logShow newState
  modify (\s -> append s ["bar"])

main = do
  Tuple a s <- runStateT (fn "init") []
  logShow s
  pure unit
