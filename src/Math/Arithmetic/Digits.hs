-- | Funtions for dealing with the digital representation of integers.
module Math.Arithmetic.Digits (
    digits,
    undigits
) where

import Data.Char (digitToInt)

-- | Decomposes an integer into its representation in base 10, with least significant digit first.
digits :: Integer -> [Integer]
digits = reverse . map (fromIntegral . digitToInt) . show

-- | Recomposes a list of digits in base 10 to the corresponding integer.
undigits :: [Integer] -> Integer
undigits = sum . zipWith (*) (iterate (*10) 1)
