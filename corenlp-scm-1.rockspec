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
  "class"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)";
$(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
