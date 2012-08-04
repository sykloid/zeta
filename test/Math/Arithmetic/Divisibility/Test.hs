module Math.Arithmetic.Divisibility.Test (tests) where

import Test.QuickCheck

import Test.Framework.Providers.API
import Test.Framework.Providers.QuickCheck2

import Math.Arithmetic.Divisibility

prop_check_everythingDividesZero :: Integer -> Property
prop_check_everythingDividesZero x = x /= 0 ==> x %? 0

prop_check_oneDividesEverything :: Integer -> Bool
prop_check_oneDividesEverything x = 1 %? x

prop_check_divisibilityOfMultiples :: Integer -> Integer -> Property
prop_check_divisibilityOfMultiples x y = x /= 0 ==> x %? (x * y)

tests :: [Test]
tests = [
        testGroup "Divisibility Check" [
                testProperty "Everything Divides Zero" prop_check_everythingDividesZero,
                testProperty "One Divides Everything" prop_check_oneDividesEverything,
                testProperty "Divisibility of Multiples" prop_check_divisibilityOfMultiples
            ]
    ]
