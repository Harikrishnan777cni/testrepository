*** Settings ***
Documentation  Use this layer to get data from external files
Library  ../CustomLibs/Csv.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data}=  read_csv_file  ${FilePath}
    [Return]  ${Data}


