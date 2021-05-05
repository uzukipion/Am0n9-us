*** Settings ***
Documentation     A test suite with a single test for valid create class.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Create Class
    Open Browser To Create Page
    Input Title    Basic Yoga
    Input Description    Suitable for children
    Select Difficulty    2
    Select Language    3
    Submit Credentials
    Result Page Should Be Open
    [Teardown]    Close Browser
