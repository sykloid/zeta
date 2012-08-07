-- | Common Integer Sequences
module Math.Arithmetic.Sequences (
    fibonacci,
) where

-- | The Fibonacci Sequence
fibonacci :: [Integer]
fibonacci = 0 : scanl (+) 1 fibonacci
