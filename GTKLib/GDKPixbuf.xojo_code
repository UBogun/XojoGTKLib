#tag Class
Protected Class GDKPixbuf
Inherits GTKLib.GObject
	#tag Method, Flags = &h0
		Sub Constructor(pic as Picture)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(pic.CopyOSHandle(picture.HandleType.LinuxGdkPixbuf))
		  MHasOwnership = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F7069657320746865206B65792F76616C75652070616972206F7074696F6E7320617474616368656420746F20612047646B50697862756620746F20616E6F746865722E20546869732069732075736566756C20746F206B656570206F726967696E616C206D6574616461746120616674657220686176696E67206D616E6970756C6174656420612066696C652E20486F7765766572206265206361726566756C20746F2072656D6F7665206D6574616461746120776869636820796F7527766520616C7265616479206170706C6965642C20737563682061732074686520226F7269656E746174696F6E22206F7074696F6E20616674657220726F746174696E672074686520696D6167652E2052657475726E732074686520737563636573732E
		Function CopyOptions(Destination As GTKLib.GDKPixbuf) As Boolean
		  #If TargetLinux
		    Return gdk_pixbuf_copy_options(mid, Destination.id)
		  #Else
		    #pragma unused destination
		  #EndIf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_copy_options Lib gtk3lib (id as ptr, otherid as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_bits_per_sample Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_byte_length Lib gtk3lib (id as ptr) As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_colorspace Lib gtk3lib (id as ptr) As GdkColorspace
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_has_alpha Lib gtk3lib (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_height Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_n_channels Lib gtk3Lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_option Lib gtk3lib (id as ptr, key as cString) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_options Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_pixels Lib gtk3lib (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_pixels_with_length Lib gtk3lib (id as ptr, length as uint16) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_rowstride Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_get_width Lib gtk3lib (id as ptr) As Int16
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_remove_option Lib gtk3lib (id as ptr, key as cString) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function gdk_pixbuf_set_option Lib gtk3lib (id as ptr, key as cString, value as CString) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 4C6F6F6B73207570206B657920696E20746865206C697374206F66206F7074696F6E732074686174206D61792068617665206265656E20617474616368656420746F2074686520706978627566207768656E20697420776173206C6F616465642C206F722074686174206D61792068617665206265656E20617474616368656420627920616E6F746865722066756E6374696F6E207573696E672067646B5F7069786275665F7365745F6F7074696F6E28292E0A466F7220696E7374616E63652C2074686520414E49206C6F616465722070726F766964657320225469746C652220616E64202241727469737422206F7074696F6E732E205468652049434F2C2058424D2C20616E642058504D206C6F61646572732070726F766964652022785F686F742220616E642022795F686F742220686F742D73706F74206F7074696F6E7320666F7220637572736F7220646566696E6974696F6E732E2054686520504E47206C6F616465722070726F766964657320746865207445587420616E63696C6C617279206368756E6B206B65792F76616C7565207061697273206173206F7074696F6E732E2053696E636520322E31322C20746865205449464620616E64204A504547206C6F61646572732072657475726E20616E20226F7269656E746174696F6E22206F7074696F6E20737472696E67207468617420636F72726573706F6E647320746F2074686520656D62656464656420544946462F45786966206F7269656E746174696F6E20746167202869662070726573656E74292E2053696E636520322E33322C207468652054494646206C6F6164657220736574732074686520226D756C74697061676522206F7074696F6E20737472696E6720746F202279657322207768656E2061206D756C74692D706167652054494646206973206C6F616465642E2053696E636520322E333220746865204A50454720616E6420504E47206C6F6164657273207365742022782D6470692220616E642022792D64706922206966207468652066696C6520636F6E7461696E7320696D6167652064656E7369747920696E666F726D6174696F6E20696E20646F74732070657220696E63682E
		Function Option(Key As Text) As Text
		  #If TargetLinux
		    Return gdk_pixbuf_get_option(mid, key.ToCString(xojo.core.TextEncoding.UTF8)).toText
		  #Else
		    #pragma unused key
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41747461636865732061206B65792F76616C7565207061697220617320616E206F7074696F6E20746F207468652047646B5069786275662E204966206B657920616C72656164792065786973747320696E20746865206C697374206F66206F7074696F6E7320617474616368656420746F20706978627566202C20746865206E65772076616C75652069732069676E6F72656420616E642046414C53452069732072657475726E65642E
		Function Option(Key As Text, assigns value as Text) As Boolean
		  #If TargetLinux
		    Return gdk_pixbuf_set_option(mid, key.ToCString(xojo.core.TextEncoding.UTF8), value.ToCString(xojo.core.TextEncoding.utf8))
		  #Else
		    #Pragma unused key
		    #pragma unused value
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 517565726965732074686520706978656C2064617461206F66207468652070697862756620757020746F2061206365727461696E2064617461206C656E6774682E
		Function PixelData(Length As Uint16) As Xojo.Core.MutableMemoryBlock
		  #If TargetLinux
		    Return New Xojo.Core.MutableMemoryBlock(gdk_pixbuf_get_pixels_with_length(Mid, length))
		  #Else
		    #pragma unused length
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320746865206B65792F76616C75652070616972206F7074696F6E20617474616368656420746F207468652047646B50697862756620616E642072657475726E732074686520737563636573732E
		Function RemoveOption(Key As Text) As Boolean
		  #If TargetLinux
		    Return gdk_pixbuf_remove_option(mid, key.ToCString(xojo.core.TextEncoding.UTF8))
		  #Else
		    #pragma unused key
		  #EndIf
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F6620626974732070657220636F6C6F722073616D706C65206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_bits_per_sample(mid)
			  #EndIf
			End Get
		#tag EndGetter
		BitsPerChannel As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206C656E677468206F66207468652070697862756620696E2062797465732028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_byte_length(mid)
			  #EndIf
			End Get
		#tag EndGetter
		ByteLength As Uint32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F66206368616E6E656C73206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_n_channels(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Channels As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F727370616365206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_colorspace(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Colorspace As GdkColorspace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5768657468657220746865207069786275662068617320616E20616C706861206368616E6E656C662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_has_alpha(mid)
			  #EndIf
			End Get
		#tag EndGetter
		HasAlpha As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520696D61676520686569676874206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_height(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Height As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206F7074696F6E732064696374696F6E61727920617474616368656420746F2074686520706978627566204173206120486173685461626C652028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gtkLib.GHashTable.FromPtr( gdk_pixbuf_get_options(mid))
			  #EndIf
			End Get
		#tag EndGetter
		Options As GTKLib.GHashTable
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520706978656C2064617461206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return new Xojo.Core.MutableMemoryBlock(gdk_pixbuf_get_pixels(mid), ByteLength)
			  #EndIf
			End Get
		#tag EndGetter
		PixelData As Xojo.Core.MutableMemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520726F77737472696465206F662061207069786275662C20776869636820697320746865206E756D626572206F66206279746573206265747765656E20746865207374617274206F66206120726F7720616E6420746865207374617274206F6620746865206E65787420726F772E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_rowstride(mid)
			  #EndIf
			End Get
		#tag EndGetter
		RowStride As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520696D616765207769647468206F6620746865207069786275662028726561642D6F6E6C79292E
		#tag Getter
			Get
			  #If TargetLinux
			    return gdk_pixbuf_get_width(mid)
			  #EndIf
			End Get
		#tag EndGetter
		Width As Int16
	#tag EndComputedProperty


	#tag Enum, Name = GdkColorspace, Type = Integer, Flags = &h0
		GDK_COLORSPACE_RGB
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="BitsPerChannel"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteLength"
			Group="Behavior"
			Type="Uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Channels"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colorspace"
			Group="Behavior"
			Type="GdkColorspace"
			EditorType="Enum"
			#tag EnumValues
				"0 - GDK_COLORSPACE_RGB"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Floating"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAlpha"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			Type="Int16"
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
			Name="RowStride"
			Group="Behavior"
			Type="Int16"
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
			Name="Width"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
