#tag Class
Protected Class GTKButton
Inherits GTKLib.GTKContainer
	#tag Method, Flags = &h21
		Private Sub ActionHandler(button as ptr, Data as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(button, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKButton = GTKLib.GTKButton(w.Value)
		        b.RaiseAction
		      Else
		        InstanceDict.Remove(button)
		      End If
		    End If
		  #Else
		    #Pragma unused button
		    #Pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AttachSignals()
		  #if TargetLinux
		    InstanceDict.Value(Mid) =  Xojo.Core.WeakRef.Create(Self)
		    Dim c As cstring = "clicked"
		    call g_signal_connect_object(mid, c, weakAddressOf ActionHandler, nil, &h1ff)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 456D697473206120E2809C636C69636B6564E2809D207369676E616C20746F207468652047746B427574746F6E2E
		Sub Click()
		  #If TargetLinux
		    gtk_button_clicked(mid)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If targetlinux
		    Super.Constructor(gtk_button_new, true)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772047746B427574746F6E20636F6E7461696E696E672061206C6162656C2E204966206368617261637465727320696E206C6162656C2061726520707265636564656420627920616E20756E64657273636F72652C20746865792061726520756E6465726C696E65642E20496620796F75206E6565642061206C69746572616C20756E64657273636F72652063686172616374657220696E2061206C6162656C2C2075736520E2809C5F5FE2809D202874776F20756E64657273636F726573292E2054686520666972737420756E6465726C696E65642063686172616374657220726570726573656E74732061206B6579626F61726420616363656C657261746F722063616C6C65642061206D6E656D6F6E69632E205072657373696E6720416C7420616E642074686174206B6579206163746976617465732074686520627574746F6E2E
		Sub Constructor(Caption as Text)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If targetlinux
		    If caption.IndexOf("_") > -1 Then
		      Super.Constructor(gtk_button_new_with_mnemonic(Caption.ToCString(xojo.core.TextEncoding.utf8)), True)
		    else
		      Super.Constructor(gtk_button_new_with_label(Caption.ToCString(xojo.core.TextEncoding.utf8)), true)
		    End If
		  #Else
		    #pragma unused caption
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720627574746F6E20636F6E7461696E696E6720616E2069636F6E2066726F6D207468652063757272656E742069636F6E207468656D652E0A4966207468652069636F6E206E616D652069736EE2809974206B6E6F776E2C206120E2809C62726F6B656E20696D616765E2809D2069636F6E2077696C6C20626520646973706C6179656420696E73746561642E204966207468652063757272656E742069636F6E207468656D65206973206368616E6765642C207468652069636F6E2077696C6C206265207570646174656420617070726F7072696174656C792E
		Sub Constructor(Imagename as Text, size as GTKIconSize)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If targetlinux
		    Super.Constructor(gtk_button_new_from_icon_name(ImageName.ToCString(xojo.core.TextEncoding.utf8), size), True)
		    AttachSignals
		  #Else
		    #Pragma Unused Imagename
		    #Pragma Unused size
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If hasOwnership Then
		    if InstanceDict.HasKey(mid) then InstanceDict.remove mid
		  End If
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_clicked Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_always_show_image Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_image Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_image_position Lib gtk3lib (id as ptr) As GtkPositionType
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_label Lib gtk3lib (id as ptr) As cstring
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_relief Lib gtk3lib (id as ptr) As GtkReliefStyle
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_get_use_underline Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_new Lib gtk3lib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_new_from_icon_name Lib gtk3lib (value as cstring, size as GTKIconSize) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_new_with_label Lib gtk3lib (value as cstring) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_button_new_with_mnemonic Lib gtk3lib (value as cstring) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_always_show_image Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_image Lib gtk3lib (id as ptr, value as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_image_position Lib gtk3lib (id as ptr, value as GtkPositionType)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_label Lib gtk3lib (id as ptr, value as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_relief Lib gtk3lib (id as ptr, value as GtkReliefStyle)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_button_set_use_underline Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseAction()
		  RaiseEvent Action
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520627574746F6E20697320636C69636B65642E
		Event Action()
	#tag EndHook


	#tag Note, Name = Status complete without style properties
		
		https://developer.gnome.org/gtk3/stable/GtkButton.html
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 576865746865722074686520627574746F6E2077696C6C2069676E6F72652074686520E2809C67746B2D627574746F6E2D696D61676573E2809D2073657474696E6720616E6420616C776179732073686F772074686520696D6167652C20696620617661696C61626C652E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_button_get_always_show_image(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_button_set_always_show_image(Mid, value)
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		AlwaysShowImage As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652074657874206F6620746865206C6162656C2E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_button_get_label(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_button_set_label(Mid, value.ToCString(xojo.core.TextEncoding.utf8))
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		Caption As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652077696467657420746861742069732063757272656E7479207365742061732074686520696D616765206F6620627574746F6E2E
		#tag Getter
			Get
			  #If TargetLinux
			    Return GTKWidget.FromPtr(gtk_button_get_image(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_button_set_image(Mid, value.nilptr)
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		Image As GTKLib.GTKWidget
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 74686520706F736974696F6E206F662074686520696D6167652072656C617469766520746F20746865207465787420696E736964652074686520627574746F6E2E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_button_get_image_position(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			     gtk_button_set_image_position(Mid, value)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ImagePosition As GtkPositionType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Static mInstanceDict As Xojo.Core.Dictionary
			  If mInstanceDict = Nil Then mInstanceDict = new xojo.Core.Dictionary
			  return mInstanceDict
			End Get
		#tag EndGetter
		Private Shared InstanceDict As Xojo.Core.Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E742072656C696566207374796C65206F66207468652047746B427574746F6E2E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_button_get_relief(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			     gtk_button_set_relief(Mid, value)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ReliefStyle As GtkReliefStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5768657468657220616E20656D62656464656420756E6465726C696E6520696E2074686520627574746F6E206C6162656C20696E646963617465732061206D6E656D6F6E69632E20
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_button_get_use_underline(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_button_set_use_underline(Mid, value)
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		UseUnderline As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlwaysShowImage"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="Caption"
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
			Name="ImagePosition"
			Group="Behavior"
			Type="GtkPositionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Top"
				"3 - Bottom"
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
			Name="ReliefStyle"
			Group="Behavior"
			Type="GtkReliefStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Normal"
				"1 - Half"
				"2 - None"
			#tag EndEnumValues
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
			Name="UseUnderline"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
