module Math.Arithmetic.Test (tests) where

import Test.Framework.Providers.API

import qualified Math.Arithmetic.Digits.Test as Digits
import qualified Math.Arithmetic.Divisibility.Test as Divisibility
import qualified Math.Arithmetic.Primality.Test as Primality
import qualified Math.Arithmetic.Sequences.Test as Sequences

tests :: [Test]
tests = [
        testGroup "Digits" Digits.tests,
        testGroup "Divisibility" Divisibility.tests,
        testGroup "Primality" Primality.tests,
        testGroup "Sequences" Sequences.tests
    ]
