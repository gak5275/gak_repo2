Find: 
```
&
```
Replace with:
```
&amp;
```

Find: 
```
<
```
String not found

Find: 
```
>
```
String not found

Find:
```
\n{3,}
```
Replace with:
```
\n\n
```

Find:
```
.+
```
Replace with:
```
<p>\0</p>
```

Find:
```
<p>(CHAPTER [IVX]+)</p>
```
Replace with:
```
<heading>\1</heading>
```

Find:
```
</p>\n\n<heading>
```
Replace with:
```
</p>\n</chapter>\n<chapter>\n<heading>
```

Add ```<chapter>``` start tag after title

Add ```</chapter>``` end tag at the end of the document

Find:
```
"(.+?)"
```
Replace with:
```
"<quote>\1</quote>"
```

Change the ```<p>``` element wrapping ```D R A C U L A``` into a ```<title>``` element.

Manually wrap document with ```<xml>``` or ```<root>``` element

# Dates and Times

Find:
```
\d+ [MJASON][aueco][eynlgptvusmbrovt]+
```
Replace with:
```
<date>\0</date>
```

Find:
```
([MJASON][aueco][eynlgptvusmbrovt]+ \d+),
```
Replace with:
```
<date>\1</date>,
```

Find:
```
([MJASON][aueco][eynlgptvusmbrovt]+ \d+)[.]
```
Replace with:
```
<date>\1</date>.
```

Find:
```
[MJASON][aueco][eynlgptvusmbrovt]+ \d+th
```
Replace with:
```
<date>\0</date>
```

Find:
```
\d+st [MJASON][aueco][eynlgptvusmbrovt]+
```
Replace with:
```
<date>\0</date>

Find:
```
\d+st [MJASON][aueco][eynlgptvusmbrovt]+
```
String not found

Find:
```
\d+nd [MJASON][aueco][eynlgptvusmbrovt]+
```
String not found

Find:
```
\d+rd [MJASON][aueco][eynlgptvusmbrovt]+
```
String not found

Find:
```
[MJASON][auecop][ieynlgptvusmbrovt]+, \d+, \d+
```
Replace with:
```
<date>\0</date>
```

Find:
```
 ([MJASON][auecop][ieynlgptvusmbrovt]+, \d+)
```
Replace with:
```
 <date>\1</date>
```

Find:
```
(\d\d\d\d);
```
Replace with:
```
<date>\1</date>;
```

Find:
```
\d+ [MJASON][AUECO][EYNLGPTVUSMBROVT]+
```
Replace with:
```
<date>\0</date>
```

Find:
```
\d:\d\d [AP]. M.
```
Replace with:
```
<time>\0</time>
```

Find:
```
\d\d:\d\d [AP]. M.
```
String not found

Find:
```
\d:\d\d [ap]. m.
```
Replace with:
```
<time>\0</time>
```

Find:
```
\d\d:\d\d [ap]. m.
```
String not found

Find:
```
([". ])(\d\d [ap]. m.)
```
Replace with:
```
\1<time>\2</time>
```

Find:
```
 (\d [ap]. m.)
```
Replace with:
```
 <time>\1</time>
```

Find:
```
\d\d:\d\d
```
Replace with:
```
<time>\0</time>
```

Find:
```
 (\d:\d\d)
```
Replace with:
```
 <time>\1</time>
```

Find:
```
[onetwothreefourfivesixseveneightnine]+ oâ€™clock
```
Replace with:
```
<time>\0</time>
```

Find:
```
\d+ oâ€™clock [pa]. m.
```
Replace with:
```
<time>\0</time>
```

Find:
```
 (\d+ oâ€™clock)
```
Replace with:
```
 <time>\1</time>
```

Find:
```
[onetwothreefourfivesixseveneightnineteneleventwelve]+ of the clock
```
Replace with:
```
<time>\0</time>
```