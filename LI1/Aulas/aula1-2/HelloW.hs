module Main where
foo :: Show a => a -> String
foo = undefined 
main = do putStrLn (foo 3)


