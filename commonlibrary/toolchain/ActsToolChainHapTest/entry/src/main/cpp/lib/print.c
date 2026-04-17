#include <stdio.h>
#include <stdarg.h>
#include <unistd.h>
#include "test.h"

#define BUFFER_SIZE 512
#define STATUS_ACTIVE 1
#define OFFSET_1 1
#define OFFSET_2 2
#define OFFSET_3 3
#define OFFSET_4 4

volatile int g_tStatus = 0;

int TPrintf(const char *s, ...)
{
    g_tStatus = STATUS_ACTIVE;
    va_list ap;
    va_start(ap, s);
    char buf[BUFFER_SIZE];
    int n = vsnprintf(buf, sizeof buf, s, ap);
    va_end(ap);
    if (n < 0) {
        n = 0;
    } else if (n >= sizeof buf) {
        n = sizeof buf;
        buf[n - OFFSET_1] = '\n';
        buf[n - OFFSET_2] = '.';
        buf[n - OFFSET_3] = '.';
        buf[n - OFFSET_4] = '.';
    }
    return write(1, buf, n);
}

int t_printf(const char *s, ...)
{
    va_list ap;
    char buf[BUFFER_SIZE];
    int n;

    g_tStatus = STATUS_ACTIVE;
    va_start(ap, s);
    n = vsnprintf(buf, sizeof buf, s, ap);
    va_end(ap);
    if (n < 0) {
        n = 0;
    }
    else if (n >= sizeof buf) {
        n = sizeof buf;
        buf[n - OFFSET_1] = '\n';
        buf[n - OFFSET_2] = '.';
        buf[n - OFFSET_3] = '.';
        buf[n - OFFSET_4] = '.';
    }
    return write(1, buf, n);
}
