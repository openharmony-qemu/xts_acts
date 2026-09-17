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
#include "napi/native_api.h"
#include <unistd.h>
#include <pthread.h>
#include <sys/wait.h>
#include "hilog/log.h"
#include <hiappevent/hiappevent_event.h>
#include <sys/prctl.h>

#define PARAM_1 5
#define PARAM_2 6

static napi_value Add(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    pid_t pid = fork();
    if (pid < 0) {
        napi_get_boolean(env, false, &res);
    } else if (pid == 0) {
        napi_get_boolean(env, true, &res);
        raise(SIGABRT);  
    } else {
        int status;
        pid_t child_pid = waitpid(pid, &status, 0);
        if (child_pid > 0) {
            bool child_success = WIFEXITED(status) && WEXITSTATUS(status) == 0;
            napi_get_boolean(env, child_success, &res);
        } else {
            napi_get_boolean(env, false, &res);
        }
    }
    return res;
}

static void OnReceiveCrashEvent(const char *domain, const struct HiAppEvent_AppEventGroup *appEventGroups,
    uint32_t groupLen)
{
    for (int i = 0; i < groupLen; ++i) {
        for (int j = 0; j < appEventGroups[i].infoLen; ++j) {
            const struct HiAppEvent_AppEventInfo &appEventInfo = appEventGroups[i].appEventInfos[j];
            OH_LOG_INFO(LogType::LOG_APP, "HiAppEvent eventInfo.domain=%{public}s", appEventInfo.domain);
            OH_LOG_INFO(LogType::LOG_APP, "HiAppEvent eventInfo.name=%{public}s", appEventInfo.name);
            OH_LOG_INFO(LogType::LOG_APP, "HiAppEvent eventInfo.eventType=%{public}d", appEventInfo.type);
            if (strcmp(appEventInfo.domain, DOMAIN_OS) != 0 ||
                (strcmp(appEventInfo.name, EVENT_APP_CRASH) != 0 && strcmp(appEventInfo.name, EVENT_APP_FREEZE) != 0
                && strcmp(appEventInfo.name, EVENT_ADDRESS_SANITIZER) != 0 && strcmp(appEventInfo.name, EVENT_CPU_USAGE_HIGH) != 0
                && strcmp(appEventInfo.name, EVENT_APP_HICOLLIE) != 0 && strcmp(appEventInfo.name, EVENT_RESOURCE_OVERLIMIT) != 0) ){
                continue;
            }
        }
    }
}

static void OnExternalLogCapacityReached(OH_HiAppEvent_ExternalLog* externalLogArr, uint32_t arrLen)
{
  OH_LOG_INFO(LogType::LOG_APP, "HiAppEvent [cpi] onCapacityReached triggered, log count: %{public}u", arrLen);
  for (uint32_t i = 0; i < arrLen; i++) {
      OH_HiAppEvent_ExternalLog* log = &externalLogArr[i];
      OH_LOG_INFO(LogType::LOG_APP, "HiAppEvent [cpi]  filePath: %{public}s, %{public}lld, %{public}ld kb event: %{public}d", log->filePath, log->generationTs, log->fileSize, log->event);
    if (i >= PARAM_1) {
        break;
    }
  }
}

static struct HiAppEvent_Watcher *systemEventWatcherR;

static napi_value RegisterExternalLogMgrSuccess(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag start");
    systemEventWatcherR = OH_HiAppEvent_CreateWatcher("Watcher987");
    const char *names[] = {EVENT_APP_CRASH, EVENT_APP_FREEZE, EVENT_ADDRESS_SANITIZER, EVENT_CPU_USAGE_HIGH, EVENT_APP_HICOLLIE, EVENT_RESOURCE_OVERLIMIT};
    OH_HiAppEvent_SetAppEventFilter(systemEventWatcherR, DOMAIN_OS, 0, names, PARAM_2);
    OH_HiAppEvent_SetWatcherOnReceive(systemEventWatcherR, OnReceiveCrashEvent);
    OH_HiAppEvent_AddWatcher(systemEventWatcherR);
    int code = OH_HiAppEvent_RegExternalLogCapacityReachedCallback(OnExternalLogCapacityReached);
    OH_LOG_INFO(LOG_APP, "testTag res is %{public}d", code);
    if (code == HIAPPEVENT_SUCCESS){
        code = HIAPPEVENT_SUCCESS;
    }
    OH_HiAppEvent_DestroyWatcher(systemEventWatcherR);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterExternalLogMgrSuccess", nullptr, RegisterExternalLogMgrSuccess, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
