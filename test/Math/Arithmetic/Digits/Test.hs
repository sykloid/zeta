module Math.Arithmetic.Digits.Test (tests) where

import Test.QuickCheck

import Test.Framework.Providers.API
import Test.Framework.Providers.QuickCheck2

import Math.Arithmetic.Digits

prop_base10_roundtrip :: Integer -> Property
prop_base10_roundtrip n = n >= 0 ==> (undigits $ digits n) == n

prop_baseB_roundtrip :: Integer -> Integer -> Property
prop_baseB_roundtrip b n = b > 1 && n >= 0 ==> (undigitsB b $ digitsB b n) == n

tests :: [Test]
tests = [
        testGroup "Digits" [
                testProperty "Base 10 Roundtrip" prop_base10_roundtrip,
                testProperty "Base B Roundtrip" prop_baseB_roundtrip
            ]
    ]
