module gi

// Flags for a `FieldInfo`.
pub enum FieldInfoFlags {
	field_is_readable = 1
	field_is_writable = 2
}

// A FieldInfo struct represents a field of a struct (see `StructInfo`),
// union (see `UnionInfo`) or an object (see `ObjectInfo`).
// The `FieldInfo` is fetched by calling `StructInfo.get_field()`, 
// `UninonInfo.get_field()` or `ObjectInfo.get_field()`.
// A field has a size, type and a struct offset asssociated and a set of flags, 
// which is currently `field_is_readable` or `field_is_writable`.
pub struct FieldInfo {
	c &C.GIBaseInfo
}

// is_field_info - Checks if `info` is a `GIFieldInfo`.
pub fn is_field_info(info voidptr) bool {
	return C.GI_IS_FIELD_INFO(info)
}

// TODO?: g_field_info_get_field()

// TODO?: g_field_info_set_field()

// get_flags - Obtain the flags for this GIFieldInfo.
// See `FieldInfoFlags` for possible flag values.
pub fn (fi FieldInfo) get_flags() FieldInfoFlags {
	flag := C.g_field_info_get_flags(fi.c)
	return FieldInfoFlags(flag)
}

// get_offset - Obtain the offset in bytes of the field member, 
// this is relative to the beginning of the struct or union.
pub fn (fi FieldInfo) get_offset() int {
	return C.g_field_info_get_offset(fi.c)
}

// get_size - Obtain the size in bits of the field member,
// this is how much space you need to allocate to store the field.
pub fn (fi FieldInfo) get_size() int {
	return C.g_field_info_get_size(fi.c)
}

// get_type - Obtain the type of a field as a `TypeInfo`.
// Returns the `TypeInfo`. Free the struct by calling its `unref()` method when done.
pub fn (fi FieldInfo) get_type() TypeInfo {
	return TypeInfo{C.g_field_info_get_type(fi.c)}
}
