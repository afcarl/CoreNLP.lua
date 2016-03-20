package = "corenlp"
version = "0.1-1"
source = {
   url = "https://github.com/vzhong/corenlp.lua",
   tag = 'v0.1'
}
description = {
   summary = "Stanford CoreNLP client in Lua.",
   detailed = [[
      An implementation of the CoreNLP client in Lua.
   ]],
   homepage = "https://github.com/vzhong/corenlp.lua",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.1",
   "class",
}
build = {
  type = 'builtin',
  modules = {
    corenlp = "CoreNLP.lua",
    ['corenlp.sh'] = 'sh.lua',
  }
}
