module gi

// Scope type of a `ArgInfo` representing callback, 
// determines how the callback is invoked and is used to decided when the invoke structs can be freed.
pub enum ScopeType {
  invalid		// The argument is not of callback type
  call			// The argument is not of callback type
  async			// The callback and associated user_data is only used until the callback is invoked, and the callback. 
  				// is invoked always exactly once
  notified		// The callback and and associated `user_data` is used until the caller is notfied via the `destroy_notify`.
}

// The direction of a `ArgInfo`.
pub enum Direction {
  @in		// in argument
  out		// out argument
  inout		// in and out argument
}

// See https://developer.gnome.org/gi/stable/gi-GIArgInfo.html#GITransfer
pub enum Transfer {
	nothing
	container
	everything
}

// `ArgInfo` represents an argument. 
// An argument is always part of a `CallableInfo`.
pub struct ArgInfo {
	c &C.GIArgInfo
}

// is_arg_info - Checks if `info` is a `GIArgInfo`.
pub fn is_arg_info(info voidptr) bool {
	return C.GI_IS_ARG_INFO(info)
}

// get_closure - Obtain the index of the user data argument.
// This is only valid for arguments which are callbacks.
// Returns index of the user data argument or `-1` if there is none.
pub fn (ai ArgInfo) get_closure() int {
	return C.g_arg_info_get_closure(ai.c)
}

// get_destroy - Obtains the index of the `GDestroyNotify` argument.
// This is only valid for arguments which are callbacks.
// Returns index of the `GDestroyNotify` argument or -1 if there is none.
pub fn (ai ArgInfo) get_destroy() int {
	return C.g_arg_info_get_destroy(ai.c)
}

// get_direction - Obtain the direction of the argument.
// Check `Direction` for possible direction values.
// Returns the direction.
pub fn (ai ArgInfo) get_direction() Direction {
	direction := C.g_arg_info_get_direction(ai.c)
	return Direction(direction)
}

// get_ownership_transfer - Obtain the ownership transfer for this argument.
// `Transfer` contains a list of possible values.
// Returns the transfer.
pub fn (ai ArgInfo) get_ownership_transfer() Transfer {
	transfer := C.g_arg_info_get_ownership_transfer(ai.c)
	return Transfer(transfer)
}

// get_scope - Obtain the scope type for this argument.
// The scope type explains how a callback is going to be invoked, 
// most importantly when the resources required to invoke it can be freed.
// GIScopeType contains a list of possible values.
pub fn (ai ArgInfo) get_scope() ScopeType {
	scope_type := C.g_arg_info_get_scope(ai.c)
	return ScopeType(scope_type)
}

// get_type - Obtain the type information for info.
// Returns the `TypeInfo` holding the type information for info,
// free it with its `unref()` method when done.
pub fn (ai ArgInfo) get_type() TypeInfo {
	return TypeInfo{C.g_arg_info_get_type(ai.c)}
}

// load_type - Obtain information about a the type of given argument info.
// This method is a variant of `get_type()` designed for stack allocation.
// The initialized type must not be referenced after info is deallocated.
pub fn (ai ArgInfo) load_type(mut type_info TypeInfo) {
	C.g_arg_info_load_type(ai.c, &type_info)
}


// may_be_null - Obtain if the type of the argument includes the possibility of `null`.
// For 'in' values this means that `null` is a valid value. 
// For 'out' values, this means that NULL may be returned.
// Returns `true` if the value may be `null`.
pub fn (ai ArgInfo) may_be_null() bool {
	return C.g_arg_info_may_be_null(ai.c)
}


// is_caller_allocates - Obtain if the argument is a pointer to a struct or object that will receive an output of a function.
// The default assumption for `Direction.out` arguments which have allocation is that the callee allocates.
//  if this is `true`, then the caller must allocate.
// Returns `true` if caller is required to have allocated the argument.
pub fn (ai ArgInfo) is_caller_allocates() bool {
	return C.g_arg_info_is_caller_allocates(ai.c)
}

// is_optional - Obtain if the argument is optional.
// For 'out' arguments this means that you can pass `null` in order to ignore the result.
// Returns `true` if it is an optional argument.
pub fn (ai ArgInfo) is_optional() bool {
	return C.g_arg_info_is_optional(ai.c)
}

// is_return_value - Obtain if the argument is a return value.
// It can either be a parameter or a return value.
// Returns `true` if it is a return value.
pub fn (ai ArgInfo) is_return_value() bool {
	return C.g_arg_info_is_return_value(ai.c)
}

// is_skip - Obtain if an argument is only useful in C.
// Returns `true` if argument is only useful in C.
pub fn (ai ArgInfo) is_skip() bool {
	return C.g_arg_info_is_skip(ai.c)
}
