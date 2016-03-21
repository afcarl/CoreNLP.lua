# CoreNLP.lua
Lua client for Stanford CoreNLP

## Installation

```bash
git clone https://github.com/vzhong/CoreNLP.lua.git
cd CoreNLP.lua && luarocks make
```

## Usage

First, start the [CoreNLP server](http://stanfordnlp.github.io/CoreNLP/):

```bash
java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer
```

Next, you can use the Lua client in your program:

```lua
local corenlp = require 'corenlp'

local c = corenlp.Client()  -- you can optionally give the url to the CoreNLP server.

-- the first argument is the document, the second argument is the properties field described here: http://stanfordnlp.github.io/CoreNLP/corenlp-server.html
local got = c:parse('the quick brown fox jumped over the lazy dog', {["tokenize.whitespace"] = true, annotators = "tokenize,ssplit,ner"})

print(got)
```
