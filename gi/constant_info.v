module gi

// GIConstantInfo represents a constant.
// A constant has a type associated which can be obtained by calling `get_type()` method and a value, 
// which can be obtained by calling `get_value()` method.
pub struct ConstantInfo {
	c &C.GIConstantInfo
}

fn is_constant_info(info voidptr) bool {
	return C.GI_IS_CONSTANT_INFO(info)
}

// free_value - Free the value returned from `get_value()` method.
pub fn (ci ConstantInfo) free_value(value Argument) {
	C.g_constant_info_free_value(ci.c, value.c)
}

// get_type - Obtain the type of the constant as a `TypeInfo`.
// Returns the `TypeInfo`. Free the struct by calling its `unref()` method when done.
pub fn (ci ConstantInfo) get_type() TypeInfo {
	type_info := C.g_constant_info_get_type(ci.c)
	return TypeInfo{type_info}
}

// get_value - Obtain the value associated with the `ConstantInfo` .
pub fn (ci ConstantInfo) get_value() Argument {
	res := Argument{0}
	C.g_constant_info_get_value(ci.c, &res)
	defer { ci.free_value(res) }
	return res
}
