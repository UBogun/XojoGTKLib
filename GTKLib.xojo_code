#tag Module
Protected Module GTKLib
	#tag Method, Flags = &h1
		Protected Function checkGTKVersion(major as uinteger, minor as uinteger = 0, micro as uinteger = 0) As Text
		  #If TargetLinux
		    Dim result As CString = gtk_check_version(major, minor, micro)
		    if result <> "" then Return Text.FromCString(result, xojo.core.TextEncoding.utf8)
		  #Else
		    #Pragma unused major
		    #Pragma unused minor
		    #Pragma unused micro
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_check_version Lib gtk3lib (major as uinteger, minor as uinteger, micro as uinteger) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_get_binary_age Lib gtk3lib () As uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_get_interface_age Lib gtk3lib () As uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_get_major_version Lib gtk3lib () As uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_get_micro_version Lib gtk3lib () As uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_get_minor_version Lib gtk3lib () As uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gtk_init_check Lib gtk3lib (byref Argc as integer, byref ArgV as CString) As boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub g_free Lib glib (id as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E20646F6573207468652073616D6520776F726B2061732067746B5F696E697428292077697468206F6E6C7920612073696E676C65206368616E67653A20497420646F6573206E6F74207465726D696E617465207468652070726F6772616D2069662074686520636F6D6D616E646C696E6520617267756D656E747320636F756C646EE280997420626520706172736564206F72207468652077696E646F77696E672073797374656D2063616EE280997420626520696E697469616C697A65642E20496E73746561642069742072657475726E732046414C5345206F6E206661696C7572652E0A61726763203D20546865206172676320706172616D65746572206F6620796F7572206D61696E28292066756E6374696F6E20286F7220302069662061726776206973204E554C4C292E20546869732077696C6C206265206368616E67656420696620616E7920617267756D656E747320776572652068616E646C65642E0A61726776203D20546865206172677620706172616D65746572206F66206D61696E28292C206F72204E554C4C2E20416E79206F7074696F6E7320756E64657273746F6F642062792047544B2B20617265207374726970706564206265666F72652072657475726E2E
		Protected Function initCheck(byref argC as Integer, byref ArgV as Text) As Boolean
		  #If TargetLinux
		    Dim temp As CString =argv.ToCString(xojo.core.TextEncoding.utf8)
		    Dim result As Boolean = gtk_init_check(argC, temp)
		    Argv = Text.FromCString(temp, xojo.core.TextEncoding.utf8)
		    return result
		  #Else
		    #Pragma unused argC
		    #Pragma unused argV
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NilPtr(Extends o as GTKLib.GObject) As Ptr
		  return if (o = nil, nil, o.id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function toText(extends c as CSTring) As Text
		  if c <>"" then return text.FromCString(c, xojo.core.TextEncoding.utf8)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1, Description = 5468652062696E617279206167652061732070617373656420746F206C6962746F6F6C207768656E206275696C64696E67207468652047544B2B206C696272617279207468652070726F636573732069732072756E6E696E6720616761696E73742028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_get_binary_age
			  #EndIf
			End Get
		#tag EndGetter
		Protected BinaryAge As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 5468652076657273696F6E206E756D626572206F66207468652047544B2B206C6962726172792028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return Text.Join (Array(gtk_get_major_version.totext, gtk_get_minor_version.totext, gtk_get_micro_version.totext), ".")
			  #EndIf
			End Get
		#tag EndGetter
		Protected GTKVersion As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #If Target64Bit
			    Return 8
			  #ElseIf Target32Bit
			    return 4
			  #EndIf
			End Get
		#tag EndGetter
		Protected IntegerSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 54686520696E74657266616365206167652061732070617373656420746F206C6962746F6F6C207768656E206275696C64696E67207468652047544B2B206C696272617279207468652070726F636573732069732072756E6E696E6720616761696E73742028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return gtk_get_interface_age
			  #EndIf
			End Get
		#tag EndGetter
		Protected InterfaceAge As UInteger
	#tag EndComputedProperty


	#tag Constant, Name = gLib, Type = Text, Dynamic = False, Default = \"glib.so", Scope = Private
	#tag EndConstant

	#tag Constant, Name = GTK3Lib, Type = Text, Dynamic = False, Default = \"gtk.so", Scope = Private
	#tag EndConstant


	#tag Structure, Name = GLIst, Flags = &h0
		Data as Ptr
		  NextData As Ptr
		PreviousData As Ptr
	#tag EndStructure


	#tag Enum, Name = GtkDeleteType, Type = Int16, Flags = &h0
		Characters
		  WordEnds
		  Words
		  DisplayLines
		  DisplayLineEnds
		  ParagraphEnds
		  Paragraphs
		Whitespace
	#tag EndEnum

	#tag Enum, Name = GTKIconSize, Type = Integer, Flags = &h0
		Invalid
		  Menu_16px
		  Small_16ps
		  Large_24px
		  Button_16px
		  DND_32px
		Dialog_48px
	#tag EndEnum

	#tag Enum, Name = GtkPositionType, Type = Integer, Flags = &h0
		Left
		  Right
		  Top
		Bottom
	#tag EndEnum

	#tag Enum, Name = GtkReliefStyle, Type = Integer, Flags = &h0
		Normal
		  Half
		None
	#tag EndEnum


	#tag ViewBehavior
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
End Module
#tag EndModule
