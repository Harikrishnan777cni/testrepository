*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Resource  ../../Resources/Assetnavigation Keywords/Publicassetnavigationkeywords.robot

*** Keywords ***
Differentmarketpublicassetnavigation using the csvfile
    [Arguments]  ${marketfolders}
    FOR   ${marketlist}  IN   @{marketfolders}
        Sleep  2s
        Wait Until Keyword Succeeds  3x  4s  Go to Imagestab
        Wait Until Keyword Succeeds  3x  4s    Go to CNIfolder
        Wait Until Keyword Succeeds  3x  4s    Go to Marketfolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to Titlefolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Check whether Commissioned, Non-Commissioned, Studio folders not acessible
        Wait Until Keyword Succeeds  3x  4s    Go to diff_Public folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to year folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to issue folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to print folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to section folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to layout folder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to assetfolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to publishertypefolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to ingestedfolder  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Go to asset  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Check asset thumbnail  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Check productiondigitallink is not present on trunk
        Wait Until Keyword Succeeds  3x  4s    Check downloadoriginalrenditionlink is not present on trunk
        Wait Until Keyword Succeeds  3x  4s    Expand branch  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Check branch thumbnail  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s    Check downloadproductionlink is not present on branch

    END
