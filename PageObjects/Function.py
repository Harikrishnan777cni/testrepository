def add(a,b)
    sum= a+b
    return sum

def clickTab(String tabText)
       tabxpath = "//div[contains(text(), '" + tabText + "')]";
       txpath= "//div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='" tabText "']
       driver.findElement(By.xpath(txpath)).click();

   }