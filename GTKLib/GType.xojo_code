#tag Class
Protected Class GType
	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F662074797065732C206C697374696E6720746865206368696C64207479706573207468617420746865207479706520636F6E666F726D7320746F2E
		Function ChildrenTypes() As GTKLib.GType()
		  #If TargetLinux
		    Dim nChildren As UInt16
		    Dim result As ptr = g_type_children(Mid, nChildren)
		    Dim mb As New Xojo.Core.MemoryBlock(result, nChildren*integersize)
		    Dim ReturnRes() As GTKLib.GType
		    nChildren = nChildren - 1
		    For q As Integer = 0 To nChildren
		      ReturnRes.Append new GTKLib.GType(mb.PtrValue(q*Integersize))
		    Next
		    GTKLib.g_free(result)
		    return ReturnRes
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(id as Ptr)
		  mid = id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClassPtr(CreateClassIfNecessary As Boolean = false) As Ptr
		  #If TargetLinux
		    If CreateClassIfNecessary Then
		      Return  g_type_class_ref(Mid)
		    Else
		      return  g_type_class_peek(mid)
		    End If
		  #Else
		    #Pragma Unused CreateClassIfNecessary
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F6F6B732075702074686520747970652049442066726F6D206120676976656E2074797065206E616D652C2072657475726E696E672030206966206E6F207479706520686173206265656E207265676973746572656420756E6465722074686973206E616D652028746869732069732074686520707265666572726564206D6574686F6420746F2066696E64206F7574206279206E616D6520776865746865722061207370656369666963207479706520686173206265656E207265676973746572656420796574292E
		Shared Function GTypeFromName(Name As Text) As GTKLib.GType
		  #If TargetLinux
		    Return New GTKLib.GType(g_type_from_name(name.ToCString(xojo.core.TextEncoding.utf8)))
		  #Else
		    #Pragma Unused name
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_children Lib gtk3lib (id as Ptr, byref nChildren as uint16) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_class_peek Lib glib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_class_ref Lib glib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_depth Lib gtk3lib (id as Ptr) As uint16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_from_name Lib gtk3lib (name as cstring) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_fundamental_next Lib glib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_interfaces Lib gtk3lib (id as Ptr, byref nChildren as uint16) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_interface_prerequisites Lib gtk3lib (id as Ptr, byref nChildren as uint16) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_name Lib gtk3lib (id as Ptr) As cstring
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_type_parent Lib gtk3lib (id as Ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652070726572657175697369746573206F6620616E20696E746572666163657320747970652E
		Shared Function InterfacePrerequisiteTypes(InterfaceType as GTKLib.GType) As GTKLib.GType()
		  #If TargetLinux
		    Dim nChildren As UInt16
		    Dim result As ptr = g_type_interface_prerequisites(InterfaceType.Id, nChildren)
		    Dim mb As New Xojo.Core.MemoryBlock(result, nChildren*integersize)
		    Dim ReturnRes() As GTKLib.GType
		    nChildren = nChildren - 1
		    For q As Integer = 0 To nChildren
		      ReturnRes.Append new GTKLib.GType(mb.PtrValue(q*Integersize))
		    Next
		    GTKLib.g_free(result)
		    return ReturnRes
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F662074797065732C206C697374696E672074686520696E74657266616365207479706573207468617420746865207479706520636F6E666F726D7320746F2E
		Function InterfaceTypes() As GTKLib.GType()
		  #If TargetLinux
		    Dim nChildren As UInt16
		    Dim result As ptr = g_type_interfaces(Mid, nChildren)
		    Dim mb As New Xojo.Core.MemoryBlock(result, nChildren*integersize)
		    Dim ReturnRes() As GTKLib.GType
		    nChildren = nChildren - 1
		    For q As Integer = 0 To nChildren
		      ReturnRes.Append new GTKLib.GType(mb.PtrValue(q*Integersize))
		    Next
		    GTKLib.g_free(result)
		    return ReturnRes
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F6F6B732075702074686520747970652049442066726F6D206120676976656E2074797065206E616D652C2072657475726E696E672030206966206E6F207479706520686173206265656E207265676973746572656420756E6465722074686973206E616D652028746869732069732074686520707265666572726564206D6574686F6420746F2066696E64206F7574206279206E616D6520776865746865722061207370656369666963207479706520686173206265656E207265676973746572656420796574292E
		Shared Function ParentForGType(aType As GTKLib.GType) As GTKLib.GType
		  #If TargetLinux
		    Return New GTKLib.GType(g_type_parent(aType.id))
		  #Else
		    #Pragma Unused aType
		  #EndIf
		End Function
	#tag EndMethod


	#tag Note, Name = Status incomplete
		https://developer.gnome.org/gobject/stable/gobject-Type-Information.html
		
		many functions missing
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 54686520756E69717565206E616D6520746861742069732061737369676E656420746F206120747970652049442E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return g_type_depth(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Depth As Uint16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mId
			End Get
		#tag EndGetter
		Id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mId As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E65787420667265652066756E64616D656E74616C20747970652069642077686963682063616E206265207573656420746F2072656769737465722061206E65772066756E64616D656E74616C2074797065207769746820675F747970655F72656769737465725F66756E64616D656E74616C28292E205468652072657475726E6564207479706520494420726570726573656E74732074686520686967686573742063757272656E746C7920726567697374657265642066756E64616D656E74616C2074797065206964656E7469666965722E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return new GTKLib.GType(g_type_fundamental_next)
			  #EndIf
			End Get
		#tag EndGetter
		NextFundamentalType As GTKLib.GType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652064697265637420706172656E742074797065206F662074686520747970652E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return ParentForGType(Self)
			  #EndIf
			End Get
		#tag EndGetter
		ParentType As GTKLib.GType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520756E69717565206E616D6520746861742069732061737369676E656420746F206120747970652049442E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return  g_type_name(mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		TypeName As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Depth"
			Group="Behavior"
			Type="Uint16"
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
		#tag ViewProperty
			Name="TypeName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
