-- | Functions for dealing with the divisibility of integers.
module Math.Arithmetic.Divisibility (
    (//),
    (%%)
) where

-- | An operator alias for 'div', for convenience.
(//) :: Integer -> Integer -> Integer
(//) = div

-- | An operator alias for 'mod', for convenience.
(%%) :: Integer -> Integer -> Integer
(%%) = mod
