*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe   
${DELAY}                  0.05
${VALID FIRSTNAME}        Somsong
${VALID LASTNAME}         Sandee
${VALID DESTINATION}      Europe
${VALID CONTACTPERSON}    Sodsai Sandee
${VALID RELATION}         Mother
${VALID EMAIL}            somsong@kkumail.com
${VALID PHONENUMBER}      081-111-1234
${SERVER}	          localhost:7272
${FORM URL}	   	  http://${SERVER}/Form.html
${COMPLETE URL}    	  http://${SERVER}/Complete.html

*** Keywords ***
Open Browser To FORM Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM URL}	
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    FORM Page Should Be Open

FORM Page Should Be Open
    Title Should Be    Customer Inquiry

Go To FORM Page
    Go To    ${FORM URL}
    FORM Page Should Be Open

Input Firstname
    [Arguments]    ${firstName}
    Input Text    firstname    ${firstName}

Input Lastname
    [Arguments]    ${lastName}
    Input Text    lastname     ${lastName}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination   ${destination}

Input ContactPerson
    [Arguments]    ${contactPerson}
    Input Text    contactperson    ${contactPerson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input PhoneNumber
    [Arguments]    ${phoneNumber}
    Input Text    phone    ${phoneNumber}

Submit Form
    Click Button    submitButton
    Go To Complete Page

Submit Form Fail
    Click Button    submitButton

Go To Complete Page
    Go To    ${COMPLETE URL}
    Complete Page Should Be Open

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be       Completed
