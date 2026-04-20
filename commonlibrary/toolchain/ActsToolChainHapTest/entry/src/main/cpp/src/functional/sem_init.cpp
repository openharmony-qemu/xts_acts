/* unnamed semaphore sanity check */
#include <pthread.h>
#include <semaphore.h>
#include <ctime>
#include <cstring>
#include <cerrno>
#include "test.h"

#define T(f) if (f) t_error(#f" failed: %s\n", strerror(errno))
#define T2(r, f) if (((r) = (f))) t_error(#f" failed: %s\n", strerror(r))

static void *StartFunc(void *arg)
{
    struct timespec ts;
    sem_t *s = static_cast<sem_t*>(arg);
    T(clock_gettime(CLOCK_REALTIME, &ts));
    ts.tv_sec += 1;
    T(sem_post(s));
    T(sem_timedwait(s + 1, &ts));
    return nullptr;
}

static void ManyWaiters()
{
    pthread_t t[3];
    sem_t s[2];
    int r;
    void *p;

    T(sem_init(s, 0, 0));
    T(sem_init(s + 1, 0, 0));
    T2(r, pthread_create(t, nullptr, StartFunc, s));
    T2(r, pthread_create(t + 1, nullptr, StartFunc, s));
    T2(r, pthread_create(t + 2, nullptr, StartFunc, s));
    T(sem_wait(s));
    T(sem_wait(s));
    T(sem_wait(s));
    T(sem_getvalue(s, &r));
    if (r) {
        t_error("sem value should be 0, got %d\n", r);
    }
    T(sem_post(s + 1));
    T(sem_post(s + 1));
    T(sem_post(s + 1));
    T2(r, pthread_join(t[0], &p));
    T2(r, pthread_join(t[1], &p));
    T2(r, pthread_join(t[2], &p));
    T(sem_getvalue(s + 1, &r));
    if (r) {
        t_error("sem value should be 0, got %d\n", r);
    }
    T(sem_destroy(s));
    T(sem_destroy(s + 1));
}

static void SingleThread()
{
    struct timespec ts;
    sem_t s;
    int r;

    T(sem_init(&s, 0, 1));
    T(sem_wait(&s));
    T(sem_getvalue(&s, &r));
    if (r) {
        t_error("sem value should be 0, got %d\n", r);
    }
    if (sem_trywait(&s) != -1 || errno != EAGAIN) {
        t_error("sem_trywait should fail with EAGAIN, got %s\n", strerror(errno));
    }
    errno = 0;
    T(clock_gettime(CLOCK_REALTIME, &ts));
    if (sem_timedwait(&s, &ts) != -1 || errno != ETIMEDOUT) {
        t_error("sem_timedwait should fail with ETIMEDOUT, got %s\n", strerror(errno));
    }
    T(sem_destroy(&s));
}

static int SemInitTestImpl(void)
{
    SingleThread();
    ManyWaiters();
    return g_tStatus;
}

int SemInitTest(void)
{
    return SemInitTestImpl();
}
