# BCM Headlight Control — End-to-End Test Lifecycle

A simple project demonstrating the **complete automotive software testing lifecycle** for a single Body Control Module (BCM) requirement, using **Robot Framework**.

## The Requirement

> **REQ-BCM-002**: Headlights shall only operate when ignition is ON.
> If ignition is OFF, headlight commands shall be rejected.

[📋 GitHub Issue #1 — Requirement Tracking](../../issues/1)

---

## Testing Lifecycle (7 Phases)

```
Phase 1: Test Planning       → docs/test_plan.md
Phase 2: Test Design         → tests/headlight_tests.robot
Phase 3: Test Implementation → src/bcm.py (software under test)
Phase 4: Test Execution      → robot tests/
Phase 5: Defect Management   → docs/defect_report.md
Phase 6: Test Reporting      → reports/ (auto-generated)
Phase 7: Regression Testing  → .github/workflows/nightly.yml
```

---

## Quick Start

```bash
# Install
pip install robotframework

# Run all tests
robot --outputdir reports tests/

# Run only regression suite
robot --outputdir reports --include regression tests/
```

---

## Project Structure

```
bcm-headlight-test/
├── README.md
├── requirements.txt
├── src/
│   └── bcm.py                  # BCM module (software under test)
├── tests/
│   └── headlight_tests.robot   # Robot Framework test suite
├── docs/
│   ├── test_plan.md            # Phase 1: Test Planning
│   └── defect_report.md        # Phase 5: Defect Management
├── reports/                    # Phase 6: Auto-generated reports
└── .github/
    └── workflows/
        └── nightly.yml         # Phase 7: Nightly regression
```

---

## Author

**Bhuvanachandriga** — Senior Data Analyst transitioning into Automotive SQA  
Built as part of interview preparation for GM VMEC division.
