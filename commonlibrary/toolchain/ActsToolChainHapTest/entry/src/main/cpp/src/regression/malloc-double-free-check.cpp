/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <csignal>
#include <cstdlib>
#include <cstring>
#include <sigchain.h>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

static void handler(int s) {}
constexpr time_t WAIT_SECONDS = 5;

static int child(void)
{
    void* ptr = malloc(10);
    if (!ptr) {
        t_error("Malloc failed:%s\n", strerror(errno));
        return -1;
    }

    /* Double free the pointer to trigger double-free check */
    free(ptr);
    free(ptr);
    return 0;
}

static pid_t start_child(void)
{
    pid_t pid;
    int ret;
    pid = fork();
    if (pid == 0) {
        ret = child();
        t_error("child process normally out with %d\n", ret);
        return ret;
    }
    return pid;
}

static int MallocDoubleFreeCheckTest_impl(int argc, char* argv[])
{
    sigset_t set;
    int status;
    pid_t pid;
    int flag = 0;

    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    signal(SIGCHLD, handler);
    RemoveAllSpecialHandler(SIGSEGV);

    pid = start_child();
    if (pid == -1) {
        t_error("%s fork failed: %s\n", argv[0], strerror(errno));
        return -1;
    }
    timespec ts{};
    ts.tv_sec = WAIT_SECONDS;
    ts.tv_nsec = 0;
    if (sigtimedwait(&set, nullptr, &ts) == -1) { /* Wait for 5 seconds */
        if (errno == EAGAIN)
            flag = 1;
        else
            t_error("%s sigtimedwait failed: %s\n", argv[0], strerror(errno));
        union sigval signalValue = { .sival_int = 0 };
        if (sigqueue(pid, SIGKILL, signalValue) == -1)
            t_error("%s sigqueue failed: %s\n", argv[0], strerror(errno));
    }

    if (waitpid(pid, &status, 0) != pid) {
        t_error("%s waitpid failed: %s\n", argv[0], strerror(errno));
        return -1;
    }

    if (flag) {
        t_error("Child process time out\n");
    }

    if (WIFSIGNALED(status)) {
        if (WTERMSIG(status) != SIGSEGV && WTERMSIG(status) != SIGILL) {
            t_error("%s child process out with %s\n", argv[0], strsignal(WTERMSIG(status)));
            return -1;
        }
    } else {
        t_error("%s child process finished normally\n", argv[0]);
    }
    return t_status;
}

int MallocDoubleFreeCheckTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MallocDoubleFreeCheckTest_impl(1, libcArgv);
}
