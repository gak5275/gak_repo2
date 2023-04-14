# Python Test
## Graydon Kupfer

[Python File](https://github.com/gak5275/gak_repo2/blob/main/PythonTest/GraydonAutotagging.py)

[Mermaid Chart](https://mermaid.live/view#pako:eNqNVNtu4jAQ_ZXIzzTiVqBIrJSW3lvKbuleaqrKjScQ1UmQY1RY1H_fie0YaGm7PIVzjs-MxzOzImHGgXRJJLKXcMqk8kb9cerhL6BHmRBDpqYP3t7eN--cRpn0oliAF6delvsizhWPpWF_0TjSpA8pz19iNfX8RSIMGZzSgpqhl9fzIgP-ocDC6Qni_ThUiEtgfAQLVUC50dzTmYxT5UXeprb3YDI8pCMmJ6DWOQY3VGmokOpQRnlEMbYCmVrfPpVzAdJnnD86xl77kHKIdiVzTBczF-mE5gpTm2AQ_DDYKQ0FsBT43cyabSJackFV9gxlGgMdClIVq2WIxYZQYYk3FUNddFQUNc8zqYAb4ntRb8R9wZ5APBrwRwGmmcLsJ7DwE6ZCm-4t1VFiyPUhhTfDzN-eH63LbdU9Q9xRCWouU4fb-21f55JyfJ3jUqKxK2e5yVnb69J269zu9vupa8XyHJInAYEQA5aUQc7o9v8gcFFLwkYMjpz0EpalvL8F-kWdLXNMb3XRi7az0InzXlNlR379oDfuIf7zYb7qyt9utHbPmjn_-Xie4S3nMoTh1oAG5-sJZYohgSdGbDIB2-_BhWuLDV2Z8Qeml_oib50-CWXtdrzEbqsrO5l2BRTT-bHF13F3B7nWRU6xZSwwcF1REmVPvNe-W1IGHjqLNf1AKiQBmbCY45JeFY5joqaQwJh08ZMz-Twm4_QVdWyusttlGpKuknOokPmMM4ULk00kS0oQeIwteW2Wvt79FTJj6X2WOQn-Jd0VWZBuo1n1O-1aq9ZpVBud_XqnQpak26759eZ-a79Wa7aa7Uaj81ohf_V5VFebB9XqQbNVb7frB6366z9tkRKq)

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

```
def xmlTagger(sourcePath, SortedDict):
    with open(sourcePath, 'r') as f:
        readFile = f.read()
        stringFile = str(readFile)

        filename = os.path.basename(f.name)
        print(f"{filename=}")
        targetFile = f"{TargetPath}/{filename}"
        print(f"{targetFile=}")

        for key, val in SortedDict.items():
            replacement = '<name type="' + val + '">' + key + '</name>'
            stringFile = stringFile.replace(key, replacement)
            cleanedUp = regex.sub(r"(<\w+? \w+?=.)<name type=\"\w+?\">(\w+?)</name>(\")", r"\1\2\3", stringFile)

        with open(targetFile, 'w') as f:
            f.write(cleanedUp)
```

This function defines the ```xmlTagger``` and provides it with the appropriate read/write instructions, including how to apply elements and attributes with regex. It also defines and prints ```targetFile``` and ```filename```. ```targetFile``` is the file directory (within the project folder) of the xml files being generated within the ```TargetPath```. ```filename``` is simply the names of these files.

The ```patterns``` entity in my code defines patterns that should be tagged (as either ```PERSON``` or ```LOC```) or patterns that are ```NULL``` and should not be tagged as anything.
