module Tests where

import qualified System.Random as R

import Control.Exception.Base

import Data.List
import Data.Function
import Data.Array

import GameState
import Botnakke

test = do print b
          putStrLn $ "enemyGrps: " ++ show enemyGrps
          putStrLn $ "weakest: " ++ show weakest
          putStrLn $ "closure: " ++ show closure
          putStrLn $ "freedomStrategy: " ++ show theStuff
            where theStuff = freedomStrategy is gs
                  gs = testGS6
                  b = board gs
                  leg = legalIndices b
                  is = filter (nextToEnemy gs) leg
                  enemyGrps = getEnemyGroups gs
                  weakest = (sortBy (on compare (freedoms b)) enemyGrps) !! 0
                  closure = nub $ concatMap neighbours $ weakest

testBoard1 = Board (listArray ((Idx 0 0), (Idx 18 18)) $
                    Free:Free:Free:(Stone Black):repeat Free)

testBoard2 = unwrapBoard ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,1,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,."

testBoard3 = unwrapBoard "1,.,.,1,.,1,.,1,.,1,.,1,.,1,.,1,.,.,.,.,1,1,.,1,1,1,.,1,.,1,.,1,.,1,.,1,1,.,1,1,.,1,1,.,1,1,.,1,.,1,1,1,.,1,1,.,1,.,1,1,1,.,1,1,.,1,.,.,1,.,1,1,1,.,1,.,1,1,.,1,1,1,1,1,.,1,1,.,1,.,1,.,1,.,1,1,.,1,1,1,.,1,1,1,1,.,1,.,1,.,1,.,1,1,.,1,1,.,1,1,1,.,1,.,1,.,1,.,1,.,1,1,.,1,1,.,1,.,.,1,1,.,1,.,1,.,1,.,1,.,1,1,1,.,1,.,1,1,1,.,1,1,.,1,1,.,1,1,.,1,.,1,1,.,1,.,1,.,1,.,1,1,1,.,1,1,1,.,1,1,.,1,.,1,1,.,1,1,1,1,.,1,1,1,.,1,.,1,.,1,1,.,.,1,.,1,.,1,.,1,0,0,0,1,1,1,.,1,.,1,1,1,1,1,.,.,1,1,.,1,0,1,1,0,1,1,0,1,0,1,1,0,0,1,1,0,1,1,.,0,0,.,0,0,0,.,0,.,.,0,.,.,.,0,.,.,0,.,.,0,0,0,0,.,0,0,0,0,.,0,0,0,0,0,0,.,0,.,.,.,1,0,.,0,0,.,.,0,.,.,0,.,0,0,0,.,.,.,0,0,0,.,0,1,.,0,0,0,.,0,.,.,.,.,0,0,.,0,.,0,0,0,0,.,.,0,0,.,0,.,0,0,.,0,.,0,.,.,0,.,0"

testBoard4 = unwrapBoard ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,0,0,0,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,0,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,0,0,0,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,0,.,0,.,.,.,.,.,.,.,1,.,.,.,.,.,.,0,.,0,.,0,.,.,.,.,.,.,.,0,.,.,.,.,.,.,0,0,0,0,0,.,.,.,.,.,0,1,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,."

testBoard5 = unwrapBoard ".,1,1,.,1,.,1,.,1,1,.,1,.,1,1,.,1,1,.,1,1,.,1,.,1,.,1,.,1,1,.,1,.,1,1,1,.,1,1,.,1,.,1,.,1,.,1,1,.,1,.,1,1,.,1,1,1,.,1,.,1,.,1,1,1,.,1,1,.,1,.,1,1,.,1,.,1,.,1,.,1,1,.,1,1,1,1,1,1,1,1,.,1,.,1,.,0,.,1,.,1,1,.,1,.,1,1,.,.,1,1,.,1,.,.,.,.,.,1,.,1,1,0,1,.,.,0,.,.,0,1,.,1,1,0,0,1,.,1,0,0,0,.,.,.,0,.,.,0,.,1,.,.,1,0,.,1,.,1,0,.,0,0,.,0,.,.,0,1,.,1,1,0,0,1,.,1,.,1,.,0,.,0,0,0,0,.,1,1,.,.,1,1,.,1,.,1,.,0,0,0,0,0,.,0,1,.,1,1,1,1,.,1,1,1,.,1,0,.,0,0,.,.,0,1,1,1,.,1,.,1,1,.,1,1,0,.,0,0,0,0,.,1,.,1,.,1,.,1,1,.,1,0,0,.,0,.,.,0,0,0,0,1,0,1,.,.,.,0,1,0,.,0,0,0,0,.,0,0,0,0,0,0,0,1,.,.,0,0,.,0,.,0,1,.,.,.,0,0,.,0,0,.,1,.,0,.,0,.,.,.,1,.,1,.,.,0,0,0,0,.,1,.,1,0,.,0,1,.,1,.,1,1,1,.,0,0,0,.,0,.,1,.,1,.,1,.,1,.,1,1,.,1,0,.,.,.,.,0,.,."

testBoard6 = unwrapBoard ".,0,-1,0,0,-1,0,.,.,0,.,.,.,.,.,.,.,.,.,.,.,0,.,.,0,-1,0,0,-1,0,.,1,.,.,.,.,0,.,.,.,.,.,.,.,0,0,-1,0,.,.,.,1,1,.,0,-1,0,0,.,.,.,.,.,0,-1,0,-1,1,.,1,-1,0,0,-1,0,0,-1,0,.,.,1,.,.,0,-1,0,.,.,.,0,-1,0,0,0,-1,0,.,.,1,.,0,1,.,0,-1,0,.,0,-1,0,.,.,.,0,.,1,1,1,.,.,1,.,.,0,-1,0,-1,0,-1,0,.,.,0,.,1,.,.,1,.,1,.,.,.,0,.,0,.,0,.,.,0,-1,1,.,.,.,.,.,.,.,.,1,1,.,.,.,.,.,0,-1,0,1,1,.,1,1,.,.,.,.,1,.,.,.,.,.,1,.,0,.,1,1,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,1,.,.,.,1,.,.,.,.,.,1,.,.,0,.,.,0,.,.,1,.,.,.,.,.,1,.,.,.,.,1,.,1,.,0,-1,0,.,1,.,.,.,.,1,.,.,.,1,.,1,.,.,0,-1,0,-1,.,.,.,.,.,.,.,.,1,1,.,.,1,1,.,0,0,-1,0,.,.,1,.,.,1,.,.,.,.,1,1,-1,1,0,-1,0,0,.,.,.,.,1,.,.,.,.,.,0,-1,0,1,1,-1,0,.,.,.,.,0,.,.,1,.,0,.,0,-1,0,-1,0,-1,0,-1,0,0,.,0,-1,0,.,.,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,1,0"

testBoard7 = unwrapBoard ".,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,."

testBoard8 = unwrapBoard ".,.,.,1,1,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,0,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,1,.,.,.,1,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,1,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,1,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,0,.,.,.,.,.,1,.,.,.,.,0,.,0,.,.,."

testGS1 = GameState {myColor = White, board = testBoard1, timePerMove = 200}
testGS2 = GameState {myColor = White, board = testBoard2, timePerMove = 200}
testGS3 = GameState {myColor = White, board = testBoard3, timePerMove = 200}
testGS4 = GameState {myColor = White, board = testBoard4, timePerMove = 200}
testGS5 = GameState {myColor = White, board = testBoard5, timePerMove = 200}
testGS6 = GameState {myColor = Black, board = testBoard6, timePerMove = 200}
testGS7 = GameState {myColor = White, board = testBoard7, timePerMove = 200}
testGS8 = GameState {myColor = White, board = testBoard8, timePerMove = 200}

testStrategy :: Strategy -> GameState -> IO ()
testStrategy strategy gameState = do
  let idxs = legalIndices (board gameState)
  gen <- R.newStdGen
  print $ strategy idxs gameState gen

testTry = let
  time = (10 ^ 6) -- 10^6 "=" (appr.) 1 second
  s = protStrat2
  gs = testGS8
  idxs = legalIndices (board gs)
  in do gen <- R.getStdGen
        tryStrategy time s idxs gs gen


fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

testFBA = do findBestAction testGS1 (10^6)
