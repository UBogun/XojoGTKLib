#tag Class
Protected Class GTKEntry
Inherits GTKLib.GTKWidget
	#tag Method, Flags = &h21
		Private Sub ActivateHandler(widget as ptr, Data as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaiseActivate
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused widget
		    #Pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AttachSignals()
		  #if TargetLinux
		    InstanceDict.Value(Mid) =  Xojo.Core.WeakRef.Create(Self)
		    dim data as new Xojo.Core.MemoryBlock(4)
		    Dim c As cstring = "activate"
		    Signals.Append g_signal_connect_object(Mid, c, WeakAddressOf ActivateHandler, Nil, &h1ff)
		    Dim c1 As CString = "backspace"
		    Signals.Append  g_signal_connect_object(Mid, c1, WeakAddressOf BackspaceHandler, nil, &h1ff)
		    Dim c2 As CString = "cut-clipboard"
		    Signals.Append  g_signal_connect_object(Mid, c2, WeakAddressOf CutHandler, Nil, &h1ff)
		    Dim c5 As cstring = "paste-clipboard"
		    Signals.Append  g_signal_connect_object(Mid, c5, WeakAddressOf PasteHandler, Nil, &h1ff)
		    
		    Dim c3 As CString = "icon-press"
		    Signals.Append  g_signal_connect_object(Mid, c3, WeakAddressOf IconPressHandler, Nil, &h1ff)
		    
		    Dim c4 As CString = "icon-release"
		    Signals.Append  g_signal_connect_object(Mid, c4, WeakAddressOf IconReleaseHandler, Nil, &h1ff)
		    
		    Dim b As GTKLib.GTKEntryBuffer = Me.Buffer
		    If b <> Nil Then
		      AddHandler b.Textinsert, WeakAddressOf InsertHandler
		      AddHandler b.TextDelete, WeakAddressOf DeleteHandler
		      AddedHandlers = true
		    End If
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BackspaceHandler(widget as ptr, Data as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaiseBackspace
		        if not b.AddedHandlers then b.RaiseTextChange
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused widget
		    #Pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720656E7472792E
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If TargetLinux
		    Super.Constructor(gtk_entry_new, True)
		    AttachSignals
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720656E747279207769746820746865207370656369666965642074657874206275666665722E
		Sub Constructor(buffer as GTKLib.GTKEntryBuffer)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If TargetLinux
		    Super.Constructor(gtk_entry_new_with_buffer(buffer.id), true)
		    AttachSignals
		  #Else
		    #pragma unused buffer
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720656E7472792077697468207468652073706563696669656420746578742E
		Sub Constructor(InitialText As Text, placeholderText as Text = "")
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If TargetLinux
		    Dim b As new GTKLib.GTKEntryBuffer(InitialText)
		    Constructor(b)
		    Me.PlaceholderText = placeholderText
		  #Else
		    #Pragma unused InitialText
		    #Pragma Unused placeholderText
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732074686520656E747279206F66206120746578746669656C64
		Sub Constructor(t as TextField)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(r as rectcontrol) -- From GTKWidget
		  // Constructor(id as ptr, takeOwnership as Boolean = false) -- From GObject
		  #If TargetLinux
		    Super.Constructor(ptr(t.Handle))
		  #Else
		    #pragma unused t
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CutHandler(widget as ptr, Data as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaiseCut
		        If Not b.AddedHandlers Then b.RaiseTextChange
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused widget
		    #Pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteHandler(buffer as gtkLib.GTKEntryBuffer, position as UInt16, numberofChars as Uint16)
		  #if TargetLinux
		    Raiseevent TextDelete(position, numberofChars)
		    Raiseevent TextChanged
		  #Else
		    #Pragma Unused position
		    #Pragma Unused numberofChars
		  #EndIf
		  #Pragma unused buffer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  if HasOwnership then RemoveSignals
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_activates_default Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_alignment Lib gtk3lib (id as ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_buffer Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_has_frame Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_icon_activatable Lib gtk3lib (id as ptr, position as GtkEntryIconPosition) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_icon_at_pos Lib gtk3lib (id as ptr, x as int16, y as int16) As int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_icon_name Lib gtk3lib (id as ptr, position as GtkEntryIconPosition) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_icon_sensitive Lib gtk3lib (id as ptr, position as GtkEntryIconPosition) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_icon_tooltip_text Lib gtk3lib (id as ptr, position as GtkEntryIconPosition) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_max_width_chars Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_overwrite_mode Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_placeholder_text Lib gtk3lib (id as ptr) As cstring
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_progress_fraction Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_progress_pulse_step Lib gtk3lib (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_text Lib gtk3lib (id as ptr) As cstring
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_text_length Lib gtk3lib (id as ptr) As UInt16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_visibility Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_get_width_chars Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_new Lib gtk3lib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_entry_new_with_buffer Lib gtk3lib (buffer as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_progress_pulse Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_activates_default Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_alignment Lib gtk3lib (id as ptr, value as Single)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_buffer Lib gtk3lib (id as ptr, value as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_has_frame Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_icon_activatable Lib gtk3lib (id as ptr, position as GtkEntryIconPosition, value as boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_icon_from_icon_name Lib gtk3lib (id as ptr, position as GtkEntryIconPosition, name as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_icon_from_pixbuf Lib gtk3lib (id as ptr, position as GtkEntryIconPosition, pixbuf as ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_icon_sensitive Lib gtk3lib (id as ptr, position as GtkEntryIconPosition, value as boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_icon_tooltip_text Lib gtk3lib (id as ptr, position as GtkEntryIconPosition, value as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_invisible_char Lib gtk3lib (id as ptr, value as uint32)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_max_length Lib gtk3lib (id as ptr, value as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_max_width_chars Lib gtk3lib (id as ptr, value as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_overwrite_mode Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_placeholder_text Lib gtk3lib (id as ptr, value as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_progress_fraction Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_progress_pulse_step Lib gtk3lib (id as ptr, value as Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_text Lib gtk3lib (id as ptr, value as cstring)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_visibility Lib gtk3lib (id as ptr, value as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_set_width_chars Lib gtk3lib (id as ptr, value as int16)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub gtk_entry_unset_invisible_char Lib gtk3lib (id as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 53657473207468652069636F6E2073686F776E20696E2074686520656E747279206174207468652073706563696669656420706F736974696F6E2066726F6D2061207069786275662E
		Sub Icon(Position as GtkEntryIconPosition, assigns pixbuf as GTKLib.GDKPixbuf)
		  #If TargetLinux
		    gtk_entry_set_icon_from_pixbuf(Mid, position, pixbuf.nilptr)
		  #Else
		    #Pragma Unused Position
		    #Pragma Unused pixbuf
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652069636F6E2073686F776E20696E2074686520656E747279206174207468652073706563696669656420706F736974696F6E2066726F6D2061207069786275662E
		Sub Icon(Position as GtkEntryIconPosition, assigns image as Picture)
		  #If TargetLinux
		    Icon(Position)= new GTKLib.GDKPixbuf(image)
		  #Else
		    #Pragma Unused Position
		    #Pragma Unused image
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652069636F6E2073686F776E20696E2074686520656E747279206174207468652073706563696669656420706F736974696F6E2066726F6D207468652063757272656E742069636F6E207468656D652E
		Sub Icon(Position as GtkEntryIconPosition, assigns iconname as Text)
		  #If TargetLinux
		    gtk_entry_set_icon_from_icon_name(Mid, position, iconname.ToCString(xojo.core.TextEncoding.utf8))
		  #Else
		    #Pragma Unused Position
		    #Pragma Unused iconname
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E6473207468652069636F6E2061742074686520676976656E20706F736974696F6E20616E642072657475726E2069747320696E6465782E2054686520706F736974696F6EE280997320636F6F7264696E61746573206172652072656C617469766520746F2074686520656E74727920E280997320746F70206C65667420636F726E65722E2049662078202C207920646F65736EE2809974206C696520696E7369646520616E2069636F6E2C202D312069732072657475726E65642E20546869732066756E6374696F6E20697320696E74656E64656420666F722075736520696E206120E2809C71756572792D746F6F6C746970E2809D207369676E616C2068616E646C65722E
		Function IconAtPosition(x as Int16, y as Int16) As int16
		  #If TargetLinux
		    return gtk_entry_get_icon_at_pos(Mid, x, y)
		  #Else
		    #Pragma Unused x
		    #Pragma Unused y
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732077686574686572207468652069636F6E206973206163746976617461626C652E
		Function IconIsActivatable(Position as GtkEntryIconPosition) As Boolean
		  #If TargetLinux
		    Return gtk_entry_get_icon_activatable(Mid, position)
		  #Else
		    #Pragma Unused position
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732077686574686572207468652069636F6E206973206163746976617461626C652E
		Sub IconIsActivatable(Position as GtkEntryIconPosition, assigns value as Boolean)
		  #If TargetLinux
		    gtk_entry_set_icon_activatable(Mid, position, value)
		  #Else
		    #Pragma Unused Position
		    #Pragma Unused value
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732077686574686572207468652069636F6E2073686F756C64206170706561722073656E7369746976652E
		Function IconIsSensitive(Position as GtkEntryIconPosition) As Boolean
		  #If TargetLinux
		    return gtk_entry_get_icon_sensitive(Mid, position)
		  #Else
		    #Pragma Unused Position
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732077686574686572207468652069636F6E2073686F756C64206170706561722073656E7369746976652E
		Sub IconIsSensitive(Position as GtkEntryIconPosition, assigns value as Boolean)
		  #If TargetLinux
		     gtk_entry_set_icon_sensitive(Mid, position, value)
		  #Else
		    #Pragma unused position
		    #pragma unused value
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526574726965766573207468652069636F6E206E616D65207573656420666F72207468652069636F6E2C206F72204E554C4C206966207468657265206973206E6F2069636F6E206F72206966207468652069636F6E207761732073657420627920736F6D65206F74686572206D6574686F642028652E672E2C206279207069786275662C2073746F636B206F72206769636F6E292E
		Function IconName(Position as GtkEntryIconPosition) As Text
		  #If TargetLinux
		    return gtk_entry_get_icon_name(Mid, position).totext
		  #Else
		    #Pragma Unused Position
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IconPressHandler(iconpos as GtkEntryIconPosition, data as ptr, widget as Ptr, eventID as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaiseIconPress(iconpos)
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused iconpos
		    #Pragma Unused data
		    #Pragma Unused widget
		    #Pragma Unused eventID
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IconReleaseHandler(iconpos as GtkEntryIconPosition, data as ptr, widget as Ptr, eventID as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaiseIconRelease(iconpos)
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused iconpos
		    #Pragma Unused data
		    #Pragma Unused widget
		    #Pragma Unused eventID
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InsertHandler(buffer as gtkLib.GTKEntryBuffer, position as UInt16, insertText as Text)
		  #if TargetLinux
		    RaiseEvent Textinsert (position, insertText)
		    RaiseEvent TextChanged
		  #Else
		    #Pragma Unused position
		    #Pragma Unused insertText
		  #EndIf
		  #Pragma unused buffer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PasteHandler(widget as ptr, Data as Ptr)
		  #if TargetLinux
		    Dim w As xojo.core.WeakRef = InstanceDict.Lookup(widget, nil)
		    If w <> Nil  Then
		      if  w.value <> Nil then
		        dim b as GTKLib.GTKEntry = GTKLib.GTKEntry(w.Value)
		        b.RaisePaste
		        If Not b.AddedHandlers Then b.RaiseTextChange
		      Else
		        InstanceDict.Remove(widget)
		      End If
		    End If
		  #Else
		    #Pragma unused widget
		    #Pragma Unused data
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E64696361746573207468617420736F6D652070726F6772657373206973206D6164652C2062757420796F7520646F6EE2809974206B6E6F7720686F77206D7563682E204361757365732074686520656E747279E28099732070726F677265737320696E64696361746F7220746F20656E74657220E2809C6163746976697479206D6F64652CE2809D207768657265206120626C6F636B20626F756E636573206261636B20616E6420666F7274682E20456163682063616C6C20746F2070726F677265737370756C73652829206361757365732074686520626C6F636B20746F206D6F76652062792061206C6974746C6520626974202874686520616D6F756E74206F66206D6F76656D656E74207065722070756C73652069732064657465726D696E65642062792070726F677265737370756C736573746570292E
		Sub ProgressPulse()
		  #If TargetLinux
		    gtk_entry_progress_pulse Mid
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseActivate()
		  RaiseEvent PressedReturn
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseBackspace()
		  RaiseEvent PressedBackspace
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseCut()
		  RaiseEvent CutToClipboard
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseIconPress(IconPosition As GtkEntryIconPosition)
		  RaiseEvent IconPressed(Iconposition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseIconRelease(IconPosition As GtkEntryIconPosition)
		  RaiseEvent IconReleased(Iconposition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaisePaste()
		  RaiseEvent TextPaste
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub RaiseTextChange()
		  RaiseEvent TextChanged
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
		    If AddedHandlers Then
		      Dim b As GTKLib.GTKEntryBuffer = Me.Buffer
		      If b <> Nil Then
		        RemoveHandler b.Textinsert, WeakAddressOf InsertHandler
		        RemoveHandler b.TextDelete, WeakAddressOf DeleteHandler
		      End If
		    End If
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652063686172616374657220746F2075736520696E20706C616365206F66207468652061637475616C2074657874207768656E20546578745669736962696C69747920686173206265656E2073657420746F2046616C73652E
		Sub SetInvisibleCharacter(Character as uint32)
		  #If TargetLinux
		    gtk_entry_set_invisible_char Mid, Character
		  #Else
		    #pragma unused character
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F6E74656E7473206F662074686520746F6F6C746970206F6E207468652069636F6E206174207468652073706563696669656420706F736974696F6E20696E2074686520656E7472792E
		Function Tooltip(Position as GtkEntryIconPosition) As Text
		  #If TargetLinux
		    return gtk_entry_get_icon_tooltip_text(Mid, position).toText
		  #Else
		    #Pragma Unused Position
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476574732074686520636F6E74656E7473206F662074686520746F6F6C746970206F6E207468652069636F6E206174207468652073706563696669656420706F736974696F6E20696E2074686520656E7472792E
		Sub Tooltip(Position as GtkEntryIconPosition, assigns tipText as Text)
		  #If TargetLinux
		    gtk_entry_set_icon_tooltip_text(Mid, position, tipText.ToCString(xojo.core.TextEncoding.utf8))
		  #Else
		    #Pragma Unused Position
		    #Pragma Unused tipText
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E736574732074686520696E76697369626C652063686172616374657220746F206974732064656661756C742E
		Sub UnsetInvisibleCharacter()
		  #If TargetLinux
		    gtk_entry_unset_invisible_char Mid
		  #EndIf
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 4669726573207768656E20746865207573657220686173206375742028612070617274206F662920746865207465787420746F2074686520636C6970626F6172642E
		Event CutToClipboard()
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E20746865207573657220636C69636B6564206F6E20616E2069636F6E2E
		Event IconPressed(IconPosition As GtkEntryIconPosition)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520757365722072656C65617365642074686520636C69636B206F6E20616E2069636F6E2E
		Event IconReleased(IconPosition As GtkEntryIconPosition)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E207468652075736572206861732068697420746865204261636B737061636520627574746F6E
		Event PressedBackspace()
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520757365722068617320686974207468652072657475726E20627574746F6E
		Event PressedReturn()
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E20746865207465787420776173206368616E6765642E
		Event TextChanged()
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074657874207761732064656C657465642E
		Event TextDelete(position as UInt16, numberofChars as Uint16)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E20746578742077617320696E7365727465642E
		Event TextInsert(position as UInt16, insertText as Text)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520757365722068617320696E73657274656420746578742076696120636C6970626F6172642070617374652E
		Event TextPaste()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0, Description = 496620545255452C207072657373696E6720456E74657220696E2074686520656E7472792077696C6C206163746976617465207468652064656661756C742077696467657420666F72207468652077696E646F7720636F6E7461696E696E672074686520656E7472792E205468697320757375616C6C79206D65616E73207468617420746865206469616C6F6720626F7820636F6E7461696E696E672074686520656E7472792077696C6C20626520636C6F7365642C2073696E6365207468652064656661756C742077696467657420697320757375616C6C79206F6E65206F6620746865206469616C6F6720627574746F6E732E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_activates_default(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_activates_default Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ActivatesDefault As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Attributes( hidden ) AddedHandlers As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 536574732074686520616C69676E6D656E7420666F722074686520636F6E74656E7473206F662074686520656E7472792E205468697320636F6E74726F6C732074686520686F72697A6F6E74616C20706F736974696F6E696E67206F662074686520636F6E74656E7473207768656E2074686520646973706C6179656420746578742069732073686F72746572207468616E20746865207769647468206F662074686520656E7472792E2056616C7565206973206265747765656E203020286C6566742920746F20312028726967687429
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_alignment(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_alignment Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		Alignment As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652047746B456E747279427566666572206F626A65637420776869636820686F6C647320746865207465787420666F722074686973207769646765742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return GTKLib.GTKEntryBuffer.fromPtr(gtk_entry_get_buffer(Mid))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_buffer Mid, value.nilptr
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		Buffer As GTKLib.GTKEntryBuffer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 576865746865722074686520656E74727920686173206120626576656C6564206672616D652061726F756E642069742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_has_frame(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_has_frame Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		HasFrame As Boolean
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

	#tag ComputedProperty, Flags = &h0, Description = 546865206D6178696D756D20616C6C6F776564206C656E677468206F6620746865207465787420696E2074686520656E747279E28099732062756666657220286F72203020666F72206E6F206C696D697429
		#tag Getter
			Get
			  #If TargetLinux
			    if Buffer <> nil then
			      return buffer.MaxLength
			    End If
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_max_length Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		MaxLength As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652064657369726564206D6178696D756D207769647468206F6620656E747279202C20696E20636861726163746572732E20
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_max_width_chars(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_max_width_chars Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		MaxWidthForCharacters As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 57686574686572207468652074657874206973206F7665727772697474656E207768656E20747970696E6720696E207468652047746B456E7472792E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_overwrite_mode(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_overwrite_mode Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		Overwrite As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207465787420746F20626520646973706C6179656420696E20656E747279207768656E20697420697320656D70747920616E6420756E666F63757365642E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_placeholder_text(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_placeholder_text Mid, value.ToCString(xojo.core.TextEncoding.utf8)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		PlaceholderText As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520656E747279E28099732070726F677265737320696E64696361746F72207468617420E2809C66696C6C7320696EE2809D2074686520676976656E206672616374696F6E206F6620746865206261722E20546865206672616374696F6E2073686F756C64206265206265747765656E20302E3020616E6420312E302C20696E636C75736976652E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_progress_fraction(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_progress_fraction Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ProgressFraction As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206672616374696F6E206F6620746F74616C20656E74727920776964746820746F206D6F7665207468652070726F677265737320626F756E63696E6720626C6F636B20666F7220656163682063616C6C20746F2070726F677265737350756C736528292E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_progress_pulse_step(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_progress_pulse_step Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		ProgressPulseStep As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Signals() As Uint32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207465787420696E20746865207769646765742E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_text(Mid).toText
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_text Mid, value.ToCString(xojo.core.TextEncoding.utf8)
			  #Else
			    #pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		TextContent As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E74206E756D626572206F66206368617261637465727320696E2047746B456E7472792028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_text_length(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		TextLength As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5365747320776865746865722074686520636F6E74656E7473206F662074686520656E747279206172652076697369626C65206F72206E6F742E205768656E207669736962696C6974792069732073657420746F2046414C53452C20636861726163746572732061726520646973706C617965642061732074686520696E76697369626C6520636861722C20616E642077696C6C20616C736F20617070656172207468617420776179207768656E20746865207465787420696E2074686520656E7472792077696467657420697320636F7069656420656C736577686572652E0A42792064656661756C742C2047544B2B207069636B7320746865206265737420696E76697369626C652063686172616374657220617661696C61626C6520696E207468652063757272656E7420666F6E742C206275742069742063616E206265206368616E67656420776974682067746B5F656E7472795F7365745F696E76697369626C655F6368617228292E0A4E6F7465207468617420796F752070726F6261626C792077616E7420746F2073657420E2809C696E7075742D707572706F7365E2809D20746F2047544B5F494E5055545F505552504F53455F50415353574F5244206F722047544B5F494E5055545F505552504F53455F50494E20746F20696E666F726D20696E707574206D6574686F64732061626F75742074686520707572706F7365206F66207468697320656E7472792C20696E206164646974696F6E20746F2073657474696E67207669736962696C69747920746F2046414C53452E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_visibility(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_visibility Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		TextVisibility As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 4368616E676573207468652073697A652072657175657374206F662074686520656E74727920746F2062652061626F7574207468652072696768742073697A6520666F722074686520737065636966696564206E756D626572206F6620636861726163746572732E204E6F74652074686174206974206368616E676573207468652073697A6520726571756573742C207468652073697A652063616E207374696C6C20626520616666656374656420627920686F7720796F75207061636B207468652077696467657420696E746F20636F6E7461696E6572732E2049662076616C7565206973202D312C207468652073697A65207265766572747320746F207468652064656661756C7420656E7472792073697A652E
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_entry_get_width_chars(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetLinux
			    gtk_entry_set_width_chars Mid, value
			  #Else
			    #Pragma unused value
			  #EndIf
			End Set
		#tag EndSetter
		WidthForCharacters As Int16
	#tag EndComputedProperty


	#tag Enum, Name = GtkEntryIconPosition, Type = Int16, Flags = &h0
		Primary
		Secondary
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActivatesDefault"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddedHandlers"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="Single"
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
			Name="HasFrame"
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
			Name="MaxLength"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidthForCharacters"
			Group="Behavior"
			Type="Int16"
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
			Name="Overwrite"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlaceholderText"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgressFraction"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgressPulseStep"
			Group="Behavior"
			Type="Double"
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
			Name="TextContent"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextLength"
			Group="Behavior"
			Type="UInt16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextVisibility"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WidthForCharacters"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
