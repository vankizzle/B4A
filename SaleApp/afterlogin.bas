Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public wholescreen As Panel
	Public subwholescr As Panel
	Dim avataricon As Button 
	Dim avatarimg As Bitmap = LoadBitmapSample(File.DirAssets,"avatar.png",215dip,215dip)
	Dim accountname As Label
	Public username As String
	Dim accountrank As Label
	Public accountbalance As Label
	Dim accountbalance1 As Label
	
	Public addmoney As Button
	Dim moneymang As moneymanagment
	
	Dim Sales1 As Button
	Dim salesmang As sales
	
	Dim history As Button
	Dim histoymng As ActionHistory
	
	Dim AddText As Label
	Dim AdTimer As Timer
	
	Dim actions As ActivitiesUtilities
	Dim other_activities As OtheActivitiesForUser
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(ck As Object)
	wholescreen.Initialize("wholescr")
	subwholescr.Initialize("Fake")
	avataricon.Initialize("avatar")
	accountname.Initialize("accname")
	accountrank.Initialize("rank")
	accountbalance.Initialize("accmoney")
	
	addmoney.Initialize("Addsum")
	moneymang.Initialize
	
	Sales1.Initialize("Sales1")
	salesmang.Initialize
	
	history.Initialize("Histor")
	histoymng.Initialize
	
	AddText.Initialize("movingadd")
	AdTimer.Initialize("Timer1",5)
	AdTimer.Enabled = False
	
	actions.Initialize
	other_activities.Initialize
End Sub

 Public Sub UIbuild
	wholescreen.AddView(subwholescr,0,0,100%x,100%y)
	subwholescr.Color = Colors.RGB(24, 96, 178)
	subwholescr.AddView(avataricon,0,0,20%x,25%y)
	avataricon.SetBackgroundImage(avatarimg)
	
	subwholescr.AddView(accountname,2%x,25%y,20%x,10%y)
	
	accountname.Text =  Main.currentuser.loginname
	accountname.TextSize = 40
	accountname.TextColor = Colors.White
	
	subwholescr.AddView(accountrank,2%x,35%y,20%x,10%y)
	accountrank.Text = "Rank:" & Main.currentuser.rank
	accountrank.TextSize = 30
    
	Dim filetemp1 As RandomAccessFile
	filetemp1.Initialize(File.DirDefaultExternal,"userninfo.dat",True)
	Dim tempuser As user
	tempuser = filetemp1.ReadObject(filetemp1.CurrentPosition)
	filetemp1.Close
	
	subwholescr.AddView(accountbalance,2%x,45%y,20%x,15%y)
	accountbalance.TextSize = 30 
	accountbalance.Text = "Balance:" & CRLF & tempuser.money
	
	UIaddons

	subwholescr.AddView(AddText,20%x,0,80%x,15%y)
	AddText.Text = "WELCOME -> "  & Main.currentuser.loginname & " <-"
'	AddText.Gravity = Gravity.CENTER
	AddText.TextSize = 40
	AddText.TextColor = Colors.Black
		
	AdTimer.Enabled = True
	
	
	
End Sub

Sub UIaddons
	subwholescr.AddView(actions.TabHost1,20%x - 4dip,15%y,80%x + 8dip,100%y)
'	subwholescr.AddView(other_activities.TabHost2,0,60%y,20%x,20%y)
End Sub

Sub Addsum_Click
	ShowMoneyManagment
End Sub

Sub Sales1_Click
	ShowSalesManagment
End Sub

Sub Histor_Click
	ShowHistory
End Sub

Public Sub accmoney 
	accountbalance.Text = "Balance:" & CRLF & Main.currentuser.money
End Sub

Sub ShowMoneyManagment
	moneymang.screen.BringToFront
End Sub

Sub ShowSalesManagment
	salesmang.screen.BringToFront
End Sub

Sub ShowHistory As Boolean
	histoymng.BuildUI
	Return True
End Sub

Sub HideHistory As Boolean
	histoymng.screen.RemoveAllViews
	Return True
End Sub

Sub Timer1_Tick
	
		AddText.Left = AddText.Left - 1
		
	If AddText.Left < avataricon.Left + avataricon.Width Then
			AddText.Left = 100%x
		End If
	
	
End Sub

Sub Fake_Click
	Return True
End Sub

