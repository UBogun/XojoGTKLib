#tag Class
Protected Class GTKEntryBuffer
Inherits GTKLib.GObject
	#tag Method, Flags = &h21
		Private Sub AttachSignals()
		  #If TargetLinux
		    InstanceDict.Value(Mid) =  Self
		    Dim c As cstring = "deleted-text"
		    Signals.Append g_signal_connect_object(Mid, c, AddressOf DeleteHandler, Nil, &h1ff)
		    dim c1 as CString = "inserted-text"
		    Signals.Append g_signal_connect_object(Mid, c1, AddressOf InsertHandler, Nil, &h1ff)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772047746B456E747279427566666572206F626A6563742E204F7074696F6E616C6C792C207370656369667920696E697469616C207465787420746F2073657420696E20746865206275666665722E
		Sub Constructor(id as ptr)
		  // Calling the overridden superclass constructor.
		  #if TargetLinux
		    Super.Constructor(id)
		    if Signals.Ubound = -1 then AttachSignals
		  #Else
		    #Pragma Unused id
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772047746B456E747279427566666572206F626A6563742E204F7074696F6E616C6C792C207370656369667920696E697469616C207465787420746F2073657420696E20746865206275666665722E
		Sub Constructor(InitalText as Text = "", numberofCharacters as Int16 = -1)
		  // Calling the overridden superclass constructor.
		  #if TargetLinux
		    Super.Constructor(gtk_entry_buffer_new(InitalText.ToCString(xojo.core.TextEncoding.utf8), numberofcharacters), True)
		    AttachSignals
		  #Else
		    #Pragma Unused InitalText
		    #Pragma Unused numberOfCharacters
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteHandler(position as UInt16, numberofChars as Uint16, buffer as ptr, Data as Ptr)
		  Dim w As GTKLib.GTKEntryBuffer = GTKLib.GTKEntryBuffer( InstanceDict.Lookup(buffer, nil))
		  If w <> Nil  Then
		    w.RaiseDeleted(position, numberofChars)
		  Else
		    InstanceDict.Remove(buffer)
		  End If
		  #Pragma Unused Data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44656C6574657320612073657175656E6365206F6620636861726163746572732066726F6D20746865206275666665722E206E5F63686172732063686172616374657273206172652064656C65746564207374617274696E6720617420706F736974696F6E202E204966206E5F6368617273206973206E656761746976652C207468656E20616C6C206368617261637465727320756E74696C2074686520656E64206F66207468652074657874206172652064656C657465642E
		Sub DeleteText(atPosition as Int16, numberOfChars as int16 = -1)
		  #If TargetLinux
		    gtk_entry_buffer_delete_text Mid, atPosition, numberOfChars
		  #Else
		    #Pragma Unused atPosition
		    #Pragma Unused numberOfChars
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  if hasOwnership then RemoveSignals
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromPtr(id as ptr) As GTKLib.GTKEntryBuffer
		  return if (id = nil, nil, new GTKLib.GTKEntryBuffer(id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_buffer_delete_text Lib gtk3lib (id as ptr, position as UInt16, numberChars as Int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_buffer_get_bytes Lib gtk3lib (id as ptr) As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_buffer_get_length Lib gtk3lib (id as ptr) As Uint16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_buffer_get_max_length Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_buffer_get_text Lib gtk3lib (id as ptr) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_buffer_insert_text Lib gtk3lib (id as ptr, position as UInt16, newText as CString, numberChars as Int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_buffer_new Lib gtk3lib (initalText as CString, numberChars as int16) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_buffer_set_max_length Lib gtk3lib (id as ptr, value as Int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_buffer_set_text Lib gtk3lib (id as ptr, value as CString)
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Sub InsertHandler(position as UInt16, chars as cstring, numberofChars as Uint16, buffer as ptr, Data as Ptr)
		  Dim w As GTKLib.GTKEntryBuffer = GTKLib.GTKEntryBuffer( InstanceDict.Lookup(buffer, Nil))
		  If w <> Nil  Then
		    w.RaiseInserted(position, chars.toText)
		  Else
		    InstanceDict.Remove(buffer)
		  End If
		  #Pragma Unused Data
		  #pragma Unused numberofChars
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7365727473206E5F63686172732063686172616374657273206F6620636861727320696E746F2074686520636F6E74656E7473206F6620746865206275666665722C20617420706F736974696F6E20706F736974696F6E2E0A4966206E5F6368617273206973206E656761746976652C207468656E20636861726163746572732066726F6D2063686172732077696C6C20626520696E73657274656420756E74696C2061206E756C6C2D7465726D696E61746F7220697320666F756E642E20496620706F736974696F6E206F72206E5F636861727320617265206F7574206F6620626F756E64732C206F7220746865206D6178696D756D206275666665722074657874206C656E6774682069732065786365656465642C207468656E20746865792061726520636F657263656420746F2073616E652076616C7565732E
		Sub InsertText(NewText as Text, Position as Int16, numberOfChars as int16 = 0)
		  #If TargetLinux
		    if numberOfChars= 0 then numberOfChars = NewText.length
		    gtk_entry_buffer_insert_text Mid, Position, NewText.ToCString(xojo.core.TextEncoding.utf8), numberOfChars
		  #Else
		    #Pragma Unused NewText
		    #Pragma Unused Position
		    #Pragma Unused numberOfChars
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseDeleted(position as UInt16, numberofChars as Uint16)
		  RaiseEvent TextDelete (position, numberofChars)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseInserted(position as UInt16, insertText as Text)
		  RaiseEvent TextInsert (position, insertText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveSignals()
		  #If TargetLinux
		    For q As Integer = Signals.Ubound downto 0
		      If Signals(q) > 0 Then 
		        g_signal_handler_disconnect(Mid, Signals(q))
		        Signals.Remove(q)
		      Else
		        break // Signal was not installed!!
		      End If
		    Next
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 4669726573207768656E2054657874207761732064656C6574656466726F6D20746865206275666665722E
		Event TextDelete(position as UInt16, numberofChars as Uint16)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E2054657874207761732064656C6574656466726F6D20746865206275666665722E
		Event TextInsert(position as UInt16, insertText as Text)
	#tag EndHook


	#tag Note, Name = Status complete except for emit methods
		
		https://developer.gnome.org/gtk3/stable/GtkEntryBuffer.html
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 546865206C656E67746820696E206279746573206F6620746865206275666665722E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_entry_buffer_get_bytes(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Bytes As UInteger
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

	#tag ComputedProperty, Flags = &h0, Description = 546865206C656E67746820696E2063686172616374657273206F6620746865206275666665722E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_entry_buffer_get_bytes(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Length As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206D6178696D756D20616C6C6F776564206C656E677468206F6620746865207465787420696E2062756666657220286F72203020666F72206E6F206C696D697429
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_entry_buffer_get_max_length(mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_buffer_set_max_length Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		MaxLength As Int16
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Signals() As Uint32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6E74656E7473206F6620746865206275666665722E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtk_entry_buffer_get_text(mid).totext
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_buffer_set_text Mid, value.ToCString(xojo.core.textencoding.utf8)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		TextContent As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bytes"
			Group="Behavior"
			Type="UInteger"
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
			Name="Length"
			Group="Behavior"
			Type="UInt16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxLength"
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextContent"
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
