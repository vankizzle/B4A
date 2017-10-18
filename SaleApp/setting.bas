Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Private fullscr As Panel
	Private base As Panel
'	Private header As Panel
'	Private footer As Panel
	Private scview1 As ScrollView
	
'	Public device1 As Label
'	Public device2 As Label
'	Public device3 As Label
	Public curdev As String 

	Type device(name As String,property As List)
	Public devList As List
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	fullscr.Initialize("falseclick")
	base.Initialize("popwindow")
'	header.Initialize("header")
'	footer.Initialize("footer")
	scview1.Initialize(-2)
	devList.Initialize

	
'	Dim dev As device
'	dev.Initialize
'	dev.name = "dev1"
'	dev.property.Initialize
'	dev.property.AddAll(Array As Int(Main.S_Pass,Main.S_User))
'	devList.Add(dev)
''	
'	Dim dev2 As device
'	dev2.Initialize
'	dev2.name = "dev2"
'	dev2.property.Initialize
'	dev2.property.Add(Main.S_Pass)
'	devList.Add(dev2)
''	
'	Dim dev3 As device
'	dev3.Initialize
'	dev3.property.Initialize
'	dev3.name = "dev3"
'	dev3.property.Add(Main.S_User)
'	devList.Add(dev3)
'	
	devInit
	BuildUI
	

End Sub
 
Public Sub getDevList As List
	Dim l As List
	l.Initialize
	
	For Each d As device In devList
		l.Add(d.name)
	Next
	
	Return l
End Sub

Public Sub BuildUI
	
	fullscr.AddView(base,25%x,0%y,50%x,100%y)
	fullscr.Color = Colors.ARGB(150,0,0,0)	
	base.Color = Colors.ARGB(250,0,0,0)
	base.AddView(scview1,0%x,0%y,50%x,100%y)
	base = scview1.Panel
	
	'	Activity.AddView(scpan,0,0,100%x,200%y)
	
	scview1.Panel.Height=100%y + 5dip
	
	
	
'	base.AddView(device1,0%x,0%y,50%x,10%y)
'	device1.Text = "Device #1"
'	device1.Color = Colors.RGB(166,166,166)
'	device1.TextSize = 20
'	
'	
'	base.AddView(device2,0%x,device1.Top + 10%y + 1dip,50%x,10%y)
'	device2.Text = "Device #2"
'	device2.Color = Colors.RGB(166,166,166)
'	device2.TextSize = 20
'	
'	base.AddView(device3,0%x,device2.Top + 10%y + 1dip,50%x,10%y)
'	device3.Text = "Device #3"
'	device3.Color = Colors.RGB(166,166,166)
'	device3.TextSize = 20
	
End Sub

Public Sub AsView As Panel
	Return fullscr
End Sub

Public Sub falseclick_Click 
	Return True
End Sub

Public Sub dev1_Click
	
'	ToastMessageShow("Device selected!",False)
	fullscr.SendToBack
	base.SendToBack
'	curdev = device1.Text
	CallSub2(Main,"Refresh",curdev)
	
End Sub

Public Sub dev2_Click
	
'	ToastMessageShow("Device selected!",False)
	fullscr.SendToBack
	base.SendToBack
'	curdev = device2.Text
	CallSub2(Main,"Refresh",curdev)
End Sub

Public Sub dev3_Click
	
'	ToastMessageShow("Device selected!",False)
	fullscr.SendToBack
	base.SendToBack
'	curdev = device3.Text
	CallSub2(Main,"Refresh",curdev)
End Sub

Sub devInit
	Dim dev As device
	dev.Initialize
	dev.name = "dev1"
	dev.property.Initialize
	dev.property.AddAll(Array As Int(Main.S_Pass,Main.S_User))
	devList.Add(dev)
	
	Dim dev2 As device
	dev2.Initialize
	dev2.name = "dev2"
	dev2.property.Initialize
	dev2.property.Add(Main.S_Pass)
	devList.Add(dev2)
	
	Dim dev3 As device
	dev3.Initialize
	dev3.property.Initialize
	dev3.name = "dev3"
	dev3.property.Add(Main.S_User)
	devList.Add(dev3)
End Sub