#tag Class
Protected Class GTKAdjustment
Inherits GTKLib.GObject
	#tag Method, Flags = &h0, Description = 557064617465732074686520E2809C76616C7565E2809D2070726F706572747920746F20656E737572652074686174207468652072616E6765206265747765656E206C6F77657220616E6420757070657220697320696E207468652063757272656E7420706167652028692E652E206265747765656E20E2809C76616C7565E2809D20616E6420E2809C76616C7565E2809D202B20E2809C706167652D73697A65E2809D292E204966207468652072616E6765206973206C6172676572207468616E2074686520706167652073697A652C207468656E206F6E6C7920746865207374617274206F662069742077696C6C20626520696E207468652063757272656E7420706167652E
		Sub ClampPage(Lower as Double, Upper as Double)
		  #If TargetLinux
		    gtk_adjustment_clamp_page(mid, Lower, Upper)
		  #Else
		    #Pragma Unused Lower
		    #Pragma Unused Upper
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320616C6C2070726F70657274696573206F66207468652061646A7573746D656E74206174206F6E63652E0A55736520746869732066756E6374696F6E20746F2061766F6964206D756C7469706C6520656D697373696F6E73206F662074686520E2809C6368616E676564E2809D207369676E616C2E
		Sub Configure(Value as Double, Lower as Double, Upper as Double, StepIncrement as Double, PageIncrement As Double, PageSize As Double)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    gtk_adjustment_configure(mid, Value, Lower, Upper, StepIncrement, PageIncrement, PageSize)
		  #Else
		    #Pragma Unused Value
		    #Pragma Unused Lower
		    #Pragma Unused Upper
		    #Pragma Unused StepIncrement
		    #Pragma Unused PageIncrement
		    #Pragma Unused PageSize
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772047746B41646A7573746D656E742E
		Sub Constructor(Value as Double, Lower as Double, Upper as Double, StepIncrement as Double, PageIncrement As Double, PageSize As Double)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(gtk_adjustment_new(Value, Lower, Upper, StepIncrement, PageIncrement, PageSize),True)
		  #Else
		    #Pragma Unused Value
		    #Pragma Unused Lower
		    #Pragma Unused Upper
		    #Pragma Unused StepIncrement
		    #Pragma Unused PageIncrement
		    #Pragma Unused PageSize
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromPtr(Id as Ptr) As GTKLib.GTKAdjustment
		  #If TargetLinux
		    Return If (id = Nil, Nil, New GTKLib.GTKAdjustment(id))
		  #Else
		    #Pragma unused id
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_clamp_page Lib gtk3lib (id as ptr, lower as double, upper as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_configure Lib gtk3lib (id as ptr, Value as Double, Lower as Double, Upper as Double, StepIncrement as Double, PageIncrement As Double, PageSize As Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_lower Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_minimum_increment Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_page_increment Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_page_size Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_step_increment Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_upper Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_get_value Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_adjustment_new Lib gtk3lib (Value as Double, Lower as Double, Upper as Double, StepIncrement as Double, PageIncrement As Double, PageSize As Double) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_lower Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_page_increment Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_page_size Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_step_increment Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_upper Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_adjustment_set_value Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod


	#tag Note, Name = Status complete without signal
		
		https://developer.gnome.org/gtk3/stable/GtkAdjustment.html
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 546865206D696E696D756D2076616C7565206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_lower(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_lower(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		Lower As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520736D616C6C6572206F66207374657020696E6372656D656E7420616E64207061676520696E6372656D656E742E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_minimum_increment(mid)
			  #EndIf
			End Get
		#tag EndGetter
		MinimumIncrement As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207061676520696E6372656D656E74206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_page_increment(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_page_increment(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		PageIncrement As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520706167652073697A65206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_page_size(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_page_size(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		PageSize As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207374657020696E6372656D656E74206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_step_increment(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_step_increment(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		StepIncrement As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206D6178696D756D2076616C7565206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_upper(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_upper(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		Upper As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E742076616C7565206F66207468652061646A7573746D656E742E20
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_adjustment_get_value(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_adjustment_set_value(Mid, Value)
			  #Else
			    #Pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		Value As Double
	#tag EndComputedProperty


	#tag ViewBehavior
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
			Name="Lower"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumIncrement"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageIncrement"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageSize"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StepIncrement"
			Group="Behavior"
			Type="Double"
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
		#tag ViewProperty
			Name="Upper"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
