# Our challenge: read in multiple text files from a directory:
# Our resource: The Python os module + a handy code example:
#  https://www.geeksforgeeks.org/how-to-read-multiple-text-files-from-folder-in-python/
import spacy
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
# AFTER THE FIRST DOWNLOAD, COMMENT OUT the spacy.cli.download(...) variable.
# Your spaCy language model will already be stored in your Python environment.
# ABOUT WHAT SPACY SHOULD LOAD: Some tutorials direct us to en_core_web_md
# There are _sm, _md, and _lg models built into spaCy. Each takes up more space than the others, but
# contains more data so may be more accurate/precise.
# If we try the sm model, we're told that it does not have word vectors loaded, so it uses tagger, parser and NER
# entity recognition to calculate similarity instead. Better to switch to the md model--but worth comparing results!

import os

##############################
# OBJECTIVE: Find out which words in my document are most similar to a particular word of interest
# How to find this using spaCy similarity vectors?

# Helpful resource for spaCy similarity calculation based on a selected word:
# https://stackoverflow.com/questions/55921104/spacy-similarity-warning-evaluating-doc-similarity-based-on-empty-vectors
##############################

# Just add the import line

# commenting out in Pycharm: find keystroke under Code >> Comment with line comment

# ebb: Identify a file directory with text files to explore:
# ebb: os.cwd returns the current working directory path

workingDir = os.getcwd()
print("current working directory: " + workingDir)

# os.listdir lists files and folders inside a path:
insideDir = os.listdir(workingDir)
print("inside this directory are the following files AND directories: " + str(insideDir))

# use os.path.join to connect the subdirectory to the working directory:
CollPath = os.path.join(workingDir, 'textCollection')
print(CollPath)

def readTextFiles(filepath):
    with open(filepath, 'r', encoding='utf8') as f:
        readFile = f.read()
        # print(readFile)
        stringFile = str(readFile)
        lengthFile = len(readFile)
        print(lengthFile)
# ebb: add that utf8 encoding argument to the open() function to ensure that reading works on everyone's systems
# this all succeeds if you see the text of your files printed in the console.
        tokens = nlp(stringFile)
        # playing with vectors here
        vectors = tokens.vector

        wordOfInterest = nlp(u'comedy')
        # print(wordOfInterest, ': ', wordOfInterest.vector_norm)

        # Now, let's open an empty dictionary! We'll fill it up with the for loop just after it.
        # The for-loop goes over each token and gets its values
        highSimilarityDict = {}
        for token in tokens:
            if(token and token.vector_norm):
                # if token not in highSimilarityDict.keys(): # Alas, this did not work to remove duplicates from my dictionary. :-(
                if wordOfInterest.similarity(token) > .3:
                    highSimilarityDict[token] = wordOfInterest.similarity(token)
                    # The line above creates the structure for each entry in my dictionary.
                        # print(token.text, "about this much similar to", wordOfInterest, ": ", wordOfInterest.similarity(token))
        print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        # print(highSimilarityDict)

        # ebb: When I printed the highSimilarityDict, I noticed that there are duplicate entries.
        # I tried a couple of strategies to remove them. One is commented-out above.
        # The strategy below actually worked, and I based it on this example:
        # https://tutorial.eyehunts.com/python/python-remove-duplicates-from-dictionary-example-code/
        highSimilarityReduced = {}
        for key, value in highSimilarityDict.items():
            if value not in highSimilarityReduced.values():
                highSimilarityReduced[key] = value
        print(highSimilarityReduced)
        print(len(highSimilarityReduced.items()), " vs ", len(highSimilarityDict.items()))

        # ebb: For this next part, it's YOUR TURN to write some modifying code.
        # We should sort the highSimilarityReduced dictionary by values from high to low,
        # but sorting is a little tricky because we need to isolate the **value**
        # not the key.
        # HOW TO DO IT? SEE https://www.freecodecamp.org/news/sort-dictionary-by-value-in-python/

        # So you should read the WHOLE tutorial to see how to convert this back into a dictionary again
        # and do that in your code here.

# ebb: This controls our file handling as a for loop over the directory:
for file in os.listdir(CollPath):
    if file.endswith(".txt"):
        filepath = f"{CollPath}/{file}"
        print(filepath)
        readTextFiles(filepath)

related_words = {'premise': 0.31, 'show': 0.45, 'titled': 0.31, 'brilliant': 0.33, 'comedy': 1.0, 'comedic': 1.0, 'misadventures': 0.35,
                'episode': 0.49, 'hilarious': 0.46, 'actors': 0.41, 'character': 0.44, 'eccentric': 0.31, 'wacky': 0.39, 'fictional': 0.34,
                'cast': 0.42, 'quirky': 0.39, 'film': 0.64}
sorted_words = sorted(related_words.items(), key=lambda x: x[1], reverse=True)
print(sorted_words)
# "Here is a list of the words most associated with 'comedy', sorted from lowest to highest association: " +