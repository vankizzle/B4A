Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public screen As Panel
	Dim subscreen As Panel
	Dim textfield As EditText
	Dim Deposit  As Button
	Dim Withdraw As Button
	
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	screen.Initialize("menuscreen")
	subscreen.Initialize("subscr")
	textfield.Initialize("text")
	Deposit.Initialize("btn1")
	Withdraw.Initialize("btn2")
End Sub

Public Sub BuildMoneyManegmentUI
	screen.AddView(subscreen,20%x,25%y,100%x,100%y)
	subscreen.Color = Colors.White
	subscreen.AddView(textfield,25%x,30%y,55%x,15%y)
	subscreen.AddView(Deposit,25%x,45%y,20%x,15%y)
	subscreen.AddView(Withdraw,50%x,45%y,20%x,15%y)
	textfield.InputType = textfield.INPUT_TYPE_NUMBERS
	Deposit.Text = "Deposit"
	Withdraw.Text = "Withdraw"
End Sub

Sub btn1_Click
	If textfield.Text = "" Then
		ToastMessageShow("Nothing entered",False)
	Else
		
'		Dim filetemp As RandomAccessFile
'		filetemp.Initialize(File.DirDefaultExternal,"userninfo.dat",True)
'		
'		Dim tempuser As user
'		tempuser = filetemp.ReadObject(filetemp.CurrentPosition)
'		
		Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
		
		Main.currentuser.money = Main.currentuser.money + textfield.Text
    	tmp.afterloggin.accmoney
'		filetemp.Close
		Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
		Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
		Main.file1.Close
		
		screen.SendToBack
		
	End If
End Sub

Sub btn2_Click
	If textfield.Text = "" Then
		ToastMessageShow("Nothing entered",False)
	Else
	Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
	Main.currentuser.money = Main.currentuser.money - textfield.Text
	tmp.afterloggin.accmoney
		Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
		Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
		Main.file1.Close
	screen.SendToBack
	End If
End Sub

