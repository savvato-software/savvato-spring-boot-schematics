
class outputWriter:

    def doIt(text, outputPath):

        f = open(outputPath, "w")

        f.write(text)

        f.close();
