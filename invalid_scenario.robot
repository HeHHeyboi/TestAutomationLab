*** Settings ***
Documentation  Register without First name
Library  SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${CHROME_BROWSER_PATH}  ${EXECDIR}${/}chrome-win64${/}chrome.exe
${CHROME_DIRVER_PATH}  ${EXECDIR}${/}chromedriver${/}chromedriver-win64${/}chromedriver.exe
${URL}  http://localhost:8080/Lab4/Registration.html
${BROWSER}  Chrome

*** Test Cases ***
Register without Firstname Case
	Open Register Page
	Empty Firstname
	Close Browser

Register without Lastname Case
	Open Register Page
	Empty Lastname
	Close Browser

Register without Firstname Lastname and Email case
	Open Register Page
	Empty Firstname Lastname and Email
	Close Browser

Register without Phone Number case
	Open Register Page
	Empty Phone Number
	Close Browser

Register with Invalid Phone Number case
	Open Register Page
	Invalid Phone Number
	Close Browser

*** Keywords ***
Open Register Page
	Set Selenium Speed  1s
	Open Browser  ${URL}  ${BROWSER}
	Title Should Be  Registration

Empty Firstname
	${EXPECTED_MSG}=  Set Variable  Please enter your first name!!
	&{REGISTERDATA}=  Create Dictionary  lastname=sodsai  organization=CS KKU  email=somsri@kkumail.com  phone=081-001-1234
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
	  Log To Console    Filling ${key}
		Input Text    id=${key}    ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}

Empty Lastname
	${EXPECTED_MSG}=  Set Variable  Please enter your last name!!
	&{REGISTERDATA}=  Create Dictionary  firstname=Somsri  organization=CS KKU  email=somsri@kkumail.com  phone=081-001-1234
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
		Input Text  id=${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}

Empty Firstname Lastname and Email
	${EXPECTED_MSG}=  Set Variable  Please enter your name!!
	&{REGISTERDATA}=  Create Dictionary  organization=CS KKU  email=somsri@kkumail.com  phone=081-001-1234
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}

	${EXPECTED_MSG}=  Set Variable  Please enter your email!!
	&{REGISTERDATA}=  Create Dictionary  firstname=Somri  lastname=sodsai  email=   organization=CS KKU  phone=081-001-1234
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}

Empty Phone Number
	${EXPECTED_MSG}=  Set Variable  Please enter your phone number!!
	&{REGISTERDATA} =  Create Dictionary  firstname=Somri  lastname=sodsai  organization=CS KKU  email=somsri@kkumail.com  phone= 
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}

Invalid Phone Number
	${EXPECTED_MSG}=  Set Variable  Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
	&{REGISTERDATA}=  Create Dictionary  firstname=Somri  lastname=sodsai  organization=CS KKU  email=somsri@kkumail.com  phone=1234
	Set Selenium Speed  0s
	FOR  ${key}  ${value}  IN  &{REGISTERDATA}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	Set Selenium Speed  0s
	Page Should Contain  ${EXPECTED_MSG}
