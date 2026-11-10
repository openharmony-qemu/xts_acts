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

#include "napi/native_api.h"
#include <dlfcn.h>
#include <unistd.h>
#include <grp.h>
#include <cstdlib>

typedef int (*GroupMemberT)(gid_t gid);

static GroupMemberT g_groupMember = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_groupMember = (GroupMemberT)dlsym(RTLD_DEFAULT, "group_member");
}

static bool IsSymbolReady()
{
    return g_groupMember != nullptr;
}

static napi_value GroupMember_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(getegid());
    return Ret(env, (rv == 0 || rv == 1) ? 0 : 1);
}

static napi_value GroupMember_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(99999);
    return Ret(env, rv == 0 ? 0 : 1);
}

static napi_value GroupMember_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int n = getgroups(0, nullptr);
    if (n != 0) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(getgid());
    return Ret(env, rv == 0 ? 0 : 1);
}

static napi_value GroupMember_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(0);
    return Ret(env, (rv == 0 || rv == 1) ? 0 : 1);
}

static napi_value GroupMember_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(getegid());
    return Ret(env, (rv == 0 || rv == 1) ? 0 : 1);
}

static napi_value GroupMember_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int n = getgroups(0, nullptr);
    if (n <= 0) {
        return Ret(env, 0);
    }
    gid_t *list = static_cast<gid_t *>(malloc(sizeof(gid_t) * n));
    if (!list) {
        return Ret(env, 1);
    }
    int cnt = getgroups(n, list);
    if (cnt < 0) {
        free(list);
        return Ret(env, 1);
    }
    gid_t gidLast = list[cnt - 1];
    free(list);
    int rv = g_groupMember(gidLast);
    return Ret(env, rv == 1 ? 0 : 1);
}

static napi_value GroupMember_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int rv = g_groupMember(getegid());
    return Ret(env, (rv == 0 || rv == 1) ? 0 : 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"GroupMember_0100", nullptr, GroupMember_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0200", nullptr, GroupMember_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0300", nullptr, GroupMember_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0500", nullptr, GroupMember_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0600", nullptr, GroupMember_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0700", nullptr, GroupMember_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GroupMember_0900", nullptr, GroupMember_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "group_member_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
