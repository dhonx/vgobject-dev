module gi

pub enum LoadFlags {
	lazy = C.G_IREPOSITORY_LOAD_FLAG_LAZY
}

pub struct Repository {
	c &C.GIRepository = C.g_irepository_get_default()
}

pub fn (r Repository) get_dependencies(namespace string) []string {
	carray := C.g_irepository_get_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(carray)
}

pub fn (r Repository) get_immediate_dependencies(namespace string) []string {
	carray := C.g_irepository_get_immediate_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(carray)
}

pub fn (r Repository) get_loaded_namespaces() []string {
	carray := C.g_irepository_get_loaded_namespaces(r.c)
	return carray_string_to_array_string(carray)
}

pub fn (r Repository) get_n_infos(namespace string) int {
	return C.g_irepository_get_n_infos(r.c, namespace.str)
}

pub fn (r Repository) get_info(namespace string, index int) BaseInfo {
	info := C.g_irepository_get_info(r.c, namespace.str, index)
	return BaseInfo{info}
}

pub fn (r Repository) enumerate_versions(namespace string) []string {
	cptr := C.g_irepository_enumerate_versions(r.c, namespace.str)
	return glist_gstring_to_array_string(cptr)
}

pub fn (r Repository) prepend_library_path(directory string) {
	C.g_irepository_prepend_library_path(directory.str)
}

pub fn (r Repository) prepend_search_path(directory string) {
	C.g_irepository_prepend_search_path(directory.str)
}

pub fn (r Repository) get_search_path() []string {
	carray := C.g_irepository_get_search_path()
	return gslist_gstring_to_array_string(carray)
}

// TODO: g_irepository_load_typelib ()

pub fn (r Repository) get_typelib_path(namespace string) string {
	cpath := C.g_irepository_get_typelib_path(r.c, namespace.str)
	return tos3(cpath)
}

pub fn (r Repository) is_registered(namespace, version string) bool {
	return C.g_irepository_is_registered(r.c, namespace.str, version.str)
}

pub fn (r Repository) require(namespace, version string, flag LoadFlags) ?Typelib {
	error := C.GError{}
	ctypelib := C.g_irepository_require(r.c, namespace.str, 0, flag, &error)
	if !isnil(error.message) {
		defer { C.g_error_free(&error) }
		return error_with_code(tos3(error.message), error.code)
	}
	return Typelib{ctypelib}
}

pub fn (r Repository) require_private(typelib_dir, namespace, version string, flag LoadFlags) ?Typelib {
	error := C.GError{}
	ctypelib := C.g_irepository_require_private(r.c, typelib_dir.str, namespace.str, version.str, flag, &error)
	if !isnil(error) {
		defer { C.g_error_free(&error) }
		return error_with_code(tos3(error.message), error.code)
	}
	return Typelib{ctypelib}
}

pub fn (r Repository) get_c_prefix(namespace string) string {
	cprefix := C.g_irepository_get_c_prefix(r.c, namespace.str)
	return tos3(cprefix)
}

pub fn (r Repository) get_shared_library(namespace string) string {
	return tos3(C.g_irepository_get_shared_library(r.c, namespace.str))
}

pub fn (r Repository) get_version(namespace string) string {
	return tos3(C.g_irepository_get_version(r.c, namespace.str))
}

// TODO: g_irepository_find_by_gtype

// TODO: g_irepository_find_by_error_domain

pub fn (r Repository) find_by_name(namespace, name string) BaseInfo {
	info := C.g_irepository_find_by_name(r.c, namespace.str, name.str)
	return BaseInfo{info}
}

// TODO: g_irepository_get_object_gtype_interfaces
