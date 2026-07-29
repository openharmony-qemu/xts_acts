/*
 * Copyright (c) 2023 - 2026 Huawei Device Co., Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#include <malloc.h>
#include <sched.h>
#include <csignal>
#include <unistd.h>
#include <pthread.h>
#include <cstdlib>
#include <sys/wait.h>
#include <dlfcn.h>
#include "functionalext.h"


const int STACK_SIZE = 1024 * 1024 * 4;

/**
 * @tc.name      : getprocpid_0100
 * @tc.desc      : Get the pid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getprocpid0100(void)
{
    typedef int (*GetprocpidFunc)();
    GetprocpidFunc getprocpid = (GetprocpidFunc)dlsym(RTLD_DEFAULT, "getprocpid");
    if (!getprocpid) {
        return;
    }
    pid_t pid1 = getprocpid();
    EXPECT_EQ("getprocpid_0100", pid1 > 1, true);
    pid_t pid2 = getprocpid();
    EXPECT_EQ("getprocpid_0100", pid1, pid2);
    pid_t getpidVal = getpid();
    EXPECT_EQ("getprocpid_0100", pid1, getpidVal);
}

/**
 * @tc.name      : getprocpid_0200
 * @tc.desc      : Get the pid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getprocpid0200(void)
{
    typedef int (*GetprocpidFunc)();
    GetprocpidFunc getprocpid = (GetprocpidFunc)dlsym(RTLD_DEFAULT, "getprocpid");
    if (!getprocpid) {
        return;
    }
    pid_t pid1 = getprocpid();
    EXPECT_EQ("getprocpid_0200", pid1, getpid());

    pid_t child = fork();
    if (child == 0) {
        pid_t pid2 = getprocpid();
        if (pid2 != getpid()) {
            exit(1);
        }
        _exit(0);
    }
    EXPECT_EQ("getprocpid_0200", child > 0, true);

    int status = 0;
    int ret = waitpid(child, &status, 0);
    EXPECT_EQ("getprocpid_0200", ret, child);
    EXPECT_EQ("getprocpid_0200", WIFEXITED(status), true);
}

static int ChildFunc(void *arg)
{
    typedef int (*GetprocpidFunc)();
    GetprocpidFunc getprocpid = (GetprocpidFunc)dlsym(RTLD_DEFAULT, "getprocpid");
    pid_t parent = *(pid_t *)arg;
    pid_t currentPid = getpid();
    if (currentPid != 1) {
        return ESRCH;
    }

    pid_t pid = getprocpid();
    if (pid == parent) {
        return ENOSYS;
    }
    return 0;
}

/**
 * @tc.name      : getprocpid_0300
 * @tc.desc      : Get the pid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getprocpid0300(void)
{
    typedef int (*GetprocpidFunc)();
    GetprocpidFunc getprocpid = (GetprocpidFunc)dlsym(RTLD_DEFAULT, "getprocpid");
    if (!getprocpid) {
        return;
    }
    pid_t pid1 = getprocpid();
    EXPECT_EQ("getprocpid_0300", pid1, getpid());

    void* stack = malloc(STACK_SIZE);
    if (!stack) {
        t_error("malloc failed %s \n", strerror(errno));
        return;
    }

    pid_t child = clone(ChildFunc, (char *)stack + STACK_SIZE, CLONE_NEWPID | SIGCHLD, &pid1);
    if (child < 0) {
    }
    EXPECT_EQ("getprocpid_0300", child > 0, true);

    int status = 0;
    int ret = waitpid(child, &status, 0);
    EXPECT_EQ("getprocpid_0300", ret, child);
    EXPECT_EQ("getprocpid_0300", WIFEXITED(status), true);

    free(stack);
}

static void *PthreadFunc(void *arg)
{
    typedef int (*GetproctidFunc)();
    GetproctidFunc getproctid = (GetproctidFunc)dlsym(RTLD_DEFAULT, "getproctid");
    pid_t parent = *(pid_t *)arg;
    pid_t pid1 = getproctid();
    if (parent == pid1) {
        return (void *)ESRCH;
    }
    pid_t pid2 = gettid();
    if (pid1 != pid2) {
        return (void *)ENOSYS;
    }
    return NULL;
}

/**
 * @tc.name      : getproctid_0100
 * @tc.desc      : Get the tid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getproctid0100(void)
{
    typedef int (*GetproctidFunc)();
    GetproctidFunc getproctid = (GetproctidFunc)dlsym(RTLD_DEFAULT, "getproctid");
    if (!getproctid) {
        return;
    }
    pid_t pid1 = getproctid();
    EXPECT_EQ("getproctid_0100", pid1 > 1, true);
    pid_t gettidVal = gettid();
    EXPECT_EQ("getproctid_0100", pid1, gettidVal);

    void *retVal = NULL;
    pthread_t thread;
    int ret = pthread_create(&thread, NULL, PthreadFunc, &pid1);
    EXPECT_EQ("getproctid_0100", ret, 0);

    ret = pthread_join(thread, &retVal);
    EXPECT_EQ("getproctid_0100", ret, 0);
    EXPECT_EQ("getproctid_0100", retVal, NULL);
}

/**
 * @tc.name      : getproctid_0200
 * @tc.desc      : Get the tid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getproctid0200(void)
{
    typedef int (*GetproctidFunc)();
    GetproctidFunc getproctid = (GetproctidFunc)dlsym(RTLD_DEFAULT, "getproctid");
    if (!getproctid) {
        return;
    }
    pid_t pid1 = getproctid();
    EXPECT_EQ("getproctid_0200", pid1, gettid());

    pid_t child = fork();
    if (child == 0) {
        pid_t pid2 = getproctid();
        if (pid2 != gettid()) {
            exit(1);
        }
        _exit(0);
    }

    EXPECT_EQ("getproctid_0200", child > 0, true);

    int status = 0;
    int ret = waitpid(child, &status, 0);
    EXPECT_EQ("getproctid_0200", ret, child);
    EXPECT_EQ("getproctid_0200", WIFEXITED(status), true);
}

static int ChildFuncTid(void *arg)
{
    typedef int (*GetproctidFunc)();
    GetproctidFunc getproctid = (GetproctidFunc)dlsym(RTLD_DEFAULT, "getproctid");
    pid_t parent = *(pid_t *)arg;
    pid_t currentPid = getpid();
    if (currentPid != 1) {
        return ESRCH;
    }

    pid_t pid = getproctid();
    if (pid == parent) {
        return ENOSYS;
    }
    return 0;
}

/**
 * @tc.name      : getproctid_0300
 * @tc.desc      : Get the tid by parsing the proc information
 * @tc.level     : Level 0
 */
void Getproctid0300(void)
{
    typedef int (*GetproctidFunc)();
    GetproctidFunc getproctid = (GetproctidFunc)dlsym(RTLD_DEFAULT, "getproctid");
    if (!getproctid) {
        return;
    }
    pid_t pid1 = getproctid();
    EXPECT_EQ("getproctid_0300", pid1, gettid());

    void* stack = malloc(STACK_SIZE);
    if (!stack) {
        t_error("malloc failed %s \n", strerror(errno));
        return;
    }

    pid_t child = clone(ChildFuncTid, (char *)stack + STACK_SIZE, CLONE_NEWPID | SIGCHLD, &pid1);
    if (child < 0) {
    }
    EXPECT_EQ("getproctid_0300", child > 0, true);

    int status = 0;
    int ret = waitpid(child, &status, 0);
    EXPECT_EQ("getproctid_0300", ret, child);
    EXPECT_EQ("getproctid_0300", WIFEXITED(status), true);

    free(stack);
}

static int GetprocpidTestImpl(int argc, char *argv[])
{
    Getprocpid0100();
    Getprocpid0200();
    Getproctid0100();
    Getproctid0200();
    return g_tStatus;
}

int GetprocpidTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return GetprocpidTestImpl(1, libcArgv);
}
