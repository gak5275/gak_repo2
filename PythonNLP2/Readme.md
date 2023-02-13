# Exercise 4B

My text collection had a lot of frequently used words, and I tried to include as many of them as I could in my new list of stopwords.

```
newStopWords = ["digital", "humanities", "technology", "college", "students", "professor", "class", "group", "premise",
                "movie", "film", "follows", "way", "role", "challenge", "use", "virtual", "reality", "write", "world",
                "code", "must", "using", "takes", "place", "find", "skills", "series", "explores", "coding", "tech"]
stop_words.extend(newStopWords)
print("UPDATED: " + f"{stop_words=}")
```

The words that were in pretty much every txt file (that likely would not be included in the basic set of stopwords) were "write", "premise", "about", "digital", "humanities", "college", and "class". This is because I used different variations on the same prompt in ChatGPT for all of my files. The word "movie" or the word "show" was also used in quite a few of them, so I added "movie" to the stopwords. I'm realizing now that should have added "show" as well, but the reason I didn't think to add it was probably because I did not see it in the [topic model visualization](https://github.com/gak_repo2/topicmodelvis.html).

I eventually added enough stopwords to the point that many of the words in the visualization were either words that are common but not super general, such as "power", "courage", and "friendship", or the different genres that I used in the prompts, such as "samurai" and "cyberpunk". Some of them also included specific mediums like "opera" and "anime", which also appeared in the visualization. This became even more apparent when I decreased the relevance metric.

![topicmodelviz](https://github.com/gak5275/gak_repo2/blob/main/PythonNLP2/topicmodelviz.png)
