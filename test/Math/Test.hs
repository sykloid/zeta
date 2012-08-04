module Math.Test (tests) where

import Test.Framework.Providers.API

import qualified Math.Arithmetic.Test as Arithmetic

tests :: [Test]
tests = [
        testGroup "Arithmetic" Arithmetic.tests
    ]
