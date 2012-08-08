module Math.Arithmetic.Primality.Test (tests) where

import Data.List (sort)

import Test.HUnit hiding (Test)
import Test.QuickCheck

import Test.Framework.Providers.API
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

import Math.Arithmetic.Divisibility
import Math.Arithmetic.Primality

case_primes_small :: Assertion
case_primes_small = takeWhile (<1000000) primes @=? filter isPrime [1 .. 1000000]

prop_isPrime_invariant :: Integer -> Property
prop_isPrime_invariant n = isPrime n ==> not $ any (%? n) [2 .. n - 1]

prop_factorization_invariant :: Integer -> Property
prop_factorization_invariant n = n > 0 ==> product [a ^ b | (a, b) <- factorization n] == n

prop_factorization_primeFactors :: Integer -> Property
prop_factorization_primeFactors n = n > 1 ==> all isPrime (factors n)

prop_divisors_invariant :: Integer -> Property
prop_divisors_invariant n = n > 0 ==> (sort $ divisors n) == filter (%? n) [1..n]

prop_phi_invariant :: Integer -> Property
prop_phi_invariant n = n > 1 ==> (fromIntegral . length $ filter (\x -> gcd x n == 1) [1..n]) == phi n

prop_sigma_invariant :: Integer -> Integer -> Property
prop_sigma_invariant k n = k >= 0 && n > 1 ==> sum [d ^ k | d <- divisors n] == sigma k n

tests :: [Test]
tests = [
        testGroup "Primes" [
                testCase "Small Primes" case_primes_small
            ],
        testGroup "Primality Test" [
                testProperty "Primality Test Invariant" prop_isPrime_invariant
            ],
        testGroup "Factorization" [
                testProperty "Factorization Invariant" prop_factorization_invariant,
                testProperty "Primality of Factors" prop_factorization_primeFactors,
                testProperty "Divisors Invariant" prop_divisors_invariant
            ],
        testGroup "Multiplicative Functions" [
                testProperty "Phi Invariant" prop_phi_invariant,
                testProperty "Sigma Invariant" prop_sigma_invariant
            ]
    ]
