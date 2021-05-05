*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7212
${BROWSER}        Chrome
${DELAY}          0
${CREATE URL}      http://${SERVER}/createClass.html
${RESULT URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create Page
    Open Browser    ${CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Page Should Be Open

Create Page Should Be Open
    Title Should Be    Create class

Go To Create Page
    Go To    ${CREATE URL}
    Create Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Select Difficulty
    [Arguments]    ${difficulty}
    Select From List By Value    difficulty_field    ${difficulty}

Select Language
    [Arguments]    ${language}
    Select From List By Value    language_field    ${language}

Submit Credentials
    Click Button    submit_button

Result Page Should Be Open
    Location Should Be    ${RESULT URL}
    Title Should Be    Result Page
