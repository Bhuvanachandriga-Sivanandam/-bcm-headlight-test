# GitHub Issue #1 — Create this as your first issue in the repo

**Title:** REQ-BCM-002: Headlights shall only operate when ignition is ON

**Labels:** `requirement`, `safety-critical`

**Body:**

## Requirement

| Field       | Detail                                         |
|-------------|-------------------------------------------------|
| ID          | REQ-BCM-002                                     |
| Source      | BCM Software Requirements Specification v1.0    |
| ASIL Level  | ASIL-B                                          |
| Priority    | High                                            |

## Description

The Body Control Module shall ensure that headlight activation commands are only accepted when the vehicle ignition is in the ON state. If the ignition is OFF, the BCM shall reject any headlight ON command. When ignition transitions from ON to OFF, any active headlights shall be automatically deactivated.

## Acceptance Criteria

- [ ] Headlights turn ON when ignition is ON (TC-001)
- [ ] Headlights rejected when ignition is OFF (TC-002)
- [ ] Ignition OFF auto-deactivates headlights (TC-003)
- [ ] Full driving cycle passes regression (TC-004)
