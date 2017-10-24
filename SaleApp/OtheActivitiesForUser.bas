Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Public TabHost2 As TabHost
	Dim optionsfortabhost As TabHostExtras
	Dim settings_option As Panel
	Dim testing As Panel
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	TabHost2.Initialize("TabHostB")
	settings_option.Initialize("stngs")
	testing.Initialize("testche")

	BuildUI
End Sub

Sub BuildUI
	TabHost2.AddTab2("Settings",settings_option)
	TabHost2.AddTab2("TEST",testing)
	optionsfortabhost.setTabHeight(TabHost2,20)
	settings_content
	test_content
	
End Sub

Sub settings_content
	settings_option.Color = Colors.White
	
End Sub

Sub test_content
	testing.color = Colors.White
End Sub