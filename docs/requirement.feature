Feature: BCM Headlight Control (REQ-BCM-002)
  As a driver
  I want headlights to only work when ignition is ON
  So that battery is not drained when car is off

  Scenario: TC-001 - Headlights allowed with ignition ON
    Given the ignition is ON
    When the driver requests headlights ON
    Then the headlights should be ON

  Scenario: TC-002 - Headlights rejected with ignition OFF
    Given the ignition is OFF
    When the driver requests headlights ON
    Then the headlights should remain OFF

  Scenario: TC-003 - Ignition OFF auto-deactivates headlights
    Given the ignition is ON
    And the headlights are ON
    When the ignition is turned OFF
    Then the headlights should be OFF

  Scenario: TC-004 - Full driving cycle regression
    Given the ignition is ON
    When the driver turns headlights ON
    And the ignition is turned OFF
    Then the ignition should be OFF
    And the headlights should be OFF
