import spacy
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

DHshowfull = open('DHshowfull.txt', 'r', encoding='utf8')
words = DHshowfull.read()
wordstrings = str(words)
print(wordstrings)

DHshowfull = nlp(wordstrings)
for token in DHshowfull:
    print(token.text, "---->", token.pos_, ":::::", token.lemma_)