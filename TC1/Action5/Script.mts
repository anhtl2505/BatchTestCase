﻿'-------------------------------- Test1 ---------------------------------------------------
showMessageInJenkinsConsole "TC001", "Login Order flight successful"
Call Login()
Call BookFlight()
Call BookDate()
Call BookClass()
Call BookTickets()
Call FindSelectFlight()
Call FillDetail()
Call Quit()

'-------------------------------- Test2 ---------------------------------------------------

showMessageInJenkinsConsole "TC002", "Check Flight"
Call Login()
Call BookFlight()
Call BookDate()
Call BookClass()
Call BookTickets()
Call Quit()