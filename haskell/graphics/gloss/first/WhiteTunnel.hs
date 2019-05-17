
module WhiteTunnel (whiteTunnel) where

import Graphics.Gloss


main = whiteTunnel

whiteTunnel = animate (InWindow "Hey" (500,500) (20, 20))
               black frame

frame time = Scale y y
             $ Color white tunnel
           where y = 0.01 * exp (0.5 * time)

picture = Color white tunnel

tunnel = Pictures [Circle x | x <- a]
       where a = map f [-10..18]
             f x = exp (0.3 * x)