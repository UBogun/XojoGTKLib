#tag Class
Protected Class GTKToolbar
Inherits GTKLib.GTKContainer
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(gtk_toolbar_new, true)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(t as Toolbar)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(ptr(t.Handle))
		  #Else
		    #pragma unused t
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_toolbar_get_icon_size Lib gtk3lib (id as ptr) As GTKLib.GTKIconSize
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_toolbar_get_style Lib gtk3lib (id as ptr) As GtkToolbarStyle
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_toolbar_insert Lib gtk3lib (id as ptr, item as ptr, pos as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_toolbar_new Lib gtk3lib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_toolbar_set_icon_size Lib gtk3lib (id as ptr, value as GTKLib . GTKIconSize)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_toolbar_set_style Lib gtk3lib (id as ptr, value as GtkToolbarStyle)
	#tag EndExternalMethod


	#tag ComputedProperty, Flags = &h0, Description = 5468652069636F6E2073697A6520666F722074686520746F6F6C6261722E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_toolbar_get_icon_size(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			     gtk_toolbar_set_icon_size(Mid, value)
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		IconSize As GTKIconSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 576865746865722074686520746F6F6C6261722068617320746578742C2069636F6E732C206F7220626F74682E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_toolbar_get_style(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			     gtk_toolbar_set_style(Mid, value)
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ToolbarStyle As GtkToolbarStyle
	#tag EndComputedProperty


	#tag Enum, Name = GtkToolbarStyle, Type = Integer, Flags = &h0
		IconsOnly
		  TextOnly
		  Both
		BothHorizontally
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="BorderWidth"
			Group="Behavior"
			Type="UInt16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanFocus"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanFocusOnClick"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Floating"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconSize"
			Group="Behavior"
			Type="GTKIconSize"
			EditorType="Enum"
			#tag EnumValues
				"0 - Invalid"
				"1 - Menu_16px"
				"2 - Small_16ps"
				"3 - Large_24px"
				"4 - Button_16px"
				"5 - DND_32px"
				"6 - Dialog_48px"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumHeight"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumWidth"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NaturalHeight"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NaturalWidth"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReceivesDefault"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ToolbarStyle"
			Group="Behavior"
			Type="GtkToolbarStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - IconsOnly"
				"1 - TextOnly"
				"2 - Both"
				"3 - BothHorizontally"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
