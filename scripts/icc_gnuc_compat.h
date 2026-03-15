/* ICC compatibility header for glibc >= 2.42 with GCC >= 13 headers.
 *
 * ICC classic spoofs __GNUC__=<host-gcc-version> but does not support
 * _Float32/_Float64 as distinct built-in types in C++ mode, nor
 * __builtin_fabsf128.  glibc 2.42+ and libstdc++ headers use features
 * that require real GCC >= 13 support.
 *
 * Fix: downgrade __GNUC__ to 12 so the _Float typedef path is taken,
 * and undef __SIZEOF_FLOAT128__ to avoid __float128 abs() overloads
 * that use unavailable builtins.
 */
#if defined(__INTEL_COMPILER) && defined(__cplusplus)
# undef __GNUC__
# define __GNUC__ 12
# undef __GNUC_MINOR__
# define __GNUC_MINOR__ 0
# undef __GNUC_PATCHLEVEL__
# define __GNUC_PATCHLEVEL__ 0
# undef __SIZEOF_FLOAT128__
#endif
