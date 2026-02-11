"""
BCM (Body Control Module) — Software Under Test
================================================
Requirement: REQ-BCM-002
  "Headlights shall only operate when ignition is ON.
   If ignition is OFF, headlight commands shall be rejected."
"""


class BodyControlModule:

    def __init__(self):
        self.ignition = False
        self.headlights = False

    def turn_ignition_on(self):
        self.ignition = True
        return True

    def turn_ignition_off(self):
        self.ignition = False
        self.headlights = False      # safety: lights off when engine off
        return True

    def turn_headlights_on(self):
        if not self.ignition:
            return False              # REQ-BCM-002: reject if ignition OFF
        self.headlights = True
        return True

    def turn_headlights_off(self):
        self.headlights = False
        return True

    def get_headlight_status(self):
        return self.headlights

    def get_ignition_status(self):
        return self.ignition
