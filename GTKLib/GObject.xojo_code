#tag Class
Private Class GObject
	#tag Method, Flags = &h0
		Sub Constructor(id as ptr, takeOwnership as Boolean = false)
		  #If TargetLinux
		    Mid = id
		    If takeOwnership Then
		      mHasOwnership = True
		      retainAndTakeOwnership
		    End If
		  #Else
		    #Pragma unused id
		    #pragma unused takeOwnership
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  if mHasOwnership then release
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_object_is_floating Lib glib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_object_ref Lib glib (id as ptr) As ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_object_ref_sink Lib glib (id as ptr) As ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub g_object_unref Lib glib (id as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub g_signal_connect Lib glib (id as ptr, signal as CString, Callback as ptr, data as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function g_signal_connect_closure Lib glib (id as ptr, signal as CString, Closure as ptr, after as Boolean) As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function g_signal_connect_object Lib glib (id as ptr, signal as CString, Callback as ptr, data as ptr, flags as uint16) As uint32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub g_signal_handler_disconnect Lib glib (id as ptr, signalID as Uint32)
	#tag EndExternalMethod

	#tag Method, Flags = &h21, Description = 44656372656173657320746865207265666572656E636520636F756E74206F6620746865206F626A6563742E
		Private Sub release()
		  #If TargetLinux
		     g_object_unref(mid)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 496E6372656173657320746865207265666572656E636520636F756E74206F6620746865206F626A6563742E
		Private Sub retain()
		  #If TargetLinux
		    mid = g_object_ref(mid)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 496E6372656173657320746865207265666572656E636520636F756E74206F6620746865206F626A6563742C2020706F737369626C792072656D6F76652074686520666C6F6174696E67207265666572656E63652E
		Private Sub retainAndTakeOwnership()
		  #If TargetLinux
		    mid = g_object_ref_sink(mid)
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 57686574686572206F626A65637420686173206120666C6F6174696E67207265666572656E63652E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return g_object_is_floating(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Floating As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHasOwnership
			End Get
		#tag EndGetter
		HasOwnership As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652070747220746F20746865206F626A656374E28099732068616E646C652E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  return mId
			End Get
		#tag EndGetter
		Id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Attributes( hidden ) Protected mHasOwnership As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Attributes( hidden ) Protected mId As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If TargetLinux
			    Return new GTKLib.GType(mid)
			  #EndIf
			End Get
		#tag EndGetter
		ObjectClass As GTKLib.GType
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
