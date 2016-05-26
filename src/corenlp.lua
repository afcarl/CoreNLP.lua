local json = require 'dkjson'
local http = require 'socket.http'
local url = require 'socket.url'
local ltn12 = require"ltn12"

--- @module Client
-- Lua implementation of CoreNLP client.

local Client = {}
Client.__index = Client
setmetatable(Client, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})


--- Constructor.
-- @arg {string='http://localhost:9000} server_url - url at which the CoreNLP server listens. Make sure your CoreNLP server is running:
--
-- @code
-- java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer
function Client.new(server_url)
  local self = setmetatable({}, Client)
  self.server_url = server_url or 'http://localhost:9000'
  return self
end

--- Annotates a document.
-- @arg {string} doc - document to annotate
-- @arg {table=} properties - properties field for CoreNLP server
--
-- By default, the properties field has
--
-- @code {lua}
-- {annotators = 'tokenize,ssplit'}
--
-- For a list of available fields, check out the [Stanford CoreNLP docs](http://stanfordnlp.github.io/CoreNLP/annotators.html).
function Client:annotate(doc, properties)
  properties = properties or {annotators = 'tokenize,ssplit'}
  properties.outputFormat = 'json'
  --local addr = self.url .. '/?properties=' .. url.escape(json.encode(properties))
  local addr = self.server_url .. '/?properties=' .. url.escape(json.encode(properties))
  local request, response = doc, {}
  local _, respcode = http.request {
    method = "POST",
    url = addr,
    source = ltn12.source.string(request),
    headers = {
      ["content-type"] = "text/plain",
      ["content-length"] = tostring(#request)
    },
    sink = ltn12.sink.table(response)
  }
  assert(respcode == 200, 'Request to '..addr.. ' failed for document:\n' .. doc)
  return json.decode(table.concat(response))
end

return {Client=Client}
