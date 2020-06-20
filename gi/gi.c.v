module gi

#flag linux `pkg-config --cflags gobject-introspection-1.0` `pkg-config --libs gobject-introspection-1.0`

#include <girepository.h>

/* ------------------------------ GIRepository ------------------------------ */
struct C.GIRepository
fn C.g_irepository_get_default() &C.GIRepository
fn C.g_irepository_get_dependencies(&C.GIRepository, charptr) &charptr
fn C.g_irepository_get_immediate_dependencies(&C.GIRepository, charptr) &charptr
fn C.g_irepository_get_loaded_namespaces(&C.GIRepository) &charptr
fn C.g_irepository_get_n_infos(&C.GIRepository, charptr) int
fn C.g_irepository_get_info(&C.GIRepository, charptr, int) &C.GIBaseInfo
fn C.g_irepository_enumerate_versions(&C.GIRepository, charptr) &C.GList
fn C.g_irepository_prepend_library_path(charptr)
fn C.g_irepository_prepend_search_path(charptr)
fn C.g_irepository_get_search_path() &C.GSList
// TODO: g_irepository_load_typelib ()
fn C.g_irepository_get_typelib_path(&C.GIRepository, charptr) charptr
fn C.g_irepository_is_registered(&C.GIRepository, charptr, charptr) bool
fn C.g_irepository_require(&C.GIRepository, charptr, charptr, int /* GIRepositoryLoadFlags */, &C.GError) &C.GITypelib
fn C.g_irepository_require_private(&C.GIRepository, charptr, charptr, charptrm, int /* GIRepositoryLoadFlags */, &C.GError) &C.GITypelib
fn C.g_irepository_get_c_prefix(&C.GIRepository, charptr) charptr
fn C.g_irepository_get_shared_library(&C.GIRepository, charptr) charptr
fn C.g_irepository_get_version(&C.GIRepository, charptr) charptr
// TODO: g_irepository_find_by_gtype
// TODO: g_irepository_find_by_error_domain
fn C.g_irepository_find_by_name(&C.GIRepository, charptr, charptr) &C.GIBaseInfo
// TODO: g_irepository_get_object_gtype_interfaces
fn C.g_irepository_dump(charptr, &C.GError)

/* ------------------------------- GIBaseInfo ------------------------------- */
struct C.GIBaseInfo
[typedef]
struct C.GIAttributeIter
// TODO: g_info_new()
fn C.g_base_info_ref(&C.GIBaseInfo) &C.GIBaseInfo
fn C.g_base_info_unref(&C.GIBaseInfo)
fn C.g_base_info_equal(&C.GIBaseInfo, &C.GIBaseInfo) bool
fn C.g_base_info_get_type(&C.GIBaseInfo) int /* GIInfoType */
fn C.g_base_info_get_typelib(&C.GIBaseInfo) &C.GITypelib
fn C.g_base_info_get_namespace(&C.GIBaseInfo) charptr
fn C.g_base_info_get_name(&C.GIBaseInfo) charptr
fn C.g_base_info_get_attribute(&C.GIBaseInfo) charptr
fn C.g_base_info_iterate_attributes(&C.GIBaseInfo, C.GIAttributeIter, &charptr, &charptr) bool
fn C.g_base_info_get_container(&C.GIBaseInfo) &C.GIBaseInfo
fn C.g_base_info_is_deprecated(&C.GIBaseInfo) bool
fn C.g_info_type_to_string(int /* GIInfoType */) charptr

/* ----------------------------- GICallableInfo ----------------------------- */
[typedef]
struct C.GICallableInfo
fn C.GI_IS_CALLABLE_INFO(voidptr) bool
fn C.g_callable_info_can_throw_gerror(&C.GIBaseInfo) bool
fn C.g_callable_info_get_n_args(&C.GIBaseInfo) int
fn C.g_callable_info_get_arg(&C.GIBaseInfo) &C.GIArgInfo
fn C.g_callable_info_get_caller_owns(&C.GIBaseInfo) int /* GITransfer */
fn C.g_callable_info_get_instance_ownership_transfer(&C.GIBaseInfo) int /* GITransfer */
fn C.g_callable_info_get_return_attribute(&C.GIBaseInfo, charptr) charptr
fn C.g_callable_info_get_return_type(&C.GIBaseInfo) &C.GIBaseInfo /* &C.GITypeInfo  */
// TODO: g_callable_info_invoke()
fn C.g_callable_info_is_method(&C.GIBaseInfo) bool
fn C.g_callable_info_iterate_return_attributes(&C.GIBaseInfo, &C.GIAttributeIter, &charptr, &charptr) bool
fn C.g_callable_info_load_arg(&C.GIBaseInfo, int, &C.GIArgInfo)
fn C.g_callable_info_load_return_type(&C.GIBaseInfo, &C.GITypeInfo)
fn C.g_callable_info_may_return_null(&C.GIBaseInfo) bool
fn C.g_callable_info_skip_return(&C.GIBaseInfo) bool

/* -------------------------- GIRegisteredTypeInfo -------------------------- */
[typedef]
struct C.GIRegisteredTypeInfo
fn C.GI_IS_REGISTERED_TYPE_INFO(voidptr) bool
fn C.g_registered_type_info_get_type_name(&C.GIBaseInfo) charptr
fn C.g_registered_type_info_get_type_init(&C.GIBaseInfo) charptr
fn C.g_registered_type_info_get_g_type(&C.GIBaseInfo) &C.GType

/* -------------------------------- GIArgInfo ------------------------------- */
[typedef]
struct C.GIArgInfo
fn C.GI_IS_ARG_INFO(voidptr) bool
fn C.g_arg_info_get_closure(&C.GIBaseInfo) int
fn C.g_arg_info_get_destroy(&C.GIBaseInfo) int
fn C.g_arg_info_get_direction(&C.GIBaseInfo) int /* GIDirection */
fn C.g_arg_info_get_ownership_transfer(&C.GIBaseInfo) int /* GITransfer */
fn C.g_arg_info_get_scope(&C.GIBaseInfo) int /* GIScopeType */
fn C.g_arg_info_get_type(&C.GIBaseInfo) &C.GIBaseInfo /* &C.GITypeInfo */
fn C.g_arg_info_load_type(&C.GIBaseInfo, &C.GIBaseInfo)
fn C.g_arg_info_may_be_null(&C.GIBaseInfo) bool
fn C.g_arg_info_is_caller_allocates(&C.GIBaseInfo) bool
fn C.g_arg_info_is_optional(&C.GIBaseInfo) bool
fn C.g_arg_info_is_return_value(&C.GIBaseInfo) bool
fn C.g_arg_info_is_skip(&C.GIBaseInfo) bool

/* ----------------------------- GIConstantInfo ----------------------------- */
[typedef]
struct C.GIConstantInfo
fn C.GI_IS_CONSTANT_INFO(voidptr) bool
fn C.g_constant_info_free_value(&C.GIBaseInfo, &C.GIArgument)
fn C.g_constant_info_get_type(&C.GIBaseInfo) &C.GIBaseInfo
fn C.g_constant_info_get_value(&C.GIBaseInfo, &C.GIArgument) bool

/* ------------------------------- GIFieldInfo ------------------------------ */
[typedef]
struct C.GIFieldInfo
fn C.GI_IS_FIELD_INFO(voidptr) bool
fn C.g_field_info_get_flags(&C.GIBaseInfo) int /* GIFieldInfoFlags */
fn C.g_field_info_get_offset(&C.GIBaseInfo) int
fn C.g_field_info_get_size(&C.GIBaseInfo) int
fn C.g_field_info_get_type(&C.GIBaseInfo) &C.GIBaseInfo /* &C.GITypeInfo */

/* ----------------------------- GIPropertyInfo ----------------------------- */
[typedef]
struct C.GIPropertyInfo
fn C.GI_IS_PROPERTY_INFO(voidptr) bool
fn C.g_property_info_get_flags(&C.GIBaseInfo) int /* GParamFlags */
fn C.g_property_info_get_ownership_transfer(&C.GIBaseInfo) int /* GITransfer */
fn C.g_property_info_get_type(&C.GIBaseInfo) &C.GIBaseInfo /* &C.GITypeInfo */

/* -------------------------------- GITypelib ------------------------------- */
[typedef]
struct C.GITypelib

[typedef]
union C.GIArgument

/* ---------------------------------- UTILS --------------------------------- */
[typedef]
struct C.GType

[typedef]
struct C.GList{
	data voidptr
	next voidptr
}

[typedef]
struct C.GSList{
	data voidptr
	next voidptr
}

[typedef]
struct C.GError {
	code int
	message charptr
}
fn C.g_strfreev(&charptr)
fn C.g_list_free(&C.GList)
fn C.g_slist_free(&C.GSList)
fn C.g_error_free(&C.GError)
