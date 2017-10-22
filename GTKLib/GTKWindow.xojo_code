#tag Class
Protected Class GTKWindow
Inherits GTKLib.GTKContainer
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(gtk_window_new, true)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Win as Window)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    Super.Constructor(ptr(win.Handle))
		  #Else
		    #pragma unused win
		  #EndIf
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_window_get_size Lib gtk3lib (win as ptr, byref width as int16, byref height as int16) As ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_window_get_titlebar Lib gtk3lib (win as ptr) As ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_window_new Lib gtk3lib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_window_resize Lib gtk3lib (win as ptr, w as int16, h as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_window_set_titlebar Lib gtk3lib (win as ptr, bar as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 526573697A6573207468652077696E646F772061732069662074686520757365722068616420646F6E6520736F2C206F626579696E672067656F6D6574727920636F6E73747261696E74732E20
		Sub Resize(Size as Xojo.core.size)
		  #If TargetLinux
		    gtk_window_resize Mid, size.Width, size.Height
		  #Else
		    #pragma unused size
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If TargetLinux
			    return GTKWidget.FromPtr(gtk_window_get_titlebar(mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_window_set_titlebar(mid, value.nilptr)
			  #EndIf
			End Set
		#tag EndSetter
		Titlebar As GTKLib.GTKWidget
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If TargetLinux
			    dim width, height as int16
			    Call gtk_window_get_size(Mid, width, height)
			    return new Xojo.Core.Size(width, height)
			  #EndIf
			End Get
		#tag EndGetter
		WindowSize As Xojo.Core.Size
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
