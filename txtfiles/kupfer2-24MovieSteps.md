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
^.+
```
Replace with: 
```
<movie>\0</movie>
```
Find: 
```
(<movie>)(.+?)\t
```
Replace with: 
```
\1<title>\2</title>
```
Find: 
```
(</title>)(.+?)\t
```
Replace with: 
```
\1<year>\2</year>
```
Find: 
```
(</year>)(.+?)\t
```
Replace with: 
```
\1<country>\2</country>
```
Find: 
```
(</country>)(.+?)(</movie>)
```
Replace with: 
```
\1<runtime unit="min">\2</runtime>\3
```
