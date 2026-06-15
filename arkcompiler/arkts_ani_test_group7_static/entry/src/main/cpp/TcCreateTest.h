/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef TC_CREATE_TEST_H
#define TC_CREATE_TEST_H
#include "Common.h"
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_create {
constexpr const char *CREATE_POINT_CLASS = "entry.src.main.src.ets.Index.CreatePoint";
constexpr const char *CREATE_INTERFACE_CLASS = "entry.src.main.src.ets.Index.CreateInterface";
constexpr const char *CREATE_ABSTRACT_CLASS = "entry.src.main.src.ets.Index.CreateAbstractBase";
constexpr const char *CREATE_COLOR_CLASS = "entry.src.main.src.ets.Index.CreateColor";
constexpr const char *CREATE_STATUS_CLASS = "entry.src.main.src.ets.Index.CreateStatus";
constexpr const char *CREATE_ARRAYBUFFER_CLASS = "std.core.ArrayBuffer";
constexpr const char *CREATE_STRING_CLASS = "std.core.String";
constexpr const char *CREATE_DOUBLE_CLASS = "std.core.Double";
constexpr const char *CREATE_FIXEDARRAY_INT_DESC = "A{i}";
constexpr ani_int CREATE_FIXEDARRAY_SIZE = 3;
constexpr ani_int CREATE_FIXEDARRAY_VALUE_ONE = 1;
constexpr ani_int CREATE_FIXEDARRAY_VALUE_TWO = 2;
constexpr ani_int CREATE_FIXEDARRAY_VALUE_THREE = 3;
constexpr ani_size CREATE_INDEX_ZERO = 0;
constexpr ani_size CREATE_INDEX_ONE = 1;
constexpr ani_size CREATE_INDEX_TWO = 2;
inline ani_class g_createCachedPointClass {};
inline ani_method g_createCachedPointIntCtor {};
inline std::string CreateStringToStd(ani_env *env, ani_string str)
{
    ani_size size = 0;
    env->String_GetUTF8Size(str, &size);
    std::vector<char> buffer(size + 1);
    ani_size written = 0;
    env->String_GetUTF8(str, buffer.data(), size + 1, &written);
    return std::string(buffer.data(), written);
}
inline ani_string CreateStdToString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
ani_int GetArrayBufferByteLengthByProperty(ani_env *env, ani_object buffer)
{
    ani_int byteLength = 0;
    ani_status status = env->Object_GetPropertyByName_Int(buffer, "byteLength", &byteLength);
    if (status == ANI_OK) {
        std::cout << "Object_GetPropertyByName_Int byteLength success: "
                  << byteLength << std::endl;
        return byteLength;
    }
    std::cerr << "Object_GetPropertyByName_Int byteLength failed, status: "
              << status << std::endl;
    ani_ref byteLengthRef {};
    status = env->Object_GetPropertyByName_Ref(buffer, "byteLength", &byteLengthRef);
    if (status != ANI_OK || byteLengthRef == nullptr) {
        std::cerr << "Object_GetPropertyByName_Ref byteLength failed, status: "
                  << status << std::endl;
        return 0;
    }
    ani_int unboxed = 0;
    ani_status unboxStatus = env->Primitive_Unbox_Int(
        static_cast<ani_object>(byteLengthRef), &unboxed);
    if (unboxStatus == ANI_OK) {
        std::cout << "Object_GetPropertyByName_Ref byteLength unbox success: "
                  << unboxed << std::endl;
        return unboxed;
    }
    std::cerr << "Primitive_Unbox_Int byteLength failed, status: "
              << unboxStatus << std::endl;
    return 0;
}
ani_int GetArrayBufferByteLengthByInfo(ani_env *env, ani_object buffer)
{
    void *data = nullptr;
    ani_size size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(static_cast<ani_arraybuffer>(buffer), &data, &size);
    if (status == ANI_OK) {
        std::cout << "ArrayBuffer_GetInfo fallback byteLength success: "
                  << size << std::endl;
        return static_cast<ani_int>(size);
    }
    std::cerr << "ArrayBuffer_GetInfo fallback failed, status: "
              << status << std::endl;
    return 0;
}
inline ani_int GetArrayBufferByteLength(ani_env *env, ani_object buffer)
{
    if (env == nullptr || buffer == nullptr) {
        std::cerr << "GetArrayBufferByteLength invalid args" << std::endl;
        return 0;
    }
    ani_int byteLength = GetArrayBufferByteLengthByProperty(env, buffer);
    if (byteLength > 0) {
        return byteLength;
    }
    return GetArrayBufferByteLengthByInfo(env, buffer);
}
ani_object TryCreateArrayBufferByIntCtor(ani_env *env, ani_class cls, ani_int length)
{
    ani_method ctor {};
    ani_status status = env->Class_FindMethod(cls, "<ctor>", "i:", &ctor);
    if (status != ANI_OK || ctor == nullptr) {
        std::cerr << "Class_FindMethod ArrayBuffer ctor i: failed, status: "
                  << status << std::endl;
        return nullptr;
    }
    ani_object buffer {};
    status = env->Object_New(cls, ctor, &buffer, length);
    if (status != ANI_OK || buffer == nullptr) {
        std::cerr << "Object_New ArrayBuffer by i: failed, status: "
                  << status << std::endl;
        return nullptr;
    }
    ani_int byteLength = GetArrayBufferByteLength(env, buffer);
    if (byteLength == length) {
        std::cout << "Create ArrayBuffer by i: success, length: "
                  << byteLength << std::endl;
        return buffer;
    }
    std::cerr << "Create ArrayBuffer by i: got unexpected byteLength: "
              << byteLength << ", expected: " << length << std::endl;
    return nullptr;
}
ani_object TryCreateArrayBufferByOptionalCtor(ani_env *env, ani_class cls, ani_int length)
{
    ani_method ctor {};
    ani_status status = env->Class_FindMethod(cls, "<ctor>", "iC{std.core.Int}:", &ctor);
    if (status != ANI_OK || ctor == nullptr) {
        std::cerr << "Class_FindMethod ArrayBuffer ctor iC{std.core.Int}: failed, status: "
                  << status << std::endl;
        return nullptr;
    }
    ani_object maxByteLength {};
    ani_status boxStatus = env->Primitive_Box_Int(length, &maxByteLength);
    if (boxStatus != ANI_OK || maxByteLength == nullptr) {
        std::cerr << "Primitive_Box_Int maxByteLength failed, status: "
                  << boxStatus << std::endl;
        return nullptr;
    }
    ani_object buffer {};
    status = env->Object_New(cls, ctor, &buffer, length, maxByteLength);
    if (status != ANI_OK || buffer == nullptr) {
        std::cerr << "Object_New ArrayBuffer by iC{std.core.Int}: failed, status: "
                  << status << std::endl;
        return nullptr;
    }
    ani_int byteLength = GetArrayBufferByteLength(env, buffer);
    if (byteLength == length) {
        std::cout << "Create ArrayBuffer by iC{std.core.Int}: success, length: "
                  << byteLength << std::endl;
        return buffer;
    }
    std::cerr << "Create ArrayBuffer by iC{std.core.Int}: got unexpected byteLength: "
              << byteLength << ", expected: " << length << std::endl;
    return nullptr;
}
ani_object CreateArrayBufferWithLength(ani_env *env, ani_int length)
{
    if (env == nullptr || length < 0) {
        std::cerr << "CreateArrayBufferWithLength invalid args, length: "
                  << length << std::endl;
        return nullptr;
    }
    ani_class cls {};
    ani_status status = env->FindClass(CREATE_ARRAYBUFFER_CLASS, &cls);
    if (status != ANI_OK || cls == nullptr) {
        std::cerr << "FindClass std.core.ArrayBuffer failed, status: "
                  << status << std::endl;
        return nullptr;
    }
    ani_object buffer = TryCreateArrayBufferByIntCtor(env, cls, length);
    if (buffer != nullptr) {
        return buffer;
    }
    return TryCreateArrayBufferByOptionalCtor(env, cls, length);
}
}
ani_boolean test_CreateArrayBufferIsView(ani_env *env, ani_object object, ani_object value)
{
    (void)object;
    ani_class cls {};
    ani_status status = env->FindClass(ani_tc_create::CREATE_ARRAYBUFFER_CLASS, &cls);
    if (status != ANI_OK) {
        std::cerr << "FindClass std.core.ArrayBuffer failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    ani_static_method method {};
    status = env->Class_FindStaticMethod(cls, "isView", "C{std.core.Object}:z", &method);
    if (status != ANI_OK) {
        std::cerr << "Class_FindStaticMethod isView failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    status = env->Class_CallStaticMethod_Boolean(cls, method, &result, value);
    if (status != ANI_OK) {
        std::cerr << "Class_CallStaticMethod_Boolean isView failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    return result;
}
ani_int test_CreateArrayBufferByLength(ani_env *env, ani_object object, ani_int length)
{
    (void)object;
    ani_object buffer = ani_tc_create::CreateArrayBufferWithLength(env, length);
    if (buffer == nullptr) {
        std::cerr << "test_CreateArrayBufferByLength failed to create ArrayBuffer" << std::endl;
        return 0;
    }
    return ani_tc_create::GetArrayBufferByteLength(env, buffer);
}
void test_CreateCtorNullptr(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &cls);
    ani_method ctor {};
    ani_status findStatus = env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor);
    std::cout << "Class_FindMethod with nullptr ctor signature status: " << findStatus << std::endl;
    ani_object point {};
    ani_status newStatus = env->Object_New(cls, ctor, &point, 1, 2);
    std::cout << "Object_New with nullptr ctor signature status: " << newStatus << std::endl;
}
ani_int test_CreatePointByIntCtor(ani_env *env, ani_object object, ani_int x, ani_int y)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor);
    ani_object point {};
    env->Object_New(cls, ctor, &point, x, y);
    ani_int sum = 0;
    env->Object_CallMethodByName_Int(point, "getIntSum", ":i", &sum);
    return sum;
}
ani_double test_CreatePointByDoubleCtor(ani_env *env, ani_object object, ani_double x, ani_double y)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "dd:", &ctor);
    ani_object point {};
    env->Object_New(cls, ctor, &point, x, y);
    ani_double sum = 0.0;
    env->Object_CallMethodByName_Double(point, "getDoubleSum", ":d", &sum);
    return sum;
}
ani_double test_CreateDoubleObject(ani_env *env, ani_object object, ani_double value)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_DOUBLE_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "d:", &ctor);
    ani_object boxed {};
    env->Object_New(cls, ctor, &boxed, value);
    ani_double result = 0.0;
    env->Primitive_Unbox_Double(boxed, &result);
    return result;
}
void test_CreateInterfaceFail(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_INTERFACE_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", ":", &ctor);
    ani_object result {};
    ani_status status = env->Object_New(cls, ctor, &result);
    std::cout << "Object_New interface status: " << status << std::endl;
}
void test_CreateAbstractFail(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_ABSTRACT_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", ":", &ctor);
    ani_object result {};
    ani_status status = env->Object_New(cls, ctor, &result);
    std::cout << "Object_New abstract class status: " << status << std::endl;
}
void test_CreateStringByObjectNew(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_STRING_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", ":", &ctor);
    ani_object result {};
    ani_status status = env->Object_New(cls, ctor, &result);
    std::cout << "Object_New std.core.String status: " << status << std::endl;
}
ani_string test_CreateStringByUtf8(ani_env *env, ani_object object, ani_string value)
{
    (void)object;
    std::string text = ani_tc_create::CreateStringToStd(env, value);
    return ani_tc_create::CreateStdToString(env, text);
}
void test_CreateFixedArrayByObjectNew(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_FIXEDARRAY_INT_DESC, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "i:", &ctor);
    ani_object result {};
    ani_status status = env->Object_New(cls, ctor, &result, ani_tc_create::CREATE_FIXEDARRAY_SIZE);
    std::cout << "Object_New FixedArray<int> status: " << status << std::endl;
}
ani_int test_CreateFixedArrayBySpecialApi(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_int array {};
    env->FixedArray_New_Int(ani_tc_create::CREATE_FIXEDARRAY_SIZE, &array);
    ani_int values[ani_tc_create::CREATE_FIXEDARRAY_SIZE] = {
        ani_tc_create::CREATE_FIXEDARRAY_VALUE_ONE,
        ani_tc_create::CREATE_FIXEDARRAY_VALUE_TWO,
        ani_tc_create::CREATE_FIXEDARRAY_VALUE_THREE
    };
    env->FixedArray_SetRegion_Int(array, 0, ani_tc_create::CREATE_FIXEDARRAY_SIZE, values);
    ani_int out[ani_tc_create::CREATE_FIXEDARRAY_SIZE] = {};
    env->FixedArray_GetRegion_Int(array, 0, ani_tc_create::CREATE_FIXEDARRAY_SIZE, out);
    return out[ani_tc_create::CREATE_INDEX_ZERO] +
    out[ani_tc_create::CREATE_INDEX_ONE] +
    out[ani_tc_create::CREATE_INDEX_TWO];
}
ani_string test_CreateEnumItemByName(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    env->FindEnum(ani_tc_create::CREATE_COLOR_CLASS, &enumType);
    ani_enum_item item {};
    env->Enum_GetEnumItemByName(enumType, "GREEN", &item);
    ani_string name {};
    env->EnumItem_GetName(item, &name);
    return name;
}
ani_int test_CreateEnumItemIntValue(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    env->FindEnum(ani_tc_create::CREATE_STATUS_CLASS, &enumType);
    ani_enum_item item {};
    env->Enum_GetEnumItemByName(enumType, "NOT_FOUND", &item);
    ani_int value = 0;
    env->EnumItem_GetValue_Int(item, &value);
    return value;
}
ani_int test_CreateGetByteLength(ani_env *env, ani_object object, ani_int length)
{
    (void)object;
    ani_object buffer = ani_tc_create::CreateArrayBufferWithLength(env, length);
    if (buffer == nullptr) {
        std::cerr << "test_CreateGetByteLength failed to create ArrayBuffer" << std::endl;
        return 0;
    }
    return ani_tc_create::GetArrayBufferByteLength(env, buffer);
}
void test_CreateFindMissing(ani_env *env, ani_object object)
{
    (void)object;
    ani_class missingCls {};
    ani_status classStatus = env->FindClass("non.existent.Class", &missingCls);
    std::cout << "FindClass non.existent.Class status: " << classStatus << std::endl;
    ani_class pointCls {};
    env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &pointCls);
    ani_method missingCtor {};
    ani_status methodStatus = env->Class_FindMethod(pointCls, "<ctor>", "xxx:", &missingCtor);
    std::cout << "Class_FindMethod missing ctor status: " << methodStatus << std::endl;
}
void test_CreateObjectNewInvalidArgs(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor);
    ani_object point {};
    ani_status status = env->Object_New(cls, ctor, &point, 1);
    std::cout << "Object_New invalid arg count status: " << status << std::endl;
    ani_string str = ani_tc_create::CreateStdToString(env, "bad");
    status = env->Object_New(cls, ctor, &point, str, str);
    std::cout << "Object_New invalid arg type status: " << status << std::endl;
}
ani_boolean test_CreateFindStaticMethod(ani_env *env, ani_object object, ani_object value)
{
    (void)object;
    ani_class cls {};
    ani_status status = env->FindClass(ani_tc_create::CREATE_ARRAYBUFFER_CLASS, &cls);
    if (status != ANI_OK) {
        std::cerr << "FindClass std.core.ArrayBuffer failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    ani_static_method method {};
    status = env->Class_FindStaticMethod(cls, "isView", "C{std.core.Object}:z", &method);
    if (status != ANI_OK) {
        std::cerr << "Class_FindStaticMethod isView failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    status = env->Class_CallStaticMethod_Boolean(cls, method, &result, value);
    if (status != ANI_OK) {
        std::cerr << "Class_CallStaticMethod_Boolean isView failed, status: " << status << std::endl;
        return ANI_FALSE;
    }
    return result;
}
ani_int test_CreateFindInstanceMethod(ani_env *env, ani_object object, ani_int length)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_create::CREATE_ARRAYBUFFER_CLASS, &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "i:", &ctor);
    ani_object buffer {};
    env->Object_New(cls, ctor, &buffer, length);
    ani_method slice {};
    env->Class_FindMethod(cls, "slice", "i:C{std.core.ArrayBuffer}", &slice);
    ani_object sliced {};
    env->Object_CallMethod_Ref(buffer, slice, reinterpret_cast<ani_ref *>(&sliced), 1);
    return ani_tc_create::GetArrayBufferByteLength(env, sliced);
}
ani_int test_CreateCachedPoint(ani_env *env, ani_object object, ani_int x, ani_int y)
{
    (void)object;
    if (ani_tc_create::g_createCachedPointClass == nullptr ||
        ani_tc_create::g_createCachedPointIntCtor == nullptr) {
        env->FindClass(ani_tc_create::CREATE_POINT_CLASS, &ani_tc_create::g_createCachedPointClass);
        env->Class_FindMethod(ani_tc_create::g_createCachedPointClass, "<ctor>", "ii:",
            &ani_tc_create::g_createCachedPointIntCtor);
    }
    ani_object point {};
    env->Object_New(ani_tc_create::g_createCachedPointClass,
        ani_tc_create::g_createCachedPointIntCtor, &point, x, y);
    ani_int sum = 0;
    env->Object_CallMethodByName_Int(point, "getIntSum", ":i", &sum);
    return sum;
}
#endif
