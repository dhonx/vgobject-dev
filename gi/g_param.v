module gi

pub const (
  g_param_readable = C.G_PARAM_READABLE
  g_param_writable = C.G_PARAM_WRITABLE
  g_param_readwrite = C.G_PARAM_READWRITE
  g_param_construct = C.G_PARAM_CONSTRUCT
  g_param_construct_only = C.G_PARAM_CONSTRUCT_ONLY
  g_param_lax_validation = C.G_PARAM_LAX_VALIDATION
  g_param_static_name = C.G_PARAM_STATIC_NAME
  g_param_private = C.G_PARAM_PRIVATE
  g_param_static_nick = C.G_PARAM_STATIC_NICK
  g_param_static_blurb = C.G_PARAM_STATIC_BLURB
  /* User defined flags go here */
  g_param_explicit_notify = C.G_PARAM_EXPLICIT_NOTIFY
  /* Avoid warning with -Wpedantic for gcc6 */
  g_param_deprecated = C.G_PARAM_DEPRECATED
)
