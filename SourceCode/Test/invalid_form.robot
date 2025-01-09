*** Settings ***
Documentation     A test suite containing tests related to invalid form.
Suite Setup       Open Browser To Form Page
Suite Teardown    Close Browser
Test Setup        Go To Form Page
Test Template     Fill Invalid Form Should Fail
Resource          resource2.robot

*** Test Cases ***     FIRSTNAME              LASTNAME		   DESTINATION	         CONTACTPERSON		  RELATION		EMAIL	  	 PHONENUMBER		 ERRORMESSAGE
Empty Destination      ${VALID FIRSTNAME}     ${VALID LASTNAME}    ${EMPTY}	         ${VALID CONTACTPERSON}	  ${VALID RELATION}	${VALID EMAIL}	 ${VALID PHONENUMBER}    *Please enter your destination!!
Empty Email            ${VALID FIRSTNAME}     ${VALID LASTNAME}    ${VALID DESTINATION}	 ${VALID CONTACTPERSON}	  ${VALID RELATION}	${EMPTY}	 ${VALID PHONENUMBER}    *Please enter an email!!
Invalid Email          ${VALID FIRSTNAME}     ${VALID LASTNAME}    ${VALID DESTINATION}	 ${VALID CONTACTPERSON}	  ${VALID RELATION}	somsong@	 ${VALID PHONENUMBER}    *Please enter a valid email!!
Empty PhoneNumber      ${VALID FIRSTNAME}     ${VALID LASTNAME}    ${VALID DESTINATION}	 ${VALID CONTACTPERSON}	  ${VALID RELATION}	${VALID EMAIL}	 ${EMPTY}		 *Please enter a phone number!!
Invalid PhoneNumber    ${VALID FIRSTNAME}     ${VALID LASTNAME}    ${VALID DESTINATION}	 ${VALID CONTACTPERSON}	  ${VALID RELATION}	${VALID EMAIL}	 191			 *Please enter a valid phone number!!

*** Keywords ***
Fill Invalid Form Should Fail
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactPerson}    ${relation}    ${email}    ${phoneNumber}    ${errorMsg}
    Input Firstname      ${firstname}
    Input Lastname       ${lastname}
    Input Destination    ${destination}
    Input ContactPerson  ${contactPerson}
    Input Relationship   ${relation}
    Input Email   	 ${email}
    Input PhoneNumber    ${phoneNumber}
    Submit Form Fail
    Error Message Should Be Displayed    ${errorMsg}

Complete Form Should Have Failed
    Location Should Be    ${FORM URL}
    Title Should Be    	  Customer Inquiry

Error Message Should Be Displayed
    Location Should Be    ${FORM URL}
    Title Should Be    	  Customer Inquiry
    [Arguments]    ${errorMsg}
    Element Text Should Be    xpath=//p    ${errorMsg}
    
