module gi

pub struct RegisteredTypeInfo {
	c &C.GIBaseInfo
}

// is_registered_type_info - Checks if `info` is a `RegisteredTypeInfo` or derived from it.
pub fn is_registered_type_info(info voidptr) bool {
	return C.GI_IS_REGISTERED_TYPE_INFO(info)
}

// get_type_name - Obtain the type name of the struct within the GObject type system.
// This type can be passed to `g_type_name()` to get a `GType`.
// Returns the type name.
pub fn (rti RegisteredTypeInfo) get_type_name() string {
	type_name := C.g_registered_type_info_get_type_name(rti.c)
	return tos3(type_name)
}

// get_type_init - Obtain the type init function for info.
// The type init function is the function which will register the GType within the GObject type system.
// Usually this is not called by langauge bindings or applications, 
// use `get_g_type()` method directly instead.
// Returns the symbol name of the type init function, suitable for passing into `g_module_symbol()`.
pub fn (rti RegisteredTypeInfo) get_type_init() string {
	type_init := C.g_registered_type_info_get_type_init(rti.c)
	return tos3(type_init)
}

pub fn (rti RegisteredTypeInfo) get_g_type() &C.GType {
	return C.g_registered_type_info_get_g_type(rti.c)
}
