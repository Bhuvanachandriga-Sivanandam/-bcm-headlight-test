# Test Plan — REQ-BCM-002: Headlight Control

| Field              | Detail                                      |
|--------------------|---------------------------------------------|
| **Requirement**    | REQ-BCM-002                                 |
| **Feature**        | Headlight ON/OFF via Body Control Module     |
| **Test Tool**      | Robot Framework                             |
| **Environment**    | Software-in-Loop (SIL) — Python simulation  |
| **ASIL Level**     | ASIL-B (lighting is safety-relevant)        |

---

## Scope

Test that headlights **only activate when ignition is ON** and are **rejected when ignition is OFF**.

## Test Cases

| Test ID   | Description                                   | Type       |
|-----------|-----------------------------------------------|------------|
| TC-001    | Headlights ON with ignition ON → accepted     | Positive   |
| TC-002    | Headlights ON with ignition OFF → rejected    | Negative   |
| TC-003    | Ignition OFF auto-deactivates headlights      | Safety     |
| TC-004    | Full cycle: ON → lights → OFF → verify        | Regression |

## Pass / Fail Criteria

- **PASS**: All 4 test cases pass, headlights never activate without ignition.
- **FAIL**: Any test case fails → file defect, block release.

## Schedule

- **Daily**: Run full suite after each code commit.
- **Nightly**: Regression suite via GitHub Actions.
