#!/usr/bin/env sh
# Read-only public API of the Electroop website. No key required; rate-limited.
B=https://electroop.io/api/public/v1
curl -s "$B/products?locale=en"     | jq '.data[] | {id, name, tagline}'
curl -s "$B/integrations?locale=en" | jq '.data[] | {product_id, provider, model, protocol, category}'
curl -s "$B/trust?locale=en"        | jq
curl -s "$B/stats"                  | jq '.data[] | {key, value, unit, window}'
