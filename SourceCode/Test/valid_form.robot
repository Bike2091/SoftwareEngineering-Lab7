*** Settings ***
Documentation     A test suite with a single test for valid form.
Resource          resource2.robot

*** Test Cases ***
Valid Form
    Open Browser To FORM Page
    Input Firstname      Somsong
    Input Lastname       Sandee
    Input Destination    Europe
    Input ContactPerson  Sodsai Sandee
    Input Relationship   Mother
    Input Email   	 somsong@kkumail.com
    Input PhoneNumber    081-111-1234
    Submit Form
    Complete Page Should Be Open
    Verify Complete Page Content
    [Teardown]    Close Browser

*** Keywords ***
Verify Complete Page Content
    Element Text Should Be    xpath=//h1    Our agent will contact you shortly.
    Element Text Should Be    xpath=//h2    Thank you for your patient.
