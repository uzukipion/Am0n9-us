*** Settings ***
Documentation     A test suite containing tests related to invalid create class.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Page
Suite Teardown    Close Browser
Test Setup        Go To Create Page
Test Template     Create With Missing Fields Should Fail
Resource          resource.robot

*** Test Cases ***               TITLE        DESCRIPTION        DIFFICULTY        LANGUAGE
Empty Title                   ${EMPTY}         Suitable for chlidren         1         1
Empty Description                   Basic Yoga         ${EMPTY}         1         1
Empty Difficulty                   Basic Yoga        Suitable for chlidren        0         1
Empty Language                    Basic Yoga        Suitable for chlidren        1         0
Empty Title And Description      ${EMPTY}         ${EMPTY}         1         1
Empty Title And Difficulty      ${EMPTY}         Suitable for chlidren         0         1
Empty Title And Language      ${EMPTY}         Suitable for chlidren         1         0
Empty Description And Difficulty      Basic Yoga         ${EMPTY}         0         1
Empty Description And Language      Basic Yoga         ${EMPTY}         1         0
Empty Difficulty And Language      Basic Yoga         Suitable for chlidren          0         0
Empty Title And Description And Difficulty      ${EMPTY}         ${EMPTY}          0         1
Empty Title And Description And Language      ${EMPTY}         ${EMPTY}          1         0
Empty Title And Difficulty And Language      ${EMPTY}         Suitable for chlidren          0         0
Empty Description And Difficulty And Language      Basic Yoga         ${EMPTY}          0         0
Empty All      ${EMPTY}         ${EMPTY}          0         0
*** Keywords ***
Create With Missing Fields Should Fail
    [Arguments]    ${title}    ${description}    ${difficulty}    ${language}
    Input Title    ${title}
    Input Description    ${description}
    Select Difficulty    ${difficulty}
    Select Language    ${language}
    Submit Credentials
    Creation Should Have Failed

Creation Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
