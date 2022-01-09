*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Resource  ../../Resources/Assetnavigation Keywords/Sharedwipnavigationkeywords.robot
Library  ../../CustomLibs/Csv.py
Library  String
*** Keywords ***

Diff market sharedwipassetnavigation using the csvfile
    [Arguments]  ${marketfolders}
    FOR   ${marketlist}  IN   @{marketfolders}
        Sleep  2s
        Sharedwipnavigationkeywords.Go to Imagestab
        Wait Until Keyword Succeeds  3x  4s   Sharedwipnavigationkeywords.Go to Folderstab
        Wait Until Keyword Succeeds  3x  4s  Go to CNIfolder
        Wait Until Keyword Succeeds  3x  4s  Go to Marketfolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to Titlefolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to diff_sharedwip folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to HIGHRES folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to sharedwipsection folder   ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to feature folder    ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to sharedassets folder   ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to published folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Go to sharedwipasset    ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Check sharedwipasset thumbnail  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s  Check downloadoriginalrenditionlink is not present on sharedwip trunk  ${marketlist}
    END














