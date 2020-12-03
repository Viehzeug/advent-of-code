import System.IO

val :: String -> Int -> Int
val str pos
    | c == '#' = 1
    | otherwise = 0
    where c = str !! mod pos (length str)

task1 :: [String] -> Int -> Int -> Int -> Int
task1 [] _ _ _ = 0
task1 (line:map) down right pos = val line pos + task1 (drop (down-1) map) down right (pos+right)

main = do  
     contents <- readFile "in.txt"
     let mapLines = lines $ contents
     putStrLn $ show $ task1 mapLines 1 3 0
     let task2 = product [task1 mapLines down right 0 | (right, down) <- [(1,1),(3,1),(5,1),(7,1),(1,2)]]
     putStrLn $ show task2