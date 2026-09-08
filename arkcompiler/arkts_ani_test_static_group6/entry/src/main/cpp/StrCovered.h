/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_STRCOVERED_H
#define ARKTS_ANI_TEST_STRCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>

constexpr int P4_THREAD_COUNT = 4;
constexpr ani_size P4_HELLO_SIZE = 5;
constexpr ani_size P4_BUF_COUNT = 16;
const uint16_t P4_HELLO_UTF16[] = {0x0068, 0x0065, 0x006C, 0x006C, 0x006F};
const uint16_t P4_EMPTY_UTF16[] = {0};

// ============================================================
// Section 1: 多线程 / Multi-Thread String Operations (7 tests)
// ============================================================

ani_int test_Str_NewUTF16_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_NewUTF16_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF16(P4_HELLO_UTF16, P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                successCount.fetch_add(1);
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16Size_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF16Size_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                ani_size sz = 0;
                if (tEnv->String_GetUTF16Size(str, &sz) == ANI_OK && sz == P4_HELLO_SIZE) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF16_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                uint16_t buf[P4_BUF_COUNT] = {0};
                ani_size written = 0;
                if (tEnv->String_GetUTF16(str, buf, P4_BUF_COUNT, &written) == ANI_OK && written == P4_HELLO_SIZE &&
                    std::memcmp(buf, P4_HELLO_UTF16, static_cast<size_t>(P4_HELLO_SIZE) * sizeof(uint16_t)) == 0) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16SubString_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF16SubString_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                uint16_t buf[P4_BUF_COUNT] = {0};
                ani_size written = 0;
                if (tEnv->String_GetUTF16SubString(str, 0, P4_HELLO_SIZE, buf, P4_BUF_COUNT, &written) == ANI_OK &&
                    written == P4_HELLO_SIZE &&
                    std::memcmp(buf, P4_HELLO_UTF16, static_cast<size_t>(P4_HELLO_SIZE) * sizeof(uint16_t)) == 0) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8Size_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF8Size_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                ani_size sz = 0;
                if (tEnv->String_GetUTF8Size(str, &sz) == ANI_OK && sz == P4_HELLO_SIZE) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF8_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                char buf[P4_BUF_COUNT] = {0};
                ani_size written = 0;
                if (tEnv->String_GetUTF8(str, buf, P4_BUF_COUNT, &written) == ANI_OK && written == P4_HELLO_SIZE &&
                    std::memcmp(buf, "hello", P4_HELLO_SIZE) == 0) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8SubString_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Str_GetUTF8SubString_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P4_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("hello", P4_HELLO_SIZE, &str) == ANI_OK && str != nullptr) {
                char buf[P4_BUF_COUNT] = {0};
                ani_size written = 0;
                if (tEnv->String_GetUTF8SubString(str, 0, P4_HELLO_SIZE, buf, P4_BUF_COUNT, &written) == ANI_OK &&
                    written == P4_HELLO_SIZE && std::memcmp(buf, "hello", P4_HELLO_SIZE) == 0) {
                    successCount.fetch_add(1);
                }
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P4_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: 边界 / Boundary String Operations (12 tests)
// ============================================================

ani_int test_Str_NewUTF8_SizeZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    ani_status status = env->String_NewUTF8("", 0, &str);
    OH_LOG_INFO(LOG_APP, "testTag : Str_NewUTF8_SizeZero status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Str_NewUTF16_SizeZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    ani_status status = env->String_NewUTF16(P4_EMPTY_UTF16, 0, &str);
    OH_LOG_INFO(LOG_APP, "testTag : Str_NewUTF16_SizeZero status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Str_GetUTF8_BufferZero(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    char buf[1] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8(str, buf, 0, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF8_BufferZero status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8_BufferSmall(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    char buf[1] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8(str, buf, 1, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF8_BufferSmall status=%{public}d written=%{public}d", status,
                static_cast<int>(written));
    return (status == ANI_BUFFER_TO_SMALL || status == ANI_INVALID_ARGS || status == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16_BufferZero(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    uint16_t buf[1] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF16(str, buf, 0, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF16_BufferZero status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16_BufferSmall(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    uint16_t buf[1] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF16(str, buf, 1, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF16_BufferSmall status=%{public}d written=%{public}d", status,
                static_cast<int>(written));
    return (status == ANI_BUFFER_TO_SMALL || status == ANI_INVALID_ARGS || status == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8SubString_OffsetAtEnd(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    char buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8SubString(str, P4_HELLO_SIZE, 0, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF8SubString_OffsetAtEnd status=%{public}d", status);
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8SubString_OffsetSizeOverflow(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    char buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8SubString(str, 0, 100, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF8SubString_OffsetSizeOverflow status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF8SubString_SizeZero(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    char buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8SubString(str, 0, 0, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF8SubString_SizeZero status=%{public}d written=%{public}d", status,
                static_cast<int>(written));
    return ANI_TRUE;
}

ani_int test_Str_GetUTF16SubString_OffsetAtEnd(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    uint16_t buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF16SubString(str, P4_HELLO_SIZE, 0, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF16SubString_OffsetAtEnd status=%{public}d", status);
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16SubString_OffsetSizeOverflow(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    uint16_t buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF16SubString(str, 0, 100, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF16SubString_OffsetSizeOverflow status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Str_GetUTF16SubString_SizeZero(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("hello", P4_HELLO_SIZE, &str) != ANI_OK || str == nullptr) {
        return ANI_FALSE;
    }
    uint16_t buf[P4_BUF_COUNT] = {0};
    ani_size written = 0;
    ani_status status = env->String_GetUTF16SubString(str, 0, 0, buf, P4_BUF_COUNT, &written);
    OH_LOG_INFO(LOG_APP, "testTag : Str_GetUTF16SubString_SizeZero status=%{public}d written=%{public}d", status,
                static_cast<int>(written));
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_STRCOVERED_H
