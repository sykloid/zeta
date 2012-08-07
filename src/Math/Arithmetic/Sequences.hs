-- | Common Integer Sequences
module Math.Arithmetic.Sequences (
    fibonacci,
    fibonacci'
) where

import Data.Bits
import Data.List

-- | The Fibonacci Sequence
fibonacci :: [Integer]
fibonacci = 0 : scanl (+) 1 fibonacci

-- | Determines the @n@th Fibonacci Number.
-- Taken from <http://www.haskell.org/haskellwiki/The_Fibonacci_sequence#Fastest_Fib_in_the_West>
fibonacci' :: Integer -> Integer
fibonacci' n = snd . foldl' f (1, 0) $ dropWhile not bitMask
  where
    n' = fromIntegral n :: Int
    s = bitSize n'
    bitMask = [testBit n' k | k <- [s - 1, s - 2 .. 0]]
    f (m, k) p
        | p         = (m * (m + 2 * k), m * m + k * k)
        | otherwise = (m * m + k * k, k * (2 * m - k))
