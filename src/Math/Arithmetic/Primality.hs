module Math.Arithmetic.Primality (
    primes,
    isPrime
) where

import qualified Data.Numbers.Primes as P

import Math.Arithmetic.Divisibility

-- | An infinite list of prime numbers.
primes :: [Integer]
primes = P.primes

-- | Determine if the given integer is prime.
isPrime :: Integer -> Bool
isPrime n
    | n <= 1 = False
    | n == 2 = True
    | otherwise = not . any (%? n) $ takeWhile (<=root) primes
  where
    root = ceiling . sqrt $ (fromIntegral n :: Double)
