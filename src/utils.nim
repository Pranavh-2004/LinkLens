import strutils, os

proc readLinks*(fileName: string): seq[string] =
    if fileExists(fileName):
        return readFile(fileName).splitLines()
    else:
        echo "File not found: ", fileName
        return @[]