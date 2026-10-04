# Electroop — OCPP & OCPI EV charging platform (CPMS, eMSP, card payment at the station)

[![Website](https://img.shields.io/badge/website-electroop-0A1838)](https://electroop.io/en)
[![OCPP](https://img.shields.io/badge/OCPP-1.6J%20%7C%202.0.1%20%7C%202.1-B8D63A)](#protocols-and-standards)
[![OCPI](https://img.shields.io/badge/OCPI-2.2.1%20CPO%20%7C%20eMSP-B8D63A)](#protocols-and-standards)
[![ISO 27001](https://img.shields.io/badge/ISO%2FIEC%2027001-2022-0A1838)](https://electroop.io/en/trust)
[![Live stats](https://img.shields.io/badge/live%20stats-public%20API-0A1838)](https://electroop.io/api/public/v1/stats)

**Electroop** builds software for the electric-vehicle charging ecosystem in Türkiye and beyond:
charging network management (**CPMS / CSMS**), white-label **eMSP** and driver app, **card payment at the charger** (Nayax, PAX),
campaign and loyalty engine, an **OCPI proxy** for networks without OCPI capability, and an ISO 18295-1 certified **driver support centre**.

> This repository is **not open source** and contains no product code. It exists so that engineers evaluating
> OCPP / OCPI platforms can find what Electroop supports, try the public read-only API and MCP server,
> and contact the team. Everything here is also published at the website and in machine-readable form (`llms.txt`, JSON API, MCP).

- 🇹🇷 Türkçe özet aşağıda: [Türkçe](#türkçe)
- 🌐 Website: https://electroop.io/en · TR: https://electroop.io/tr
- 💬 Talk to the team / request a 45-minute live demo: https://electroop.io/en/contact?need=demo

## Products

| Product | What it does | Page |
|---|---|---|
| **Electroop CPMS** (Charging Network Management) | Multi-tenant CSMS for charge point operators: OCPP 1.6J / 2.0.1 / 2.1 on one command pipeline, tariffs, sessions, alerts, smart charging, EPDK & GİB reporting for Türkiye, OCPI 2.2.1 CPO role, ISO 15118 Plug & Charge PKI, Volt AI operator assistant | [EN](https://electroop.io/en/products/charging-network-management) · [TR](https://electroop.io/tr/urunler/sarj-agi-yonetimi) |
| **Electroop Link** | OCPP proxy + OCPI 2.2.1 CPO role for charging networks whose software cannot speak OCPI; joins roaming without replacing the CSMS | [EN](https://electroop.io/en/products/electroop-link) |
| **Operator Digitalisation Platform** | Field operations, maintenance and work orders for operators; talks to both CPMS and eMSP | [EN](https://electroop.io/en/products/operator-digitalisation-platform) |
| **Electroop MSP** | White-label eMSP: driver accounts, wallet, payment providers, OCPI 2.2.1 eMSP role, OICP 2.3 (Hubject) adapter, CDR validation, e-invoice | [EN](https://electroop.io/en/products/electroop-msp) |
| **Relay** | Charging-specific campaign and loyalty engine with consent/İYS checks; mobile SDKs (React Native, Kotlin, Swift) and server SDKs (TypeScript, .NET, Java) | [EN](https://electroop.io/en/products/relay) |
| **Voltaj** | Electroop's own driver app (Android / iOS) | [voltaj.app](https://voltaj.app) |
| **Hermes** | Card-present charging at the station on Nayax VPOS Touch and PAX terminals; works with your existing charging software | [EN](https://electroop.io/en/products/hermes) |
| **Hermes Gateway** | Connects terminal and payment partners to the charging flow; three paths: CPO (REST/OCPI), eMSP (OCPI), hub (OCPI) | [EN](https://electroop.io/en/products/hermes-gateway) |
| **Driver Support Centre** (service) | ISO 18295-1 certified omnichannel contact centre + CRM + AI under the operator's brand; agents see the charger and session while talking to the driver | [EN](https://electroop.io/en/driver-support-centre) |

Every product can be bought on its own. No bundle is required. See [Data and commercial independence](https://electroop.io/en/data-and-commercial-independence).

## Protocols and standards

| Area | Supported |
|---|---|
| Charger protocol | **OCPP 1.6J, OCPP 2.0.1, OCPP 2.1** (OCPP-J over WebSocket, security profiles, mTLS, offline command queue) |
| Roaming | **OCPI 2.2.1** CPO role (CPMS, Electroop Link) and eMSP role (Electroop MSP); hub connection via E-Gridium ChargeBridge; **OICP 2.3** adapter for Hubject (eMSP) |
| Plug & Charge | **ISO 15118-2** certificate lifecycle with the platform's own sub-CA |
| Demand response | OpenADR 2.0b client in the virtual power plant module |
| Card payment | Nayax VPOS Touch (Energy PTP), PAX IM30 / A920 via OrtakPos; new terminal providers through a common payment interface |
| Türkiye reporting | EPDK Charging Automation System reporting, GİB charging-unit (ÖKC) registration services, fiscally sealed monthly report |
| Payment providers | Paywall, Craftgate, iyzico, Stripe adapters; integrator-independent e-invoice layer |
| Messaging | FCM, APNs, Netgsm, Verimor, Twilio, Amazon SES, SendGrid, SMTP, WhatsApp Cloud API, Slack, Teams, Telegram, PagerDuty, webhooks |
| Device catalogue | 598 charger models and configurations from 81 brands (catalogue entry ≠ field verification): [device compatibility](https://electroop.io/en/device-compatibility) |

Full matrix with verification scope and prerequisites: https://electroop.io/en/integrations

## Open resources in this repository

- [`docs/ocpp-versions-cheat-sheet.md`](docs/ocpp-versions-cheat-sheet.md) — OCPP 1.6J vs 2.0.1 vs 2.1 for operators, with field notes from running all three on one pipeline.
- [`docs/turkiye-reporting.md`](docs/turkiye-reporting.md) — EPDK, GİB (EŞÜ, ÖKC), e-invoice and İYS obligations for charging networks in Türkiye.
- [`data/charger-catalogue.json`](data/charger-catalogue.json) — 598 charger models and configurations from 81 brands (brand, model, kW, AC/DC, connectors, OCPP profile); Markdown view in [`docs/charger-catalogue.md`](docs/charger-catalogue.md).
- [`examples/`](examples) — public API and MCP client examples.

If these are useful, a ⭐ helps other engineers find them.

## Live operations

The website publishes live, aggregated counters read from the EPDK reporting service of networks running on Electroop CPMS
(sessions started and kWh successfully reported; rolling 24 h / 30 d windows and totals since August 2026, refreshed every 10 minutes):

```bash
curl -s https://electroop.io/api/public/v1/stats | jq '.data[] | {key, value, unit}'
```

Method and scope are documented in the response's `meta.method` field and on the home page.

## Try the public API (read-only, no key)

```bash
# Product catalogue
curl -s "https://electroop.io/api/public/v1/products?locale=en" | jq '.data[] | {id, name, tagline}'

# Integration matrix (providers, protocols, verification scope)
curl -s "https://electroop.io/api/public/v1/integrations?locale=en" | jq '.data[] | {product_id, provider, protocol}'

# Trust: certifications and entities
curl -s "https://electroop.io/api/public/v1/trust?locale=en" | jq
```

Every product page is also available as Markdown by appending `.md`, and the whole catalogue as
[`/llms.txt`](https://electroop.io/llms.txt) and [`/llms-full.txt`](https://electroop.io/llms-full.txt).

## Connect the MCP server (read-only)

A stateless, streamable-HTTP [MCP](https://modelcontextprotocol.io) server exposes the same catalogue to AI assistants and agents.
No authentication; rate-limited.

```bash
claude mcp add --transport http electroop https://electroop.io/mcp
```

Or add to any MCP-capable client (see [`examples/mcp.json`](examples/mcp.json)):

```json
{ "mcpServers": { "electroop": { "type": "http", "url": "https://electroop.io/mcp" } } }
```

Tools: `list_products`, `get_product`, `find_solutions`, `check_integration`, `get_trust_information`, `search_knowledge`, `get_market_summary`, `get_market_statistics`, `get_operator_rankings`, `get_infrastructure`, `get_electroop_share` (Türkiye charging-market data from EPDK reports and the station register; operator names normalised to one canonical brand across tools; monthly-report and register socket counts are flagged as non-comparable). Raw JSON-RPC example: [`examples/mcp-tools-list.sh`](examples/mcp-tools-list.sh).

## Türkiye charging-market data over MCP and API

The same server exposes the Türkiye charging-market dataset derived from EPDK monthly reports and the EPDK station register:
`get_market_summary`, `get_market_statistics` (21 raw and derived monthly metrics since 2023-06, with definitions), `get_operator_rankings` (top-ten operators, CR3/CR5/CR10) `get_infrastructure` (per-province and per-operator register counts, licences) and `get_electroop_share` (share of EPDK-reported sessions sent through Electroop CPMS, per calendar month, with comparability flags).
Human-readable version with charts: https://electroop.io/en/charging-market · JSON: `/api/public/v1/market`, `/api/public/v1/infrastructure`. Figures belong to EPDK and TÜİK; derived indicators by Electroop.

## Trust

- **ISO/IEC 27001:2022** (ISMS-26.03.309) and **TS EN ISO 18295-1:2017** (CCC-26.03.309), issued by DSR Certification, valid 2026-03-04 → 2027-03-03. Certificates and scope: https://electroop.io/en/trust
- Tenant data belongs to the customer; session, CDR and user exports are built into the product (CSV / JSON).
- Runs as a cloud tenant, in your enterprise cluster or in your own data centre.

## Who is this for

- **Charge point operators** consolidating chargers of many brands and OCPP versions, with Türkiye reporting duties built in.
- **Companies offering charging under their own brand** (energy, banking, automotive, retail) that want an eMSP, driver app and campaigns without building them.
- **Terminal and payment partners** who need a clean path into the charging flow.
- **Operators moving from another platform**: [migration guide](https://electroop.io/en/migration).

## Contact

- Request a demo (45-minute live session on the real product): https://electroop.io/en/contact?need=demo
- General enquiries: https://electroop.io/en/contact
- Questions about this repository: open an issue using the "Contact" template.

## Related

- E-Gridium **ChargeBridge** (roaming hub) is a product of E-Gridium, a separate company under common ownership. It is not an Electroop product.

---

## Türkçe

**Electroop**, elektrikli araç şarj ekosistemi için yazılım geliştirir: **şarj ağı yönetimi (CPMS / CSMS)**, beyaz etiket **eMSP** ve sürücü uygulaması,
**istasyonda kartla ödeme** (Nayax, PAX), kampanya ve sadakat motoru, OCPI yetkinliği olmayan ağlar için **OCPI proxy** (Electroop Link),
Operatör Dijitalleştirme Platformu ve ISO 18295-1 sertifikalı **Sürücü Destek Merkezi** hizmeti.

- Desteklenen protokoller: **OCPP 1.6J / 2.0.1 / 2.1**, **OCPI 2.2.1** (CPO ve eMSP rolleri), **OICP 2.3** (Hubject), **ISO 15118** Plug & Charge, OpenADR 2.0b.
- Türkiye modülleri üründe gelir: **EPDK** Şarj Otomasyon Sistemi raporlaması, **GİB** EŞÜ (ÖKC) kayıt servisleri ve mali mühürlü aylık rapor.
- Kartla ödeme: Nayax VPOS Touch ve PAX IM30 / A920 (OrtakPos). Ödeme sağlayıcıları: Paywall, Craftgate, iyzico, Stripe.
- Cihaz kataloğu: 81 markadan 598 model ve konfigürasyon → https://electroop.io/tr/cihaz-uyumlulugu
- Canlı operasyon sayaçları (EPDK'ya başarıyla raporlanan şarjlanma ve enerji): https://electroop.io/tr
- Sertifikalar: ISO/IEC 27001:2022 ve TS EN ISO 18295-1:2017 → https://electroop.io/tr/guven
- Başka platformdan geçiş: https://electroop.io/tr/gecis
- Veri ve ticari bağımsızlık: https://electroop.io/tr/veri-ve-ticari-bagimsizlik

Bu depo açık kaynak değildir ve ürün kodu içermez; değerlendirme yapan mühendisler için yetenek özeti, public API ve MCP örnekleri sunar.

**Demo talep edin (45 dakikalık canlı oturum):** https://electroop.io/tr/iletisim?need=demo
