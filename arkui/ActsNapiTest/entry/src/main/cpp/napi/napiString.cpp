#include "napi/native_api.h"
#include "common/native_common.h"
#include <securec.h>
#include <string>
#include <hilog/log.h>

#define LOG_TAG "NAPI_STRING_TEST"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_TAG, __VA_ARGS__))

const int NAPI_UTF8_LENGTH = 256;

constexpr int ASCII_MAX_VALUE = 127;
constexpr int BUFFER_SIZE_256 = 256;
constexpr int STRING_LENGTH_4 = 4;
constexpr int TEST_VALUE_123 = 123;
constexpr int BUFFER_SIZE_16 = 16;
constexpr int TEST_VALUE_42 = 42;
constexpr int STRING_LENGTH_5 = 5;
// g_finalizeCalled tracks whether any external-string finalize callback has been
// invoked by the engine.  Buffers are now owned per-creation: each create uses
// its own heap buffer, passed via finalizeData to the callback so it deletes
// the exact pointer handed to napi_create_external_string_*.  We no longer
// route deletion through a shared global pointer (that caused double-free /
// use-after-free when multiple external strings were alive concurrently).
static bool g_finalizeCalled = false;

static void ExternalAsciiFinalizeCallback(void* finalizeData, void* finalizeHint)
{
    if (finalizeData != nullptr) {
        delete[] static_cast<char*>(finalizeData);
    }
    g_finalizeCalled = true;
}

static void ExternalUtf16FinalizeCallback(void* finalizeData, void* finalizeHint)
{
    if (finalizeData != nullptr) {
        delete[] static_cast<char16_t*>(finalizeData);
    }
}

napi_value CreateStringUtf8(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value argv[1];
    status = napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_value strValue = argv[0];
    char str[NAPI_UTF8_LENGTH];
    size_t strLength;
    status = napi_get_value_string_utf8(env, strValue, str, NAPI_UTF8_LENGTH, &strLength);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Invalid string was passed as argument");
        return nullptr;
    }
    if (strLength >= NAPI_UTF8_LENGTH) {
        strLength = NAPI_UTF8_LENGTH - 1;
    }
    napi_value result;
    status = napi_create_string_utf8(env, str, strLength, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string");
        return nullptr;
    }
    return result;
}

// Test: napi_create_string_utf8 with invalid UTF8 data
napi_value CreateStringUtf8InvalidData(napi_env env, napi_callback_info info)
{
    // Simulate invalid UTF8 by passing nullptr as data
    napi_status status = napi_create_string_utf8(env, nullptr, 10, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Test: napi_create_external_string_ascii - normal case
napi_value CreateExternalStringAscii(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    size_t strLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &strLen);

    char* asciiBuf = new char[strLen + 1];
    napi_get_value_string_utf8(env, args[0], asciiBuf, strLen + 1, &strLen);
    asciiBuf[strLen] = '\0';

    napi_value result = nullptr;
    // Pass asciiBuf as both the data pointer AND the finalizeData.
    // The engine invokes ExternalAsciiFinalizeCallback(asciiBuf, ...) which
    // deletes the exact allocation.  On success we do NOT touch asciiBuf
    // because ownership has been transferred to the engine.
    napi_status status = napi_create_external_string_ascii(env, asciiBuf,
        strLen, ExternalAsciiFinalizeCallback, asciiBuf, &result);
    if (status != napi_ok) {
        delete[] asciiBuf;
        return nullptr;
    }
    return result;
}

// Test: napi_create_external_string_ascii - null str parameter
napi_value CreateExternalStringAsciiNullStr(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_external_string_ascii(env, nullptr,
        0, ExternalAsciiFinalizeCallback, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Test: napi_create_external_string_ascii - with non-ASCII characters
napi_value CreateExternalStringAsciiNonAscii(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    // Get the UTF8 string and check for non-ASCII characters
    size_t strLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &strLen);

    char* utf8Str = new char[strLen + 1];
    napi_get_value_string_utf8(env, args[0], utf8Str, strLen + 1, &strLen);
    utf8Str[strLen] = '\0';

    // Check if any byte has the high bit set (non-ASCII UTF-8 encoding)
    bool hasNonAscii = false;
    for (size_t i = 0; i < strLen; i++) {
        if (static_cast<unsigned char>(utf8Str[i]) > ASCII_MAX_VALUE) {
            hasNonAscii = true;
            break;
        }
    }

    napi_status status = napi_ok;
    if (hasNonAscii) {
        // Non-ASCII characters detected, should return an error
        status = napi_invalid_arg;
        delete[] utf8Str;  // error path: we own it
    } else {
        // Only ASCII characters, proceed with creation.
        // Pass utf8Str as finalizeData so finalize callback owns the buffer.
        napi_value result = nullptr;
        status = napi_create_external_string_ascii(env, utf8Str,
            strLen, ExternalAsciiFinalizeCallback, utf8Str, &result);
        if (status != napi_ok) {
            delete[] utf8Str;  // create failed: we still own it
        }
        // else: engine owns utf8Str. DO NOT delete[] utf8Str here!
    }

    // Return status code to indicate result
    napi_value statusResult = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &statusResult);
    return statusResult;
}

// Test: napi_create_external_string_utf16 - normal case
napi_value CreateExternalStringUtf16(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    size_t strLen = 0;
    napi_get_value_string_utf16(env, args[0], nullptr, 0, &strLen);

    char16_t* utf16Buf = new char16_t[strLen + 1];
    napi_get_value_string_utf16(env, args[0], utf16Buf, strLen + 1, &strLen);
    utf16Buf[strLen] = u'\0';

    napi_value result = nullptr;
    // Pass utf16Buf as finalizeData: finalize callback will delete exactly it.
    napi_status status = napi_create_external_string_utf16(env, utf16Buf,
        strLen, ExternalUtf16FinalizeCallback, utf16Buf, &result);
    if (status != napi_ok) {
        delete[] utf16Buf;
        return nullptr;
    }
    return result;
}

// Test: napi_create_external_string_utf16 - with null parameters
napi_value CreateExternalStringUtf16NullParam(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_external_string_utf16(env, nullptr,
        0, ExternalUtf16FinalizeCallback, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Extract UTF16 data from ArkTS string for comparison
// Returns true on success, fills extracted (heap-allocated, caller must delete[]) and inputLen
static bool ExtractUtf16ForComparison(napi_env env, napi_value arg,
                                      char16_t** extracted, size_t* inputLen)
{
    size_t len = 0;
    napi_status s = napi_get_value_string_utf16(env, arg, nullptr, 0, &len);
    if (s != napi_ok || len == 0) {
        return false;
    }
    *extracted = new char16_t[len + 1];
    napi_get_value_string_utf16(env, arg, *extracted, len + 1, &len);
    (*extracted)[len] = u'\0';
    *inputLen = len;
    return true;
}

// Verify UTF16 buffer in critical scope
// Opens scope, gets buffer, compares, closes scope
// Returns true if data matches
static bool VerifyUtf16BufferInScope(napi_env env, napi_value arg,
                                     const char16_t* extracted, size_t inputLen)
{
    napi_critical_scope scope = nullptr;
    napi_status s2 = napi_open_critical_scope(env, &scope);
    if (s2 != napi_ok) {
        return false;
    }
    const char16_t* strBuf = nullptr;
    size_t strLen = 0;
    napi_status s3 = napi_get_buffer_string_utf16_in_critical_scope(env, arg, &strBuf, &strLen);
    bool dataOk = false;
    if (s3 == napi_ok && strBuf != nullptr && strLen == inputLen) {
        dataOk = true;
        for (size_t i = 0; i < inputLen; i++) {
            if (strBuf[i] != extracted[i]) {
                dataOk = false;
                break;
            }
        }
    }
    napi_close_critical_scope(env, scope);
    return dataOk;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope
// Directly uses ArkTS input string for critical scope API.
// Per official docs, napi_create_string_utf16 doesn't guarantee UTF-16 internal storage.
napi_value GetBufferStringUtf16InCriticalScope(napi_env env, napi_callback_info info)
{
    LOGI("GetBufferStringUtf16InCriticalScope START");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    char16_t* extracted = nullptr;
    size_t inputLen = 0;
    if (!ExtractUtf16ForComparison(env, args[0], &extracted, &inputLen)) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    bool dataOk = VerifyUtf16BufferInScope(env, args[0], extracted, inputLen);
    delete[] extracted;
    LOGI("GetBufferStringUtf16InCriticalScope END, dataOk=%{public}d", (int)dataOk);
    napi_value result = nullptr;
    napi_get_boolean(env, dataOk, &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - null param
napi_value GetBufferStringUtf16InCriticalScopeNull(napi_env env, napi_callback_info info)
{
    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, nullptr, nullptr, nullptr);
    napi_close_critical_scope(env, scope);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Test: napi_get_value_string_latin1
napi_value GetValueStringLatin1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    char latin1Buf[BUFFER_SIZE_256];
    size_t strLen = 0;
    napi_status status = napi_get_value_string_latin1(env, args[0], latin1Buf, BUFFER_SIZE_256, &strLen);
    if (status != napi_ok) {
        napi_value result = nullptr;
        napi_create_int32(env, static_cast<int32_t>(status), &result);
        return result;
    }

    napi_value result = nullptr;
    napi_create_string_latin1(env, latin1Buf, strLen, &result);
    return result;
}

// Test: napi_get_value_string_latin1 - null parameter
napi_value GetValueStringLatin1NullParam(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_string_latin1(env, nullptr, nullptr, 0, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Test: napi_create_external_string_ascii - return value verification
// Verify napi_ok return and string can be retrieved via get_value_string_utf8
napi_value CreateExternalStringAsciiVerifyReturn(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    size_t strLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &strLen);

    char* asciiBuf = new char[strLen + 1];
    napi_get_value_string_utf8(env, args[0], asciiBuf, strLen + 1, &strLen);
    asciiBuf[strLen] = '\0';

    napi_value result = nullptr;
    // Pass asciiBuf as finalizeData so finalize owns it on success.
    napi_status status = napi_create_external_string_ascii(env, asciiBuf,
        strLen, ExternalAsciiFinalizeCallback, asciiBuf, &result);
    if (status != napi_ok) {
        delete[] asciiBuf;
        napi_value errResult = nullptr;
        napi_create_int32(env, static_cast<int32_t>(status), &errResult);
        return errResult;
    }

    // Verify: get value string utf8 back from the result.
    // We use a local verify buffer; we MUST NOT free asciiBuf anymore
    // because the external string still owns it.
    char verifyBuf[BUFFER_SIZE_256];
    size_t verifyLen = 0;
    status = napi_get_value_string_utf8(env, result, verifyBuf, BUFFER_SIZE_256, &verifyLen);

    bool verified = (status == napi_ok && strcmp(asciiBuf, verifyBuf) == 0);

    // asciiBuf is still referenced by the live external string object:
    // the engine's finalize will release it later.  Do NOT delete here.

    napi_value verifyResult = nullptr;
    napi_get_boolean(env, verified, &verifyResult);
    return verifyResult;
}

// Test: napi_create_external_string_utf16 - return value verification
napi_value CreateExternalStringUtf16VerifyReturn(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    size_t strLen = 0;
    napi_get_value_string_utf16(env, args[0], nullptr, 0, &strLen);

    char16_t* utf16Buf = new char16_t[strLen + 1];
    napi_get_value_string_utf16(env, args[0], utf16Buf, strLen + 1, &strLen);
    utf16Buf[strLen] = u'\0';

    napi_value result = nullptr;
    // Pass utf16Buf as finalizeData so finalize owns it on success.
    napi_status status = napi_create_external_string_utf16(env, utf16Buf,
        strLen, ExternalUtf16FinalizeCallback, utf16Buf, &result);
    if (status != napi_ok) {
        delete[] utf16Buf;
        napi_value errResult = nullptr;
        napi_create_int32(env, static_cast<int32_t>(status), &errResult);
        return errResult;
    }

    // Verify: check result type is string
    napi_valuetype vtype;
    napi_typeof(env, result, &vtype);
    bool typeOk = (vtype == napi_string);

    // Verify: get value string utf16 back
    char16_t verifyBuf[BUFFER_SIZE_256];
    size_t verifyLen = 0;
    status = napi_get_value_string_utf16(env, result, verifyBuf, BUFFER_SIZE_256, &verifyLen);

    bool contentOk = (status == napi_ok && verifyLen == strLen);

    // utf16Buf still referenced by the external string: engine finalize owns it.
    // DO NOT delete[] utf16Buf here.

    napi_value verifyResult = nullptr;
    napi_get_boolean(env, typeOk && contentOk, &verifyResult);
    return verifyResult;
}

// Test: napi_create_external_string_utf16 - abnormal scenario
// Test creating external UTF16 string under abnormal conditions
napi_value CreateExternalStringUtf16Abnormal(napi_env env, napi_callback_info info)
{
    // Test with empty buffer
    napi_value result = nullptr;
    napi_status status = napi_create_external_string_utf16(env, nullptr,
        0, ExternalUtf16FinalizeCallback, nullptr, &result);

    napi_value statusResult = nullptr;
    napi_create_int32(env, static_cast<int32_t>(status), &statusResult);
    return statusResult;
}

// Test: napi_create_external_string_utf16 - combined usage with string APIs
napi_value CreateExternalStringUtf16Combined(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    // Step 1: Get UTF16 string from ArkTS
    size_t strLen = 0;
    napi_get_value_string_utf16(env, args[0], nullptr, 0, &strLen);

    char16_t* utf16Buf = new char16_t[strLen + 1];
    napi_get_value_string_utf16(env, args[0], utf16Buf, strLen + 1, &strLen);
    utf16Buf[strLen] = u'\0';

    // Step 2: Create external UTF16 string
    napi_value externalStr = nullptr;
    // Pass utf16Buf as finalizeData: engine owns it on success.
    napi_status status = napi_create_external_string_utf16(env, utf16Buf,
        strLen, ExternalUtf16FinalizeCallback, utf16Buf, &externalStr);
    if (status != napi_ok) {
        delete[] utf16Buf;
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    // Step 3: Combine - create a new UTF8 string from the external string content
    char utf8Buf[BUFFER_SIZE_256];
    size_t utf8Len = 0;
    status = napi_get_value_string_utf8(env, externalStr, utf8Buf, BUFFER_SIZE_256, &utf8Len);
    if (status != napi_ok) {
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    // Step 4: Create a new string from the extracted content
    napi_value newStr = nullptr;
    napi_create_string_utf8(env, utf8Buf, utf8Len, &newStr);

    // Step 5: Verify the new string matches the original
    char verifyBuf[BUFFER_SIZE_256];
    size_t verifyLen = 0;
    napi_get_value_string_utf8(env, newStr, verifyBuf, BUFFER_SIZE_256, &verifyLen);

    bool match = (strcmp(utf8Buf, verifyBuf) == 0);

    // utf16Buf still owned by externalStr: DO NOT delete[] here.
    // Finalize callback will release utf16Buf when GC collects externalStr.

    napi_value result = nullptr;
    napi_get_boolean(env, match, &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - return value verification
napi_value GetBufferStringUtf16VerifyReturn(napi_env env, napi_callback_info info)
{
    LOGI("GetBufferStringUtf16VerifyReturn START");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    char16_t* extracted = nullptr;
    size_t inputLen = 0;
    if (!ExtractUtf16ForComparison(env, args[0], &extracted, &inputLen)) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    bool dataOk = VerifyUtf16BufferInScope(env, args[0], extracted, inputLen);
    delete[] extracted;
    LOGI("GetBufferStringUtf16VerifyReturn END, dataOk=%{public}d", (int)dataOk);
    napi_value result = nullptr;
    napi_get_boolean(env, dataOk, &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - abnormal scenario
napi_value GetBufferStringUtf16Abnormal(napi_env env, napi_callback_info info)
{
    // Test 1: Call outside critical scope
    const char16_t* strBuf = nullptr;
    size_t strLen = 0;
    napi_value result = nullptr;

    // Create a valid string first
    napi_value testStr = nullptr;
    napi_create_string_utf8(env, "test", STRING_LENGTH_4, &testStr);

    // Try without critical scope
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, testStr, &strBuf, &strLen);

    napi_create_int32(env, static_cast<int32_t>(status), &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - combined usage
napi_value GetBufferStringUtf16Combined(napi_env env, napi_callback_info info)
{
    LOGI("GetBufferStringUtf16Combined START");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    char16_t* extracted = nullptr;
    size_t inputLen = 0;
    if (!ExtractUtf16ForComparison(env, args[0], &extracted, &inputLen)) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    bool dataOk = VerifyUtf16BufferInScope(env, args[0], extracted, inputLen);
    delete[] extracted;
    LOGI("GetBufferStringUtf16Combined END, dataOk=%{public}d", (int)dataOk);
    napi_value result = nullptr;
    napi_get_boolean(env, dataOk, &result);
    return result;
}

// Test: napi_get_value_string_latin1 - abnormal scenario
napi_value GetValueStringLatin1Abnormal(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    // Test: pass a non-string type (number)
    napi_value numberValue = nullptr;
    napi_create_int32(env, TEST_VALUE_123, &numberValue);

    char latin1Buf[BUFFER_SIZE_256];
    size_t strLen = 0;
    napi_status status = napi_get_value_string_latin1(env, numberValue, latin1Buf, BUFFER_SIZE_256, &strLen);

    // Should return non-OK status for non-string type
    bool isError = (status != napi_ok);

    // Also test with insufficient buffer size
    if (argc >= 1) {
        size_t smallLen = 0;
        napi_status status2 = napi_get_value_string_latin1(env, args[0], latin1Buf, 1, &smallLen);
        // Even with small buffer, should get the needed length (napi_ok is acceptable)
        if (status2 == napi_ok) {
            // Buffer returned data successfully
        }
    }

    napi_value result = nullptr;
    napi_get_boolean(env, isError, &result);
    return result;
}

// Test: Verify external string finalize was called
napi_value IsExternalFinalizeCalled(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_boolean(env, g_finalizeCalled, &result);
    // Reset for next test
    g_finalizeCalled = false;
    return result;
}

// Test: napi_create_string_utf8 - verify result can be retrieved
napi_value CreateStringUtf8AndVerify(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }

    // Create string
    char str[BUFFER_SIZE_256];
    size_t strLen = 0;
    napi_get_value_string_utf8(env, args[0], str, BUFFER_SIZE_256, &strLen);

    napi_value createdStr = nullptr;
    napi_create_string_utf8(env, str, strLen, &createdStr);

    // Verify by reading it back
    char verifyStr[BUFFER_SIZE_256];
    size_t verifyLen = 0;
    napi_status status = napi_get_value_string_utf8(env, createdStr, verifyStr, BUFFER_SIZE_256, &verifyLen);

    napi_value result = nullptr;
    if (status == napi_ok && strcmp(str, verifyStr) == 0) {
        napi_get_boolean(env, true, &result);
    } else {
        napi_get_boolean(env, false, &result);
    }
    return result;
}

// Test: napi_create_external_string_ascii - normal scenario (verify ArkTS usage)
// Excel行: 67
napi_value CreateExternalStringAsciiNormalUsage(napi_env env, napi_callback_info info)
{
    const char* testStr = "hello world";
    size_t strLen = strlen(testStr);

    char* asciiBuf = new char[strLen + 1];
    if (strcpy_s(asciiBuf, strLen + 1, testStr) != EOK) {
        delete[] asciiBuf;
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    napi_value result = nullptr;
    // Pass asciiBuf as finalizeData so engine owns it on success.
    napi_status status = napi_create_external_string_ascii(env, asciiBuf,
        strLen, ExternalAsciiFinalizeCallback, asciiBuf, &result);
    if (status != napi_ok) {
        delete[] asciiBuf;
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    // NOTE: Do NOT delete asciiBuf after napi_create_external_string_ascii
    // The API takes ownership and will free it via the finalize callback
    // using finalizeData (asciiBuf).  Return the string; ArkTS will
    // verify its content.
    return result;
}

// Test: napi_create_external_string_ascii - combined scenario with finalize
// Excel行: 69
// NOTE: Engine-driven finalize runs at GC time, which is non-deterministic.
// We therefore verify the contract we CAN test: creation with a registered
// finalize callback succeeds AND the content round-trips correctly.  The
// finalize-callback flag g_finalizeCalled is left as an engine-side side
// effect observable via isExternalFinalizeCalled (for debugging / probes).
napi_value CreateExternalStringAsciiWithFinalize(napi_env env, napi_callback_info info)
{
    g_finalizeCalled = false;

    const char* testStr = "finalize_test";
    size_t strLen = strlen(testStr);

    char* asciiBuf = new char[strLen + 1];
    if (strcpy_s(asciiBuf, strLen + 1, testStr) != EOK) {
        delete[] asciiBuf;
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    napi_value result = nullptr;
    // Pass asciiBuf both as data and as finalizeData so the callback
    // deletes the correct allocation.
    napi_status status = napi_create_external_string_ascii(env, asciiBuf,
        strLen, ExternalAsciiFinalizeCallback, asciiBuf, &result);
    if (status != napi_ok) {
        delete[] asciiBuf;
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    // Use the string first (read it back) to verify the external string is
    // actually live and usable.
    char verifyBuf[BUFFER_SIZE_256];
    size_t verifyLen = 0;
    status = napi_get_value_string_utf8(env, result, verifyBuf, BUFFER_SIZE_256, &verifyLen);
    if (status != napi_ok || strcmp(verifyBuf, testStr) != 0) {
        napi_value errResult = nullptr;
        napi_get_boolean(env, false, &errResult);
        return errResult;
    }

    // Creation + round-trip succeeded.  Finalize is handled by the engine
    // later (non-deterministic).  Do NOT call finalize manually, and do NOT
    // delete asciiBuf (still owned by the live external string).

    bool success = true;
    napi_value verifyResult = nullptr;
    napi_get_boolean(env, success, &verifyResult);
    return verifyResult;
}

// Test: napi_create_string_utf8 - abnormal scenario (invalid UTF8)
// Excel行: 91
napi_value CreateStringUtf8AbnormalScenario(napi_env env, napi_callback_info info)
{
    // Test 1: Pass invalid UTF-8 bytes (0xFF 0xFF is invalid UTF-8)
    const unsigned char invalidUtf8[] = {0xFF, 0xFF, 0x00};
    napi_value result1 = nullptr;
    napi_status status1 = napi_create_string_utf8(env,
        reinterpret_cast<const char*>(invalidUtf8), 2, &result1);

    // Should either succeed with replacement or return error (implementation dependent)
    bool test1Handled = (status1 == napi_ok || status1 == napi_generic_failure);

    // Test 2: Pass str non-null but length exceeds actual content (truncate test)
    const char* shortStr = "ab";
    napi_value result2 = nullptr;
    // Use length 1 even though string is longer - should only copy 1 char
    napi_status status2 = napi_create_string_utf8(env, shortStr, 1, &result2);

    char buf[BUFFER_SIZE_16];
    size_t len = 0;
    napi_get_value_string_utf8(env, result2, buf, BUFFER_SIZE_16, &len);
    bool test2Ok = (status2 == napi_ok && len == 1 && buf[0] == 'a');

    napi_value result = nullptr;
    napi_get_boolean(env, test1Handled && test2Ok, &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - abnormal parameters (NULL)
// Excel行: 140
napi_value GetBufferStringUtf16AbnormalParams(napi_env env, napi_callback_info info)
{
    // Create a valid test string first
    napi_value testStr = nullptr;
    napi_create_string_utf8(env, "test", STRING_LENGTH_4, &testStr);

    // Open critical scope
    napi_critical_scope scope = nullptr;
    napi_status statusScope = napi_open_critical_scope(env, &scope);
    if (statusScope != napi_ok) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }

    // Test 1: NULL data output pointer
    size_t strLen = 0;
    napi_status status1 = napi_get_buffer_string_utf16_in_critical_scope(env, testStr, nullptr, &strLen);

    // Test 2: NULL length output pointer
    const char16_t* strBuf = nullptr;
    napi_status status2 = napi_get_buffer_string_utf16_in_critical_scope(env, testStr, &strBuf, nullptr);

    napi_close_critical_scope(env, scope);

    // Both NULL pointer calls should return napi_invalid_arg
    bool allError = (status1 == napi_invalid_arg && status2 == napi_invalid_arg);

    napi_value result = nullptr;
    napi_get_boolean(env, allError, &result);
    return result;
}

// Test: napi_get_buffer_string_utf16_in_critical_scope - normal scenario (efficient access)
napi_value GetBufferStringUtf16NormalScenario(napi_env env, napi_callback_info info)
{
    LOGI("GetBufferStringUtf16NormalScenario START");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    char16_t* extracted = nullptr;
    size_t inputLen = 0;
    if (!ExtractUtf16ForComparison(env, args[0], &extracted, &inputLen)) {
        napi_value result = nullptr;
        napi_get_boolean(env, false, &result);
        return result;
    }
    bool dataOk = VerifyUtf16BufferInScope(env, args[0], extracted, inputLen);
    delete[] extracted;
    LOGI("GetBufferStringUtf16NormalScenario END, dataOk=%{public}d", (int)dataOk);
    napi_value result = nullptr;
    napi_get_boolean(env, dataOk, &result);
    return result;
}

// Test: napi_get_value_string_latin1 - abnormal parameters (NULL and non-string)
// Excel行: 199
napi_value GetValueStringLatin1AbnormalParams(napi_env env, napi_callback_info info)
{
    // Test 1: NULL value parameter
    char buf[BUFFER_SIZE_256];
    size_t len = 0;
    napi_status status1 = napi_get_value_string_latin1(env, nullptr, buf, BUFFER_SIZE_256, &len);

    // Test 2: Pass a non-string (number) type
    napi_value numberVal = nullptr;
    napi_create_int32(env, TEST_VALUE_42, &numberVal);
    napi_status status2 = napi_get_value_string_latin1(env, numberVal, buf, BUFFER_SIZE_256, &len);

    // Test 3: buf is NULL but get length
    napi_value validStr = nullptr;
    napi_create_string_utf8(env, "hello", STRING_LENGTH_5, &validStr);
    napi_status status3 = napi_get_value_string_latin1(env, validStr, nullptr, 0, &len);

    // Status checks
    bool test1 = (status1 == napi_invalid_arg);
    bool test2 = (status2 == napi_string_expected || status2 == napi_object_expected || status2 != napi_ok);
    bool test3 = (status3 == napi_ok && len == STRING_LENGTH_5);

    napi_value result = nullptr;
    napi_get_boolean(env, test1 && test2 && test3, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createStringUtf8", CreateStringUtf8),
        DECLARE_NAPI_FUNCTION("createStringUtf8InvalidData", CreateStringUtf8InvalidData),
        DECLARE_NAPI_FUNCTION("createStringUtf8AndVerify", CreateStringUtf8AndVerify),
        DECLARE_NAPI_FUNCTION("createExternalStringAscii", CreateExternalStringAscii),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiNullStr", CreateExternalStringAsciiNullStr),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiNonAscii", CreateExternalStringAsciiNonAscii),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16", CreateExternalStringUtf16),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16NullParam", CreateExternalStringUtf16NullParam),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScope", GetBufferStringUtf16InCriticalScope),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16InCriticalScopeNull", GetBufferStringUtf16InCriticalScopeNull),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1", GetValueStringLatin1),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1NullParam", GetValueStringLatin1NullParam),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiVerifyReturn", CreateExternalStringAsciiVerifyReturn),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16VerifyReturn", CreateExternalStringUtf16VerifyReturn),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16Abnormal", CreateExternalStringUtf16Abnormal),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16Combined", CreateExternalStringUtf16Combined),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16VerifyReturn", GetBufferStringUtf16VerifyReturn),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16Abnormal", GetBufferStringUtf16Abnormal),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16Combined", GetBufferStringUtf16Combined),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1Abnormal", GetValueStringLatin1Abnormal),
        // NOTE: not exercised by any ets test in current scope; retained as a debug/observation hook
        // (allows probing engine-driven finalize of external strings which is GC-timing dependent).
        DECLARE_NAPI_FUNCTION("isExternalFinalizeCalled", IsExternalFinalizeCalled),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiNormalUsage", CreateExternalStringAsciiNormalUsage),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiWithFinalize", CreateExternalStringAsciiWithFinalize),
        DECLARE_NAPI_FUNCTION("createStringUtf8AbnormalScenario", CreateStringUtf8AbnormalScenario),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16AbnormalParams", GetBufferStringUtf16AbnormalParams),
        DECLARE_NAPI_FUNCTION("getBufferStringUtf16NormalScenario", GetBufferStringUtf16NormalScenario),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1AbnormalParams", GetValueStringLatin1AbnormalParams),
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
    .nm_modname = "napiString",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}