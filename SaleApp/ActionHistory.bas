Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public screen As Panel
	Dim subscreen As Panel
	Dim infolbl As Label
	Dim moneymnginfo As moneymanagment
	Dim salesinfo As sales
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
screen.Initialize("wholescr")
subscreen.Initialize("subscr")
infolbl.Initialize("inf")
moneymnginfo.Initialize
salesinfo.Initialize
BuildUI
End Sub

Sub BuildUI
	screen.AddView(subscreen,20%x,25%y,100%x,100%y)
	subscreen.Color = Colors.White

	

End Sub

Sub Addmoneyinfo
	Public infolbl As Label
	infolbl.Initialize("inf")
	subscreen.AddView(infolbl,0,0,100%x,15%y)
	infolbl.Color = Colors.RGB(179, 179, 179)
	infolbl.Text = "Added " & moneymnginfo.textfield.Text
	infolbl.TextColor = Colors.Black
	infolbl.TextSize = 30
End Sub