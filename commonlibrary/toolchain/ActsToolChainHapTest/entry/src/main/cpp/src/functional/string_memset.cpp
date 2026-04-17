#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include "test.h"

#define N 500
#define ALIGN_MASK 63
#define ALIGN_SIZE 64
#define TEST_LEN 10
#define LOOP_LIMIT 256
#define PRINT_LEN 128
static char buf[N];
static char buf2[N];

static void *(*volatile pmemset)(void *, int, size_t);

static char *aligned(void *p)
{
    return reinterpret_cast<char *>(reinterpret_cast<uintptr_t>(p) + ALIGN_MASK & -ALIGN_SIZE);
}

static void test_align(int align, int len)
{
    char *s = aligned(buf + ALIGN_SIZE) + align;
    char *want = aligned(buf2 + ALIGN_SIZE) + align;
    char *p;
    int i;

    if (len + ALIGN_SIZE > buf + N - s || len + ALIGN_SIZE > buf2 + N - want)
        abort();
    for (i = 0; i < N; i++) {
        buf[i] = buf2[i] = ' ';
    }
    for (i = 0; i < len; i++) {
        want[i] = '#';
    }
    p = (char *)pmemset(s, '#', len);
    if (p != s)
        t_error("memset(%p,...) returned %p\n", s, p);
    for (i = -ALIGN_SIZE; i < len + ALIGN_SIZE; i++) {
        if (s[i] != want[i]) {
            t_error("memset(align %d, '#', %d) failed at pos %d\n", align, len, i);
            TPrintf("got : '%.*s'\n", len + PRINT_LEN, s - ALIGN_SIZE);
            TPrintf("want: '%.*s'\n", len + PRINT_LEN, want - ALIGN_SIZE);
            break;
        }
    }
}

static void test_value(int c)
{
    int i;

    pmemset(buf, c, TEST_LEN);
    for (i = 0; i < TEST_LEN; i++) {
        if ((unsigned char)buf[i] != (unsigned char)c) {
            t_error("memset(%d) failed: got %d\n", c, buf[i]);
            break;
        }
    }
}

static int StringMemsetTestImpl(void)
{
    int i,j,k;

    pmemset = memset;

    for (i = 0; i < ALIGN_SIZE; i++) {
        for (j = 0; j < N - LOOP_LIMIT; j++) {
            test_align(i,j);
        }
    }

    test_value('c');
    test_value(0);
    test_value(-1);
    test_value(-5);
    test_value(0xab);
    return g_tStatus;
}

int StringMemsetTest(void)
{
    return StringMemsetTestImpl();
}
