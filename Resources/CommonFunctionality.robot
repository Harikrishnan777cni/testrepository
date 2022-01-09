*** Settings ***

Library  SeleniumLibrary
*** Keywords ***
Start TestCase
    Open Browser  https://google.com  chrome
    Maximize Browser Window

Finish TestCase
    Close All Browsers

