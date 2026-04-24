/*
 * Minimal securec compatibility header for test builds.
 */
#ifndef SECUREC_H
#define SECUREC_H

#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EOK
#define EOK 0
#endif

typedef int errno_t;

static inline errno_t memcpy_s(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == NULL || src == NULL) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    (void)memcpy(dest, src, count);
    return EOK;
}

static inline int snprintf_s(char *strDest, size_t destMax, size_t count, const char *format, ...)
{
    if (strDest == NULL || format == NULL || destMax == 0) {
        return -1;
    }
    size_t writeCount = count;
    if (writeCount >= destMax) {
        writeCount = destMax - 1;
    }

    va_list args;
    va_start(args, format);
    int ret = vsnprintf(strDest, writeCount + 1, format, args);
    va_end(args);
    return ret;
}

#ifdef __cplusplus
}
#endif

#endif
