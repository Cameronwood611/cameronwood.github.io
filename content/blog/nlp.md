+++
title = "NLP"
date = 2021-09-12
updated = 2021-09-13
[taxonomies]
category = ["nlp"]
tags = ["uab", "nlp"]
+++


# Index
 - [Background](#background)
 - [Text Normalization](#text-normalization)


 ## Background

 Natural Language Processing (NLP) is used in many fields. Some examples include Speech Recognition, Biomedical Data, Linguistics, Auto-complete, Auto-correct etc. If we break up the words contained within NLP, we have a better understanding of what it means. Natrual languages are English, Spanish, Italian, French, German and so on. Processing just means some work on some input (in this case, a computer that receivees speech and text) to result in some useful output (classifier, words, speech etc.).

 ### NLP Pipeline

 There are a few topics that encompass the study of NLP. You may start at any one of these and work up/down the pipeline. They generally start and continue as follows:

  - Phonetics: Study of Human speech/sound.
  - Phonology: Mental processing of sounds.
  - Morphology: Internal structure of words.
  - Syntax: Rules for how words are put together in a language.
  - Semantics: Meaning behind word(s).
  - Pragmatics: Understanding text in its entire context (who/what/where/when).

 ### Common Terms

 Here are some explained terms that you might come accross:

  + __Corpus__ (plural corpora) - Collection of documents.  
  + __Lemma__ - Also known as stem, it is the root of a word (i.e. run has the same lemma as running).  
  + __Types__ - Distinct elements of corpus. Also called __vocab__.  
  + __Tokens__ - Parsed elements without any normalization.  
  + __Affix__ - Part of a word that gives grammatical function; could be prefix, suffix, infix & circumfix.  
  + __Morpheme__ - Smallest meaningful units of a word; containes stems and affixes.  
  + __Stemming__ - Process of removing affixes crudely (am, is, are -> be).  
  + __Lemmatization__ - Process of removing affixes based off the morphological analysis of a word.  
  + __Tokenization__ - Separation of words using regex and/or Machine Learning classifiers.  
  + __Segmentation__ - Normally, this is the separation of sentences in a corpus.  
  + __Language Model__ - Historically, it is a probability distribution of a sequence of words.  


## Text Normalization

The idea behind text normalization is to put words/tokens into a standard format.

Two methods for normalizing might be __lemmatization__ and __stemming__. Stemming is much faster but it crudely chops off affixes, rather than doing some morphological analysis like lemmatization.

An example of text normalization might be the following:
"
__How many words are in this sentence__: "They lay back on the San Fransisco grass and looked at the start and their ..."

To normalize, one would first break this into tokens by simply splitting on spaces. This gives a count of 15 tokens, though, one might argue that San Fransisco could make it 14. Then, we could say this has 13 types (combining "and") or 12 ("they" == "their").


## Language Models

Language models are just a probability distribution over a sequence of words; probablity of getting those words. This is a core area of research for NLP and involves autocomplete, spelling correction, audio recognition etc.

Historically, language models are N-gram based but they could be Neural Network models. N-gram models have their downside. For word prediction, they only work well if the training data matches the test data. This never happens in the real world; we need robust models that generalize. 


### Naive Bayes

If we want a simple model that classifies a document to a particular class, then Naive Bayes is our friend. It is extremely fast with low storage. Really beneficial for small or large datasets. Common applications are any general biinary classification: poitive/negative reviews, spam detection etc. Note: there are other types of classifiers like Machine Learning or K-Nearest Neighbor but Naive Bayes is easily understood and implemented.

