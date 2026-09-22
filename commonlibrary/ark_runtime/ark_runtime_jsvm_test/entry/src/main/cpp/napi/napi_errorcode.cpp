/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
// Must be defined before including jsvm.h to enable experimental JSVM APIs.
#define JSVM_EXPERIMENTAL
#include <unistd.h>

#include <cstdint>
#include <cstring>

#include "napi_errorcode.h"

static JSVM_Value EmptyCallback(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return thisVar;
}

static void ExternalMemoryFinalizeCallback(JSVM_Env env, void* finalizeData, void* finalizeHint, bool copied)
{
    (void)env;
    (void)finalizeData;
    (void)finalizeHint;
    (void)copied;
}

static void ClearPendingException(JSVM_Env env)
{
    JSVM_Value exception = nullptr;
    OH_JSVM_GetAndClearLastException(env, &exception);
}

static bool TestWasmMemoryDetach(JSVM_Env env)
{
    const char* wasmMemoryScript = "new WebAssembly.Memory({initial: 1}).buffer";
    JSVM_Value source = nullptr;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, wasmMemoryScript, std::strlen(wasmMemoryScript), &source);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateStringUtf8 Failed");
        return false;
    }
    JSVM_Script script = nullptr;
    status = OH_JSVM_CompileScript(env, source, nullptr, 0, true, nullptr, &script);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CompileScript Failed");
        return false;
    }
    JSVM_Value wasmMemoryBuffer = nullptr;
    status = OH_JSVM_RunScript(env, script, &wasmMemoryBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_RunScript Failed");
        return false;
    }
    status = OH_JSVM_DetachArraybuffer(env, wasmMemoryBuffer);
    if (status != JSVM_DETACHABLE_ARRAYBUFFER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_DetachArraybuffer Failed");
        return false;
    }
    return true;
}

static bool TestDefineClassInvalidName(JSVM_Env env)
{
    JSVM_CallbackStruct constructor = {};
    constructor.data = nullptr;
    constructor.callback = EmptyCallback;
    JSVM_Value classResult = nullptr;
    // 536870912 = 512 * 1024 * 1024
    constexpr size_t kInvalidNameLength = 536870912;
    JSVM_Status status = OH_JSVM_DefineClassWithOptions(env, "cls", kInvalidNameLength, &constructor, 0, nullptr,
                                                        nullptr, 0, nullptr, &classResult);
    if (status != JSVM_GENERIC_FAILURE) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_DefineClassWithOptions Failed");
        return false;
    }
    return true;
}

static bool TestCompileWasmModuleInvalid(JSVM_Env env)
{
    const uint8_t invalidWasm[] = {0x00, 0x61, 0x73, 0x6d, 0xff, 0xff, 0xff, 0xff};
    JSVM_Value wasmModuleValue = nullptr;
    JSVM_Status status = OH_JSVM_CompileWasmModule(env, invalidWasm, sizeof(invalidWasm), nullptr, 0, nullptr,
                                                   &wasmModuleValue);
    if (status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CompileWasmModule Failed");
        return false;
    }
    JSVM_Value exception = nullptr;
    // The pending exception left by OH_JSVM_CompileWasmModule must be cleared before returning,
    // otherwise subsequent JSVM calls would return JSVM_PENDING_EXCEPTION unexpectedly.
    status = OH_JSVM_GetAndClearLastException(env, &exception);
    if (status != JSVM_OK) {
        ClearPendingException(env);
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetAndClearLastException Failed");
        return false;
    }
    return true;
}

static bool CreatePrivateValues(JSVM_Env env, JSVM_Value& object, JSVM_Data& privateKey, JSVM_Value& privateValue)
{
    JSVM_Status status = OH_JSVM_CreateObject(env, &object);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateObject Failed");
        return false;
    }
    status = OH_JSVM_CreatePrivate(env, nullptr, &privateKey);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreatePrivate Failed");
        return false;
    }
    status = OH_JSVM_CreateStringUtf8(env, "privateValue", sizeof("privateValue") - 1, &privateValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateStringUtf8 Failed");
        return false;
    }
    return true;
}

static bool TestPrivateOpsWithPendingException(JSVM_Env env, JSVM_Value object, JSVM_Data privateKey,
                                               JSVM_Value privateValue)
{
    JSVM_Status status = OH_JSVM_ThrowError(env, nullptr, "TestJSVMOK1 preset pending exception");
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_ThrowError Failed");
        return false;
    }
    status = OH_JSVM_SetPrivate(env, object, privateKey, privateValue);
    if (status != JSVM_PENDING_EXCEPTION) {
        ClearPendingException(env);
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_SetPrivate Failed");
        return false;
    }
    JSVM_Value getValue = nullptr;
    status = OH_JSVM_GetPrivate(env, object, privateKey, &getValue);
    if (status != JSVM_PENDING_EXCEPTION) {
        ClearPendingException(env);
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetPrivate Failed");
        return false;
    }
    status = OH_JSVM_DeletePrivate(env, object, privateKey);
    if (status != JSVM_PENDING_EXCEPTION) {
        ClearPendingException(env);
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_DeletePrivate Failed");
        return false;
    }
    JSVM_Value exception = nullptr;
    // The preset pending exception must be cleared before returning, otherwise subsequent
    // JSVM calls would return JSVM_PENDING_EXCEPTION instead of their expected statuses.
    status = OH_JSVM_GetAndClearLastException(env, &exception);
    if (status != JSVM_OK) {
        ClearPendingException(env);
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetAndClearLastException Failed");
        return false;
    }
    return true;
}

// JSVM_OK
[[maybe_unused]] JSVM_Value TestErrorCode(JSVM_Env env, JSVM_CallbackInfo info)
{
    (void)info;
    if (!TestWasmMemoryDetach(env)) {
        return nullptr;
    }
    if (!TestDefineClassInvalidName(env)) {
        return nullptr;
    }
    if (!TestCompileWasmModuleInvalid(env)) {
        return nullptr;
    }
    JSVM_Value object = nullptr;
    JSVM_Data privateKey = nullptr;
    JSVM_Value privateValue = nullptr;
    if (!CreatePrivateValues(env, object, privateKey, privateValue)) {
        return nullptr;
    }
    if (!TestPrivateOpsWithPendingException(env, object, privateKey, privateValue)) {
        return nullptr;
    }
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetBoolean(env, true, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetBoolean Failed");
        return nullptr;
    }
    return result;
}

static bool SetupOwnVmEnv(JSVM_Env env, JSVM_VM& ownVm, JSVM_Env& ownEnv, JSVM_EnvScope& ownEnvScope,
                          JSVM_HandleScope& ownHandleScope)
{
    JSVM_CreateVMOptions ownVmOptions = {};
    JSVM_Status status = OH_JSVM_CreateVM(&ownVmOptions, &ownVm);
    if (status != JSVM_OK || ownVm == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestOH_JSVM_CreateVM Failed");
        return false;
    }
    status = OH_JSVM_CreateEnv(ownVm, 0, nullptr, &ownEnv);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateEnv Failed");
        OH_JSVM_DestroyVM(ownVm);
        return false;
    }
    status = OH_JSVM_OpenEnvScope(ownEnv, &ownEnvScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_OpenEnvScope Failed");
        OH_JSVM_DestroyEnv(ownEnv);
        OH_JSVM_DestroyVM(ownVm);
        return false;
    }
    status = OH_JSVM_OpenHandleScope(ownEnv, &ownHandleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_OpenHandleScope Failed");
        OH_JSVM_CloseEnvScope(ownEnv, ownEnvScope);
        OH_JSVM_DestroyEnv(ownEnv);
        OH_JSVM_DestroyVM(ownVm);
        return false;
    }
    return true;
}

static bool CreateScriptCodeCache(JSVM_Env env, JSVM_Env ownEnv, JSVM_Value& cacheSource, JSVM_Script& cacheScript,
                                  JSVM_CodeCache& codeCache)
{
    const char* cacheScriptSource = "var a = 1; a + 1;";
    JSVM_Status status = OH_JSVM_CreateStringUtf8(ownEnv, cacheScriptSource, std::strlen(cacheScriptSource),
                                                  &cacheSource);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateStringUtf8 Failed");
        return false;
    }
    status = OH_JSVM_CompileScript(ownEnv, cacheSource, nullptr, 0, true, nullptr, &cacheScript);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CompileScript Failed");
        return false;
    }
    const uint8_t* cacheData = nullptr;
    size_t cacheLength = 0;
    status = OH_JSVM_CreateCodeCache(ownEnv, cacheScript, &cacheData, &cacheLength);
    if (status != JSVM_OK || cacheData == nullptr || cacheLength == 0) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateCodeCache Failed");
        return false;
    }
    // JSVM_CodeCache.cache is non-const while OH_JSVM_CreateCodeCache returns const data;
    // the cast only adapts the API boundary, ownership stays with the VM.
    codeCache.cache = const_cast<uint8_t*>(cacheData);
    codeCache.length = cacheLength;
    return true;
}

static bool TestBackgroundDeserialize(JSVM_Env env, JSVM_VM ownVm, const JSVM_CodeCache& codeCache,
                                      JSVM_DeserializeResult& deserializeResult)
{
    JSVM_Status status = OH_JSVM_BackgroundDeserialize(ownVm, codeCache, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_BackgroundDeserialize null result Failed");
        return false;
    }
    JSVM_CodeCache nullCache = {};
    nullCache.cache = nullptr;
    nullCache.length = 0;
    status = OH_JSVM_BackgroundDeserialize(ownVm, nullCache, &deserializeResult);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_BackgroundDeserialize null cache Failed");
        return false;
    }
    status = OH_JSVM_BackgroundDeserialize(ownVm, codeCache, &deserializeResult);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_BackgroundDeserialize Failed");
        return false;
    }
    return true;
}

static bool TestCompileScriptWithOptionsResult(JSVM_Env env, JSVM_Env ownEnv, JSVM_Value cacheSource)
{
    // static: the profile must outlive the compile options that reference it.
    static int profileData[] = {1, 2, 3, 4, 5};
    const size_t length = sizeof(profileData) / sizeof(profileData[0]);
    JSVM_CompileProfile compileProfile = {
        .profile = profileData,
        .length = length
    };
    // JSVM_CompileProfile is a const typedef while the option content slot is void*;
    // the double cast only adapts the API boundary, the profile is never modified.
    void* profilePtr = const_cast<void*>(static_cast<const void*>(&compileProfile));
    JSVM_CompileOptions options[] = {
        {.id = JSVM_COMPILE_BACKGROUND_DESERIALIZE_RESULT, .content = {nullptr}},
        {.id = JSVM_COMPILE_CODE_CACHE_REJECTED, .content = {nullptr}},
        {.id = JSVM_COMPILE_COMPILE_PROFILE, .content = {profilePtr}}
    };

    constexpr unsigned int kWaitSeconds = 1;
    sleep(kWaitSeconds);
    JSVM_Script script = nullptr;
    JSVM_Status status = OH_JSVM_CompileScriptWithOptions(ownEnv, cacheSource, sizeof(options) / sizeof(options[0]),
                                                          options, &script);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CompileScriptWithOptions Failed");
        return false;
    }
    OH_JSVM_ReleaseScript(ownEnv, script);
    return true;
}

static bool TestReleaseDeserializeResult(JSVM_Env env, JSVM_DeserializeResult deserializeResult)
{
    JSVM_Status status = OH_JSVM_ReleaseDeserializeResult(nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_ReleaseDeserializeResult null Failed");
        return false;
    }
    status = OH_JSVM_ReleaseDeserializeResult(deserializeResult);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_ReleaseDeserializeResult Failed");
        return false;
    }
    return true;
}

static void ReleaseOwnVmEnv(JSVM_Env ownEnv, JSVM_HandleScope ownHandleScope, JSVM_EnvScope ownEnvScope,
                            JSVM_Script cacheScript, JSVM_VM ownVm)
{
    if (cacheScript != nullptr) {
        OH_JSVM_ReleaseScript(ownEnv, cacheScript);
    }
    OH_JSVM_CloseHandleScope(ownEnv, ownHandleScope);
    OH_JSVM_CloseEnvScope(ownEnv, ownEnvScope);
    OH_JSVM_DestroyEnv(ownEnv);
    OH_JSVM_DestroyVM(ownVm);
}

static bool TestExternalArrayBuffer(JSVM_Env env)
{
    // static: the memory must stay valid while the ArrayBuffer created from it may be held by GC.
    static uint64_t externalMemory[2] = {0x1122334455667788, 0x99aabbccddeeff00};
    JSVM_Value externalArrayBuffer = nullptr;
    bool copied = false;
    JSVM_Status status = OH_JSVM_CreateArrayBufferFromExternalMemory(env, externalMemory, sizeof(externalMemory),
                                                                     ExternalMemoryFinalizeCallback, nullptr, &copied,
                                                                     &externalArrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateArrayBufferFromExternalMemory Failed");
        return false;
    }
    void* arrayBufferData = nullptr;
    size_t arrayBufferLength = 0;
    status = OH_JSVM_GetArraybufferInfo(env, externalArrayBuffer, &arrayBufferData, &arrayBufferLength);
    if (status != JSVM_OK || arrayBufferLength != sizeof(externalMemory)) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetArraybufferInfo Failed");
        return false;
    }
    if (std::memcmp(arrayBufferData, externalMemory, sizeof(externalMemory)) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateArrayBufferFromExternalMemory content mismatch");
        return false;
    }
    JSVM_Value invalidBuffer = nullptr;
    status = OH_JSVM_CreateArrayBufferFromExternalMemory(env, nullptr, sizeof(externalMemory), nullptr, nullptr,
                                                         nullptr, &invalidBuffer);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateArrayBufferFromExternalMemory null data Failed");
        return false;
    }
    status = OH_JSVM_CreateArrayBufferFromExternalMemory(env, reinterpret_cast<uint8_t*>(externalMemory) + 1,
                                                         sizeof(externalMemory), nullptr, nullptr, nullptr,
                                                         &invalidBuffer);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_CreateArrayBufferFromExternalMemory unaligned Failed");
        return false;
    }
    return true;
}

[[maybe_unused]] JSVM_Value TestDeserialize(JSVM_Env env, JSVM_CallbackInfo info)
{
    (void)info;
    JSVM_VM ownVm = nullptr;
    JSVM_Env ownEnv = nullptr;
    JSVM_EnvScope ownEnvScope = nullptr;
    JSVM_HandleScope ownHandleScope = nullptr;
    if (!SetupOwnVmEnv(env, ownVm, ownEnv, ownEnvScope, ownHandleScope)) {
        return nullptr;
    }
    JSVM_Value cacheSource = nullptr;
    JSVM_Script cacheScript = nullptr;
    JSVM_CodeCache codeCache = {};
    JSVM_DeserializeResult deserializeResult = nullptr;
    if (!CreateScriptCodeCache(env, ownEnv, cacheSource, cacheScript, codeCache) ||
        !TestBackgroundDeserialize(env, ownVm, codeCache, deserializeResult) ||
        !TestCompileScriptWithOptionsResult(env, ownEnv, cacheSource) ||
        !TestReleaseDeserializeResult(env, deserializeResult)) {
        ReleaseOwnVmEnv(ownEnv, ownHandleScope, ownEnvScope, cacheScript, ownVm);
        return nullptr;
    }
    ReleaseOwnVmEnv(ownEnv, ownHandleScope, ownEnvScope, cacheScript, ownVm);
    if (!TestExternalArrayBuffer(env)) {
        return nullptr;
    }
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetBoolean(env, true, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test: OH_JSVM_GetBoolean Failed");
        return nullptr;
    }
    return result;
}
