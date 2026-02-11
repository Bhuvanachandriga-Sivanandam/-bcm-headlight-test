# Defect Report — REQ-BCM-002

## JIRA Ticket: BCM-042

| Field            | Detail                                              |
|------------------|-----------------------------------------------------|
| **Title**        | Headlights remain ON after ignition OFF             |
| **Requirement**  | REQ-BCM-002                                         |
| **Severity**     | High                                                |
| **Priority**     | P1                                                  |
| **Status**       | ✅ CLOSED — Fixed and Verified                      |
| **Assigned To**  | SW Development Team                                 |
| **Found By**     | Bhuvanachandriga (SQA)                              |
| **Found In**     | TC-003 — Nightly Regression Build #47               |

---

## Steps to Reproduce

1. Create BCM instance
2. Turn ignition ON
3. Turn headlights ON
4. Turn ignition OFF
5. **Expected**: Headlights = OFF
6. **Actual (bug)**: Headlights = ON ❌

## Root Cause Analysis

The `turn_ignition_off()` method was missing `self.headlights = False`.

```python
# BEFORE (bug)
def turn_ignition_off(self):
    self.ignition = False
    return True

# AFTER (fix)
def turn_ignition_off(self):
    self.ignition = False
    self.headlights = False    # ← fix added
    return True
```

## Verification

- TC-003 re-executed after fix → **PASSED** ✅
- Full regression suite re-run → **ALL PASSED** ✅
- No new defects introduced by the fix.

---

## Daily Standup Update (Sample)

> **Yesterday**: Found defect BCM-042 during nightly regression — headlights stay ON after ignition OFF.  
> **Today**: Fix deployed by dev team. Re-running TC-003 and full regression suite to verify.  
> **Blockers**: None. Waiting for regression results before marking CLOSED.
