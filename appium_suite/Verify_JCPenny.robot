*** Settings ***
Library    AppiumLibrary    

*** Test Cases ***
TC1_ValidCredential
    Open Application    http://localhost:4723/wd/hub
    ...    platformName=android
    ...    deviceName=samsung
    ...    appPackage=com.jcp
    ...    appActivity=com.jcpenney.activities.StartupActivity
    ...    noReset=True
    Set Appium Timeout    30s
    Wait Until Page Contains        Sign In
    #Click Element    //*[@text='Skip All']
    Run Keyword And Ignore Error  Click Element  //*[contains(@text='Allow all the time')]
    Click Element    //*[@text='Sign In or Create an Account']
    # Click Element    xpath=//*[contains(@text,'Email') or contains(@text,'gmail')]
    Wait Until page Contains Element    //*[contains(@resource-id,'sign_in_email_address_or_mobile_number')]
      
   Click Element    //*[contains(@resource-id,'sign_in_email_address_or_mobile_number')]     
   #Clear Text    //*[contains(@resource-id,'sign_in_email_address_or_mobile_number')]
   Clear Text    xpath=//*[contains(@text,'Email') or contains(@text,'gmail')]
   Input Text    xpath=//*[contains(@text,'Email') or contains(@text,'gmail')]        valli.potlacheruvu@gmail.com
   Click Element    //*[@text='Password']
   Input Text    //*[@text='Password']    V@lli2023
   Click Element    //*[@text='SIGN IN']
   Wait Until Page Contains Element    //*[contains(@resource-id,'com.jcp:id/search_button')]        
   Click Element    //*[contains(@resource-id,'com.jcp:id/search_button')] 
   Sleep    2s    
   Input Text    //*[@resource-id='com.jcp:id/search_src_text']    baby
   ${bool}    Is Keyboard Shown
   Run Keyword If    '${bool}'=='True'    Hide Keyboard  
   Wait Until Page Contains    Infant Baby Boy Clothes      
   Click Element    //*[contains(@text,'Infant Baby Boy Clothes')]   
   Wait Until Page Contains Element    //*[contains(@text,'Baby Boys Pant Set')]        
   Tap    //*[contains(@text,'Baby Boys Pant Set')]
   #Click Element    //*[contains(@text,'ADD TO CART')]
   Sleep    5s    
   Click Element    //*[@text='3 months']
   Click Element    //*[@text='ADD TO CART']
   Sleep    5s    
   Click Element    //*[@resource-id='com.jcp:id/cart_icon']
   Wait Until Page Contains Element    //*[@resource-id='com.jcp:id/product_description']    
   ${product_name}    Get Text    //*[@resource-id='com.jcp:id/product_description']
   Log To Console    ${product_name}    
   ${Total_price}    Get Text    //*[@resource-id='com.jcp:id/total_price']
   Log To Console    ${Total_price}    
   Click Element    //*[contains(@text,'Valli')]
   Sleep    2s    
   Click Element  //*[@resource-id='com.jcp:id/my_account_sign_out']