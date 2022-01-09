*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Resource  ../../Resources/Assetnavigation Keywords/Sharedwipnavigationkeywords.robot
Library  ../../CustomLibs/Csv.py
Library  String
*** Keywords ***

Own market sharedwipassetnavigation using the csvfile
    [Arguments]  ${marketfolders}
    FOR   ${marketlist}  IN   @{marketfolders}
        Sleep  2s
        Wait Until Keyword Succeeds  3x  4s   Sharedwipnavigationkeywords.Go to Imagestab
        Wait Until Keyword Succeeds  3x  4s   Go to my folder tab
        Wait Until Keyword Succeeds  3x  4s   Go to sharedwip folder
        Wait Until Keyword Succeeds  3x  4s   Go to highresolution folder
        Wait Until Keyword Succeeds  3x  4s   Go to sharedwipsection folder   ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Go to feature folder    ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Go to sharedassets folder   ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Go to published folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Go to sharedwipasset    ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check sharedwipasset thumbnail  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check downloadoriginalrenditionlink is present on sharedwip trunk  ${marketlist}
    END














