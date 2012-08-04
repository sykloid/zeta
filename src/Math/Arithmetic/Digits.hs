-- | Funtions for dealing with the digital representation of integers.
module Math.Arithmetic.Digits (
    digits,
    undigits,

    digitsB,
    undigitsB
) where

import Data.Char (digitToInt)

-- | Decomposes an integer into its representation in base 10, with least significant digit first.
digits :: Integer -> [Integer]
digits = reverse . map (fromIntegral . digitToInt) . show

-- | Recomposes a list of digits in base 10 to the corresponding integer.
undigits :: [Integer] -> Integer
undigits = sum . zipWith (*) (iterate (*10) 1)

-- | Decomposes an integer into its representation in a given base, with least significant digit first.
digitsB :: Integer -> Integer -> [Integer]
digitsB _ 0 = []
digitsB b n =  r : digitsB b q where (q, r) = n `quotRem` b

-- | Recomposes a list of digits into an integer using the given base.
undigitsB :: Integer -> [Integer] -> Integer
undigitsB b = sum .zipWith (*) (iterate (*b) 1)
