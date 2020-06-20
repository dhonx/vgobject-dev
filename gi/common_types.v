module gi

// The type tag of a `TypeInfo`.
pub enum TypeTag {
  /* Basic types */
  void       = 0
  boolean    = 1
  int8       = 2
  uint8      = 3
  int16      = 4
  uint16     = 5
  int32      = 6
  uint32     = 7
  int64      = 8
  uint64     = 9
  float      = 10
  double     = 11
  gtype      = 12
  utf8       = 13
  filename   = 14
  /* Non-basic types; compare with G_TYPE_TAG_IS_BASIC */
  array      = 15
  @interface = 16
  glist      = 17
  gslist     = 18
  ghash      = 19
  error      = 20
  /* Another basic type */
  unichar    = 21
}


pub struct Argument {
  c &C.GIArgument
}
