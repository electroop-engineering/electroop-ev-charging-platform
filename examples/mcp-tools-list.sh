#!/usr/bin/env sh
# List the read-only tools exposed by the Electroop MCP server, then fetch the product catalogue.
BASE=https://electroop.io/mcp
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | jq '.result.tools[].name'
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_products","arguments":{"locale":"en"}}}' | jq '.result'
# Türkiye charging-market data (EPDK monthly reports + station register)
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"get_market_summary","arguments":{}}}' | jq '.result.structuredContent'
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"get_market_statistics","arguments":{"metrics":["sockets_total","sockets_dc","energy_mwh","kwh_per_socket_day"],"from":"2026-01"}}}' | jq '.result.structuredContent.rows'
curl -s -X POST "$BASE" -H 'content-type: application/json' \
  --data-binary '{"jsonrpc":"2.0","id":5,"method":"tools/call","params":{"name":"get_infrastructure","arguments":{"province":"İstanbul"}}}' | jq '.result.structuredContent.provinces'
