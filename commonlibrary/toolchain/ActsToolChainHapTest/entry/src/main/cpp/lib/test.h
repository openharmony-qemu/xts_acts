/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef TEST_H
#define TEST_H
 
#include <stdint.h>
#include <unistd.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/* TODO: not thread-safe nor fork-safe */
extern volatile int g_tStatus;

#define T_LOC2(l) __FILE__ ":" #l
#define T_LOC1(l) T_LOC2(l)
#define t_error(...) TPrintf(T_LOC1(__LINE__) ": " __VA_ARGS__)

int TPrintf(const char *s, ...);

int TVmfill(void **, size_t *, int);
int t_memfill(void);

void t_fdfill(void);

void TRandseed(uint64_t s);
uint64_t t_randn(uint64_t n);
uint64_t TRandint(uint64_t a, uint64_t b);
void t_shuffle(uint64_t *p, size_t n);
void TRandrange(uint64_t *p, size_t n);
int t_choose(uint64_t n, size_t k, uint64_t *p);

char *TPathrel(char *buf, size_t n, char *argv0, char *p);

int TSetrlim(int r, long lim);

int TSetutf8(void);

void check_log(const char *file, const char *pattern, bool regex_match);
void clear_log(const char *log_dir, const char *file_tag);
// Use the file_tag to match all the files in log_dir, and then check if the file contain pattern.
void find_and_check_file(const char *log_dir, const char *file_tag, const char *pattern, bool regex_match);

#ifndef __arm__
#define CLOCK_GETTIME64 clock_gettime
#define PTHREAD_COND_TIMEDWAIT_TIME64 pthread_cond_timedwait
#define NANOSLEEP_TIME64 nanosleep
#define FSTAT_TIME64 fstat
#define LSTAT_TIME64 lstat
#define STAT_TIME64 stat
#define UTIMENSAT_TIME64 utimensat
#define ADJTIMEX_TIME64 adjtimex
#define CLOCK_ADJTIME64 clock_adjtime
#define CLOCK_GETRES_TIME64 clock_getres
#define CLOCK_NANOSLEEP_TIME64 clock_nanosleep
#define CLOCK_SETTIME64 clock_settime
#define CND_TIMEDWAIT_TIME64 cnd_timedwait
#define CTIME64 ctime
#define CTIME64_R ctime_r
#define DIFFTIME64 difftime
#define DLSYM_TIME64 dlsym
#define FSTATAT_TIME64 fstatat
#define FUTIMENS_TIME64 futimens
#define FUTIMES_TIME64 futimes
#define FUTIMESAT_TIME64 futimesat
#define GETITIMER_TIME64 getitimer
#define GETRUSAGE_TIME64 getrusage
#define GETTIMEOFDAY_TIME64 gettimeofday
#define GMTIME64 gmtime
#define GMTIME64_R gmtime_r
#define LOCALTIME64 localtime
#define LOCALTIME64_R localtime_r
#define LUTIMES_TIME64 lutimes
#define MKTIME64 mktime
#define MTX_TIMEDLOCK_TIME64 mtx_timedlock
#define PPOLL_TIME64 ppoll
#define PSELECT_TIME64 pselect
#define PTHREAD_MUTEX_TIMEDLOCK_TIME64 pthread_mutex_timedlock
#define PTHREAD_RWLOCK_TIMEDRDLOCK_TIME64 pthread_rwlock_timedrdlock
#define PTHREAD_RWLOCK_TIMEDWRLOCK_TIME64 pthread_rwlock_timedwrlock
#define RECVMMSG_TIME64 recvmmsg
#define SCHED_RR_GET_INTERVAL_TIME64 sched_rr_get_interval
#define SELECT_TIME64 select
#define SEM_TIMEDWAIT_TIME64 sem_timedwait
#define SEMTIMEDOP_TIME64 semtimedop
#define SETITIMER_TIME64 setitimer
#define SETTIMEOFDAY_TIME64 settimeofday
#define SIGTIMEDWAIT_TIME64 sigtimedwait
#define THRD_SLEEP_TIME64 thrd_sleep
#define TIME64 time
#define TIMEGM_TIME64 timegm
#define TIMER_GETTIME64 timer_gettime
#define TIMER_SETTIME64 timer_settime
#define TIMERFD_GETTIME64 timerfd_gettime
#define TIMERFD_SETTIME64 timerfd_settime
#define TIMESPEC_GET_TIME64 timespec_get
#define UTIME64 utime
#define UTIMES_TIME64 utimes
#define WAIT4_TIME64 wait4
#endif

#define TEST_MODE 0666

#ifdef __cplusplus
}
#endif

#endif // TEST_H
