import os, unittest
import ../src/checker  

suite "Link Checker Tests":
    test "Sequential Checker":
        sequentialChecker(@["https://google.com", "https://invalid.url"])
    test "Async Checker":
        waitFor asyncChecker(@["https://google.com", "https://invalid.url"])