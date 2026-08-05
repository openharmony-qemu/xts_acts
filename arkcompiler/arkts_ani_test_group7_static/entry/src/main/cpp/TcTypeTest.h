/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef TC_TYPE_TEST_H
#define TC_TYPE_TEST_H
#include "Common.h"
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_type {
constexpr const char *TYPE_FOO_CLASS_NAME = "entry.src.main.src.ets.Index.Foo";
constexpr const char *TYPE_STRING_CLASS = "std.core.String";
constexpr const char *TYPE_ARRAYBUFFER_CLASS = "std.core.ArrayBuffer";
constexpr const char *TYPE_FIXEDARRAY_INT_CLASS = "A{i}";
constexpr const char *TYPE_FIXEDARRAY_STRING_CLASS = "A{C{std.core.String}}";
constexpr const char *TYPE_ERROR_CLASS = "escompat.Error";
constexpr const char *TYPE_MISSING_CLEAR_CLASS = "non.existent.ClassForClear";
constexpr const char *TYPE_OBJECT_CLASS = "std.core.Object";
constexpr ani_int TYPE_ERROR_INT_RETURN = -1;
constexpr ani_int TYPE_ZERO_INT = 0;
inline bool g_typeProcessUnionBatchOk = false;
std::string TypeAniStringToStdString(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, 0);
    ani_size writtenSize = 0;
    status = env->String_GetUTF8(str, buffer.data(), buffer.size(), &writtenSize);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return "";
    }
    return std::string(buffer.data(), writtenSize);
}
inline ani_string TypeStdStringToAniString(ani_env *env, const std::string &value)
{
    if (env == nullptr) {
        return nullptr;
    }
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
inline void TypeClearPendingError(ani_env *env)
{
    if (env == nullptr) {
        return;
    }
    ani_boolean hasError = ANI_FALSE;
    ani_status status = env->ExistUnhandledError(&hasError);
    if (status == ANI_OK && hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
}
ani_status TypeThrowError(ani_env *env, const char *message)
{
    if (env == nullptr || message == nullptr) {
        return static_cast<ani_status>(ANI_RES_INVALID_ARGS);
    }
    ani_string msg {};
    ani_status status = env->String_NewUTF8(message, std::strlen(message), &msg);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed when creating error message")) {
        return status;
    }
    ani_class errorCls {};
    status = env->FindClass(TYPE_ERROR_CLASS, &errorCls);
    if (!AssertEqMsg(status, ANI_OK, "FindClass escompat.Error failed")) {
        return status;
    }
    if (errorCls == nullptr) {
        return status;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Class_FindMethod escompat.Error constructor failed")) {
        return status;
    }
    if (ctor == nullptr) {
        return status;
    }
    ani_object errorObj {};
    status = env->Object_New(errorCls, ctor, &errorObj, msg);
    if (!AssertEqMsg(status, ANI_OK, "Object_New escompat.Error failed")) {
        return status;
    }
    if (errorObj == nullptr) {
        return status;
    }
    status = env->ThrowError(reinterpret_cast<ani_error>(errorObj));
    if (!AssertEqMsg(status, ANI_OK, "ThrowError failed")) {
        return status;
    }
    return status;
}
ani_boolean TypeObjectInstanceOf(ani_env *env, ani_object object, const char *className)
{
    if (env == nullptr || object == nullptr || className == nullptr) {
        return ANI_FALSE;
    }
    ani_class cls {};
    ani_status status = env->FindClass(className, &cls);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "FindClass failed")) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    status = env->Object_InstanceOf(object, cls, &result);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Object_InstanceOf failed")) {
        return ANI_FALSE;
    }
    return result;
}
ani_double TypeUnboxDoubleObject(ani_env *env, ani_ref ref)
{
    if (env == nullptr || ref == nullptr) {
        return 0.0;
    }
    ani_double value = 0.0;
    ani_status status = env->Primitive_Unbox_Double(static_cast<ani_object>(ref), &value);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Unbox_Double failed")) {
        return 0.0;
    }
    return value;
}
ani_int TypeUnboxIntObject(ani_env *env, ani_ref ref)
{
    if (env == nullptr || ref == nullptr) {
        return 0;
    }
    ani_int value = 0;
    ani_status status = env->Primitive_Unbox_Int(static_cast<ani_object>(ref), &value);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Unbox_Int failed")) {
        return 0;
    }
    return value;
}
ani_boolean TypeIsUndefined(ani_env *env, ani_ref ref)
{
    if (env == nullptr) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Reference_IsUndefined(ref, &result);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Reference_IsUndefined failed")) {
        return ANI_FALSE;
    }
    return result;
}
bool TypeFindAndCacheClass(ani_env *env, const char *className, ani_ref *globalRef)
{
    ani_class cls {};
    ani_status status = env->FindClass(className, &cls);
    if (status != ANI_OK || cls == nullptr) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "FindClass failed")) {
        return false;
    }
    if (cls == nullptr) {
        return false;
    }
    status = env->GlobalReference_Create(cls, globalRef);
    if (status != ANI_OK || *globalRef == nullptr) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "GlobalReference_Create failed")) {
        return false;
    }
    if (*globalRef == nullptr) {
        return false;
    }
    return true;
}
bool TypeArrayHasInstance(ani_env *env, ani_array array, ani_class cls)
{
    ani_size length = 0;
    ani_status status = env->Array_GetLength(array, &length);
    if (status != ANI_OK) {
        TypeClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Array_GetLength failed")) {
        return false;
    }
    for (ani_size i = 0; i < length; i++) {
        ani_ref item {};
        status = env->Array_Get(array, i, &item);
        if (status != ANI_OK || item == nullptr) {
            TypeClearPendingError(env);
            continue;
        }
        ani_boolean isInstance = ANI_FALSE;
        status = env->Object_InstanceOf(static_cast<ani_object>(item), cls, &isInstance);
        if (status == ANI_OK && isInstance == ANI_TRUE) {
            return true;
        }
        TypeClearPendingError(env);
    }
    return false;
}
}
ani_boolean test_IsPositive(ani_env *env, ani_object object, ani_int num)
{
    (void)env;
    (void)object;
    ani_boolean result = num > 0 ? ANI_TRUE : ANI_FALSE;
    std::cout << "test_IsPositive result is " << static_cast<int>(result) << std::endl;
    return result;
}
ani_int test_GetCharCode(ani_env *env, ani_object object, ani_char ch)
{
    (void)env;
    (void)object;
    return static_cast<ani_int>(ch);
}
ani_byte test_EchoByte(ani_env *env, ani_object object, ani_byte value)
{
    (void)env;
    (void)object;
    return value;
}
ani_short test_EchoShort(ani_env *env, ani_object object, ani_short value)
{
    (void)env;
    (void)object;
    return value;
}
ani_int test_EchoInt(ani_env *env, ani_object object, ani_int value)
{
    (void)env;
    (void)object;
    return value;
}
ani_long test_EchoLong(ani_env *env, ani_object object, ani_long value)
{
    (void)env;
    (void)object;
    return value;
}
ani_float test_EchoFloat(ani_env *env, ani_object object, ani_float value)
{
    (void)env;
    (void)object;
    return value;
}
ani_double test_EchoDouble(ani_env *env, ani_object object, ani_double value)
{
    (void)env;
    (void)object;
    return value;
}
ani_double test_ProcessNumber(ani_env *env, ani_object object, ani_double value)
{
    (void)env;
    (void)object;
    return value;
}
ani_string test_CreateGreeting(ani_env *env, ani_object object, ani_string name)
{
    (void)object;
    std::string nameValue = ani_tc_type::TypeAniStringToStdString(env, name);
    return ani_tc_type::TypeStdStringToAniString(env, "Hello, " + nameValue);
}
void test_WriteToBuffer(ani_env *env, ani_object object, ani_arraybuffer buffer, ani_int offset, ani_int value)
{
    (void)object;
    if (env == nullptr || buffer == nullptr) {
        return;
    }
    void *data = nullptr;
    ani_size size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(buffer, &data, &size);
    if (status != ANI_OK) {
        return;
    }
    if (data == nullptr || offset < 0 || static_cast<ani_size>(offset) >= size) {
        return;
    }
    auto *bytes = static_cast<uint8_t *>(data);
    bytes[offset] = static_cast<uint8_t>(value);
}
ani_double test_TypeSumArray(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    if (env == nullptr || array == nullptr) {
        return 0.0;
    }
    ani_size length = 0;
    ani_status status = env->Array_GetLength(array, &length);
    if (!AssertEqMsg(status, ANI_OK, "Array_GetLength failed")) {
        return 0.0;
    }
    ani_double sum = 0.0;
    for (ani_size i = 0; i < length; i++) {
        ani_ref element {};
        status = env->Array_Get(array, i, &element);
        if (!AssertEqMsg(status, ANI_OK, "Array_Get failed")) {
        return sum;
    }
        sum += ani_tc_type::TypeUnboxDoubleObject(env, element);
    }
    return sum;
}
ani_int test_SumFixedArray(ani_env *env, ani_object object, ani_valuearray_int array)
{
    (void)object;
    if (env == nullptr || array == nullptr) {
        return 0;
    }
    ani_size length = 0;
    ani_status status = env->ValueArray_GetLength(array, &length);
    if (!AssertEqMsg(status, ANI_OK, "ValueArray_GetLength failed")) {
        return 0;
    }
    ani_int sum = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_int value = 0;
        status = env->ValueArray_GetRegion_Int(array, i, 1, &value);
        if (!AssertEqMsg(status, ANI_OK, "ValueArray_GetRegion_Int failed")) {
        return sum;
    }
        sum += value;
    }
    return sum;
}
ani_string test_ProcessRef(ani_env *env, ani_object object, ani_ref ref)
{
    (void)object;
    ani_ref upcastRef = ref;
    ani_string str = static_cast<ani_string>(upcastRef);
    std::string value = ani_tc_type::TypeAniStringToStdString(env, str);
    return ani_tc_type::TypeStdStringToAniString(env, value);
}
void test_CastStringToArray(ani_env *env, ani_object object, ani_string str)
{
    (void)object;
    ani_array array = reinterpret_cast<ani_array>(str);
    ani_size length = 0;
    ani_status status = env->Array_GetLength(array, &length);
    std::cout << "test_CastStringToArray status: " << status
              << ", length: " << length << std::endl;
}
ani_object test_CreateObjectWithInt(ani_env *env, ani_object object, ani_int value)
{
    (void)object;
    if (env == nullptr) {
        return nullptr;
    }
    ani_class objectCls {};
    ani_status status = env->FindClass(ani_tc_type::TYPE_OBJECT_CLASS, &objectCls);
    if (!AssertEqMsg(status, ANI_OK, "FindClass std.core.Object failed")) {
        return nullptr;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(objectCls, "<ctor>", ":", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Class_FindMethod Object ctor failed")) {
        return nullptr;
    }
    ani_object result {};
    status = env->Object_New(objectCls, ctor, &result);
    if (!AssertEqMsg(status, ANI_OK, "Object_New failed")) {
        return nullptr;
    }
    ani_object boxed {};
    status = env->Primitive_Box_Int(value, &boxed);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Int failed")) {
        return result;
    }
    status = env->Object_SetPropertyByName_Ref(result, "value", boxed);
    if (!AssertEqMsg(status, ANI_OK, "Object_SetPropertyByName_Ref failed")) {
        return result;
    }
    return result;
}
#include "TcTypeTestPart2.h"
#endif
