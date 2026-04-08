/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <climits>
#include <clocale>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cwchar>
#include <dirent.h>
#include <pthread.h>
#include <sys/wait.h>
#include <utime.h>
#include "functionalext.h"

namespace {
constexpr size_t K_SETVBUF_PROBE_BUF_BYTES = 1024U;
} // namespace

/**
 * @tc.name      : Ftell0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Ftell0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Ftell0100: Error forking process");
    } else if (pid == 0) {
        ftell(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Ftell0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Fwrite0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Fwrite0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Fwrite0100: Error forking process");
    } else if (pid == 0) {
        char buf[] = "this is test";
        fwrite(buf, sizeof(char), strlen(buf), nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Fwrite0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Getc0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Getc0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Getc0100: Error forking process");
    } else if (pid == 0) {
        getc(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Getc0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Pclose0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Pclose0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Pclose0100: Error forking process");
    } else if (pid == 0) {
        pclose(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Pclose0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Rewind0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Rewind0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Rewind0100: Error forking process");
    } else if (pid == 0) {
        rewind(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Rewind0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Setvbuf0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Setvbuf0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Setvbuf0100: Error forking process");
    } else if (pid == 0) {
        char buff[K_SETVBUF_PROBE_BUF_BYTES] = { 0 };
        (void)setvbuf(nullptr, buff, -1, K_SETVBUF_PROBE_BUF_BYTES);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Setvbuf0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Wcsnrtombs0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Wcsnrtombs0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Wcsnrtombs0100: Error forking process");
    } else if (pid == 0) {
        char buffer[32]{};
        mbstate_t mbs;
        size_t wn = 4;
        size_t n = 4;
        mbrlen(nullptr, 0, &mbs);
        wcsnrtombs(buffer, nullptr, wn, n, &mbs);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Wcsnrtombs0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Unsetenv0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Unsetenv0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Unsetenv0100: Error forking process");
    } else if (pid == 0) {
        unsetenv(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Unsetenv0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : Readdir0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Readdir0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Readdir0100: Error forking process");
    } else if (pid == 0) {
        readdir(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Readdir0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : PthreadJoin0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void PthreadJoin0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("PthreadJoin0100: Error forking process");
    } else if (pid == 0) {
        pthread_t invalidThread = 0;
        void* res;
        pthread_join(invalidThread, &res);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("PthreadJoin0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : PthreadKill0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void PthreadKill0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("PthreadKill0100: Error forking process");
    } else if (pid == 0) {
        pthread_t invalidThread = 0;
        int validSig = SIGTERM;
        pthread_kill(invalidThread, validSig);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("PthreadKill0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : PthreadSetschedparam0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void PthreadSetschedparam0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("PthreadSetschedparam0100: Error forking process");
    } else if (pid == 0) {
        pthread_t invalidThread = 0;
        struct sched_param param;
        param.sched_priority = 1;
        pthread_setschedparam(invalidThread, SCHED_FIFO, &param);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("PthreadSetschedparam0100", SIGABRT, sig);
        }
    }
}

static int InvalidParamBTestImpl(int argc, char* argv[])
{
    Ftell0100();
    Fwrite0100();
    Getc0100();
    Pclose0100();
    Rewind0100();
    Setvbuf0100();
    Wcsnrtombs0100();
    Unsetenv0100();
    Readdir0100();
    PthreadJoin0100();
    PthreadKill0100();
    PthreadSetschedparam0100();

    return T_STATUS;
}

int InvalidParamBTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return InvalidParamBTestImpl(1, libcArgvStub);
}
