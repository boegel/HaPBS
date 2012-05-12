import System (getArgs)

import HAPBS

main :: IO()
main = do
        args <- getArgs
        let server = head args
        putStrLn "Well hello there!"
        ec <- pbsConnect server
        putStrLn $ "exit code: " ++ (show ec)
        if ec == 0 then putStrLn "Connection OK!"
                   else putStrLn "Connected FAILED."
