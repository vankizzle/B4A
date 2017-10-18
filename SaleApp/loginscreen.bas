Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public wholescrn As Panel
	Public panellogin As Panel
	Public username As EditText
	Dim password As EditText
	Dim btnlog As Button
	Dim registerbtn As Button
	
	Public afterloggin As afterlogin
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	wholescrn.Initialize("wholescr")
 	panellogin.Initialize("flscrLogin")
	username.Initialize("usernamelog")
	password.Initialize("passwordlog")
	btnlog.Initialize("loginbtn")
	registerbtn.Initialize("regbtn")
	afterloggin.Initialize(Me)
	
	BuildUIlogin
	
End Sub

Sub BuildUIlogin

	wholescrn.AddView(panellogin,0,0,100%x,100%y)
	
	panellogin.Color = Colors.RGB(24, 96, 178)
	panellogin.AddView(username,20%x,20%y,30%x,15%y)
	panellogin.AddView(password,20%x,username.Top + 25%y,30%x,15%y)
	panellogin.AddView(btnlog,55%x,35%y,30%x,15%y)
	
	username.Color = Colors.White
	username.TextColor = Colors.Black
	password.Color = Colors.White
	password.TextColor = Colors.Black
	username.SingleLine = True
	password.SingleLine = True
	
	btnlog.Color = Colors.White
	btnlog.Text = "Login"
	btnlog.TextColor = Colors.Black
	
	panellogin.AddView(registerbtn,85%x,5%y,14%x,15%y)
	registerbtn.Color = Colors.White
	registerbtn.Text = "Register"
	registerbtn.TextColor = Colors.Black
	
	
End Sub

Sub loginbtn_Click
	If username.Text = ""  Or password.Text = "" Then
		ToastMessageShow("Nothing entered!",False)
	Else
		Dim filetemp As RandomAccessFile
		filetemp.Initialize(File.DirDefaultExternal,"userninfo.dat",True)
		Dim tempuser As user
		tempuser = filetemp.ReadObject(filetemp.CurrentPosition) 
			If tempuser.loginname = username.Text Then
				If tempuser.password = password.Text Then
					ToastMessageShow("Login Successful!",False)
				     wholescrn.AddView(afterloggin.wholescreen,0,0,100%x,100%y)
					afterloggin.wholescreen.BringToFront
'				afterloggin.username = username.Text
				afterloggin.UIbuild
				End If
			End If
	End If
End Sub

Public Sub GetUsername As String
	Return username.Text
End Sub

Sub regbtn_Click
	wholescrn.SendToBack
End Sub