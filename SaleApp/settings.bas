Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Dim S_namelbl As Label
	Dim S_text As EditText
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	S_namelbl.Initialize("label")
	S_namelbl.Color = Colors.RGB(1,103,247)
	S_text.Initialize("text")
	S_text.Color = Colors.White
	S_text.TextColor = Colors.Black
	S_namelbl.SetLayout(125dip, 50dip, 120dip, 130dip)
End Sub