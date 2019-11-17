module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just hamming
  where hamming = sum [1 | (x, y) <- zip xs ys, x /= y]
