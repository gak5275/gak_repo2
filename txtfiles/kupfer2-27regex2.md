Find: 
```
&
```
String not found

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
^.+
```
Replace with:
```
 
```

Find:
```
.+
```
Replace with:
```
<line>\0</line>
```

Find:
```
<line>[IVXLC]+</line>
```
Replace with:
```
</sonnet>\r\n<sonnet number="\1">
```

Delete the first instance of ```</sonnet>```

Put one more ```</sonnet>``` at the end of the document

Manually wrap document with ```<xml>``` or ```<root>``` element