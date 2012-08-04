module Math.Arithmetic.Test (tests) where

import Test.Framework.Providers.API

import qualified Math.Arithmetic.Divisibility.Test as Divisibility

tests :: [Test]
tests = [
        testGroup "Divisibility" Divisibility.tests
    ]
