Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public screen As Panel
	Dim subscreen As Panel
	Public saleslist As ScrollView
	Public btnlist As List
	

End Sub

'Initializes the object. You can add parameters to this method if needed.

Public Sub Initialize
screen.Initialize("screen")
subscreen.Initialize("subscreen")
saleslist.Initialize(-2)
btnlist.Initialize
UIbuild
End Sub


Sub UIbuild
	screen.AddView(subscreen,20%x,25%y,100%x,100%y)
	subscreen.AddView(saleslist,0,0,100%x,100%y)
	saleslist.Color = Colors.White

	Props
End Sub




Sub Props
	For i=0 To 5
		
		Public salepnl As Panel
		Public  salep As Label
		Public salenm As Label
		Public buybtn As Button
		
		salepnl.Initialize("pan")
		salep.Initialize("priz")
		salenm.Initialize("name")
		buybtn.Initialize("butnn")
		
		salepnl.Color = Colors.RGB(179, 179, 179)
		
		salepnl.AddView(salenm,0%x,0%y,15%x,15%y)
		salenm.Text = "Property #" & (i+1) 
		salenm.TextColor = Colors.Black
		salenm.TextSize = 20 
		salenm.Gravity = Gravity.CENTER
		
		salepnl.AddView(salep,20%x,0%y,15%x,15%y)
		salep.Text = saleprice
		salep.Color = Colors.RGB(255, 153, 51)
		salep.TextSize = 20
		salep.Gravity = Gravity.CENTER
		salep.TextColor = Colors.Black
		
		salepnl.AddView(buybtn,40%x,0%y,15%x,15%y)
		buybtn.Color = Colors.RGB(1, 174, 1)
		buybtn.Text = "BUY"
		buybtn.Tag = i
		buybtn.TextSize = 20
		buybtn.TextColor = Colors.Black
		buybtn.Gravity = Gravity.CENTER
		
		saleslist.Panel.AddView(salepnl,0,0 + (15%y+5dip)*i,100%x,15%y)
		btnlist.Add(salep)
	Next
	
End Sub

Sub saleprice As Int
	Dim salespriceint As Int
	salespriceint = Rnd(200,5000)
	Return salespriceint
End Sub

Sub butnn_Click
	Dim tmpbtn As Button = Sender
	Dim templbl As Label = btnlist.Get(tmpbtn.Tag)
	
	
	If Main.currentuser.money > templbl.Text Then
		Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
		Main.currentuser.money = Main.currentuser.money - templbl.Text
		tmp.afterloggin.accmoney
		Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
		Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
		Main.file1.Close
		screen.SendToBack
	Else
		ToastMessageShow("Not enought money!",False)
		screen.SendToBack
	End If
	'ToastMessageShow("ERRR",False)
End Sub