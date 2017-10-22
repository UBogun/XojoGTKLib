#tag Class
Protected Class GTKWidget
Inherits GTKLib.GObject
	#tag Method, Flags = &h0
		Sub Constructor(r as rectcontrol)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(ptr(r.Handle))
		  #Else
		    #pragma unused r
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromPtr(P as ptr) As GTKLib.GTKWidget
		  #If TargetLinux
		    return if (p = nil, nil, new GTKWidget(p))
		  #Else
		    #Pragma unused p
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_widget_get_can_focus Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_widget_get_focus_on_click Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_get_preferred_height Lib gtk3lib (id as ptr, byref minH as int16, byref natH as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_get_preferred_width Lib gtk3lib (id as ptr, byref minW as int16, byref natW as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_widget_get_receives_default Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_get_size_request Lib gtk3lib (id as ptr, byref w as int16, byref h as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_queue_draw Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_set_can_focus Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_set_focus_on_click Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_set_receives_default Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_set_size_request Lib gtk3lib (id as ptr, w as int16, h as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_show Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_widget_show_all Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 466C61677320612077696467657420746F20626520646973706C617965642E20416E792077696467657420746861742069736EE28099742073686F776E2077696C6C206E6F7420617070656172206F6E207468652073637265656E2E20496620796F752077616E7420746F2073686F7720616C6C20746865207769646765747320696E206120636F6E7461696E65722C206974E28099732065617369657220746F2063616C6C2067746B5F7769646765745F73686F775F616C6C2829206F6E2074686520636F6E7461696E65722C20696E7374656164206F6620696E646976696475616C6C792073686F77696E672074686520776964676574732E0A52656D656D626572207468617420796F75206861766520746F2073686F772074686520636F6E7461696E65727320636F6E7461696E696E672061207769646765742C20696E206164646974696F6E20746F207468652077696467657420697473656C662C206265666F72652069742077696C6C20617070656172206F6E73637265656E2E
		Sub Invalidate()
		  #If TargetLinux
		    gtk_widget_queue_draw(mid)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C61677320612077696467657420746F20626520646973706C617965642E20416E792077696467657420746861742069736EE28099742073686F776E2077696C6C206E6F7420617070656172206F6E207468652073637265656E2E20496620796F752077616E7420746F2073686F7720616C6C20746865207769646765747320696E206120636F6E7461696E65722C206974E28099732065617369657220746F2063616C6C2067746B5F7769646765745F73686F775F616C6C2829206F6E2074686520636F6E7461696E65722C20696E7374656164206F6620696E646976696475616C6C792073686F77696E672074686520776964676574732E0A52656D656D626572207468617420796F75206861766520746F2073686F772074686520636F6E7461696E65727320636F6E7461696E696E672061207769646765742C20696E206164646974696F6E20746F207468652077696467657420697473656C662C206265666F72652069742077696C6C20617070656172206F6E73637265656E2E
		Sub Show()
		  #If TargetLinux
		    gtk_widget_show(mid)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265637572736976656C792073686F77732061207769646765742C20616E6420616E79206368696C642077696467657473202869662074686520776964676574206973206120636F6E7461696E657229
		Sub ShowAll()
		  #If TargetLinux
		    gtk_widget_show_all(mid)
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 576865746865722074686520746865207769646765742063616E206F776E2074686520696E70757420666F6375732E20
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_widget_get_can_focus(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_widget_set_can_focus(Mid, value)
			  #Else
			    #pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		CanFocus As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5768657468657220746865207769646765742073686F756C64206772616220666F637573207768656E20697420697320636C69636B6564207769746820746865206D6F7573652E
		#tag Getter
			Get
			  #If TargetLinux
			    If GTKLib.checkGTKVersion(3, 20).Empty Then Return gtk_widget_get_focus_on_click(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    if GTKLib.checkGTKVersion(3, 20).Empty then gtk_widget_set_focus_on_click(Mid, value)
			  #Else
			    #pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		CanFocusOnClick As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520776964676574E280997320696E697469616C206D696E696D756D206865696768742E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Dim minH, NatH As Int16
			    gtk_widget_get_preferred_height(mid, minh, nath)
			    Return minH
			    #pragma unused Nath
			  #EndIf
			End Get
		#tag EndGetter
		MinimumHeight As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520776964676574E280997320696E697469616C206D696E696D756D2077696474682E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Dim minH, NatH As Int16
			    gtk_widget_get_preferred_width(mid, minh, nath)
			    Return minH
			    #pragma unused Nath
			  #EndIf
			End Get
		#tag EndGetter
		MinimumWidth As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520776964676574E280997320696E697469616C206D696E696D756D206865696768742E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Dim minH, NatH As Int16
			    gtk_widget_get_preferred_height(mid, minh, nath)
			    Return nath
			    #pragma unused minH
			  #EndIf
			End Get
		#tag EndGetter
		NaturalHeight As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520776964676574E280997320696E697469616C206D696E696D756D2077696474682E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Dim minH, NatH As Int16
			    gtk_widget_get_preferred_width(mid, minh, nath)
			    Return nath
			    #pragma unused minH
			  #EndIf
			End Get
		#tag EndGetter
		NaturalWidth As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5768657468657220746865207769646765742077696C6C2062652074726561746564206173207468652064656661756C74207769646765742077697468696E2069747320746F706C6576656C207768656E206974206861732074686520666F6375732C206576656E20696620616E6F7468657220776964676574206973207468652064656661756C742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_widget_get_receives_default(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_widget_set_receives_default(Mid, value)
			  #Else
			    #pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		ReceivesDefault As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520776964676574E28099732073697A65206173207265717565737465642E20412076616C7565206F66202D3120666F722069647468206F722068656967687420696E64696361746573207468617420746865206E61747572616C2076616C75652077696C6C20626520757365642E
		#tag Getter
			Get
			  #If TargetLinux
			    Dim w, h As Int16
			    gtk_widget_get_size_request(mid, w, h)
			    Return new xojo.core.size(w, h)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_widget_set_size_request(Mid, value.Width, value.Height)
			  #EndIf
			End Set
		#tag EndSetter
		SizeRequest As Xojo.Core.Size
	#tag EndComputedProperty


	#tag ViewBehavior
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
