import os, checker, utils, asyncdispatch

proc main() = 
    if paramCount() == 1:
        let linksFile = paramStr(1)
        let links = readLinks(linksFile)
        echo "Checking links sequentially:"
        sequentialChecker(links)
        echo "\nChecking links asynchronously:"
        waitFor asyncChecker(links)
    else:
        echo "Usage: nimble run -- <links_file>"
    
main()