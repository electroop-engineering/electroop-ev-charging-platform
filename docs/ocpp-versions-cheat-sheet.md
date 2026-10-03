# OCPP 1.6J vs 2.0.1 vs 2.1 — what changes for an operator

A practical cheat sheet from running all three versions on one command pipeline (Electroop CPMS). It is not a substitute for the OCA specifications.

| Topic | OCPP 1.6J | OCPP 2.0.1 | OCPP 2.1 |
|---|---|---|---|
| Transport | JSON over WebSocket (`ocpp1.6` subprotocol) | JSON over WebSocket (`ocpp2.0.1`) | JSON over WebSocket (`ocpp2.1`) |
| Security | Optional; security profiles came with the 1.6 Security Whitepaper (basic auth, TLS, mTLS) | Security profiles 1–3 built in; certificate management messages | Same as 2.0.1 plus refinements |
| Device model | Flat `GetConfiguration` / `ChangeConfiguration` key list | Structured device model (`GetVariables`, `SetVariables`, components and variables, `GetBaseReport`) | Device model extended (e.g. DER, battery swap, dynamic tariffs) |
| Transactions | `StartTransaction` / `StopTransaction` with `MeterValues` | Single `TransactionEvent` (Started / Updated / Ended) | `TransactionEvent` with cost and tariff details |
| Authorization | `Authorize` with idTag; local list; offline rules | `Authorize` with IdToken types (ISO14443, ISO15693, eMAID, MacAddress…); group IdTokens | Same plus payment-related token types |
| Plug & Charge (ISO 15118) | Not native (vendor extensions) | `Get15118EVCertificate`, `CertificateSigned`, `InstallCertificate`, contract certificates | Extended certificate handling, ISO 15118-20 awareness |
| Smart charging | `SetChargingProfile`, `GetCompositeSchedule`, `ClearChargingProfile` | Same concepts with richer profiles (`ChargingProfile` purposes, `NotifyChargingLimit`) | Dynamic profiles, DER control, V2X-related messages |
| Tariffs and cost | Not part of the protocol (shown by the backend/app) | `CostUpdated`, display messages | **Dynamic tariffs pushed to the charger** (`SetDefaultTariff`, tariff and cost in transaction events) |
| Firmware and diagnostics | `UpdateFirmware`, `GetDiagnostics` (FTP upload) | `UpdateFirmware` with signed firmware, `GetLog` | Same as 2.0.1 |
| Reservations | `ReserveNow` / `CancelReservation` | `ReserveNow` with connector type and IdToken | Same |
| Display and UX | Limited | `SetDisplayMessage`, `ClearDisplayMessage` | Same plus tariff display |
| Offline behaviour | Local authorization list, cache, offline transactions queued by the charger | Same with `OfflineThreshold` variables, message queueing rules | Same |
| Migration path | — | Address change (`SetNetworkProfile` in 2.0.1 firmware) | Usually a firmware upgrade on the charger |

## What "same command pipeline" means in practice

- The operator uses one screen and one rule set regardless of the version a charger speaks; the platform translates (e.g. a "reset" becomes `Reset` in 1.6J and `Reset` with `OnIdle`/`Immediate` in 2.0.1).
- Commands to an offline charger are queued and delivered on reconnect; the queue is visible per charger.
- Firmware and configuration are managed by **desired state** per charger model, not by per-device manual entry.
- Tariff pushes to the charger are only possible on 2.1 firmware; on 1.6J and 2.0.1 the price is shown in the app or on the terminal.

## Field notes

- Support in the catalogue (profile predefined) is not the same as field verification with a specific firmware. Verify start/stop, remote reset, meter values, firmware status and tariff flows on a real session before go-live.
- Many "2.0.1-ready" chargers ship with 1.6J active; the switch is a firmware/profile change and may require vendor involvement.
- Chargers tied to a vendor cloud may only expose OCPP through that cloud; ask the vendor for a direct endpoint or a forwarding option.

More: https://electroop.io/en/technology · Migration guide: https://electroop.io/en/migration
