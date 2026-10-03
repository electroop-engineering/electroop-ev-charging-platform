"""Fetch the Electroop product catalogue and live counters from the public read-only API."""
import json, urllib.request

BASE = "https://electroop.io/api/public/v1"

def get(path: str):
    with urllib.request.urlopen(f"{BASE}{path}", timeout=15) as r:
        return json.load(r)

for p in get("/products?locale=en")["data"]:
    print(f"{p['id']:<20} {p['name']}")

for s in get("/stats")["data"]:
    print(f"{s['key']:<15} {s['value']:>12,} {s['unit']}  ({s['window']})")
