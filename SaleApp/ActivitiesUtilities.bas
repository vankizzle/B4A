Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public TabHost1 As TabHost
	Dim moneymanagment As Panel
	Dim sales1 As ScrollView
	Dim history As ScrollView
	Dim addsale As Panel
	
	'adding moneymanagment content
	Dim textfield As EditText
	Dim Deposit  As Button
	Dim Withdraw As Button
	
	'adding sales content
	Dim salename As Label
	Dim saleprice As Label
	Dim saleprice1 As Int 
	Dim buybtn As Button
	Dim saleinfo As Label
	Dim contenthold As Panel
	'sale type
	Dim AddedSale As sale
	Dim file2 As RandomAccessFile
	'adding add_sales content
	Dim entersalename As EditText
	Dim entersaleprice As EditText
	Dim entersaleinfo As EditText
	Dim publishsale As Button	
	Private booBuild As Boolean
	Public btnlist As List
	Dim i As Int = 0
	Dim listpossition As Int = 0
	Dim pricetag As Int = 0
	Dim buybtntag As Int = 0
	Dim z As Int = 0
	
'adding history content
    Dim content_hold_for_transactions As Panel
	Dim content_hold_for_sales As Panel
	Dim h_salename As Label
	Dim h_saleprice As Label
	Dim h_saleboughtorpublished As Label
	Dim h_depositorwithdrwasum As Label
	Dim h_isdepositorwithdraw As Label
	Dim h_dateandtime As Label
	Dim now As Long
	Dim M, H As String

	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	TabHost1.Initialize("Utils")
	moneymanagment.Initialize("money")
	sales1.Initialize(-1)
	history.Initialize(-1)
	addsale.Initialize("addsales")
	
	textfield.Initialize("addsumfield")
	Deposit.Initialize("deposit")
	Withdraw.Initialize("withdraw")

	AddedSale.Initialize
	AddedSale.price.Initialize
	entersalename.Initialize("salename")
	entersaleinfo.Initialize("saleinfo")
	entersaleprice.Initialize("saleprise")
	publishsale.Initialize("publishbtn")
	btnlist.Initialize
	
	
	If booBuild = False Then
		BuildUI
		booBuild = True
	End If
End Sub

Sub BuildUI
	TabHost1.AddTab2("Finances",moneymanagment)
	TabHost1.AddTab2("Sales",sales1)
	TabHost1.AddTab2("History",history)
	TabHost1.AddTab2("Add sale",addsale)
	Moneymangmt_Contents
	AddSale_Contents
	
	If contenthold.IsInitialized Then
		salesmangmt_Contents
	End If
	
	If content_hold_for_transactions.IsInitialized Then
		History_Contents_Transactions
	End If
	
	If content_hold_for_sales.IsInitialized Then
		History_Contents_Sales

	End If
End Sub

Sub Moneymangmt_Contents
	moneymanagment.Color = Colors.White
	moneymanagment.AddView(textfield,10%x,20%y,60%x,15%y)
	moneymanagment.AddView(Deposit,10%x,40%y,30%x,15%y)
	moneymanagment.AddView(Withdraw,40%x,40%y,30%x,15%y)
	textfield.InputType = textfield.INPUT_TYPE_NUMBERS
	Deposit.Text = "Deposit"
	Withdraw.Text = "Withdraw"
	Deposit.TextColor = Colors.Black
	Withdraw.TextColor = Colors.Black
End Sub

Sub salesmangmt_Contents
sales1.Color = Colors.White
contenthold.Color = Colors.RGB(179, 179, 255)
salename.TextSize = 30
saleinfo.TextSize = 20
saleprice.TextSize = 30 
salename.TextColor = Colors.Black
salename.Color = Colors.RGB(191, 191, 191)
salename.Gravity = Gravity.CENTER
saleinfo.TextColor = Colors.Black
saleinfo.Color = Colors.RGB(77, 166, 255)
saleprice.Color = Colors.RGB(0, 115, 230)
saleprice.TextColor = Colors.Black
saleprice.Gravity = Gravity.CENTER
buybtn.Color = Colors.RGB(0, 153, 0)
buybtn.Text = "BUY"
buybtn.TextSize = 15
buybtn.Gravity = Gravity.CENTER
buybtn.Tag = buybtntag
buybtntag = buybtntag + 1
End Sub

Sub AddSale_Contents
	addsale.Color=Colors.White
	addsale.AddView(entersalename,20%x,5%y,40%x,10%y)
	addsale.AddView(entersaleinfo,10%x,15%y,60%x,25%y)
	addsale.AddView(entersaleprice,30%x,40%y,20%x,10%y)
	addsale.AddView(publishsale,30%x,50%y,20%x,15%y)
	
	entersalename.Hint = "Enter sale name"
	entersaleinfo.Hint = "Enter infromation"
	entersaleprice.Hint = "Enter price"
	entersaleprice.InputType = entersaleprice.INPUT_TYPE_NUMBERS
	publishsale.Color = Colors.RGB(0, 153, 0)
	publishsale.Text = "Submit"
	publishsale.TextColor = Colors.Black
End Sub

Sub History_Contents_Sales
	history.Color = Colors.white
	content_hold_for_sales.Color = Colors.DarkGray
	h_salename.TextSize = 20
	h_salename.Gravity = Gravity.CENTER
	h_salename.TextColor = Colors.White
	h_saleprice.TextSize = 20
	h_saleprice.Gravity = Gravity.CENTER
	h_saleprice.TextColor = Colors.White
	h_saleboughtorpublished.TextSize = 20
	h_saleboughtorpublished.Gravity = Gravity.CENTER
	h_saleboughtorpublished.TextColor = Colors.White
	h_dateandtime.TextColor = Colors.White
	h_dateandtime.Gravity = Gravity.CENTER
	h_dateandtime.TextSize = 20
	DateTime.DateFormat = "dd MMM yyyy"
	DateTime.TimeFormat = "hh:mm"
	h_dateandtime.Text = DateTime.Date(DateTime.Now) & " at " &  DateTime.Time(DateTime.Now)
End Sub

Sub History_Contents_Transactions
	history.Color = Colors.white
	
	content_hold_for_transactions.Color = Colors.DarkGray
	h_depositorwithdrwasum.TextSize = 20
	h_depositorwithdrwasum.Gravity = Gravity.CENTER
	h_depositorwithdrwasum.TextColor = Colors.White
	h_isdepositorwithdraw.TextSize = 20
	h_isdepositorwithdraw.Gravity = Gravity.CENTER
	h_isdepositorwithdraw.TextColor = Colors.White
	h_dateandtime.TextColor = Colors.White
	h_dateandtime.Gravity = Gravity.CENTER
	h_dateandtime.TextSize = 20
	DateTime.DateFormat = "dd MMM yyyy"
	DateTime.TimeFormat = "hh:mm"

	h_dateandtime.Text = DateTime.Date(DateTime.Now) & " at " &  DateTime.Time(DateTime.Now)
'	Label5.Text = H & ":" & M
End Sub

Sub deposit_Click
	If textfield.Text = "" Then
		ToastMessageShow("Nothing entered",False)
	Else
		
		Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
		
		Main.currentuser.money = Main.currentuser.money + textfield.Text
		
		tmp.afterloggin.accmoney
		CreateHistoryOfDeposit
		
		Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
		Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
		Main.file1.Close
	End If
End Sub

Sub withdraw_Click
	If textfield.Text = "" Then
		ToastMessageShow("Nothing entered",False)
	Else
		Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
		Main.currentuser.money = Main.currentuser.money - textfield.Text
		If Main.currentuser.money < 0 Then
			Main.currentuser.money = 0
		End If
		tmp.afterloggin.accmoney
		CreateHistoryOfWithdraw
		
		Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
		Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
		Main.file1.Close
	End If
End Sub

Sub publishbtn_Click
	If entersalename.Text = "" Or entersaleprice.Text = "" Then
		ToastMessageShow("Missing information",False)		
	Else
		File_initialization
		contenthold.Initialize("contents")
		salename.Initialize("addedsalename")
		saleprice.Initialize("addedsaleprice")
		saleinfo.Initialize("addedsaleinfo")
		buybtn.Initialize("buybtnX")
		
		AddedSale.name = entersalename.Text
		AddedSale.info = entersaleinfo.Text
		AddedSale.price.Add(entersaleprice.Text)
		file2.WriteObject(AddedSale,False,file2.CurrentPosition)
		file2.Close
		salename.Text = AddedSale.name
		saleinfo.Text = AddedSale.info
		saleprice.Text = AddedSale.price.Get(listpossition)
		saleprice1 = saleprice.Text
		saleprice.Tag = pricetag
		pricetag = pricetag + 1
		listpossition = listpossition + 1
	
		sales1.Panel.AddView(contenthold,0,0+(15%y + 1dip)*i,100%x,15%y)
		i = i + 1
		contenthold.AddView(salename,0,0,20%x,15%y)
		contenthold.AddView(saleinfo,20%x,0,20%x,15%y)
		contenthold.AddView(saleprice,40%x,0,20%x,15%y)
		contenthold.AddView(buybtn,60%x,0,20%x,15%y)
		salesmangmt_Contents
		CreateSalePublished
	End If
	entersalename.Text = ""
	entersaleinfo.Text = ""
	entersaleprice.Text = ""
End Sub

Public Sub File_initialization
	file2.Initialize(File.DirDefaultExternal,"saleinfo.dat",False)
End Sub

Sub buybtnX_Click
	Dim tmpbtn As Button = Sender

	If Main.currentuser.money > saleprice.Text Or Main.currentuser.money = saleprice.Text Then
			Public tmp As loginscreen = CallSub(Main,"Get_loginscrn")
		Main.currentuser.money = Main.currentuser.money - AddedSale.price.Get(tmpbtn.Tag)
			tmp.afterloggin.accmoney
			Main.file1.Initialize(File.DirDefaultExternal,"userninfo.dat",False)
			Main.file1.WriteObject(Main.currentuser,False,Main.file1.CurrentPosition)
			Main.file1.Close
		Else
			ToastMessageShow("Not enought money!",False)
		End If
		'ToastMessageShow("ERRR",False)

End Sub

Sub CreateHistoryOfDeposit
	content_hold_for_sales.Initialize("content1")
	content_hold_for_transactions.Initialize("content")
	h_depositorwithdrwasum.Initialize("addedsum")
	h_isdepositorwithdraw.Initialize("isdeposit")
	h_dateandtime.Initialize("timeshow")
	h_depositorwithdrwasum.Text = textfield.Text
	h_isdepositorwithdraw.Text = "Deposited"
	history.Panel.AddView(content_hold_for_transactions,0,0+(15%y + 1dip)*z,100%x,15%y)
	z = z + 1
	content_hold_for_transactions.AddView(h_isdepositorwithdraw,0,0,20%x,15%y)
	content_hold_for_transactions.AddView(h_depositorwithdrwasum,20%x,0,20%x,15%y)
	content_hold_for_transactions.AddView(h_dateandtime,40%x,0,20%x,15%y)
	History_Contents_Transactions
End Sub

Sub CreateHistoryOfWithdraw
	content_hold_for_sales.Initialize("content1")
	content_hold_for_transactions.Initialize("content")
	h_depositorwithdrwasum.Initialize("addedsum")
	h_isdepositorwithdraw.Initialize("isdeposit")
	h_dateandtime.Initialize("timeshow")
	h_depositorwithdrwasum.Text = textfield.Text
	h_isdepositorwithdraw.Text = "Withdrawed"
	history.Panel.AddView(content_hold_for_transactions,0,0+(15%y + 1dip)*z,100%x,15%y)
	z = z + 1
	content_hold_for_transactions.AddView(h_isdepositorwithdraw,0,0,20%x,15%y)
	content_hold_for_transactions.AddView(h_depositorwithdrwasum,20%x,0,20%x,15%y)
	content_hold_for_transactions.AddView(h_dateandtime,40%x,0,20%x,15%y)
	History_Contents_Transactions
End Sub

Sub CreateSalePublished
	content_hold_for_transactions.Initialize("content")
	content_hold_for_sales.Initialize("content1")
	h_salename.Initialize("salename")
	h_saleprice.Initialize("saleprice")
	h_dateandtime.Initialize("timeshow")
	h_saleboughtorpublished.Initialize("boughtorpublished")
	
	h_salename.Text = entersalename.Text
	h_saleprice.Text = entersaleprice.Text
	h_saleboughtorpublished.Text = "Published"
	history.Panel.AddView(content_hold_for_sales,0,0+(15%y + 1dip)*z,100%x,15%y)
	z = z + 1
	content_hold_for_sales.AddView(h_saleboughtorpublished,0,0,20%x,15%y)
	content_hold_for_sales.AddView(h_salename,20%x,0,20%x,15%y)
	content_hold_for_sales.AddView(h_saleprice,40%x,0,20%x,15%y)
	content_hold_for_sales.AddView(h_dateandtime,60%x,0,20%x,15%y)
	History_Contents_Sales
End Sub