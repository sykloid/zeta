import Test.Framework.Providers.API
import Test.Framework.Runners.Console

import qualified Math.Test as Math

tests :: [Test]
tests = [
        testGroup "Math" Math.tests
    ]

main :: IO ()
main = defaultMain tests
