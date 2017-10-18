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
	
	
	wholescreen.AddView(moneymang.screen,0,0,100%x,100%y)
	moneymang.screen.SendToBack
	moneymang.BuildMoneyManegmentUI
	
	wholescreen.AddView(salesmang.screen,0,0,100%x,100%y)
	salesmang.screen.SendToBack
	salesmang.UIbuild
End Sub

Sub UIaddons
	subwholescr.AddView(addmoney,20%x,15%y,20%x,10%y)
	addmoney.Color = Colors.White
	addmoney.Text = "Cash managment"
	addmoney.TextColor = Colors.Black
	
	subwholescr.AddView(Sales1,40%x,15%y,20%x,10%y)
	Sales1.Color = Colors.White
	Sales1.Text = "Sales"
	Sales1.TextColor = Colors.Black
End Sub

Sub Addsum_Click
	ShowMoneyManagment
End Sub

Sub Sales1_Click
	ShowSalesManagment
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

Sub Fake_Click
	Return True
End Sub

