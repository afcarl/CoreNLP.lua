package = "corenlp"
version = "scm-1"

source = {
   url = "git://github.com/vzhong/corenlp.lua",
   tag = "master"
}

description = {
  summary = "CoreNLP client in Lua",
  detailed = [[
    CoreNLP client in Lua for natural language processing.
  ]],
  homepage = "https://github.com/vzhong/corenlp.lua"
}

dependencies = {
  "dkjson",
  "luasocket",
}

build = {
  type = "builtin",
  modules = {
    corenlp = 'src/corenlp.lua',
  }
}
