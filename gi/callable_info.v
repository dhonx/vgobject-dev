module gi

/* 
`CallableInfo` represents an entity which is callable. 
Currently a function (`FunctionInfo`), virtual function (`VFuncInfo`) or callback (`CallbackInfo`).

A callable has a list of arguments (`ArgInfo`), a return type, direction and a flag which decides if it returns null.
*/

// Struct representing a callable.
pub struct CallableInfo {
	c &C.GIBaseInfo
}

/* is_callable_info - Checks if info is a `CallableInfo` or derived from it. */
pub fn is_callable_info(info voidptr) bool {
	return C.GI_IS_CALLABLE_INFO(info)
}

// TODO: Documentation
pub fn (ci CallableInfo) can_throw_gerror() bool {
	return C.g_callable_info_can_throw_gerror(ci.c)
}

// get_n_args - Obtain the number of arguments for this callable.
// Returns the number of arguments this callable expects.
pub fn (ci CallableInfo) get_n_args() int {
	return C.g_callable_info_get_n_args(ci.c)
}

// get_arg - Obtain information about a particular argument of this callable.
// Param `n` - the argument index to fetch.
// Returns the `ArgInfo`. Free it with its `unref()` method when done.
pub fn (ci CallableInfo) get_arg(n int) ArgInfo {
	return ArgInfo{C.g_callable_info_get_arg(ci.c, n)}
}

// get_caller_owns - See whether the caller owns the return value of this callable.
// `Transfer` contains a list of possible transfer values.
// Returns the transfer mode for the return value of the callable.
pub fn (ci CallableInfo) get_caller_owns() Transfer {
	transfer := C.g_callable_info_get_caller_owns(ci.c)
	return Transfer(transfer)
}

// get_instance_ownership_transfer - Obtains the ownership transfer for the instance argument.
// `Transfer` contains a list of possible transfer values.
// Returns the transfer mode of the callable.
pub fn (ci CallableInfo) get_instance_ownership_transfer() Transfer {
	transfer := C.g_callable_info_get_instance_ownership_transfer(ci.c)
	return Transfer(transfer)
}

// get_return_attribute - Retrieve an arbitrary attribute associated with the return value.
// Returns the value of the attribute, or an empty string if no such attribute exists.
pub fn (ci CallableInfo) get_return_attribute(name string) string {
	attr := C.g_callable_info_get_return_attribute(ci.c, name.str)
	if isnil(attr) {
		return ''
	}
	return tos3(attr)
}

// TODO: g_callable_info_invoke()

// is_method - Determines if the callable info is a method.
// For `VFuncInfo`s, `CallbackInfo`s, and `GISignalInfo`s, this is always true.
// Otherwise, this looks at the GI_FUNCTION_IS_METHOD flag on the `FunctionInfo`.
pub fn (ci CallableInfo) is_method() bool {
	return C.g_callable_info_is_method(ci.c)
}

// TODO: Documentation
pub fn (ci CallableInfo) get_return_attributes() []Attribute {
	mut ret := []Attribute{}
	iter := C.GIAttributeIter{}
	name := ''
	value := ''
	for C.g_callable_info_iterate_return_attributes(ci.c, &iter, &name.str, &value.str) {
		ret << Attribute{ name: name, value: value }
	}
	return ret
}

// load_arg - Obtain information about a particular argument of this callable.
// This function is a variant of `CallableInfo.get_arg()` designed for stack allocation.
pub fn (ci CallableInfo) load_arg(n int, mut arg ArgInfo) {
	C.g_callable_info_load_arg(ci.c, n, &arg.c)
}

// load_return_type - Obtain information about a return value of callable.
// This function is a variant of `CallableInfo.get_return_type()` designed for stack allocation.
pub fn (ci CallableInfo) load_return_type(mut type_ ArgInfo) {
	C.g_callable_info_load_return_type(ci.c, &type_.c)
}

// may_return_null - See if a callable could return `NULL`.
// Returns `true` if callable could return `NULL`.
pub fn (ci CallableInfo) may_return_null() bool {
	return C.g_callable_info_may_return_null(ci.c)
}

// skip_return - See if a callable's return value is only useful in C.
// Returns `true` if return value is only useful in C.
pub fn (ci CallableInfo) skip_return() bool {
	return C.g_callable_info_skip_return(ci.c)
}
