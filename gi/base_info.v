module gi

pub enum InfoType {
	invalid
	function
	callback
	@struct
	boxed
	@enum         /*  5 */
	flags
	object
	@interface
	constant
	invalid_0    /* 10 */
	@union
	value
	signal
	vfunc
	property     /* 15 */
	field
	arg
	@type
	unresolved
}

pub struct Attribute {
	name string
	value string
}

pub struct BaseInfo {
	c &C.GIBaseInfo
}

// TODO: g_info_new()

pub fn (bi BaseInfo) ref() BaseInfo {
	cinfo := C.g_base_info_ref(bi.c)
	return BaseInfo{cinfo}
}

pub fn (bi BaseInfo) unref() {
	C.g_base_info_unref(bi.c)
}

pub fn (bi BaseInfo) equal(info BaseInfo) bool {
	return C.g_base_info_equal(bi.c, info.c)
}

pub fn (bi BaseInfo) get_type() InfoType {
	info_type := C.g_base_info_get_type(bi.c)
	return InfoType(info_type)
}

pub fn (bi BaseInfo) get_typelib() Typelib {
	typelib := C.g_base_info_get_typelib(bi.c)
	return Typelib{typelib}
}

pub fn (bi BaseInfo) get_namespace() string {
	ns := C.g_base_info_get_namespace(bi.c)
	return tos3(ns)
}

pub fn (bi BaseInfo) get_name() string {
	name := C.g_base_info_get_name(bi.c)
	return tos3(name)
}

pub fn (bi BaseInfo) get_attribute(name string) string {
	attr := C.g_base_info_get_attribute(bi.c, name.str)
	return tos3(attr)
}

pub fn (bi BaseInfo) get_attributes() []Attribute {
	mut ret := []Attribute{}
	iter := C.GIAttributeIter{}
	name := ''
	value := ''
	for C.g_base_info_iterate_attributes(bi.c, &iter, &name.str, &value.str) {
		ret << Attribute{ name: name, value: value }
	}
	return ret
}

pub fn (bi BaseInfo) get_container() BaseInfo {
	container := C.g_base_info_get_container(bi.c)
	return BaseInfo{container}
}

pub fn (bi BaseInfo) is_deprecated() bool {
	return C.g_base_info_is_deprecated(bi.c)
}

// pub fn (info_type InfoType) str() string {
// 	return tos3(int(info_type))
// }
