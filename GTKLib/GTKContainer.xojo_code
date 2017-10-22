#tag Class
Protected Class GTKContainer
Inherits GTKLib.GTKWidget
	#tag Method, Flags = &h0, Description = 4164647320612077696467657420746F2074686520636F6E7461696E65722E205479706963616C6C79207573656420666F722073696D706C6520636F6E7461696E65727320737563682061732047746B57696E646F772C2047746B4672616D652C206F722047746B427574746F6E3B20666F72206D6F726520636F6D706C696361746564206C61796F757420636F6E7461696E65727320737563682061732047746B426F78206F722047746B477269642C20746869732066756E6374696F6E2077696C6C207069636B2064656661756C74207061636B696E6720706172616D65746572732074686174206D6179206E6F7420626520636F72726563742E20536F20636F6E73696465722066756E6374696F6E7320737563682061732067746B5F626F785F7061636B5F7374617274282920616E642067746B5F677269645F617474616368282920617320616E20616C7465726E617469766520746F2067746B5F636F6E7461696E65725F616464282920696E2074686F73652063617365732E204120776964676574206D617920626520616464656420746F206F6E6C79206F6E6520636F6E7461696E657220617420612074696D653B20796F752063616EE280997420706C616365207468652073616D652077696467657420696E736964652074776F20646966666572656E7420636F6E7461696E6572732E
		Sub AddChild(Widget as GTKLib.GTKWidget)
		  #If TargetLinux
		    gtk_container_add Mid, Widget.id
		  #Else
		    #pragma unused widget
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Children() As Ptr()
		  #If TargetLinux
		    Dim result() As Ptr
		    Dim initialList As GLIst = gtk_container_get_children(Mid)
		    While initialList.Data <> Nil
		      result.Append initialList.Data
		      initialList = initialList.NextData.GLIst
		    Wend
		    Return result
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_add Lib gtk3lib (id as ptr, widget as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_child_type Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_forall Lib gtk3lib (id as ptr, callback as ptr, data as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_foreach Lib gtk3lib (id as ptr, callback as ptr, data as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_get_border_width Lib gtk3lib (id as ptr) As UInt16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_get_children Lib gtk3lib (id as ptr) As GLIst
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_get_focus_child Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_get_focus_hadjustment Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_container_get_focus_vadjustment Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_remove Lib gtk3lib (id as ptr, widget as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_set_border_width Lib gtk3lib (id as ptr, value as UInt16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_set_focus_child Lib gtk3lib (id as ptr, child as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_set_focus_hadjustment Lib gtk3lib (id as ptr, value as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_container_set_focus_vadjustment Lib gtk3lib (id as ptr, value as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 52656D6F7665732061207769646765742066726F6D2074686520636F6E7461696E65722C2072656C656173696E6720697473206D656D6F7279206966206E6F742068656C6420627920616E6F74686572206F626A656374206F722070726F70657274792E
		Sub RemoveChild(Widget as GTKLib.GTKWidget)
		  #If TargetLinux
		    gtk_container_remove Mid, Widget.id
		  #Else
		    #pragma unused widget
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E766F6B65732063616C6C6261636B206F6E206561636820646972656374206368696C64206F6620636F6E7461696E65722C20696E636C7564696E67206368696C6472656E20746861742061726520636F6E7369646572656420E2809C696E7465726E616CE2809D2E0A43616C6C6261636B206D7573742062652074686520287765616B29416464726573736F6620612063616C6261636B206D6574686F642C20646174612063616E20626520612047544B206F626A6563742C207468652070747220746F20612068616E646C65206F66206120586F6A6F20636F6E74726F6C206F72207468652064617461206F662061206D656D6F7279626C6F636B2E
		Sub RunOnAllChildren(Callback as Ptr, Data as Ptr= nil)
		  #If TargetLinux
		    gtk_container_forall Mid, callback, data
		  #Else
		    #Pragma unused Callback
		    #pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E766F6B65732063616C6C6261636B206F6E2065616368206E6F6E2D696E7465726E616C206368696C64206F662074686520636F6E7461696E65722E0A43616C6C6261636B206D7573742062652074686520287765616B29416464726573736F6620612063616C6261636B206D6574686F642C20646174612063616E20626520612047544B206F626A6563742C207468652070747220746F20612068616E646C65206F66206120586F6A6F20636F6E74726F6C206F72207468652064617461206F662061206D656D6F7279626C6F636B2E
		Sub RunOnExternalChildren(Callback as Ptr, Data as Ptr= nil)
		  #If TargetLinux
		    gtk_container_foreach Mid, callback, data
		  #Else
		    #Pragma unused Callback
		    #pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 54686520626F72646572207769647468206F662074686520636F6E7461696E65722E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_container_get_border_width(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_container_set_border_width(Mid, value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		BorderWidth As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If TargetLinux
			    return new GTKLib.GType(gtk_container_child_type(mid))
			  #EndIf
			End Get
		#tag EndGetter
		ChildType As GTKLib.GType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E7420666F637573206368696C642077696467657420696E7369646520636F6E7461696E6572202E2054686973206973206E6F74207468652063757272656E746C7920666F6375736564207769646765742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return  GTKLib.GTKWidget.FromPtr(gtk_container_get_focus_child(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_container_set_focus_child(Mid, value.nilptr)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		FocusChild As GTKLib.GTKWidget
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520686F72697A6F6E74616C20666F6375732061646A7573746D656E7420666F722074686520636F6E7461696E65722C20736F207768656E2061206368696C64206F662074686520636F6E7461696E657220697320666F63757365642C207468652061646A7573746D656E74206973207363726F6C6C656420746F2073686F772074686174207769646765742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return  GTKLib.GTKAdjustment.FromPtr(gtk_container_get_focus_hadjustment(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_container_set_focus_hadjustment(Mid, value.nilptr)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		HorizontalFocusAdjustment As GTKLib.GTKAdjustment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520766572746963616C20666F6375732061646A7573746D656E7420666F722074686520636F6E7461696E65722C20736F207768656E2061206368696C64206F662074686520636F6E7461696E657220697320666F63757365642C207468652061646A7573746D656E74206973207363726F6C6C656420746F2073686F772074686174207769646765742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return  GTKLib.GTKAdjustment.FromPtr(gtk_container_get_focus_vadjustment(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_container_set_focus_vadjustment(Mid, value.nilptr)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		VerticalFocusAdjustment As GTKLib.GTKAdjustment
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
