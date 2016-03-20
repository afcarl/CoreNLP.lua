package = "corenlp"
version = "0.1-1"
source = {
   url = "https://github.com/vzhong/corenlp.lua",
   tag = '0.1'
}
description = {
   summary = "Stanford CoreNLP client in Lua.",
   detailed = [[
      An implementation of the CoreNLP client in Lua.
   ]],
   homepage = "https://github.com/vzhong/corenlp.lua",
   license = "MIT",
   maintainer = "victor@victorzhong.com"
}
dependencies = {
   "class",
}
build = {
  type = 'builtin',
  modules = {
    corenlp = "src/corenlp.lua",
    ['corenlp.sh'] = 'src/sh.lua',
  }
}
