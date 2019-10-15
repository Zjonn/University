main :: IO ()
main = do
    game_loop [5, 5, 5, 5, 5]
    return ()

game_loop :: [Int] -> IO ()
game_loop map = do
    putStrLn "Row"
    row <- getLine
    if row == "q"
        then return ()
        else do
            putStrLn "Stars"
            stars <- getLine

            let row_nr   = read row :: Int
            let stars_nr = read stars :: Int

            let p_map    = player_move map row_nr stars_nr
            print_map p_map
            if is_end p_map
                then print "Player won"
                else
                    let c_map = comp_move p_map
                    in  do
                            print_map c_map
                            if is_end c_map
                                then print "Computer won"
                                else game_loop c_map

player_move :: [Int] -> Int -> Int -> [Int]
player_move maps 0 stars =
    let v = (head maps - stars)
    in  if v < 0 then 0 : (tail maps) else v : (tail maps)

player_move maps n stars =
    (head maps) : (player_move (tail maps) (n - 1) stars)

comp_move map = if head map > 0
    then (head map - 1) : (tail map)
    else (head map) : (comp_move (tail map))

is_end []        = True
is_end (hd : tl) = hd <= 0 && (is_end tl)

print_map maps = do
    print_rows maps
    print "-----------"

print_rows []   = return ()
print_rows maps = do
    print_char (head maps)     '*'
    print_char (5 - head maps) '.'
    putStr $ "\n"
    print_rows (tail maps)

print_char n c
    | n <= 0 = return ()
    | otherwise = do
        putStr . show $ c
        print_char (n - 1) c


