# นายธนทัต ภู่แก้ว 663380211-0
*** Settings ***
Documentation  Register with all field
Library  SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}  ${EXECDIR}${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}  ${EXECDIR}${/}chromedriver${/}chromedriver-win64${/}chromedriver.exe
${URL}  http://localhost:8080/Lab4/Registration.html
${BROWSER}  Chrome
${DELAY}  1 seconds

*** Test Cases ***
Register with Organization Case
	Open Register page
	Register with Organization
	Close Browser

Register without Organization Case
	Open Register page
	Register without Organization
	Close Browser

*** Keywords ***
Open Register Page
	Set Selenium Speed  ${DELAY}
	Open Browser  ${URL}  ${BROWSER}
	Title Should Be  Registration

Register without Organization
	&{R}=  Create Dictionary  firstname=Somsri  lastname=sodsai  email=somsri@kkumail.com  phone=081-001-1234
	FOR  ${key}  ${value}  IN  &{R}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	${title} =  Get Title
	Log To Console  ${title}
	Title Should be  Success
	Page Should Contain  Thank you for registering with us.
	Page Should Contain  We will send a confirmation to your email soon.

Register with Organization
	Set Selenium Speed  0s
	&{RO} =  Create Dictionary  firstname=Somsri  lastname=sodsai  organization=CS KKU  email=somsri@kkumail.com  phone=081-001-1234
	FOR  ${key}  ${value}  IN  &{RO}
		Input Text  ${key}  ${value}  true
	END
	Set Selenium Speed  1s
	Submit Form  myform
	${title} =  Get Title
	Log To Console  ${title}
	Title Should be  Success
	Page Should Contain  Thank you for registering with us.
	Page Should Contain  We will send a confirmation to your email soon.
