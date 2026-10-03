#!/usr/bin/env sh
# List the read-only tools exposed by the Electroop MCP server, then fetch the product catalogue.
BASE=https://electroop-website.netlify.app/mcp
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | jq '.result.tools[].name'
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_products","arguments":{"locale":"en"}}}' | jq '.result'
