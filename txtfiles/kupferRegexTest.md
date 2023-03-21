1a. "Dot matches all" should be turned on so that the <sp> tags are wrapped around the entirety of each speech.

1b. ```\1``` and ```\2``` are the expressions in the parentheses. ```\1``` is ```(.+?)```, which finds all of the text in the document. ```\2``` is ```(\n\n)```, which finds any instance of two new lines in a row. Each speech is surrounded by two new lines on either side, so ```</sp>``` should go between ```\1``` and ```\2``` in the Replace window.

1c.

Check "Dot matches all"

Find:

```
^(.+?)(\n\n)
```

Replace with:

```
<sp>\1</sp>\2
```

2.

Uncheck "Dot matches all"

Find:

```
\(
```

Replace with:

```
<sd>\0
```

Find:

```
\)
```

Replace with:

```
\0</sd>
```

3.

Find:

```
<sp>(.+):
```

Replace with:

```
<sp><sr>\1</sr>:
```

4.

Check "Dot matches all"

Find:

```
.+
```

Replace with:

```
<root>\0</root>
```

Manually remove all tags from line 508 that are not <sd> or </sd>

5.

Uncheck "Dot matches all"

Find:

```
<sp>(<sd>.+</sd>)</sp>
```

Replace with:

```
\1
```

Find:

```
<sp><sr>SOUND</sr>: <sd>(.+)</sd></sp>
```

Replace with:

```
<sd>SOUND: \1</sd>
```