SystemUtil.Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe","https://preprod-secure1.mhelpdesk.com"
Browser("mHelpDesk Login").Page("mHelpDesk Login").Sync
Browser("mHelpDesk Login").Page("mHelpDesk Login").WebEdit("ucLogin$txtUsername").Set "Preprodtony2@mhelpdesk.com"
Browser("mHelpDesk Login").Page("mHelpDesk Login").WebEdit("ucLogin$txtPassword").Set "tester123"
Browser("mHelpDesk Login").Page("mHelpDesk Login").Link("Sign In").Click
wait(5)
Browser("mHelpDesk Login").Quit
