# Python Test
## Graydon Kupfer

```
def readTextFiles(filepath):
    with PySaxonProcessor(license=False) as proc:
        xml = open(filepath, encoding='utf-8').read()
        xp = proc.new_xpath_processor()
        node = proc.parse_xml(xml_text=xml)
        xp.set_context(xdm_item=node)

        xpath = xp.evaluate('//dialogue ! normalize-space() => string-join()')
        string = str(xpath)
        cleanedUp = regex.sub("_", " ", string)
        cleanedUp = regex.sub(r"'([A-Z])]", r" \1", cleanedUp)
        cleanedUp = regex.sub(r"([.!?;'`])([A-Z'`]])", r"\1 \2", cleanedUp)
        tokens = nlp(cleanedUp)

        dictEntities = entitycollector(tokens)
        print(f"{dictEntities=}")
        return(dictEntities)
```

This function is meant to output dictionary entries. It establishes the ```filepath``` and ```xpath```, converts ```xpath``` to a string value, and cleans it using regex. It then defines the clean strings as ```tokens``` and performs natural language processing on them. ```tokens``` is collected as ```dictEntities```, which is then printed and returned.

```
def entitycollector(tokens):
    entities = {}
    for ent in sorted(tokens.ents):
        if ent.label_ == "LOC" or ent.label_=="FAC" or ent.label_=="ORG" or ent.label_=="GPE" or ent.label_=="NORP" or ent.label_=="PERSON":
            if not regex.match(r"\w*[.,!?;:']\w*", ent.text):
                entities[ent.text] = ent.label_
    print(f"{entities=}")
    return entities
```

This function collects ```tokens``` and outputs them as autotagged ```entities```. ```entities``` is defined, and then the different labels that they will be autotagged with (```LOC```, ```FAC```, ```ORG```, ```GPE```, ```NORP```, and ```PERSON```) are defined. ```ent.label_``` is applied to ```entities```, which is then printed and returned.

```
def assembleAllNames(CollPath):
    AllNames = {}
    for file in os.listdir(CollPath):
        if file.endswith(".xml"):
            filepath = f"{CollPath}/{file}"

            eachFileDict = readTextFiles(filepath)
            print(f"{eachFileDict=}")
            AllNames.update(eachFileDict)

    print(f"{AllNames=}")
    AllNamesKeys = list(AllNames.keys())
    AllNamesKeys.sort()
    SortedDict =  {i: AllNames[i] for i in AllNamesKeys}
    print(f"{SortedDict=}")
    writeSortedEntries(SortedDict)
    
    for file in os.listdir(CollPath):
        if file.endswith(".xml"):
            sourcePath = f"{CollPath}/{file}"
            eachFileData = xmlTagger(sourcePath, SortedDict)
    return eachFileData
```

This function establishes that the only files in the ```CollPath``` that should be acknowledged are the ones that end with ```.xml```. The named entities are put into ```eachFileDict``` and ```AllNames```, both of which are then printed. ```eachFileDict``` prints the named entities from each file separately, while ```AllNames``` prints all of them together. ```AllNames``` is sorted and redefined as ```SortedDict```, which is then printed. The last part of the function applies an ```xmlTagger``` to ```SortedDict``` so that the named entities are tagged with elements and attributes in the target xml files.

```
def writeSortedEntries(dictionary):
    with open('autotagged.txt', 'w') as f:
        for key, value in dictionary.items():
            f.write(key + ' : ' + value + '\n')
```

This function ouputs the named entities as a sorted dictionary to the specified file, which in this case is [autotagged.txt](https://github.com/gak5275/gak_repo2/blob/main/PythonTest/autotagged.txt).
