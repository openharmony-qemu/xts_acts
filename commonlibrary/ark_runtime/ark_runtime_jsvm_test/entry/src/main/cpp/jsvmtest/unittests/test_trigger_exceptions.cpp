/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifdef TEST_TRIGGER_EXCEPTIONS
#include <csetjmp>
#include <iostream>

#include "jsvmtest.h"

static jmp_buf g_buf;
static bool g_oomHandlerFinished = false;
static bool g_fatalHandlerFinished = false;
static bool g_fatalHandlerFinished2 = false;
static bool g_promiseRejectFinished = false;

void OnOOMError(const char *location, const char *detail, bool isHeapOOM)
{
    g_oomHandlerFinished = true;
    longjmp(g_buf, 1);
}

void OnFatalError(const char *location, const char *message)
{
    g_fatalHandlerFinished = true;
    longjmp(g_buf, 1);
}

void OnFatalError2(const char *location, const char *message)
{
    g_fatalHandlerFinished2 = true;
    longjmp(g_buf, 1);
}


void OnPromiseReject(JSVM_Env env, JSVM_PromiseRejectEvent rejectEvent, JSVM_Value rejectInfo)
{
    CHECK(jsvm::IsObject(rejectInfo));
    auto promise = jsvm::GetProperty(rejectInfo, "promise");
    CHECK(jsvm::IsPromise(promise));
    auto value = jsvm::GetProperty(rejectInfo, "value");
    CHECK(jsvm::IsNumber(value));
    g_promiseRejectFinished = true;
}

TEST(OOM)
{
    g_oomHandlerFinished = false;
    JSVMTEST_CALL(OH_JSVM_SetHandlerForOOMError(vm, OnOOMError));
}

TEST(FatalError)
{
    g_fatalHandlerFinished = false;
    JSVMTEST_CALL(OH_JSVM_SetHandlerForFatalError(vm, OnFatalError));
    static bool fataled = false;
    setjmp(g_buf);
    if (!fataled) {
        fataled = true;
        jsvm::TryTriggerFatalError(vm);
    }
    CHECK(g_fatalHandlerFinished);
}

void FixJSVMStatusTest()
{
    JSVM_Status status = JSVM_CANCELLED;
    CHECK(status == JSVM_CANCELLED);
    status = JSVM_CALLBACK_SCOPE_MISMATCH;
    CHECK(status == JSVM_CALLBACK_SCOPE_MISMATCH);
    status = JSVM_QUEUE_FULL;
    CHECK(status == JSVM_QUEUE_FULL);
    status = JSVM_CLOSING;
    CHECK(status == JSVM_CLOSING);
    status = JSVM_WOULD_DEADLOCK;
    CHECK(status == JSVM_WOULD_DEADLOCK);
    status = JSVM_NO_EXTERNAL_BUFFERS_ALLOWED;
    CHECK(status == JSVM_NO_EXTERNAL_BUFFERS_ALLOWED);
    status = JSVM_CANNOT_RUN_JS;
    CHECK(status == JSVM_CANNOT_RUN_JS);
}

void FixJSVMPromiseRejectTest()
{
    JSVM_PromiseRejectEvent event = JSVM_PROMISE_REJECT_OTHER_REASONS;
    CHECK(event == JSVM_PROMISE_REJECT_OTHER_REASONS);
    event = JSVM_PROMISE_REJECT_WITH_NO_HANDLER;
    CHECK(event == JSVM_PROMISE_REJECT_WITH_NO_HANDLER);
    event = JSVM_PROMISE_ADD_HANDLER_AFTER_REJECTED;
    CHECK(event == JSVM_PROMISE_ADD_HANDLER_AFTER_REJECTED);
    event = JSVM_PROMISE_REJECT_AFTER_RESOLVED;
    CHECK(event == JSVM_PROMISE_REJECT_AFTER_RESOLVED);
    event = JSVM_PROMISE_RESOLVE_AFTER_RESOLVED;
    CHECK(event == JSVM_PROMISE_RESOLVE_AFTER_RESOLVED);
}

void FixJSVMMessageErrorTest()
{
    JSVM_MessageErrorLevel level = JSVM_MESSAGE_LOG;
    CHECK(level == JSVM_MESSAGE_LOG);
    level = JSVM_MESSAGE_DEBUG;
    CHECK(level == JSVM_MESSAGE_DEBUG);
    level = JSVM_MESSAGE_INFO;
    CHECK(level == JSVM_MESSAGE_INFO);
    level = JSVM_MESSAGE_ERROR;
    CHECK(level == JSVM_MESSAGE_ERROR);
    level = JSVM_MESSAGE_WARNING;
    CHECK(level == JSVM_MESSAGE_WARNING);
    level = JSVM_MESSAGE_ALL;
    CHECK(level == JSVM_MESSAGE_ALL);
}

void FixJSVMGCCallbackFlagsTest()
{
    JSVM_GCCallbackFlags flag = JSVM_NO_GC_CALLBACK_FLAGS;
    CHECK(flag == JSVM_NO_GC_CALLBACK_FLAGS);
    flag = JSVM_GC_CALLBACK_CONSTRUCT_RETAINED_OBJECT_INFOS;
    CHECK(flag == JSVM_GC_CALLBACK_CONSTRUCT_RETAINED_OBJECT_INFOS);
    flag = JSVM_GC_CALLBACK_FORCED;
    CHECK(flag == JSVM_GC_CALLBACK_FORCED);
    flag = JSVM_GC_CALLBACK_SYNCHRONOUS_PHANTOM_CALLBACK_PROCESSING;
    CHECK(flag == JSVM_GC_CALLBACK_SYNCHRONOUS_PHANTOM_CALLBACK_PROCESSING);
    flag = JSVM_GC_CALLBACK_COLLECT_ALL_AVAILABLE_GARBAGE;
    CHECK(flag == JSVM_GC_CALLBACK_COLLECT_ALL_AVAILABLE_GARBAGE);
    flag = JSVM_GC_CALLBACK_COLLECT_ALL_EXTERNAL_MEMORY;
    CHECK(flag == JSVM_GC_CALLBACK_COLLECT_ALL_EXTERNAL_MEMORY);
    flag = JSVM_GC_CALLBACK_SCHEDULE_IDLE_GARBAGE_COLLECTION;
    CHECK(flag == JSVM_GC_CALLBACK_SCHEDULE_IDLE_GARBAGE_COLLECTION);
}

TEST(PromiseReject)
{
    FixJSVMStatusTest();
    FixJSVMPromiseRejectTest();
    FixJSVMMessageErrorTest();
    FixJSVMGCCallbackFlagsTest();
    JSVMTEST_CALL(OH_JSVM_SetHandlerForPromiseReject(vm, OnPromiseReject));
    jsvm::Run("new Promise((resolve, reject) => { reject(42); })");
}

TEST(CheckHandler)
{
    CHECK(g_fatalHandlerFinished);
    CHECK(g_promiseRejectFinished);
}
#endif // TEST_TRIGGER_EXCEPTIONS