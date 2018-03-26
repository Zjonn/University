#!/usr/bin/python3
import subprocess

PROGRAM_NAME = "prac"
TESTS_DIR_PATH = "tests"


def test():
    tests = getTestsFromDir()
    testProg(tests)


def getTestsFromDir():
    return subprocess.check_output(["ls", TESTS_DIR_PATH]).decode("utf-8").split()


def testProg(tests):
    incorrect = 0

    for test in tests:
        try:
            (arg, out) = getTestBody(test)
        except ValueError as e:
            arg = getTestBody(test)
            out = ""

        (progOut, returnCode) = invokeProg(arg)
        if not equals(out, progOut):
            incorrect += 1
            printErr(test, returnCode, progOut, out)

    if incorrect == 0:
        print("All tests passed")


def getTestBody(test):
    testBody = readFromFile(test)
    return parseTest(testBody)


def invokeProg(arg):
    p = subprocess.run(["./"+PROGRAM_NAME],
                       input=" ".join(arg),
                       stdout=subprocess.PIPE,
                       encoding="utf-8")
    return (p.stdout, p.returncode)


def readFromFile(test):
    with open(TESTS_DIR_PATH + "/" + test, 'r') as content_file:
        content = content_file.read()
    return content


def parseTest(testBody):
    return testBody.split(';')


def equals(a, b):
    a = a.replace("\n", " ").strip()
    b = b.replace("\n", " ").strip()
    return a == b


def printErr(test, returnCode, progOut, expectedOut):
    print("Test \"" + test + "\" fail with exit code: " + str(returnCode))
    print("Program returned:\n" + progOut)
    #print("Expected output: " + expectedOut)


test()
