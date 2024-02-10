*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Documentation    To Connect and read csv file
Library    SeleniumLibrary
Library    DataDriver    file=

*** Test Cases ***
Validate UnSuccessful Login
    open the Browser with Login screen
    fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the Browser with Login screen
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    Input Text    id:username    rajeshbedse
    Input Password    id:password    132465
    Select Checkbox    id:terms
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${alertText}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${alertText}    Incorrect username/password.