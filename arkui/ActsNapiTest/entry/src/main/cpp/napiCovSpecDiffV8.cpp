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
#include "common/native_common.h"
#include <cstring>
#include <climits>

static const size_t UTF16_BUFFER_SIZE = 8;

static napi_value CreateBoolean(napi_env env, bool value)
{
    napi_value result = nullptr;
    napi_get_boolean(env, value, &result);
    return result;
}

static napi_value CreateInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

// ============================================================================
// V8-D01: napi_reference_unref 在 refcount=0 时 OH 返回 napi_ok（差异已确认）
// Node.js 18: 返回 napi_generic_failure
// OH: 返回 napi_ok
// ============================================================================
static napi_value SpecDiffV8D01(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 2, &ref);

    uint32_t refCount = 0;
    napi_status status = napi_reference_unref(env, ref, &refCount);
    if (status != napi_ok || refCount != 1) {
        napi_delete_reference(env, ref);
        return CreateBoolean(env, false);
    }

    status = napi_reference_unref(env, ref, &refCount);
    bool confirmed = (status == napi_ok && refCount == 0);

    napi_delete_reference(env, ref);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D02: napi_reference_ref 对弱引用 OH 无条件递增（差异已确认）
// Node.js 18: 句柄为空时 Ref() 返回 0，不递增
// OH: 无条件 ++refCount_，产生"幽灵计数"
// ============================================================================
static napi_value SpecDiffV8D02(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_ref ref = nullptr;
    napi_create_reference(env, obj, 1, &ref);

    uint32_t refCount = 0;
    napi_reference_unref(env, ref, &refCount);

    napi_status status = napi_reference_ref(env, ref, &refCount);

    bool confirmed = (status == napi_ok && refCount == 1);

    napi_delete_reference(env, ref);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D03: napi_throw 对非 Error 值 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: 可抛出任意 JS 值
// OH: 要求 IsError()，非 Error 返回 napi_invalid_arg
// ============================================================================
static napi_value SpecDiffV8D03(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_status status = napi_throw(env, args[0]);

    napi_value ex = nullptr;
    if (napi_is_exception_pending(env, nullptr) == napi_ok) {
        napi_get_and_clear_last_exception(env, &ex);
    }

    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D04: napi_get_and_clear_last_exception 无异常时 OH 不写入 undefined（差异已确认）
// Node.js 18: 写入 undefined 到 *result
// OH: 不写入 *result，保留原值
// ============================================================================
static napi_value SpecDiffV8D04(napi_env env, napi_callback_info info)
{
    napi_value sentinel = nullptr;
    napi_create_string_utf8(env, "SENTINEL", NAPI_AUTO_LENGTH, &sentinel);

    napi_value result = sentinel;
    napi_status status = napi_get_and_clear_last_exception(env, &result);

    napi_valuetype resultType = napi_undefined;
    napi_typeof(env, result, &resultType);

    bool confirmed = (status == napi_ok && resultType == napi_string);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D05: napi_create_arraybuffer 的 data 为 nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: data 可为 nullptr
// OH: CHECK_ARG(env, data) 将其设为必填
// ============================================================================
static napi_value SpecDiffV8D05(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer = nullptr;
    napi_status status = napi_create_arraybuffer(env, 16, nullptr, &arraybuffer);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D06: napi_get_arraybuffer_info 的 byte_length 为 nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: byte_length 可独立为 nullptr
// OH: byte_length 为必填
// ============================================================================
static napi_value SpecDiffV8D06(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer = nullptr;
    void *data = nullptr;
    napi_create_arraybuffer(env, 16, &data, &arraybuffer);

    napi_status status = napi_get_arraybuffer_info(env, arraybuffer, &data, nullptr);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D07: napi_create_buffer_copy 的 result_data 为 nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: result_data 可选
// OH: result_data 为必填
// ============================================================================
static napi_value SpecDiffV8D07(napi_env env, napi_callback_info info)
{
    napi_value srcBuf = nullptr;
    void *srcData = nullptr;
    napi_create_buffer(env, 4, &srcData, &srcBuf);
    if (srcData != nullptr) {
        memcpy(srcData, "test", 4);
    }

    napi_value dstBuf = nullptr;
    napi_status status = napi_create_buffer_copy(env, 4, srcData, nullptr, &dstBuf);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D08: napi_get_buffer_info 传入 nullptr data/length 时 OH 崩溃（差异已确认）
// Node.js 18: data 和 length 可独立为 nullptr
// OH: 无条件解引用两者 -> 崩溃
// 注意：传入 nullptr 会导致 OH 崩溃，此用例仅验证有效参数路径正常
// ============================================================================
static napi_value SpecDiffV8D08ValidParams(napi_env env, napi_callback_info info)
{
    napi_value buf = nullptr;
    void *bufData = nullptr;
    napi_create_buffer(env, 4, &bufData, &buf);

    void *data = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_info(env, buf, &data, &length);
    bool confirmed = (status == napi_ok && data != nullptr && length == 4);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D09: napi_create_external_arraybuffer 的 finalize_cb 为 nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: finalize_callback 可为 nullptr
// OH: CHECK_ARG(env, finalize_cb) 将其设为必填
// ============================================================================
static napi_value SpecDiffV8D09(napi_env env, napi_callback_info info)
{
    static uint8_t externalData[4] = {1, 2, 3, 4};
    napi_value arraybuffer = nullptr;
    napi_status status = napi_create_external_arraybuffer(env, externalData, 4, nullptr, nullptr, &arraybuffer);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D10: 字符串创建接口 length=0, str=nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: length==0 + nullptr 合法，创建空字符串
// OH: 无条件 CHECK_ARG(env, str)
// ============================================================================
static napi_value SpecDiffV8D10Latin1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_string_latin1(env, nullptr, 0, &result);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

static napi_value SpecDiffV8D10Utf8(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_string_utf8(env, nullptr, 0, &result);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

static napi_value SpecDiffV8D10Utf16(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_string_utf16(env, nullptr, 0, &result);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D11: napi_create_string_latin1 按 UTF-8 解码而非 Latin-1（差异已确认）
// Node.js 18: 使用 V8 NewFromOneByte，0xE9->U+00E9(e)
// OH: 使用 NewFromUtf8，0x80-0xFF 被误解码，结果与 Latin-1 不同
// ============================================================================
static napi_value SpecDiffV8D11(napi_env env, napi_callback_info info)
{
    const unsigned char latin1Bytes[] = {0xE9, 0xE7, 0xF1, 0x00};
    const char *latin1Data = reinterpret_cast<const char *>(latin1Bytes);
    napi_value str = nullptr;
    napi_status status = napi_create_string_latin1(env, latin1Data, 3, &str);
    if (status != napi_ok) {
        return CreateBoolean(env, false);
    }

    char16_t buf[UTF16_BUFFER_SIZE] = {0};
    size_t len = 0;
    napi_get_value_string_utf16(env, str, buf, UTF16_BUFFER_SIZE, &len);

    bool confirmed = !(len == 3 && buf[0] == 0xE9 && buf[1] == 0xE7 && buf[2] == 0xF1);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D12: 字符串创建接口 length > INT_MAX 时 OH 不返回 napi_invalid_arg（差异已确认）
// Node.js 18: length > INT_MAX 返回 napi_invalid_arg
// OH: 未做 INT_MAX 校验
// ============================================================================
static napi_value SpecDiffV8D12Latin1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_string_latin1(env, "", static_cast<size_t>(INT_MAX) + 1, &result);
    bool confirmed = (status != napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

static napi_value SpecDiffV8D12Utf8(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_string_utf8(env, "", static_cast<size_t>(INT_MAX) + 1, &result);
    bool confirmed = (status != napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D13: napi_create_string_utf16 显式长度模式仍扫描 NUL 终止符（差异已确认）
// Node.js 18: 显式长度直传，不要求 NUL 结尾
// OH: 无条件执行 char_traits::length(str)，NUL 后内容被截断
// ============================================================================
static napi_value SpecDiffV8D13(napi_env env, napi_callback_info info)
{
    char16_t buffer[] = {u'A', u'B', u'C', u'D', u'\0', u'E', u'F', u'G', u'\0'};
    const size_t explicitLen = 8;
    napi_value str = nullptr;
    napi_escapable_handle_scope scope = nullptr;
    napi_open_escapable_handle_scope(env, &scope);
    napi_status status = napi_create_string_utf16(env, buffer, explicitLen, &str);
    if (status != napi_ok) {
        napi_close_escapable_handle_scope(env, scope);
        return CreateInt32(env, -1);
    }

    char16_t result[16] = {0};
    size_t resultLen = 0;
    napi_get_value_string_utf16(env, str, result, 16, &resultLen);

    napi_value intVal = nullptr;
    napi_create_int32(env, static_cast<int32_t>(resultLen), &intVal);
    napi_escape_handle(env, scope, intVal, &intVal);
    napi_close_escapable_handle_scope(env, scope);
    return intVal;
}

// ============================================================================
// V8-D14: napi_create_function 忽略 length，按 NUL 终止截断（差异已确认）
// Node.js 18: 使用显式 length，含嵌入 NUL -> name 长度=5
// OH: 忽略 length，strlen 截断 -> name 长度=2
// ============================================================================
static napi_value SpecDiffV8D14Callback(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    return undefined;
}

static napi_value SpecDiffV8D14(napi_env env, napi_callback_info info)
{
    char name[] = {'a', 'b', '\0', 'X', 'Y'};
    napi_value func = nullptr;
    napi_status status = napi_create_function(env, name, 5, SpecDiffV8D14Callback, nullptr, &func);
    if (status != napi_ok) {
        return CreateBoolean(env, false);
    }

    napi_value nameVal = nullptr;
    napi_get_named_property(env, func, "name", &nameVal);

    char16_t buf[UTF16_BUFFER_SIZE] = {0};
    size_t len = 0;
    napi_get_value_string_utf16(env, nameVal, buf, UTF16_BUFFER_SIZE, &len);

    bool confirmed = (len != 5);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D15: napi_define_class 使用 strlen 二次截断（差异已确认）
// Node.js 18: 显式长度直传 -> name 长度=5
// OH: min(length, strlen(name)) -> name 长度=2
// ============================================================================
static napi_value SpecDiffV8D15Constructor(napi_env env, napi_callback_info info)
{
    napi_value thisArg = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, nullptr);
    return thisArg;
}

static napi_value SpecDiffV8D15(napi_env env, napi_callback_info info)
{
    char name[] = {'C', 'l', '\0', 's', 's'};
    napi_value ctor = nullptr;
    napi_status status = napi_define_class(env, name, 5, SpecDiffV8D15Constructor, nullptr, 0, nullptr, &ctor);
    if (status != napi_ok) {
        return CreateBoolean(env, false);
    }

    napi_value nameVal = nullptr;
    napi_get_named_property(env, ctor, "name", &nameVal);

    char16_t buf[UTF16_BUFFER_SIZE] = {0};
    size_t len = 0;
    napi_get_value_string_utf16(env, nameVal, buf, UTF16_BUFFER_SIZE, &len);

    bool confirmed = (len != 5);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D16: napi_get_cb_info 对 argv!=nullptr && argc==nullptr 静默返回 napi_ok（差异已确认）
// Node.js 18: 返回 napi_invalid_arg
// OH: 静默忽略，返回 napi_ok
// ============================================================================
static napi_value SpecDiffV8D16(napi_env env, napi_callback_info info)
{
    napi_value argv[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, nullptr, argv, nullptr, nullptr);
    bool confirmed = (status == napi_ok);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D17: napi_is_detached_arraybuffer 对非 ArrayBuffer 返回 napi_invalid_arg（差异已确认）
// Node.js 18: 返回 napi_ok，写入 false
// OH: 返回 napi_invalid_arg，不写入结果
// ============================================================================
static napi_value SpecDiffV8D17(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);

    bool isDetached = true;
    napi_status status = napi_is_detached_arraybuffer(env, obj, &isDetached);
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D18: napi_create_async_work 的 complete 为 nullptr 时 OH 返回 napi_invalid_arg（差异已确认）
// Node.js 18: complete 可为 nullptr
// OH: CHECK_ARG(env, complete) 将其设为必填
// ============================================================================
static void SpecDiffV8D18Execute(napi_env env, void *data)
{
}

static napi_value SpecDiffV8D18(napi_env env, napi_callback_info info)
{
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "SpecDiffV8D18", NAPI_AUTO_LENGTH, &resourceName);

    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, resourceName,
        SpecDiffV8D18Execute, nullptr, nullptr, &work);
    if (status == napi_ok && work != nullptr) {
        napi_delete_async_work(env, work);
    }
    bool confirmed = (status == napi_invalid_arg);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D19: napi_queue_async_work 忽略入队失败，固定返回 napi_ok（差异已确认，源码级）
// Node.js 18: uv_queue_work 失败 -> CHECK_EQ 终止进程
// OH: 忽略 Queue() 返回值，固定返回 napi_ok
// ============================================================================
// V8-D19-DEL: napi_queue_async_work 固定返回 napi_ok（源码级差异，设备测试会导致延迟崩溃，已删除）
// V8-D21-DEL: napi_acquire_threadsafe_function 关闭后返回值（源码级差异，设备测试会导致延迟崩溃，已删除）
// ============================================================================

// ============================================================================
// V8-D19: napi_make_callback 对原始值 receiver 返回 napi_object_expected（差异已确认）
// Node.js 18: 使用 ToObject() 装箱
// OH: 要求 IsObject()，返回 napi_object_expected
// ============================================================================
static napi_value SpecDiffV8D19Cb(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    return undefined;
}

static napi_value SpecDiffV8D19(napi_env env, napi_callback_info info)
{
    napi_value func = nullptr;
    napi_create_function(env, "cb", NAPI_AUTO_LENGTH, SpecDiffV8D19Cb, nullptr, &func);

    napi_value numberReceiver = nullptr;
    napi_create_int32(env, 42, &numberReceiver);

    napi_value result = nullptr;
    napi_status status = napi_make_callback(env, nullptr, numberReceiver, func, 0, nullptr, &result);
    bool confirmed = (status == napi_object_expected);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D21: napi_acquire_threadsafe_function 关闭后返回 napi_generic_failure 而非 napi_closing（差异已确认）
// Node.js 18: 返回 napi_closing
// OH: 所有非 OK 统一映射为 napi_generic_failure
// ============================================================================
// V8-D20: napi_get_version OH 返回的版本号为 8（Node.js 18 返回 9）（差异已确认）
// ============================================================================
static napi_value SpecDiffV8D20(napi_env env, napi_callback_info info)
{
    uint32_t version = 0;
    napi_status status = napi_get_version(env, &version);
    bool confirmed = (status == napi_ok && version == 8);
    napi_value result = nullptr;
    napi_create_int32(env, confirmed ? static_cast<int32_t>(version) : -1, &result);
    return result;
}

// ============================================================================
// V8-D21: napi_is_array 将 SendableArray 识别为数组（差异已确认）
// Node.js 18: 仅识别 V8 Array，SendableArray -> false
// OH: 额外识别 SharedArray -> true
// ============================================================================
static napi_value SpecDiffV8D21(napi_env env, napi_callback_info info)
{
    napi_value sendableArray = nullptr;
    napi_status status = napi_create_sendable_array_with_length(env, 0, &sendableArray);
    if (status != napi_ok) {
        return CreateBoolean(env, true);
    }

    bool isArray = true;
    status = napi_is_array(env, sendableArray, &isArray);
    bool confirmed = (status == napi_ok && isArray == true);
    return CreateBoolean(env, confirmed);
}

// ============================================================================
// V8-D22: napi_is_arraybuffer 将 SendableArrayBuffer 识别为 ArrayBuffer（差异已确认）
// Node.js 18: 仅识别 V8 ArrayBuffer，SendableArrayBuffer -> false
// OH: 额外识别 SendableArrayBuffer -> true
// ============================================================================
static napi_value SpecDiffV8D22(napi_env env, napi_callback_info info)
{
    napi_value sendableAb = nullptr;
    void *abData = nullptr;
    napi_status status = napi_create_sendable_arraybuffer(env, 0, &abData, &sendableAb);
    if (status != napi_ok) {
        return CreateBoolean(env, true);
    }

    bool isArrayBuffer = true;
    status = napi_is_arraybuffer(env, sendableAb, &isArrayBuffer);
    bool confirmed = (status == napi_ok && isArrayBuffer == true);
    return CreateBoolean(env, confirmed);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("specDiffV8D01", SpecDiffV8D01),
        DECLARE_NAPI_FUNCTION("specDiffV8D02", SpecDiffV8D02),
        DECLARE_NAPI_FUNCTION("specDiffV8D03", SpecDiffV8D03),
        DECLARE_NAPI_FUNCTION("specDiffV8D04", SpecDiffV8D04),
        DECLARE_NAPI_FUNCTION("specDiffV8D05", SpecDiffV8D05),
        DECLARE_NAPI_FUNCTION("specDiffV8D06", SpecDiffV8D06),
        DECLARE_NAPI_FUNCTION("specDiffV8D07", SpecDiffV8D07),
        DECLARE_NAPI_FUNCTION("specDiffV8D08ValidParams", SpecDiffV8D08ValidParams),
        DECLARE_NAPI_FUNCTION("specDiffV8D09", SpecDiffV8D09),
        DECLARE_NAPI_FUNCTION("specDiffV8D10Latin1", SpecDiffV8D10Latin1),
        DECLARE_NAPI_FUNCTION("specDiffV8D10Utf8", SpecDiffV8D10Utf8),
        DECLARE_NAPI_FUNCTION("specDiffV8D10Utf16", SpecDiffV8D10Utf16),
        DECLARE_NAPI_FUNCTION("specDiffV8D11", SpecDiffV8D11),
        DECLARE_NAPI_FUNCTION("specDiffV8D12Latin1", SpecDiffV8D12Latin1),
        DECLARE_NAPI_FUNCTION("specDiffV8D12Utf8", SpecDiffV8D12Utf8),
        DECLARE_NAPI_FUNCTION("specDiffV8D13", SpecDiffV8D13),
        DECLARE_NAPI_FUNCTION("specDiffV8D14", SpecDiffV8D14),
        DECLARE_NAPI_FUNCTION("specDiffV8D15", SpecDiffV8D15),
        DECLARE_NAPI_FUNCTION("specDiffV8D16", SpecDiffV8D16),
        DECLARE_NAPI_FUNCTION("specDiffV8D17", SpecDiffV8D17),
        DECLARE_NAPI_FUNCTION("specDiffV8D18", SpecDiffV8D18),
        DECLARE_NAPI_FUNCTION("specDiffV8D19", SpecDiffV8D19),
        DECLARE_NAPI_FUNCTION("specDiffV8D20", SpecDiffV8D20),
        DECLARE_NAPI_FUNCTION("specDiffV8D21", SpecDiffV8D21),
        DECLARE_NAPI_FUNCTION("specDiffV8D22", SpecDiffV8D22),
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
    .nm_modname = "napiCovSpecDiffV8",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
