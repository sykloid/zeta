module Math.Arithmetic.Primality (
    primes
) where

import qualified Data.Numbers.Primes as P

-- | An infinite list of prime numbers.
primes :: [Integer]
primes = P.primes
