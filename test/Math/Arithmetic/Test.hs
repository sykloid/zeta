module Math.Arithmetic.Test (tests) where

import Test.Framework.Providers.API

import qualified Math.Arithmetic.Digits.Test as Digits
import qualified Math.Arithmetic.Divisibility.Test as Divisibility

tests :: [Test]
tests = [
        testGroup "Digits" Digits.tests,
        testGroup "Divisibility" Divisibility.tests
    ]
