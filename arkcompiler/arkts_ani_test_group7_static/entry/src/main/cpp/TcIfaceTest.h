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

#ifndef TC_IFACE_TEST_H
#define TC_IFACE_TEST_H
#include "Common.h"
#include <iostream>
#include <string>
namespace ani_tc_iface {
constexpr const char *INDEX_MODULE = "entry.src.main.src.ets.Index";
constexpr const char *POINT_I_CLASS = "entry.src.main.src.ets.Index.PointI";
constexpr const char *IFACE_COUNTER_CLASS = "entry.src.main.src.ets.Index.IfaceCounter";
constexpr const char *IFACE_MANAGED_FOO_CLASS = "entry.src.main.src.ets.Index.IfaceManagedFoo";
constexpr const char *IFACE_ANIMAL_CLASS = "entry.src.main.src.ets.Index.Animal";
constexpr ani_int IFACE_PROP_SET_VALUE = 123;
constexpr ani_int IFACE_FIELD_ADD_VALUE = 10;
constexpr ani_int IFACE_AGE_SET_VALUE = 35;
constexpr ani_int IFACE_AGE_WRONG_FIELD_VALUE = 99;
constexpr ani_int IFACE_POINT_X_SET_VALUE = 100;
constexpr ani_int IFACE_NATIVE_DATA_INIT_VALUE = 100;
constexpr ani_int IFACE_NATIVE_DATA_ADD_VALUE = 23;
constexpr ani_double IFACE_OPTIONAL_ARG_LEFT = 3.0;
constexpr ani_double IFACE_OPTIONAL_ARG_RIGHT = 4.0;
constexpr ani_double IFACE_OPTIONAL_UNDEFINED_RESULT = -1.0;
constexpr ani_size IFACE_FUNCTION_ARG_COUNT = 2;
struct NativeData {
    int value;
};
inline NativeData *g_ifaceNativeData = nullptr;
inline std::string AniStringToStd(ani_env *env, ani_string str)
{
    ani_size size = 0;
    env->String_GetUTF8Size(str, &size);
    std::string result(size, '\0');
    ani_size written = 0;
    env->String_GetUTF8(str, result.data(), size + 1, &written);
    return result;
}
inline ani_string StdToAniString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
inline bool HasPendingError(ani_env *env)
{
    ani_boolean pending = ANI_FALSE;
    env->ExistUnhandledError(&pending);
    return pending == ANI_TRUE;
}
inline void ClearPendingError(ani_env *env)
{
    ani_error error {};
    if (env->GetUnhandledError(&error) == ANI_OK) {
        env->ResetError();
    }
}
}
ani_boolean test_IfaceObjectNewInterfaceFail(ani_env *env, ani_object object)
{
    (void)object;
    ani_class ifaceCls {};
    ani_status status = env->FindClass(ani_tc_iface::POINT_I_CLASS, &ifaceCls);
    if (status != ANI_OK) {
        ani_tc_iface::ClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(ifaceCls, "<ctor>", ":", &ctor);
    if (status != ANI_OK) {
        ani_tc_iface::ClearPendingError(env);
        return ANI_TRUE;
    }
    ani_object newObj {};
    status = env->Object_New(ifaceCls, ctor, &newObj);
    if (status != ANI_OK || ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_int test_IfaceReadPointLiteral(ani_env *env, ani_object object, ani_object point)
{
    (void)object;
    ani_int x = 0;
    ani_int y = 0;
    env->Object_GetPropertyByName_Int(point, "x", &x);
    env->Object_GetPropertyByName_Int(point, "y", &y);
    return x + y;
}
ani_boolean test_IfacePropertyAccess(ani_env *env, ani_object object, ani_object obj)
{
    (void)object;
    ani_int fieldValue = 0;
    ani_status fieldStatus = env->Object_GetFieldByName_Int(obj, "prop", &fieldValue);
    if (fieldStatus == ANI_OK) {
        std::cout << "Field access unexpectedly succeeded for interface property" << std::endl;
    }
    ani_status setStatus = env->Object_SetPropertyByName_Int(
        obj, "prop", ani_tc_iface::IFACE_PROP_SET_VALUE);
    ani_int propValue = 0;
    ani_status getStatus = env->Object_GetPropertyByName_Int(obj, "prop", &propValue);
    if (ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
    }
    return (setStatus == ANI_OK && getStatus == ANI_OK &&
        propValue == ani_tc_iface::IFACE_PROP_SET_VALUE) ? ANI_TRUE : ANI_FALSE;
}
ani_int test_IfaceFieldAccess(ani_env *env, ani_object object, ani_object point)
{
    (void)object;
    ani_int x = 0;
    env->Object_GetFieldByName_Int(point, "x", &x);
    env->Object_SetFieldByName_Int(point, "x", x + ani_tc_iface::IFACE_FIELD_ADD_VALUE);
    ani_int newX = 0;
    env->Object_GetFieldByName_Int(point, "x", &newX);
    return newX;
}
ani_int test_IfaceGetterSetterAccess(ani_env *env, ani_object object, ani_object person)
{
    (void)object;
    env->Object_SetPropertyByName_Int(person, "age", ani_tc_iface::IFACE_AGE_SET_VALUE);
    ani_int age = 0;
    env->Object_GetPropertyByName_Int(person, "age", &age);
    ani_status fieldStatus = env->Object_SetFieldByName_Int(
        person, "age", ani_tc_iface::IFACE_AGE_WRONG_FIELD_VALUE);
    if (fieldStatus != ANI_OK || ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
    }
    return age;
}
ani_string test_IfaceRefPropertyAccess(ani_env *env, ani_object object, ani_object person)
{
    (void)object;
    ani_string name = ani_tc_iface::StdToAniString(env, "Alice");
    env->Object_SetPropertyByName_Ref(person, "name", name);
    ani_ref resultRef {};
    env->Object_GetPropertyByName_Ref(person, "name", &resultRef);
    ani_int wrong = 0;
    ani_status wrongStatus = env->Object_GetPropertyByName_Int(person, "name", &wrong);
    if (wrongStatus != ANI_OK || ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
    }
    return static_cast<ani_string>(resultRef);
}
ani_int test_IfaceStaticFieldAccess(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_iface::IFACE_COUNTER_CLASS, &cls);
    ani_int value = 0;
    env->Class_GetStaticFieldByName_Int(cls, "count", &value);
    value++;
    env->Class_SetStaticFieldByName_Int(cls, "count", value);
    ani_int result = 0;
    env->Class_GetStaticFieldByName_Int(cls, "count", &result);
    return result;
}
ani_boolean test_IfaceCallManagedFunc(ani_env *env, ani_object object, ani_object foo)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_iface::IFACE_MANAGED_FOO_CLASS, &cls);
    ani_method method {};
    env->Class_FindMethod(cls, "managedFunc", ":", &method);
    env->Object_CallMethod_Void(foo, method);
    ani_boolean called = ANI_FALSE;
    env->Object_GetFieldByName_Boolean(foo, "called", &called);
    return called;
}
ani_int test_IfaceCallAdd(ani_env *env, ani_object object, ani_object foo, ani_int a, ani_int b)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_iface::IFACE_MANAGED_FOO_CLASS, &cls);
    ani_method method {};
    env->Class_FindMethod(cls, "add", "ii:i", &method);
    ani_int result = 0;
    env->Object_CallMethod_Int(foo, method, &result, a, b);
    return result;
}
ani_int test_IfaceCallStaticSquare(ani_env *env, ani_object object, ani_int x)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_iface::IFACE_MANAGED_FOO_CLASS, &cls);
    ani_static_method method {};
    env->Class_FindStaticMethod(cls, "square", "i:i", &method);
    ani_int result = 0;
    env->Class_CallStaticMethod_Int(cls, method, &result, x);
    return result;
}
ani_double test_IfaceCallOptionalFn(ani_env *env, ani_object object, ani_object obj)
{
    (void)object;
    ani_ref fnRef {};
    env->Object_GetFieldByName_Ref(obj, "fn", &fnRef);
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsUndefined(fnRef, &isUndefined);
    if (isUndefined == ANI_TRUE) {
        return ani_tc_iface::IFACE_OPTIONAL_UNDEFINED_RESULT;
    }
    ani_object arg0 {};
    ani_object arg1 {};
    env->Primitive_Box_Double(ani_tc_iface::IFACE_OPTIONAL_ARG_LEFT, &arg0);
    env->Primitive_Box_Double(ani_tc_iface::IFACE_OPTIONAL_ARG_RIGHT, &arg1);
    ani_ref argv[ani_tc_iface::IFACE_FUNCTION_ARG_COUNT] = {arg0, arg1};
    ani_ref resultRef {};
    env->FunctionalObject_Call(static_cast<ani_fn_object>(fnRef),
        ani_tc_iface::IFACE_FUNCTION_ARG_COUNT, argv, &resultRef);
    ani_double result = 0.0;
    env->Primitive_Unbox_Double(static_cast<ani_object>(resultRef), &result);
    return result;
}
ani_int test_IfaceModifyPoint(ani_env *env, ani_object object, ani_object point)
{
    (void)object;
    env->Object_SetPropertyByName_Int(point, "x", ani_tc_iface::IFACE_POINT_X_SET_VALUE);
    ani_int y = 0;
    env->Object_GetPropertyByName_Int(point, "y", &y);
    return y;
}
ani_object test_IfaceCreateWrapper(ani_env *env, ani_object object)
{
    (void)object;
    ani_class objCls {};
    env->FindClass("std.core.Object", &objCls);
    ani_method ctor {};
    env->Class_FindMethod(objCls, "<ctor>", ":", &ctor);
    ani_object wrapper {};
    env->Object_New(objCls, ctor, &wrapper);
    if (ani_tc_iface::g_ifaceNativeData != nullptr) {
        delete ani_tc_iface::g_ifaceNativeData;
        ani_tc_iface::g_ifaceNativeData = nullptr;
    }
    ani_tc_iface::g_ifaceNativeData = new ani_tc_iface::NativeData();
    ani_tc_iface::g_ifaceNativeData->value = ani_tc_iface::IFACE_NATIVE_DATA_INIT_VALUE;
    return wrapper;
}
ani_int test_IfaceUseWrapper(ani_env *env, ani_object object, ani_object wrapper)
{
    (void)env;
    (void)object;
    (void)wrapper;
    if (ani_tc_iface::g_ifaceNativeData == nullptr) {
        return -1;
    }
    ani_tc_iface::g_ifaceNativeData->value += ani_tc_iface::IFACE_NATIVE_DATA_ADD_VALUE;
    return ani_tc_iface::g_ifaceNativeData->value;
}
ani_boolean test_IfaceDeleteWrapper(ani_env *env, ani_object object, ani_object wrapper)
{
    (void)env;
    (void)object;
    (void)wrapper;
    if (ani_tc_iface::g_ifaceNativeData == nullptr) {
        return ANI_FALSE;
    }
    delete ani_tc_iface::g_ifaceNativeData;
    ani_tc_iface::g_ifaceNativeData = nullptr;
    return ANI_TRUE;
}
ani_boolean test_IfaceWrapperWithoutFinalizer(ani_env *env, ani_object object)
{
    ani_object wrapper = test_IfaceCreateWrapper(env, object);
    ani_boolean result = ani_tc_iface::g_ifaceNativeData != nullptr ? ANI_TRUE : ANI_FALSE;
    if (wrapper != nullptr) {
        env->Reference_Delete(wrapper);
    }
    return result;
}
ani_boolean test_IfaceCleanupNativeData(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    delete ani_tc_iface::g_ifaceNativeData;
    ani_tc_iface::g_ifaceNativeData = nullptr;
    return ANI_TRUE;
}
ani_boolean test_IfaceWrongPropertyAccess(ani_env *env, ani_object object, ani_object data)
{
    (void)object;
    ani_int value = 0;
    ani_status status = env->Object_GetPropertyByName_Int(data, "value", &value);
    if (status != ANI_OK || ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_boolean test_IfaceWrongFieldAccess(ani_env *env, ani_object object, ani_object person)
{
    (void)object;
    ani_ref name {};
    ani_status status = env->Object_GetFieldByName_Ref(person, "name", &name);
    if (status != ANI_OK || ani_tc_iface::HasPendingError(env)) {
        ani_tc_iface::ClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_string test_IfaceReadDerived(ani_env *env, ani_object object, ani_object obj)
{
    (void)object;
    ani_int id = 0;
    ani_ref nameRef {};
    env->Object_GetPropertyByName_Int(obj, "id", &id);
    env->Object_GetPropertyByName_Ref(obj, "name", &nameRef);
    std::string name = ani_tc_iface::AniStringToStd(env, static_cast<ani_string>(nameRef));
    return ani_tc_iface::StdToAniString(env, std::to_string(id) + ":" + name);
}
ani_string test_IfaceCallAnimalSpeak(ani_env *env, ani_object object, ani_object animal)
{
    (void)object;
    ani_class cls {};
    env->FindClass(ani_tc_iface::IFACE_ANIMAL_CLASS, &cls);
    ani_method method {};
    env->Class_FindMethod(cls, "speak", ":C{std.core.String}", &method);
    ani_ref result {};
    env->Object_CallMethod_Ref(animal, method, &result);
    return static_cast<ani_string>(result);
}
#endif
