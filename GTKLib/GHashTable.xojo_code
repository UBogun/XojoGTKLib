#tag Class
Protected Class GHashTable
	#tag Method, Flags = &h0
		Sub Constructor(id as ptr)
		  #If TargetLinux
		    Mid = id
		  #Else
		    #Pragma unused id
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(HashFunc as Ptr, EqualFunc as Ptr)
		  // Calling the overridden superclass constructor.
		  #If TargetLinux
		    mid = g_hash_table_new(HashFunc, EqualFunc)
		  #Else
		    #Pragma unused HashFunc
		    #pragma Unused EqualFunc
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromPtr(Id as Ptr) As GTKLib.GHashTable
		  #If TargetLinux
		    Return If (id = Nil, Nil, New GHashTable(id))
		  #Else
		    #Pragma Unused id
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5468697320697320612074656D706C61746520666F7220612047457175616C46756E63206D6574686F6420757361626C6520696E2074686520636F6E7374727563746F722E205365652074686520636F6D6D656E7420696E6973646520746865206D6574686F642E
		Shared Function GEqualFunc(ValueA As Ptr, ValueB as Ptr) As Boolean
		  // This is a template for a GEqualFunc method usable in the constructor
		  // For HashTables using Text as keys, modify the input parameters to be CStrings
		  
		  #If TargetLinux
		    // Your code
		  #EndIf
		  
		  
		  // Specifies the type Of a Function used To test two values For equality. The Function should Return True If both values are equal And False otherwise.
		  
		  #Pragma Unused ValueA
		  #Pragma Unused ValueB
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_hash_table_new Lib glib (HashFunc as Ptr, EqualFunc as Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function g_hash_table_size Lib gtk3lib (id as ptr) As uint16
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 5468697320697320612074656D706C61746520666F722061204861736846756E63206D6574686F6420757361626C6520696E2074686520636F6E7374727563746F722E205365652074686520636F6D6D656E747320696E7369646520746865206D6574686F642E
		Shared Function HashFuncTemplate(Key As Ptr) As UInt16
		  // This is a template for a HashFunc method usable in the constructor
		  // For HashTables using Text as keys, modify the input parameter to be a CString
		  #If TargetLinux
		    // Your code
		  #EndIf
		  
		  //Specifies the type Of the hash Function which Is passed To g_hash_table_new() when a GHashTable Is created.
		  //The Function Is passed a key And should Return a guint hash value. The functions g_direct_hash(), g_int_hash() And g_str_hash() provide hash functions which can be used when the key Is a gpointer, gint*, And gchar* respectively.
		  //g_direct_hash() Is also the appropriate hash Function For keys Of the form GINT_TO_POINTER (n) (Or similar macros).
		  //<!-- FIXME: Need more here. --> A good hash functions should produce hash values that are evenly distributed over a fairly large range. The modulus Is taken With the hash table size (a prime number) To find the 'bucket' to place each key into. The function should also be very fast, since it is called for each key lookup.
		  //Note that the hash functions provided by GLib have these qualities, but are Not particularly robust against manufactured keys that cause hash collisions. Therefore, you should consider choosing a more secure hash Function when Using a GHashTable With keys that originate In untrusted data (such As HTTP requests). Using g_str_hash() In that situation might make your application vulerable To Algorithmic Complexity Attacks.
		  //The key To choosing a good hash Is unpredictability. Even cryptographic hashes are very easy To find collisions For when the remainder Is taken modulo a somewhat predictable prime number. There must be an element Of randomness that an attacker Is unable To guess.
		  
		  #pragma unused key
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mId
			End Get
		#tag EndGetter
		Id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mId As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F6620656C656D656E747320636F6E7461696E656420696E207468652047486173685461626C652E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetLinux
			    Return g_hash_table_size(Mid)
			  #EndIf
			End Get
		#tag EndGetter
		TableSize As Uint16
	#tag EndComputedProperty


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
			Name="TableSize"
			Group="Behavior"
			Type="Uint16"
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
