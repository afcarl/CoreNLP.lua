local corenlp = require 'corenlp'

local sent = 'For Human Rights in United e2SymStart  Latvia e2SymEnd  did not nominate a candidate &#44; it was announced after election that e1SymStart  they e1SymEnd  supported Endziņ&scaron; .'

local client = corenlp.Client()
local parse = client:annotate(sent, {['ssplit.isOneSentence']= true, annotators='ssplit,tokenize,ner'})
print(parse)
