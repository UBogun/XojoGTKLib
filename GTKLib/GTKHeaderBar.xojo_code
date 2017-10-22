#tag Class
Protected Class GTKHeaderBar
Inherits GTKLib.GTKContainer
	#tag Method, Flags = &h0, Description = 416464732061204368696C6420746F2074686520656E6420286F72206F7074696F6E616C6C792074686520737461727429206F6620746865206261722E
		Sub AddChild(Child as GTKLib.GTKWidget, atStart As Boolean = False)
		  #If TargetLinux
		    if atStart then
		      gtk_header_bar_pack_start Mid, child.id
		    Else
		      gtk_header_bar_pack_end mid, child.id
		    End If
		  #Else
		    #Pragma unused Child
		    #pragma Unused atStart
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(gtk_header_bar_new, true)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_box_set_spacing Lib gtk3lib (bar as ptr, value as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_headerbar_get_spacing Lib gtk3lib (bar as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_custom_title Lib gtk3lib (bar as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_decoration_layout Lib gtk3lib (bar as ptr) As cstring
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_has_subtitle Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_show_close_button Lib gtk3lib (bar as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_subtitle Lib gtk3lib (bar as ptr) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_get_title Lib gtk3lib (bar as ptr) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_header_bar_new Lib gtk3lib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_pack_end Lib gtk3lib (bar as ptr, value as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_pack_start Lib gtk3lib (bar as ptr, value as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_custom_title Lib gtk3lib (bar as ptr, value as Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_decoration_layout Lib gtk3lib (bar as ptr, value as CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_has_subtitle Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_show_close_button Lib gtk3lib (bar as ptr, value as boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_subtitle Lib gtk3lib (bar as ptr, title as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_header_bar_set_title Lib gtk3lib (bar as ptr, title as cstring)
	#tag EndExternalMethod


	#tag Note, Name = Status complete except properties.
		
		https://developer.gnome.org/gtk3/stable/GtkHeaderBar.html
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 57686574686572207468697320686561646572206261722073686F777320746865207374616E646172642077696E646F77206465636F726174696F6E732C20696E636C7564696E6720636C6F73652C206D6178696D697A652C20616E64206D696E696D697A652E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_header_bar_get_show_close_button(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_show_close_button Mid, value
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		CloseButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 4120637573746F6D207469746C6520666F72207468652047746B4865616465724261722E2053657420746F204E696C20746F2073686F7720746865207374616E64617264207469746C652F7375627469746C652E
		#tag Getter
			Get
			  #If TargetLinux
			    Return GTKWidget.FromPtr(gtk_header_bar_get_custom_title(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_custom_title Mid, value.nilptr
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		CustomTitle As GTKLib.GTKWidget
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206465636F726174696F6E206C61796F757420666F72207468697320686561646572206261722C20696620746865207374616E6461726420776173206F76657272696464656E2E0A54686520666F726D6174206F662074686520737472696E6720697320627574746F6E206E616D65732C2073657061726174656420627920636F6D6D61732E204120636F6C6F6E207365706172617465732074686520627574746F6E7320746861742073686F756C6420617070656172206F6E20746865206C6566742066726F6D2074686F7365206F6E207468652072696768742E205265636F676E697A656420627574746F6E206E616D657320617265206D696E696D697A652C206D6178696D697A652C20636C6F73652C2069636F6E20287468652077696E646F772069636F6E2920616E64206D656E75202861206D656E7520627574746F6E20666F72207468652066616C6C6261636B20617070206D656E75292E0A466F72206578616D706C652C20E2809C6D656E753A6D696E696D697A652C6D6178696D697A652C636C6F7365E2809D207370656369666965732061206D656E75206F6E20746865206C6566742C20616E64206D696E696D697A652C206D6178696D697A6520616E6420636C6F736520627574746F6E73206F6E207468652072696768742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_header_bar_get_decoration_layout(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_decoration_layout Mid, value.ToCString(xojo.core.TextEncoding.utf8)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		DecorationLayout As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5768657468657220746865206865616465722062617220726573657276657320737061636520666F722061207375627469746C652C207265676172646C657373206966206F6E652069732063757272656E746C7920736574206F72206E6F742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_header_bar_get_has_subtitle(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_has_subtitle Mid, value
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		HasSubtitle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207375627469746C65206F6620746865206865616465726261722E
		#tag Getter
			Get
			  #if TargetLinux
			    Return gtk_header_bar_get_subtitle(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_subtitle(Mid, Value.ToCString(xojo.core.TextEncoding.utf8))
			  #EndIf
			End Set
		#tag EndSetter
		Subtitle As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207469746C65206F6620746865206865616465726261722E
		#tag Getter
			Get
			  #if TargetLinux
			    Return gtk_header_bar_get_title(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_header_bar_set_title(Mid, Value.ToCString(xojo.core.TextEncoding.utf8))
			  #EndIf
			End Set
		#tag EndSetter
		Title As Text
	#tag EndComputedProperty


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
			Name="CloseButton"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DecorationLayout"
			Group="Behavior"
			Type="Text"
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
			Name="HasSubtitle"
			Group="Behavior"
			Type="Boolean"
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
			Name="Subtitle"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="Text"
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
