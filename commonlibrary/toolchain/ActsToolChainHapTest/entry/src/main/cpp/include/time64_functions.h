#ifndef TIME64_FUNCTIONS_H
#define TIME64_FUNCTIONS_H

#include <pthread.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/sem.h>
#include <sys/timerfd.h>
#include <time.h>
#include <threads.h>

#ifdef __cplusplus
extern "C" {
#endif

int __recvmmsg_time64(int, struct mmsghdr *, unsigned int, unsigned int, struct timespec *);
int __getitimer_time64(int, struct itimerval *);
int __setitimer_time64(int, const struct itimerval *, struct itimerval *);
int __cnd_timedwait_time64(cnd_t *, mtx_t *, const struct timespec *);
int __clock_getres_time64(clockid_t, struct timespec *);
int __clock_settime64(clockid_t, const struct timespec *);
double __difftime64(time_t, time_t);
int __semtimedop_time64(int, struct sembuf *, size_t, const struct timespec *);
int __settimeofday_time64(const struct timeval *, const struct timezone *);
int __timerfd_gettime64(int, struct itimerspec *);
int __timerfd_settime64(int, int, const struct itimerspec *, struct itimerspec *);
int __utimes_time64(const char *, const struct timeval *);
pid_t __wait4_time64(pid_t, int *, int, struct rusage *);
int __getrusage_time64(int, struct rusage *);
int __sched_rr_get_interval_time64(pid_t, struct timespec *);
int __select_time64(int, fd_set *, fd_set *, fd_set *, struct timeval *);
int __futimesat_time64(int, const char *, const struct timeval *);
int __utimensat_time64(int, const char *, const struct timespec *, int);
int __mtx_timedlock_time64(mtx_t *, const struct timespec *);
int __pthread_mutex_timedlock_time64(pthread_mutex_t *, const struct timespec *);
int __pthread_rwlock_timedrdlock_time64(pthread_rwlock_t *, const struct timespec *);
int __pthread_rwlock_timedwrlock_time64(pthread_rwlock_t *, const struct timespec *);
int __thrd_sleep_time64(const struct timespec *, struct timespec *);
int __gettimeofday_time64(struct timeval *, void *);
int __nanosleep_time64(const struct timespec *, struct timespec *);
int __timespec_get_time64(struct timespec *, int);
int __adjtimex_time64(struct timex *);
int __futimes_time64(int, const struct timeval *);
int __lutimes_time64(const char *, const struct timeval *);
time_t __time64(time_t *);
time_t __timegm_time64(struct tm *);
void *__dlsym_time64(void *, const char *);
struct tm *__gmtime64(const time_t *);
struct tm *__gmtime64_r(const time_t *, struct tm *);
struct tm *__localtime64(const time_t *);
struct tm *__localtime64_r(const time_t *, struct tm *);
time_t __mktime64(struct tm *);
int __timer_gettime64(timer_t, struct itimerspec *);
int __timer_settime64(timer_t, int, const struct itimerspec *, struct itimerspec *);

#ifdef __cplusplus
}
#endif

#endif
