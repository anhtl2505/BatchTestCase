
Function Login()
	'Dialog("Run").WinEdit("Open:").Type "C:\Program Files (x86)\Micro Focus\Unified Functional Testing\samples\Flights Application\FlightsGUI.exe"
	'Dialog("Run").WinButton("OK").Click
	SystemUtil.Run "C:\Program Files (x86)\Micro Focus\Unified Functional Testing\samples\Flights Application\FlightsGUI.exe"
	'SystemUtil.Run "FlightsGUI.exe"
	WpfWindow("Micro Focus MyFlight Sample").WpfEdit("agentName").Set("John")
	WpfWindow("Micro Focus MyFlight Sample").WpfEdit("password").Set("hp")
	wait(2)
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("OK").Click
	wait(2)
End Function

Function verifyLogin()
	WpfWindow("Micro Focus MyFlisght Sample").Activate
	WpfWindow("Micro Focus MyFlight Sample").WpfObject("John Smith").CheckProperty
End Function

Function BookFlight()
	DataTable.SetCurrentRow(1)
	Dim FromLocation
	'FromLocation = InputBox("Enter Your Location")
	FromLocation = DataTable.Value("Location","Global")
	'MsgBox "You entered:" & FromLocation
	WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("fromCity").Select (FromLocation)
	wait(2)
	Dim ToLocation
	'ToLocation = InputBox("Enter Where You Want To Go ")
		ToLocation = DataTable.Value("Destination","Global")
	'MsgBox "You entered:" & ToLocation
	If(FromLocation = ToLocation)  Then
		ToLocation = InputBox("Same Location ! PLz Fill again Where You Go")
		'MsgBox "You entered:" & ToLocation
	End If
	WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("toCity").Select (ToLocation)
	wait(2)
End Function

Function BookDate()
	Dim DateTime
	'DateTime = InputBox("Book Flight Date(Example:3-Nov-2018)")
	DateTime = DataTable.Value("Date","Global")
	'MsgBox "Date: " & DateTime
	WpfWindow("Micro Focus MyFlight Sample").WpfCalendar("datePicker").SetDate (DateTime)
	wait(2)
End Function

Function BookClass()
	Dim Choice
	'Choice = InputBox("Your Choice 1-2-3:   1: Economy 2: Business 3: First")
	Choice = DataTable.Value("Class","Global")
	Select Case Choice
		Case "Economy"
		WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("Class").Select "Economy"
		Case "Business"
		WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("Class").Select "Business"
		Case "First"
		WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("Class").Select "First"
	End Select
	wait(2)
End Function

Function BookTickets()
	Dim NumTickets
	'NumTickets = InputBox("Number Your Tickets")
	NumTickets = DataTable.Value("Tickets","Global")
	WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("numOfTickets").Select NumTickets
	wait(2)
End Function

Function FindSelectFlight()
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("FIND FLIGHTS").Click
	WpfWindow("Micro Focus MyFlight Sample").WpfTable("flightsDataGrid").SelectCell 2,2
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("SELECT FLIGHT").Click
	WpfWindow("Micro Focus MyFlight Sample").WpfObject("FLIGHT DETAILS").CheckProperty "visible",True
End Function


Function FillDetail()

	Dim PassengerName
	'PassengerName = InputBox("Passenger Name")
	PassengerName = DataTable.Value("Name","Global")
	WpfWindow("Micro Focus MyFlight Sample").WpfEdit("passengerName").Set (PassengerName)
	wait(1)
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("ORDER").Click
	wait(3)
	WpfWindow("Micro Focus MyFlight Sample").WpfImage("WpfImage").CheckProperty "visible",True
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("NEW SEARCH").Click
End Function

Function Quit()
	WpfWindow("Micro Focus MyFlight Sample").Close
End Function

Function DeleteOrder()
	WpfWindow("Micro Focus MyFlight Sample").WpfObject("FLIGHT DETAILS").CheckProperty "visible",True
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("WpfButton_3").Click
	WpfWindow("Micro Focus MyFlight Sample").Dialog("Notification").WinButton("Yes").Click
	WpfWindow("Micro Focus MyFlight Sample").WpfObject("Order deleted").CheckProperty "visible",True
End Function


Function SearchOrder()
	'WpfWindow("Micro Focus MyFlight Sample").WpfTabStrip("WpfTabStrip").Select
	WpfWindow("Micro Focus MyFlight Sample").VirtualButton("SearchOrder").Click
	MsgBox("Choose: 1: Search by date    2: Search by Number Order ")
	Dim Selection
	Selection = InputBox("Your Choice")
	
	Select Case Selection
		Case 1
		WpfWindow("Micro Focus MyFlight Sample").WpfRadioButton("byNameOrDateRadio").Set
		Dim NameCustomer
		NameCustomer = InputBox("Name Customer You Order Before(Example: John)")
		WpfWindow("Micro Focus MyFlight Sample").WpfEdit("byNameWatermark").Set (NameCustomer)
		Dim DateFlight
		DateFlight = InputBox("Book Flight Date(Example:3-Nov-2018)")
		WpfWindow("Micro Focus MyFlight Sample").WpfCalendar("byDatePicker").SetDate (DateFlight)
		
		Case 2
		WpfWindow("Micro Focus MyFlight Sample").WpfRadioButton("byNumberRadio").Set
		Dim OrderNumber
		OrderNumber = InputBox("Your Number Order Before")
		WpfWindow("Micro Focus MyFlight Sample").WpfEdit("byNumberWatermark").Set (OrderNumber)
	End Select
	
		WpfWindow("Micro Focus MyFlight Sample").WpfButton("SEARCH").Click
		WpfWindow("Micro Focus MyFlight Sample").WpfObject("ORDER DETAILS").CheckProperty "visible",true
End Function


Function EditOrder()
	Dim i
	Dim SelecEdit
	i = 0
	While (i < 1)
		SelecEdit = InputBox("Choose: 1: Edit tickets		2: Edit Class	3: Edit Passenger Name ")
		Select Case SelecEdit
			Case 1
			Dim NumTickets
			NumTickets = InputBox("Edit Your Number Tickets")
			WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("numOfTicketsCombo").Select NumTickets
			Case 2
			Dim ClassEdit
						ClassEdit = InputBox("Edit Your Class:   1: Economy 2: Business 3: First")
						Select Case Choice
								Case 1
								WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("flightClassCombo").Select "Economy"
								Case 2
								WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("flightClassCombo").Select "Business"
								Case 3
								WpfWindow("Micro Focus MyFlight Sample").WpfComboBox("flightClassCombo").Select "First"
						End Select
			Case 3
			Dim NamePas
			NamePas = InputBox("Edit Your Passenger Name")
			WpfWindow("Micro Focus MyFlight Sample").WpfEdit("passengerName").Set (NamePas)
			Case Else
			i = 1
		End Select	
	Wend
	WpfWindow("Micro Focus MyFlight Sample").WpfButton("updateBtn").Click
	WpfWindow("Micro Focus MyFlight Sample").WpfObject("Order completed").CheckProperty "visible",true

End Function
