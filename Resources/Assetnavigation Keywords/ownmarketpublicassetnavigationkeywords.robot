*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py
Resource  ../../Resources/Assetnavigation Keywords/Publicassetnavigationkeywords.robot

*** Keywords ***
Ownmarket publicassetnavigation using the csvfile
  [Arguments]  ${ownmarketfolders}
  FOR   ${marketlist}  IN  @{ownmarketfolders}
     Go to Imagestab
     Wait Until Keyword Succeeds  3x  4s   Go to my folder tab
     Wait Until Keyword Succeeds  3x  4s   Go to public folder
     Wait Until Keyword Succeeds  3x  4s   Go to year folder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to issue folder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to print folder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to section folder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to layout folder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to assetfolder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to publishertypefolder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to ingestedfolder  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Go to asset  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Check asset thumbnail  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Run Keyword and Ignore Error  Check productiondigitallink is present on trunk
     Wait Until Keyword Succeeds  3x  4s   Check downloadoriginalrenditionlink is present on trunk  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Expand branch  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Check branch thumbnail  ${marketlist}
     Wait Until Keyword Succeeds  3x  4s   Check downloadproductionlink is present on branch  ${marketlist}
  END













