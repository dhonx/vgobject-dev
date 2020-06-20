module gi

// `PropertyInfo` represents a property.
// A property belongs to either a `ObjectInfo` or a `InterfaceInfo`.
pub struct PropertyInfo {
	c &C.GIPropertyInfo
}

// is_property_info - Checks if `info` is a `GIPropertyInfo`.
pub fn is_property_info(info voidptr) bool {
	return C.GI_IS_PROPERTY_INFO(info)
}

// get_flags - Obtain the flags for this property info.
// See constants with `g_param_` prefix for more information about possible flag values.
pub fn (pi PropertyInfo) get_flags() int {
	return C.g_property_info_get_flags(pi.c)
}

// get_ownership_transfer - Obtain the ownership transfer for this property.
// See `Transfer` for more information about transfer values.
pub fn (pi PropertyInfo) get_ownership_transfer() Transfer {
	ownership := C.g_property_info_get_ownership_transfer(pi.c)
	return Transfer(ownership)
}

// get_type - Obtain the type information for the property info.
// Returns the `TypeInfo`, free it with its `unref()` method when done.
pub fn (pi PropertyInfo) get_type() TypeInfo {
	return TypeInfo{C.g_property_info_get_type(pi.c)}
}
