-- A tiny TCL Subset.
-- Copyright 2011 Henry Strickland (github.com/strickyak).
-- MIT License.

-- EXAMPLE:
--   ghc --make -package base tcl.hs run.hs joy.hs
--   # Produces binary './run'
--   echo 'set x [* 4 5]; incr x 3; lappend x cents; k $x' | ./run
--   echo 'joy {555 dup 404 swap}' | ./run

module Main
  where
import Control.Monad.State
import Text.ParserCombinators.Parsec hiding (State)
import qualified System.Environment
import qualified Data.Char(ord)
import qualified Data.Map as M
import qualified Numeric(readDec)
import Debug.Trace(trace)
import qualified TinyTcl
import qualified System.IO

main :: IO ()
main = do
  args <- System.Environment.getArgs
  let argv = if length args > 0 then tail args else []
  lines <- if length args > 0 then readFile $ head $ args else getContents
  putStrLn $ "INPUT: " ++ (show lines)
  (result, terp) <- runStateT (
      TinyTcl.evalProcBody ["argv"] lines [TinyTcl.joinTclList argv]
          ) TinyTcl.freshTerp
  putStrLn $ "END: " ++ (show terp)
  putStrLn $ "END: " ++ (show result)
