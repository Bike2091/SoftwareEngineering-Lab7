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
${DELAY}                  0.05s
${VALID USER}             demo
${VALID PASSWORD}         mode
${SERVER}	          localhost:7272
${LOGIN URL}              http://${SERVER}
${ERROR URL}              http://${SERVER}/error.html
${WELCOME URL}            http://${SERVER}/welcome.html

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${LOGIN URL}	
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text     username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     password_field    ${password}

Submit Credentials
    Click Button    id:login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be       Welcome Page
