*** Settings ***
Documentation     REQ-BCM-002: Headlights shall only operate when ignition is ON.
...               This suite covers the full test lifecycle for a single requirement.
Library           ../src/bcm.py
Suite Setup       Log    Starting BCM Headlight Test Suite
Suite Teardown    Log    BCM Headlight Test Suite Complete

*** Variables ***
${REQ_ID}         REQ-BCM-002

*** Test Cases ***

TC-001: Headlights Turn ON With Ignition ON
    [Documentation]    GIVEN ignition is ON, WHEN headlights requested, THEN headlights activate.
    [Tags]    positive    safety_critical    regression    ${REQ_ID}
    ${bcm}=    Evaluate    __import__('sys').path.insert(0,'src') or __import__('bcm').BodyControlModule()
    # --- Arrange ---
    ${ign}=    Call Method    ${bcm}    turn_ignition_on
    Should Be True    ${ign}    Ignition should turn ON
    # --- Act ---
    ${result}=    Call Method    ${bcm}    turn_headlights_on
    # --- Assert ---
    Should Be True    ${result}    Headlights command should be accepted
    ${status}=    Call Method    ${bcm}    get_headlight_status
    Should Be True    ${status}    Headlights should be ON

TC-002: Headlights Rejected When Ignition Is OFF
    [Documentation]    GIVEN ignition is OFF, WHEN headlights requested, THEN command rejected.
    [Tags]    negative    safety_critical    regression    ${REQ_ID}
    ${bcm}=    Evaluate    __import__('sys').path.insert(0,'src') or __import__('bcm').BodyControlModule()
    # --- Ignition is OFF by default ---
    ${result}=    Call Method    ${bcm}    turn_headlights_on
    # --- Assert ---
    Should Not Be True    ${result}    Headlights command should be REJECTED
    ${status}=    Call Method    ${bcm}    get_headlight_status
    Should Not Be True    ${status}    Headlights must remain OFF

TC-003: Ignition OFF Auto-Deactivates Headlights
    [Documentation]    GIVEN headlights are ON, WHEN ignition turned OFF, THEN headlights deactivate.
    [Tags]    safety_critical    regression    ${REQ_ID}
    ${bcm}=    Evaluate    __import__('sys').path.insert(0,'src') or __import__('bcm').BodyControlModule()
    # --- Setup: ignition ON, headlights ON ---
    Call Method    ${bcm}    turn_ignition_on
    Call Method    ${bcm}    turn_headlights_on
    ${before}=    Call Method    ${bcm}    get_headlight_status
    Should Be True    ${before}    Headlights should be ON before test
    # --- Act: turn ignition OFF ---
    Call Method    ${bcm}    turn_ignition_off
    # --- Assert ---
    ${after}=    Call Method    ${bcm}    get_headlight_status
    Should Not Be True    ${after}    Headlights must auto-deactivate with ignition

TC-004: Full Driving Cycle Regression
    [Documentation]    Full cycle: start car → headlights on → drive → stop → verify all off.
    [Tags]    regression    ${REQ_ID}
    ${bcm}=    Evaluate    __import__('sys').path.insert(0,'src') or __import__('bcm').BodyControlModule()
    # --- Start car ---
    Call Method    ${bcm}    turn_ignition_on
    ${ign}=    Call Method    ${bcm}    get_ignition_status
    Should Be True    ${ign}
    # --- Turn on headlights ---
    ${result}=    Call Method    ${bcm}    turn_headlights_on
    Should Be True    ${result}
    # --- Stop car ---
    Call Method    ${bcm}    turn_ignition_off
    # --- Verify everything is OFF ---
    ${ign_off}=    Call Method    ${bcm}    get_ignition_status
    Should Not Be True    ${ign_off}    Ignition should be OFF
    ${lights_off}=    Call Method    ${bcm}    get_headlight_status
    Should Not Be True    ${lights_off}    Headlights should be OFF
