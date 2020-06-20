module gi

// GITypeInfo represents a type.
// You can retrieve a type info from an argument (see `ArgInfo`),
// a functions return value (see `FunctionInfo`),
// a field (see `FieldInfo`),
// a property (see `PropertyInfo`),
// a constant (see `ConstantInfo`) or 
// for a union discriminator (see `UnionInfo`).
// A type can either be a of a basic type which is a standard C primitive type or an interface type.
// For interface types you need to call `get_interface()` methood to get a reference to the base info for that interface.
pub struct TypeInfo {
	c &C.GIBaseInfo
}
