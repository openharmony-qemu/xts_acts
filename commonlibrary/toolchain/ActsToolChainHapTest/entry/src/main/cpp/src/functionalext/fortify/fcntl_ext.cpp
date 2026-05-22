/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cerrno>
#include <fcntl.h>
#include <csignal>
#include <cstring>
#include <sys/wait.h>
#include <sigchain.h>
#include "fortify_test.h"
#include "functionalext.h"
#include "test.h"


#define FILE_MODE_ALL (0777)
#define SANDBOX_PATH "/data/storage/el2/base/cache/test_file"

#ifdef open
#undef open
#endif

#ifdef openat
#undef openat
#endif

#define OPEN64 open
#define OPENAT64 openat

/**
 * @tc.name     : open_0010
 * @tc.desc     : test open normal condition
 * @tc.level    : Level 0
 */
static void Open0010(void)
{
    errno = 0;
    int fd = open(SANDBOX_PATH, O_RDWR | O_CREAT, FILE_MODE_ALL);
    TEST(fd != -1);
    close(fd);
    return;
}

/**
 * @tc.name     : Open0020
 * @tc.desc     : test open O_CREAT without mode
 * @tc.level    : Level 2
 */
static void Open0020(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_CREAT;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            open(SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : open_0030
 * @tc.desc     : test open O_TMPFILE without mode
 * @tc.level    : Level 2
 */
static void Open0030(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_TMPFILE;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            open(SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : open_0040
 * @tc.desc     : test open only O_RDWR
 * @tc.level    : Level 1
 */
static void Open0040(void)
{
    errno = 0;
    int fd = open(SANDBOX_PATH, O_RDWR);
    EXPECT_NE(Open0040, fd, -1);
    close(fd);
    return;
}

/**
 * @tc.name     : openat_0010
 * @tc.desc     : test openat normal condition
 * @tc.level    : Level 0
 */
static void Openat0010(void)
{
    errno = 0;
    int fd = openat(AT_FDCWD, SANDBOX_PATH, O_RDWR | O_CREAT, FILE_MODE_ALL);
    TEST(fd != -1);
    close(fd);
    return;
}

/**
 * @tc.name     : openat_0020
 * @tc.desc     : test openat O_CREAT without mode
 * @tc.level    : Level 2
 */
static void Openat0020(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_CREAT;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            openat(AT_FDCWD, SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : openat_0030
 * @tc.desc     : test openat O_TMPFILE without mode
 * @tc.level    : Level 2
 */
static void Openat0030(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_TMPFILE;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            openat(AT_FDCWD, SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : openat_0040
 * @tc.desc     : test openat only O_RDWR
 * @tc.level    : Level 1
 */
static void Openat0040(void)
{
    errno = 0;
    int fd = openat(AT_FDCWD, SANDBOX_PATH, O_RDWR);
    EXPECT_NE(Openat0040, fd, -1);
    close(fd);
    return;
}

#if defined(_LARGEFILE64_SOURCE) || defined(_GNU_SOURCE)
/**
 * @tc.name     : open_0010
 * @tc.desc     : test open normal condition
 * @tc.level    : Level 0
 */
static void Open640010(void)
{
    errno = 0;
    int fd = open(SANDBOX_PATH, O_RDWR | O_CREAT, FILE_MODE_ALL);
    TEST(fd != -1);
    close(fd);
    return;
}

/**
 * @tc.name     : open_0020
 * @tc.desc     : test open O_CREAT without mode
 * @tc.level    : Level 2
 */
static void Open640020(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_CREAT;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            open(SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : open_0030
 * @tc.desc     : test open O_TMPFILE without mode
 * @tc.level    : Level 2
 */
static void Open640030(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_TMPFILE;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            open(SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : Open640040
 * @tc.desc     : test open only O_RDWR
 * @tc.level    : Level 1
 */
static void Open640040(void)
{
    errno = 0;
    int fd = open(SANDBOX_PATH, O_RDWR);
    EXPECT_NE(Open640040, fd, -1);
    close(fd);
    return;
}

/**
 * @tc.name     : Openat640010
 * @tc.desc     : test openat normal condition
 * @tc.level    : Level 0
 */
static void Openat640010(void)
{
    errno = 0;
    int fd = openat(AT_FDCWD, SANDBOX_PATH, O_RDWR | O_CREAT, FILE_MODE_ALL);
    TEST(fd != -1);
    close(fd);
    return;
}

/**
 * @tc.name     : Openat640020
 * @tc.desc     : test openat O_CREAT without mode
 * @tc.level    : Level 2
 */
static void Openat640020(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_CREAT;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            openat(AT_FDCWD, SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : Openat640030
 * @tc.desc     : test openat O_TMPFILE without mode
 * @tc.level    : Level 2
 */
static void Openat640030(void)
{
    errno = 0;
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, NULL);

    int flags = O_TMPFILE;
    int status;
    int pid = fork();
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            openat(AT_FDCWD, SANDBOX_PATH, flags);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }
    return;
}

/**
 * @tc.name     : Openat640040
 * @tc.desc     : test openat only O_RDWR
 * @tc.level    : Level 1
 */
static void Openat640040(void)
{
    errno = 0;
    int fd = openat(AT_FDCWD, SANDBOX_PATH, O_RDWR);
    EXPECT_NE(Openat640040, fd, -1);
    close(fd);
    return;
}
#endif

static int FcntlExtTestImpl(int argc, char *argv[])
{
    RemoveAllSpecialHandler(SIGABRT);
    Open0010();
    Open0040();
    Openat0010();
    Openat0040();
#if defined(_LARGEFILE64_SOURCE) || defined(_GNU_SOURCE)
    Open640010();
    Open640040();
    Openat640010();
    Openat640040();
#endif
    return g_tStatus;
}

int FcntlExtTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return FcntlExtTestImpl(1, libcArgv);
}
