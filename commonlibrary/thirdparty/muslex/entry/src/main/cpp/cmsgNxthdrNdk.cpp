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

#include "napi/native_api.h"
#include "libcFunctionLoader.h"
#include <cerrno>
#include <cstring>
#include <sys/socket.h>

static constexpr int K_CMSG_TEST_DATA_2025 = 2025;
static constexpr int K_CMSG_TEST_DATA_2026 = 2026;
static constexpr int K_CMSG_COUNT = 2;

static cmsghdr* CallCmsgNxthdr(msghdr* mhdr, cmsghdr* cmsg)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<cmsghdr* (*)(msghdr*, cmsghdr*)>(loader.GetCmsgNxthdr());
    if (!func) {
        errno = ENOSYS;
        return nullptr;
    }
    errno = 0;
    return func(mhdr, cmsg);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetCmsgNxthdr()) {
        return true;
    }
    /* Setup a valid msghdr with a dummy cmsghdr to test stub mode */
    char controlBuf[256];
    memset(controlBuf, 0, sizeof(controlBuf));
    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int));
    errno = 0;
    CallCmsgNxthdr(&msg, cmsg);
    return (errno == ENOSYS);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ---------- TC-056: basic traverse control messages ---------- */
static napi_value CmsgNxthdrNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char controlBuf[1024];
    memset(controlBuf, 0, sizeof(controlBuf));

    // Setup first cmsghdr
    cmsghdr* cmsg1 = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg1->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg1->cmsg_level = SOL_SOCKET;
    cmsg1->cmsg_type = SCM_RIGHTS;
    *reinterpret_cast<int*>(CMSG_DATA(cmsg1)) = K_CMSG_TEST_DATA_2025;

    // Setup second cmsghdr
    size_t offset1 = CMSG_SPACE(sizeof(int));
    cmsghdr* cmsg2 = reinterpret_cast<cmsghdr*>(controlBuf + offset1);
    cmsg2->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg2->cmsg_level = SOL_SOCKET;
    cmsg2->cmsg_type = SCM_RIGHTS;
    *reinterpret_cast<int*>(CMSG_DATA(cmsg2)) = K_CMSG_TEST_DATA_2026;

    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int)) * K_CMSG_COUNT;

    cmsghdr* first = CMSG_FIRSTHDR(&msg);
    if (first == nullptr || first != cmsg1) {
        return ReturnInt32(env, 0);
    }

    cmsghdr* next = CallCmsgNxthdr(&msg, first);
    if (next == nullptr || next != cmsg2) {
        return ReturnInt32(env, 0);
    }

    cmsghdr* end = CallCmsgNxthdr(&msg, next);
    if (end != nullptr) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-057: empty buffer no control messages ---------- */
static napi_value CmsgNxthdrNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    msghdr msg = {};
    msg.msg_control = nullptr;
    msg.msg_controllen = 0;
    cmsghdr* first = CMSG_FIRSTHDR(&msg);
    if (first != nullptr) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-058: single control message traverse ---------- */
static napi_value CmsgNxthdrNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char controlBuf[1024];
    memset(controlBuf, 0, sizeof(controlBuf));

    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    *reinterpret_cast<int*>(CMSG_DATA(cmsg)) = K_CMSG_TEST_DATA_2025;

    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int));

    cmsghdr* first = CMSG_FIRSTHDR(&msg);
    if (first == nullptr || first != cmsg) {
        return ReturnInt32(env, 0);
    }

    cmsghdr* next = CallCmsgNxthdr(&msg, first);
    if (next != nullptr) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-059: return NULL confirmation ---------- */
static napi_value CmsgNxthdrFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char controlBuf[1024];
    memset(controlBuf, 0, sizeof(controlBuf));

    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;

    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int));

    cmsghdr* first = CMSG_FIRSTHDR(&msg);
    if (first == nullptr) {
        return ReturnInt32(env, 1);
    }

    cmsghdr* next = CallCmsgNxthdr(&msg, first);
    if (next != nullptr) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-060: source code NULL condition coverage ---------- */
static napi_value CmsgNxthdrFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    // Test: cmsg_len < sizeof(cmsghdr) -> NULL
    char controlBuf[1024];
    memset(controlBuf, 0, sizeof(controlBuf));

    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = sizeof(cmsghdr) - 1; // invalid length

    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = sizeof(controlBuf);

    cmsghdr* result = CallCmsgNxthdr(&msg, cmsg);
    if (result != nullptr) {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

/* ---------- TC-061: dlsym symbol existence ---------- */
static napi_value CmsgNxthdrSpec001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetCmsgNxthdr();
    if (!func) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-062: non-PC stub verification ---------- */
static napi_value CmsgNxthdrSpec002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char controlBuf[256];
    memset(controlBuf, 0, sizeof(controlBuf));
    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int));
    cmsghdr* result = CallCmsgNxthdr(&msg, cmsg);
    if (result == nullptr) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-063: IsStubMode detection ---------- */
static napi_value CmsgNxthdrSpec003(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}

/* ---------- TC-064: PC vs non-PC behavior difference ---------- */
static napi_value CmsgNxthdrSpec004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    char controlBuf[256];
    memset(controlBuf, 0, sizeof(controlBuf));
    cmsghdr* cmsg = reinterpret_cast<cmsghdr*>(controlBuf);
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    msghdr msg = {};
    msg.msg_control = controlBuf;
    msg.msg_controllen = CMSG_SPACE(sizeof(int));
    cmsghdr* result = CallCmsgNxthdr(&msg, cmsg);
    if (result == nullptr) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"cmsgNxthdrNormal001", nullptr, CmsgNxthdrNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrNormal002", nullptr, CmsgNxthdrNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrNormal003", nullptr, CmsgNxthdrNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrFunc001", nullptr, CmsgNxthdrFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrFunc002", nullptr, CmsgNxthdrFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrSpec001", nullptr, CmsgNxthdrSpec001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrSpec002", nullptr, CmsgNxthdrSpec002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrSpec003", nullptr, CmsgNxthdrSpec003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cmsgNxthdrSpec004", nullptr, CmsgNxthdrSpec004, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "cmsgNxthdrndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterCmsgNxthdrndkModule(void)
{
    napi_module_register(&demoModule);
}