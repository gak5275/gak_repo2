Text to find:
```
&
```
Scanned files: 24
Occurences: 0

Text to find:
```
<
```
Replace with:
```
&lt;
```

Text to find:
```
>
```
Replace with:
```
&gt;
```

Text to find:
```
xnbData
```
Replace with:
```
<metadata>\0
```

Text to find:
```
String&gt;
```
Replace with:
```
\0</metadata>
```

Text to find:
```
    
```
(4 spaces)

Replace with:
```

```
Nothing

Text to find:
```
.+#!String
```
Replace with:
```
<context>\0</p>
```

Text to find:
```
<context>
```
Replace with:
```
<p>\0
```

Text to find:
```
<context>.+:
```
Replace with:
```
\0</context>
```

Text to find:
```
> (".+")
```
Replace with:
```
> <dialogue>\1</dialogue>
```

Text to find:
```
[Ee]vent.+:
```
Replace with:
```
<event>\0</event>
```

# Autotagging dates
#### Context: Stardew Valley has an in-game calendar that goes by seasons instead of months. Each season lasts 28 days. If a character's line of dialogue is labelled "winter_Wed2" for example, it means that the line will only be spoken on the 2nd of Winter (though I am not sure if this is actually the case, as I am pretty sure I have seen some of these lines in the game on days that are not the ones that they are labelled as).

Text to find:
```
[Ss]pring.+\d+:
```
Replace with:
```
<date season="spring">\0</date>
```

Text to find:
```
[Ss]ummer.+\d+:
```
Replace with:
```
<date season="summer">\0</date>
```

Text to find:
```
[Ff]all.+\d+:
```
Replace with:
```
<date season="fall">\0</date>
```

Text to find:
```
[Ww]inter.+\d+:
```
Replace with:
```
<date season="winter">\0</date>
```

Text to find:
```
<metadata>
```
Replace with:
```
<xml>\0
```

Manually add ```</xml>``` at the end of each document (there is no unique string of characters at the end of each document like there is at the start, so as far as I am aware, there is no way to add ```</xml>``` using regex in this case)

Debug: On line 64 of Leah.xml, There is a colon ```:``` in the dialogue, which caused the ```</context>``` end tag to show up within the dialogue instead of before it. I fixed this manually.
