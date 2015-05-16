module Main where

import System.Random

chooseName :: RandomGen g => g -> [a] -> (a, g)
chooseName gen names = (names !! index, gen')
    where (index, gen') = randomR (0, length names - 1) gen

fullName :: String -> String -> String
fullName firstName lastName = firstName ++ " " ++ lastName
                          
main = do
  gen <- getStdGen
  maleFirstNamesContents <- readFile "male.txt"
  surnamesContents <- readFile "names.txt"
  let (maleFirstName, gen') = chooseName gen $ lines maleFirstNamesContents
      (surname, gen'') = chooseName gen' $ lines surnamesContents
  putStrLn $ fullName maleFirstName surname
