# CoreNLP.lua

[![wercker status](https://app.wercker.com/status/b45452b05cfd3aa069569acd38015bda/s/master "wercker status")](https://app.wercker.com/project/bykey/b45452b05cfd3aa069569acd38015bda)

Lua client for [Stanford CoreNLP](http://nlp.stanford.edu/software/).

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
local got = c:annotate('the quick brown fox jumped over the lazy dog', {["tokenize.whitespace"] = true, annotators = "tokenize,ssplit,ner"})

print(got)
```

## Documentation

Documentation is generated via [docroc](//www.victorzhong.com/docroc) and can be found [here](//www.victorzhong.com/corenlp.lua)


## FAQ

### My document fails to annotate

If this happens on the Lua end and not on the Java end, please find an issue because this is likely a bug.

If this happens on the Java end (eg. you see an exception in the Java server), this is most likely because your document's encoding is not acceptable.

One way to handle this problem is to escape non-UTF8 characters in the document. You can do this via [Lua UTF-8](//github.com/starwing/luautf8), namely via

```lua
text = utf8.escape(text)
```
