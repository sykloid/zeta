-- | Functions for dealing with the divisibility of integers.
module Math.Arithmetic.Divisibility (
    (//),
    (%%),

    (%?),
    (%!)
) where

-- | An operator alias for 'div', for convenience.
(//) :: Integer -> Integer -> Integer
(//) = div

-- | An operator alias for 'mod', for convenience.
(%%) :: Integer -> Integer -> Integer
(%%) = mod

-- | A divisibility check; succeeds if the first integer precisely divides the second.
(%?) :: Integer -> Integer -> Bool
(%?) a b = b %% a == 0

-- | A deep divisibility operator, where if @(s, t) = a %! b@, then @a^s * t == b@.
(%!) :: Integer -> Integer -> (Integer, Integer)
(%!) _ 0 = (1, 0)
(%!) 1 b = (1, b)
(%!) a b
    | a %? b = (1 + s, t)
    | otherwise = (0, b)
  where
    (s, t) = a %! (b // a)
