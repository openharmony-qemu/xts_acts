/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <info/fatal_message.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

static void AssertOrFail(bool value, const char* expr, const char* func)
{
    if (!value) {
        __assert_fail(expr, __FILE__, __LINE__, func);
    }
}

#define FILE_ABORT "abort.Txt"
#define FILE_IGNORE "ignore.Txt"
#define FILE_RETRY "retry.Txt"
#define ASSERT_ABORT_INFO "ASSERT_ABORT"
#define ASSERT_IGNORE_INFO "ASSERT_IGNORE"
#define ASSERT_RETRY_INFO "ASSERT_RETRY"
#define MAX_FILE_SIZE 1024

void WriteToFile(const char* filename, const char* content)
{
    FILE* file = fopen(filename, "w");
    if (file != nullptr) {
        fprintf(file, "%s\n", content);
        (void)fclose(file);
    } else {
        perror("fopen");
    }
}

char* ReadFile(const char* filename)
{
    static char buffer[MAX_FILE_SIZE];
    FILE* file;

    file = fopen(filename, "r");
    if (file == nullptr) {
        perror("fopen");
        return nullptr;
    }
    if (fgets(buffer, sizeof(buffer), file) == nullptr) {
        perror("fgets");
        (void)fclose(file);
        return nullptr;
    }

    (void)fclose(file);
    return buffer;
}

Assert_Status CallbackFunctionAbort(AssertFailureInfo assert_fail)
{
    char content[MAX_FILE_SIZE] = ASSERT_ABORT_INFO;
    WriteToFile(FILE_ABORT, content);
    Assert_Status res = ASSERT_ABORT;
    return res;
}

Assert_Status CallbackFunctionIgnore(AssertFailureInfo assert_fail)
{
    char content[MAX_FILE_SIZE] = ASSERT_IGNORE_INFO;
    WriteToFile(FILE_IGNORE, content);
    Assert_Status res = ASSERT_IGNORE;
    return res;
}

Assert_Status CallbackFunctionRetry(AssertFailureInfo assert_fail)
{
    char content[MAX_FILE_SIZE] = ASSERT_RETRY_INFO;
    WriteToFile(FILE_RETRY, content);
    Assert_Status res = ASSERT_RETRY;
    return res;
}

void ProcessAbort()
{
    set_assert_callback(CallbackFunctionAbort);
    AssertOrFail(false, "0", __func__);
}

void ProcessIgnore()
{
    set_assert_callback(CallbackFunctionIgnore);
    AssertOrFail(false, "0", __func__);
}

void ProcessRetry()
{
    set_assert_callback(CallbackFunctionRetry);
    AssertOrFail(false, "0", __func__);
}

static pid_t ForkAndRun(void (*fn)(), const char* name)
{
    pid_t pid = fork();
    if (pid < 0) {
        fprintf(stderr, "Fork failed for %s\n", name);
        return -1;
    }
    if (pid == 0) {
        fn();
        return 0;
    }
    return pid;
}

static int WaitChildrenAndCheckFiles(pid_t pid1, pid_t pid2, pid_t pid3)
{
    int status;
    waitpid(pid1, &status, 0);
    waitpid(pid2, &status, 0);
    waitpid(pid3, &status, 0);

    char* bufferAbort = strdup(ReadFile(FILE_ABORT));
    char* bufferIgnore = strdup(ReadFile(FILE_IGNORE));
    char* bufferRetry = strdup(ReadFile(FILE_RETRY));
    if (strcmp(bufferAbort, ASSERT_ABORT_INFO) == 0 && strcmp(bufferIgnore, ASSERT_IGNORE_INFO) == 0 &&
        strcmp(bufferRetry, ASSERT_RETRY_INFO) == 0) {
        printf("All processes finished.\n");
    }
    free(bufferAbort);
    free(bufferIgnore);
    free(bufferRetry);
    return 0;
}

static int UnittestFatalMessageAssertFailDialogTestImpl(void)
{
    (void)signal(SIGUSR1, SIG_DFL);
    pid_t pid1 = ForkAndRun(ProcessAbort, "Process One");
    if (pid1 < 0) {
        return 1;
    }
    if (pid1 == 0) {
        return 0;
    }

    pid_t pid2 = ForkAndRun(ProcessIgnore, "Process Two");
    if (pid2 < 0) {
        return 1;
    }
    if (pid2 == 0) {
        return 0;
    }

    pid_t pid3 = ForkAndRun(ProcessRetry, "Process Three");
    if (pid3 < 0) {
        return 1;
    }
    if (pid3 == 0) {
        return 0;
    }

    return WaitChildrenAndCheckFiles(pid1, pid2, pid3);
}

int UnittestFatalMessageAssertFailDialogTest(void)
{
    return UnittestFatalMessageAssertFailDialogTestImpl();
}
