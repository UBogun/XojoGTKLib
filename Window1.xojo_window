#tag Window
Begin GTKLib.GTKLibWindow Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   208
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   556
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   126
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   62
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   516
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField TextField1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "a Xojo textfield with an icon, height set automatically"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   516
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event , Description = 5573652074686973206576656E7420746F2064657369676E20612068656164657262617220746F2061747461636820746F207468652077696E646F77206175746F6D61746963616C6C792E2052657475726E207468652068656164657262617220746F206D616B652069742073686F776E2E0A4F6E6C7920617661696C61626C65206F6E204C696E75782E
		Function CreateHeaderBar(Headerbar as GTKLib.GTKHeaderBar) As GTKLib.GTKHeaderBar
		  Headerbar.Title = "Test Bar"
		  Headerbar.Subtitle = "Test Bar Subtitle"
		  Headerbar.SizeRequest = New xojo.core.size(Self.Width, 100)
		  Headerbar.CloseButton = True
		  Headerbar.DecorationLayout="menu:minimize,maximize,close"
		  b1 = New GTKLib.GTKButton("appointment-new", GTKIconSize.Dialog_48px)
		  b1.Caption = "_Test Caption"
		  b1.UseUnderline = True
		  b1.ImagePosition = GtkPositionType.Top
		  b1.AlwaysShowImage = True
		  AddHandler b1.action, AddressOf buttonpushed
		  Headerbar.AddChild b1, True
		  
		  t1 = New GTKLib.GTKEntry("Initial Text")
		  t1.Icon(GTKLib.GTKEntry.GtkEntryIconPosition.Primary)= "help-faq"
		  t1.IconIsActivatable(GTKLib.GTKEntry.GtkEntryIconPosition.Primary)= True
		  t1.IconIsSensitive(GTKLib.GTKEntry.GtkEntryIconPosition.Primary)= True
		  t1.ActivatesDefault = True
		  t1.ReceivesDefault = True
		  t1.CanFocus = True
		  t1.CanFocusOnClick = True
		  t1.WidthForCharacters = 25
		  Headerbar.AddChild t1, False
		  t1.HasFrame = True
		  
		  Dim mb1 As New Xojo.Core.MemoryBlock ( t1.Id, 400)
		  Dim pt1 As ptr = mb1.PtrValue(16)
		  dim tt1 as new GTKLib.GType(pt1)
		  t1.MaxWidthForCharacters = 20
		  dim types() as GTKLib.GType = Headerbar.ChildType.InterfaceTypes
		  t1.ProgressFraction= 0.58
		  t1.Icon(GTKLib.GTKEntry.GtkEntryIconPosition.Secondary)= GTKXLogo
		  t1.IconIsActivatable(GTKLib.GTKEntry.GtkEntryIconPosition.Secondary)= True
		  t1.IconIsSensitive(GTKLib.GTKEntry.GtkEntryIconPosition.Secondary)= True
		  AddHandler t1.IconPressed, AddressOf clickHandler
		  AddHandler t1.TextChanged, AddressOf TextChangeHandler
		  
		  
		  //Dim aw As New GTKLib.GTKApplicationwindow(Self)
		  //
		  //listbox1.AddRow "ApplicationWindow", aw.NaturalWidth.ToText+" x "+aw.NaturalHeight.ToText
		  //listbox1.Addrow "GTKwindow.Size",aw.WindowSize.Width.ToText+" x "+aw.WindowSize.Height.ToText
		  //listbox1.AddRow "Window", Self.Width.ToText+" x "+Self.Height.ToText
		  //listbox1.AddRow "Listbox", Me.Width.ToText+" x "+Me.Height.ToText
		  //Listbox1.AddRow
		  //bb = New GTKLib.GTKButton("Added programmatically")
		  //Dim tb As New GTKLib.GTKToolbar(Toolbar11)
		  //tb.AddChild (bb)
		  
		  return Headerbar
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub ButtonPushed(Button as GTKLib.GTKButton)
		  MsgBox "You pushed button "+Button.Caption
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub clickHandler(entry as GTKLib.GTKEntry, IconPos as GTKLib.GTKEntry.GtkEntryIconPosition)
		  MsgBox "clicked on "+if (IconPos = GTKLib.GTKEntry.GtkEntryIconPosition.Primary, "primary ", "secondary ")+"icon."
		  #Pragma Unused entry
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitHeader()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockLB()
		  Listbox1.LockRight = True
		  Listbox1.LockBottom = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TextChangeHandler(entry as GTKLib.GTKEntry)
		  MsgBox "Text Changed"
		  #Pragma Unused entry
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub update()
		  listbox1.AddRow "After ReLockControls:"
		  Listbox1.AddRow "Win Height", Self.Height.ToText
		  Listbox1.AddRow "WinSizeHeight", Self.ApplicationWindow.WindowSize.Height.ToText
		  Listbox1.AddRow "Widget Height", Self.ApplicationWindow.NaturalHeight.ToText
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected b1 As GTKLib.GTKButton
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected bb As GTKLib.GTKButton
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected t1 As GTKLib.GTKEntry
	#tag EndProperty


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub Open()
		  Dim t As Text = ""
		  Dim argC As Integer
		  Dim b As Boolean = GTKLib.initCheck(argC, t)
		  me.AddRow "GTK InitCheck", If (b, "True", "False")
		  me.AddRow "GTK-Version", GTKLib.GTKVersion
		  me.addrow "is at least GTK+3", If (GTKLib.checkGTKVersion(3).Empty, "True", GTKLib.checkGTKVersion(3))
		  Me.AddRow "Win Height", Self.Height.ToText
		  //Me.AddRow "WinSizeHeight", Self.ApplicationWindow.WindowSize.Height.ToText
		  Me.AddRow "Widget Height", Self.ApplicationWindow.NaturalHeight.ToText
		  Me.AddRow
		  xojo.core.timer.CallLater 2000, Addressof update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub Open()
		  Dim GTKE As New GTKLib.GTKEntry(me)
		  Me.Height = gtke.NaturalHeight
		  gtke.HasFrame = True
		  GTKE.Icon (GTKLib.GTKEntry.GtkEntryIconPosition.Primary) = GTKXLogo
		  GTKE.IconIsActivatable(GTKLib.GTKEntry.GtkEntryIconPosition.Primary)= True
		  GTKE.IconIsSensitive(GTKLib.GTKEntry.GtkEntryIconPosition.Primary)= True
		  GTKE.Tooltip(GTKLib.GTKEntry.GtkEntryIconPosition.Primary) = "A sample Tooltip for an icon"
		  
		  GTKE.Icon (GTKLib.GTKEntry.GtkEntryIconPosition.Secondary) = "edit-clear"
		  GTKE.Tooltip(GTKLib.GTKEntry.GtkEntryIconPosition.Secondary) = "Another sample Tooltip for an icon"
		  gtke.WidthForCharacters = gtke.TextLength
		  me.Width = gtke.SizeRequest.Width
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
