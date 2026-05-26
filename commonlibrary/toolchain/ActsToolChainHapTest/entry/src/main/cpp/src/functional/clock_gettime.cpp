#include <ctime>
#include <cerrno>
#include <cstring>
#include "test.h"


#ifdef __arm__
extern "C" int __clock_gettime64(clockid_t, struct timespec *);
#else
#define __clock_gettime64 clock_gettime
#endif

#define TEST(c, ...) \
    ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
int ClockGettimeTest()
{
    struct timespec ts;
#ifdef __arm__
#else
#endif
    errno = 0;
    int ret1 = clock_gettime(CLOCK_REALTIME, &ts);
    TEST(ret1 == 0, "%s\n", strerror(errno));
    errno = 0;
    int ret2 = __clock_gettime64(CLOCK_REALTIME, &ts);
    TEST(ret2 == 0, "%s\n", strerror(errno));
    return g_tStatus;
}
