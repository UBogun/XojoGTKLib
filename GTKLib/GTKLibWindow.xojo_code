#tag Class
Protected Class GTKLibWindow
Inherits Window
	#tag Event
		Sub Open()
		  #if TargetLinux
		    CreateHeader( RaiseEvent CreateHeaderBar(New GTKLib.GTKHeaderBar))
		  #EndIf
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CorrectDifferentHeight()
		  //Dim dif As Integer = Self.ApplicationWindow.NaturalHeight - Self.Height
		  //If dif <>  0 Then 
		  //self.Height = self.Height+ dif
		  //End If
		  ApplicationWindow.SizeRequest = WinSize
		  xojo.core.timer.CallLater 70, AddressOf relockControls
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateHeader(Header as GTKLib.GTKHeaderBar)
		  if Header <> nil then
		    For q As Integer = 0 To Me.ControlCount - 1
		      Dim c As control = Me.Control(q)
		      Dim dict As New xojo.core.Dictionary
		      If c IsA RectControl Then
		        Dim cR As RectControl = RectControl(c)
		        If cr.LockRight Then
		          cr.LockRight = False
		          dict.Value("LockRight")= True
		        End If
		        If cr.LockBottom Then
		          cr.LockBottom = False
		          dict.Value("LockBottom")= True
		        End If
		        dict.Value("DistanceToBottom") = self.Height-(cr.top+cr.Height)
		      End If
		      ControlLockDict.Append dict
		    Next
		    
		    WinSize = ApplicationWindow.WindowSize
		    Dim myheight As Integer = Me.Height
		    Me.ApplicationWindow.Titlebar = Header
		    Me.ApplicationWindow.ShowAll
		    // +(ApplicationWindow.NaturalHeight-me.Height)
		    
		    xojo.core.timer.CallLater 70, addressof CorrectDifferentHeight
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReLockControls()
		  dim difSet as Boolean
		  For q As Integer = 0 To Me.ControlCount - 1
		    Dim c As control = Me.Control(q)
		    If c IsA RectControl Then
		      Dim cR As RectControl = RectControl(c)
		      Dim dict As Xojo.Core.Dictionary = ControlLockDict(q)
		      if not difset then
		        Dim distance As Integer = dict.Value("DistanceToBottom")
		        Dim currentdistance As Integer = Self.Height-(ApplicationWindow.Titlebar.NaturalHeight+cr.top+cr.Height)
		        Dim difference As Integer = currentdistance-distance
		        If difference <  0 Then 
		          Self.Height = Self.Height-difference
		          difSet = true
		        End If
		      End If
		      If dict.HasKey("LockRight") Then cr.LockRight = true
		      If dict.HasKey("LockBottom") Then cr.lockbottom = True
		    End If
		  Next
		  redim ControlLockDict(-1)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 5573652074686973206576656E7420746F2064657369676E20612068656164657262617220746F2061747461636820746F207468652077696E646F77206175746F6D61746963616C6C792E2052657475726E207468652068656164657262617220746F206D616B652069742073686F776E2E0A4F6E6C7920617661696C61626C65206F6E204C696E75782E
		Event CreateHeaderBar(Headerbar as GTKLib.GTKHeaderBar) As GTKLib.GTKHeaderBar
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0, Description = 546865204170706C69636174696F6E57696E646F7720726570726573656E746174696F6E206F6620746869732077696E646F772E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return New GTKLib.GTKApplicationWindow(Self)
			  #EndIf
			End Get
		#tag EndGetter
		ApplicationWindow As GTKLib.GTKApplicationWindow
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ControlLockDict() As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WinSize As Xojo.core.size
	#tag EndProperty


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
End Class
#tag EndClass
