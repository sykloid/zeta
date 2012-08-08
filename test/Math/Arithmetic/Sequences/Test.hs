module Math.Arithmetic.Sequences.Test (tests) where

import Test.HUnit ((@=?), Assertion)
import Test.QuickCheck

import Test.Framework.Providers.API
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

import Math.Arithmetic.Sequences

prop_fibonacci_invariant :: Integer -> Bool
prop_fibonacci_invariant n
    | n == 0 = fibonacci' n == 0
    | n == 1 = fibonacci' n == 1
    | otherwise = fibonacci' n + fibonacci' (n + 1) == fibonacci' (n + 2)

case_fibonacci_sequenceLookupEquivalence :: Assertion
case_fibonacci_sequenceLookupEquivalence = take 100 fibonacci @=? map fibonacci' [0..99]

tests :: [Test]
tests = [
        testGroup "The Fibonacci Sequence" [
                testProperty "Fibonacci Sequence Invariant" $ mapSize (`div` 100) prop_fibonacci_invariant,
                testCase "Fibonacci Sequence Lookup Equivalence" case_fibonacci_sequenceLookupEquivalence
            ]
    ]
