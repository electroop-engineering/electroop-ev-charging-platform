# Türkiye regulatory integrations for charging networks (EPDK, GİB)

A short orientation for teams entering the Turkish market or evaluating a platform for it. Not legal advice; obligations are set by the regulator and change over time.

| Obligation | What it is | How Electroop CPMS handles it |
|---|---|---|
| **EPDK Şarj Otomasyon Sistemi reporting** | The energy regulator's charging automation system collects socket status, prices, energy and usage data from licensed operators | Built-in reporting module per tenant: transaction started/stopped, in-use and consumed-energy reports with retry, reconciliation and per-record outcome tracking. The public counters on electroop-website are derived from this service (successful reports only). |
| **GİB EŞÜ (ÖKC) services** | Revenue Administration services for registering charging units as fiscal devices: registration, status, transfer and closure | Charging-unit registration, status, transfer and closure operations as a product module, enabled per account. |
| **GİB ÖKC monthly charging report** | Monthly per-plate charging report, signed with a fiscal seal | Generated and signed by the platform; fiscal seal belongs to the operator. |
| **e-Invoice / e-Archive** | Invoices through an accredited integrator | Integrator-independent invoicing layer in Electroop MSP; the operator brings its own integrator. |
| **İYS (commercial messaging permission)** | Permission registry for commercial electronic messages | Relay checks consent and İYS permission before every campaign message. |
| **Card payment at DC chargers** | Card-present payment for drivers without an app | Hermes on Nayax VPOS Touch and PAX IM30/A920 terminals; Hermes Gateway for payment partners. |

Related pages: [Charging Network Management](https://electroop-website.netlify.app/en/products/charging-network-management) · [Hermes](https://electroop-website.netlify.app/en/products/hermes) · [Relay](https://electroop-website.netlify.app/en/products/relay) · [Trust centre](https://electroop-website.netlify.app/en/trust)
