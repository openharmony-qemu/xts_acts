/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "AniObjectTypeTest.h"
#include "Common.h"

#include <cstring>
#include <string>
#include <vector>

namespace {

ani_ref g_storedCallbackRef = nullptr;

ani_boolean CreateBoxedBoolean(ani_env *env, ani_object mgr, ani_boolean v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Boolean(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_boolean result = ANI_FALSE;
    env->Primitive_Unbox_Boolean(boxed, &result);
    return result;
}

ani_int CreateBoxedChar(ani_env *env, ani_object mgr, ani_int v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Int(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_int result = 0;
    env->Primitive_Unbox_Int(boxed, &result);
    return result;
}

ani_int CreateBoxedByte(ani_env *env, ani_object mgr, ani_int v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Int(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_int result = 0;
    env->Primitive_Unbox_Int(boxed, &result);
    return result;
}

ani_int CreateBoxedShort(ani_env *env, ani_object mgr, ani_int v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Int(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_int result = 0;
    env->Primitive_Unbox_Int(boxed, &result);
    return result;
}

ani_int CreateBoxedInt(ani_env *env, ani_object mgr, ani_int v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Int(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_int result = 0;
    env->Primitive_Unbox_Int(boxed, &result);
    return result;
}

ani_long CreateBoxedLong(ani_env *env, ani_object mgr, ani_long v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Long(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_long result = 0;
    env->Primitive_Unbox_Long(boxed, &result);
    return result;
}

ani_float CreateBoxedFloat(ani_env *env, ani_object mgr, ani_float v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Float(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_float result = 0.0F;
    env->Primitive_Unbox_Float(boxed, &result);
    return result;
}

ani_double CreateBoxedDouble(ani_env *env, ani_object mgr, ani_double v)
{
    (void)mgr;
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Double(v, &boxed) != ANI_OK) {
        return v;
    }
    ani_double result = 0.0;
    env->Primitive_Unbox_Double(boxed, &result);
    return result;
}

ani_boolean VerifyBoxedBoolean(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedBoolean", &r) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(r, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_boolean v = ANI_FALSE;
    return (env->Primitive_Unbox_Boolean(static_cast<ani_object>(r), &v) == ANI_OK) ? v : ANI_FALSE;
}

ani_int VerifyBoxedChar(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedChar", &r) != ANI_OK) {
        return 0;
    }
    ani_int v = 0;
    return (env->Primitive_Unbox_Int(static_cast<ani_object>(r), &v) == ANI_OK) ? v : 0;
}

ani_int VerifyBoxedByte(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedByte", &r) != ANI_OK) {
        return 0;
    }
    ani_int v = 0;
    return (env->Primitive_Unbox_Int(static_cast<ani_object>(r), &v) == ANI_OK) ? v : 0;
}

ani_int VerifyBoxedShort(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedShort", &r) != ANI_OK) {
        return 0;
    }
    ani_int v = 0;
    return (env->Primitive_Unbox_Int(static_cast<ani_object>(r), &v) == ANI_OK) ? v : 0;
}

ani_int VerifyBoxedInt(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedInt", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int v = 0;
    return (env->Primitive_Unbox_Int(static_cast<ani_object>(r), &v) == ANI_OK)
               ? v : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_long VerifyBoxedLong(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedLong", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_long v = 0;
    return (env->Primitive_Unbox_Long(static_cast<ani_object>(r), &v) == ANI_OK)
               ? v : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_float VerifyBoxedFloat(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedFloat", &r) != ANI_OK) {
        return 0.0F;
    }
    ani_float v = 0.0F;
    return (env->Primitive_Unbox_Float(static_cast<ani_object>(r), &v) == ANI_OK) ? v : 0.0F;
}

ani_double VerifyBoxedDouble(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boxedDouble", &r) != ANI_OK) {
        return 0.0;
    }
    ani_double v = 0.0;
    return (env->Primitive_Unbox_Double(static_cast<ani_object>(r), &v) == ANI_OK) ? v : 0.0;
}

ani_string CreateUtf8String(ani_env *env, ani_object mgr, ani_string content)
{
    (void)mgr;
    ani_size utf8Size = 0;
    if (env->String_GetUTF8Size(content, &utf8Size) != ANI_OK) {
        return nullptr;
    }
    std::vector<char> buffer(utf8Size + 1);
    ani_size outSize = 0;
    if (env->String_GetUTF8(content, buffer.data(), buffer.size(), &outSize) != ANI_OK) {
        return nullptr;
    }
    ani_string newStr = nullptr;
    if (env->String_NewUTF8(buffer.data(), utf8Size, &newStr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "strField", static_cast<ani_ref>(newStr));
    return newStr;
}

ani_int GetStringLength(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "strField", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size len = 0;
    if (env->String_GetUTF8Size(static_cast<ani_string>(r), &len) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(len);
}

ani_string GetSubstring(ani_env *env, ani_object mgr, ani_int start, ani_int length)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "strField", &r) != ANI_OK) {
        return nullptr;
    }
    ani_string original = static_cast<ani_string>(r);
    std::vector<char> buffer(static_cast<size_t>(length) + 1);
    ani_size resultSize = 0;
    if (env->String_GetUTF8SubString(original, static_cast<ani_size>(start),
                                     static_cast<ani_size>(length), buffer.data(),
                                     buffer.size(), &resultSize) != ANI_OK) {
        return nullptr;
    }
    ani_string substr = nullptr;
    env->String_NewUTF8(buffer.data(), resultSize, &substr);
    return substr;
}

ani_array CreateObjectArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_ref undefinedRef = nullptr;
    if (env->GetUndefined(&undefinedRef) != ANI_OK) {
        return nullptr;
    }
    ani_array array = nullptr;
    if (env->Array_New(static_cast<ani_size>(size), undefinedRef, &array) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "objArray", static_cast<ani_ref>(array));
    return array;
}

ani_status SetArrayElement(ani_env *env, ani_object mgr, ani_int index, ani_object value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "objArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->Array_Set(static_cast<ani_array>(r), static_cast<ani_size>(index), value);
}

ani_object GetExplicitNull(ani_env *env)
{
    ani_ref nullRef = nullptr;
    return (env->GetNull(&nullRef) == ANI_OK) ? static_cast<ani_object>(nullRef) : nullptr;
}

ani_object GetArrayElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "objArray", &r) != ANI_OK) {
        return GetExplicitNull(env);
    }
    ani_ref elem = nullptr;
    if (env->Array_Get(static_cast<ani_array>(r), static_cast<ani_size>(index), &elem) != ANI_OK) {
        return GetExplicitNull(env);
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elem, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return GetExplicitNull(env);
    }
    return static_cast<ani_object>(elem);
}

ani_int GetDynamicArrayLength(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "objArray", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size len = 0;
    if (env->Array_GetLength(static_cast<ani_array>(r), &len) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(len);
}

ani_valuearray_int CreateIntFixedArray7(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_int arr = nullptr;
    if (env->ValueArray_New_Int(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "intFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetIntRegion7(ani_env *env, ani_object mgr, ani_int start, ani_int count, ani_array values)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "intFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    std::vector<ani_int> intValues(count);
    for (ani_int i = 0; i < count; i++) {
        ani_ref elem = nullptr;
        env->Array_Get(values, static_cast<ani_size>(i), &elem);
        ani_int unboxed = 0;
        env->Primitive_Unbox_Int(static_cast<ani_object>(elem), &unboxed);
        intValues[i] = unboxed;
    }
    return env->ValueArray_SetRegion_Int(static_cast<ani_valuearray_int>(r),
                                         static_cast<ani_size>(start),
                                         static_cast<ani_size>(count), intValues.data());
}

ani_int GetIntElement7(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "intFixedArray", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int values[1] = {0};
    if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(r),
                                      static_cast<ani_size>(index),
                                      RES_INCREMENT_STEP, values) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return values[0];
}

ani_valuearray_boolean CreateBooleanFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_boolean arr = nullptr;
    if (env->ValueArray_New_Boolean(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "boolFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetBooleanElement(ani_env *env, ani_object mgr, ani_int index, ani_boolean value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boolFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_boolean values[1] = {value};
    return env->ValueArray_SetRegion_Boolean(static_cast<ani_valuearray_boolean>(r),
                                             static_cast<ani_size>(index),
                                             RES_INCREMENT_STEP, values);
}

ani_boolean GetBooleanElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "boolFixedArray", &r) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean values[1] = {ANI_FALSE};
    if (env->ValueArray_GetRegion_Boolean(static_cast<ani_valuearray_boolean>(r),
                                          static_cast<ani_size>(index),
                                          RES_INCREMENT_STEP, values) != ANI_OK) {
        return ANI_FALSE;
    }
    return values[0];
}

ani_valuearray_int CreateCharFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_int arr = nullptr;
    if (env->ValueArray_New_Int(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "charFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetCharElement(ani_env *env, ani_object mgr, ani_int index, ani_int value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "charFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_int values[1] = {value};
    return env->ValueArray_SetRegion_Int(static_cast<ani_valuearray_int>(r),
                                         static_cast<ani_size>(index),
                                         RES_INCREMENT_STEP, values);
}

ani_int GetCharElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "charFixedArray", &r) != ANI_OK) {
        return 0;
    }
    ani_int values[1] = {0};
    if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(r),
                                      static_cast<ani_size>(index),
                                      RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0;
    }
    return values[0];
}

ani_valuearray_int CreateByteFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_int arr = nullptr;
    if (env->ValueArray_New_Int(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "byteFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetByteElement(ani_env *env, ani_object mgr, ani_int index, ani_int value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "byteFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_int values[1] = {value};
    return env->ValueArray_SetRegion_Int(static_cast<ani_valuearray_int>(r),
                                         static_cast<ani_size>(index),
                                         RES_INCREMENT_STEP, values);
}

ani_int GetByteElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "byteFixedArray", &r) != ANI_OK) {
        return 0;
    }
    ani_int values[1] = {0};
    if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(r),
                                      static_cast<ani_size>(index),
                                      RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0;
    }
    return values[0];
}

ani_valuearray_int CreateShortFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_int arr = nullptr;
    if (env->ValueArray_New_Int(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "shortFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetShortElement(ani_env *env, ani_object mgr, ani_int index, ani_int value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "shortFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_int values[1] = {value};
    return env->ValueArray_SetRegion_Int(static_cast<ani_valuearray_int>(r),
                                         static_cast<ani_size>(index),
                                         RES_INCREMENT_STEP, values);
}

ani_int GetShortElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "shortFixedArray", &r) != ANI_OK) {
        return 0;
    }
    ani_int values[1] = {0};
    if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(r),
                                      static_cast<ani_size>(index),
                                      RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0;
    }
    return values[0];
}

ani_valuearray_long CreateLongFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_long arr = nullptr;
    if (env->ValueArray_New_Long(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "longFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetLongElement(ani_env *env, ani_object mgr, ani_int index, ani_long value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "longFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_long values[1] = {value};
    return env->ValueArray_SetRegion_Long(static_cast<ani_valuearray_long>(r),
                                          static_cast<ani_size>(index),
                                          RES_INCREMENT_STEP, values);
}

ani_long GetLongElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "longFixedArray", &r) != ANI_OK) {
        return 0;
    }
    ani_long values[1] = {0};
    if (env->ValueArray_GetRegion_Long(static_cast<ani_valuearray_long>(r),
                                       static_cast<ani_size>(index),
                                       RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0;
    }
    return values[0];
}

ani_valuearray_float CreateFloatFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_float arr = nullptr;
    if (env->ValueArray_New_Float(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "floatFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetFloatElement(ani_env *env, ani_object mgr, ani_int index, ani_float value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "floatFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_float values[1] = {value};
    return env->ValueArray_SetRegion_Float(static_cast<ani_valuearray_float>(r),
                                           static_cast<ani_size>(index),
                                           RES_INCREMENT_STEP, values);
}

ani_float GetFloatElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "floatFixedArray", &r) != ANI_OK) {
        return 0.0F;
    }
    ani_float values[1] = {0.0F};
    if (env->ValueArray_GetRegion_Float(static_cast<ani_valuearray_float>(r),
                                        static_cast<ani_size>(index),
                                        RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0.0F;
    }
    return values[0];
}

ani_valuearray_double CreateDoubleFixedArray(ani_env *env, ani_object mgr, ani_int size)
{
    ani_valuearray_double arr = nullptr;
    if (env->ValueArray_New_Double(static_cast<ani_size>(size), &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "doubleFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_status SetDoubleElement(ani_env *env, ani_object mgr, ani_int index, ani_double value)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "doubleFixedArray", &r) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_double values[1] = {value};
    return env->ValueArray_SetRegion_Double(static_cast<ani_valuearray_double>(r),
                                            static_cast<ani_size>(index),
                                            RES_INCREMENT_STEP, values);
}

ani_double GetDoubleElement(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "doubleFixedArray", &r) != ANI_OK) {
        return 0.0;
    }
    ani_double values[1] = {0.0};
    if (env->ValueArray_GetRegion_Double(static_cast<ani_valuearray_double>(r),
                                         static_cast<ani_size>(index),
                                         RES_INCREMENT_STEP, values) != ANI_OK) {
        return 0.0;
    }
    return values[0];
}

ani_fixedarray CreateRefFixedArray7(ani_env *env, ani_object mgr, ani_int size)
{
    ani_class objClass = nullptr;
    if (env->FindClass("std.core.Object", &objClass) != ANI_OK) {
        return nullptr;
    }
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return nullptr;
    }
    ani_fixedarray arr = nullptr;
    if (env->FixedArray_New(static_cast<ani_type>(objClass), static_cast<ani_size>(size),
                            nullRef, &arr) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "refFixedArray", static_cast<ani_ref>(arr));
    return arr;
}

ani_object GetRefElement7(ani_env *env, ani_object mgr, ani_int index)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "refFixedArray", &r) != ANI_OK) {
        return GetExplicitNull(env);
    }
    ani_ref elem = nullptr;
    if (env->FixedArray_Get(static_cast<ani_fixedarray>(r), static_cast<ani_size>(index),
                            &elem) != ANI_OK) {
        return GetExplicitNull(env);
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elem, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return GetExplicitNull(env);
    }
    ani_boolean isUndefined = ANI_FALSE;
    if (env->Reference_IsUndefined(elem, &isUndefined) == ANI_OK && isUndefined == ANI_TRUE) {
        return GetExplicitNull(env);
    }
    return static_cast<ani_object>(elem);
}

ani_arraybuffer CreateArrayBuffer(ani_env *env, ani_object mgr, ani_int size)
{
    void *data = nullptr;
    ani_arraybuffer buffer = nullptr;
    if (env->CreateArrayBuffer(static_cast<size_t>(size), &data, &buffer) != ANI_OK) {
        return nullptr;
    }
    env->Object_SetFieldByName_Ref(mgr, "bufferField", static_cast<ani_ref>(buffer));
    return buffer;
}

ani_int GetByteLength(ani_env *env, ani_object mgr)
{
    ani_ref r = nullptr;
    if (env->Object_GetFieldByName_Ref(mgr, "bufferField", &r) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(r, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    void *data = nullptr;
    size_t length = 0;
    if (env->ArrayBuffer_GetInfo(static_cast<ani_arraybuffer>(r), &data, &length) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(length);
}

ani_boolean FindEnumWithFallback(ani_env *env, const char *name, ani_enum *out)
{
    if (env->FindEnum(name, out) == ANI_OK) {
        return ANI_TRUE;
    }
    env->ResetError();
    std::string full = std::string(ETS_INDEX_PREFIX) + name;
    if (env->FindEnum(full.c_str(), out) == ANI_OK) {
        return ANI_TRUE;
    }
    env->ResetError();
    return ANI_FALSE;
}

ani_boolean FindNamespaceWithFallback(ani_env *env, const char *name, ani_namespace *out)
{
    if (env->FindNamespace(name, out) == ANI_OK) {
        return ANI_TRUE;
    }
    env->ResetError();
    std::string full = std::string(ETS_INDEX_PREFIX) + name;
    if (env->FindNamespace(full.c_str(), out) == ANI_OK) {
        return ANI_TRUE;
    }
    env->ResetError();
    return ANI_FALSE;
}

ani_double CreateAndCallFunction(ani_env *env, ani_object mgr)
{
    (void)mgr;
    ani_namespace ns = nullptr;
    if (env->FindNamespace("entry.src.main.src.ets.Index.TestModule", &ns) != ANI_OK) {
        env->ResetError();
        if (env->FindNamespace("TestModule", &ns) != ANI_OK) {
            return 0.0;
        }
    }
    ani_function func = nullptr;
    if (env->Namespace_FindFunction(ns, "makeFifteen", ":d", &func) != ANI_OK) {
        return 0.0;
    }
    ani_double result = 0.0;
    return (env->Function_Call_Double(func, &result) == ANI_OK) ? result : 0.0;
}

ani_int CallWithCallback(ani_env *env, ani_object mgr, ani_fn_object callback, ani_int value)
{
    (void)mgr;
    ani_object boxedValue = nullptr;
    if (env->Primitive_Box_Int(value, &boxedValue) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_ref args[1] = {static_cast<ani_ref>(boxedValue)};
    ani_ref resultRef = nullptr;
    if (env->FunctionalObject_Call(callback, 1, args, &resultRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int result = 0;
    return (env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &result) == ANI_OK)
               ? result : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_status StoreCallback(ani_env *env, ani_object mgr, ani_fn_object callback)
{
    (void)mgr;
    if (g_storedCallbackRef != nullptr) {
        env->GlobalReference_Delete(g_storedCallbackRef);
    }
    return env->GlobalReference_Create(static_cast<ani_ref>(callback), &g_storedCallbackRef);
}

ani_status ExecuteStoredCallback(ani_env *env, ani_object mgr)
{
    (void)mgr;
    if (g_storedCallbackRef == nullptr) {
        return ANI_OK;
    }
    ani_fn_object callback = static_cast<ani_fn_object>(g_storedCallbackRef);
    ani_ref result = nullptr;
    return env->FunctionalObject_Call(callback, 0, nullptr, &result);
}

ani_status ThrowCustomError(ani_env *env, ani_object mgr, ani_string message)
{
    (void)mgr;
    ani_class errorClass = nullptr;
    if (env->FindClass("std.core.Error", &errorClass) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(errorClass, "<ctor>", "C{std.core.String}:", &ctor) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_error error = nullptr;
    if (env->Object_New(errorClass, ctor,
                        reinterpret_cast<ani_object *>(&error), message) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->ThrowError(error);
}

ani_string CatchAndHandleError(ani_env *env, ani_object mgr)
{
    (void)mgr;
    ani_boolean hasError = ANI_FALSE;
    if (env->ExistUnhandledError(&hasError) != ANI_OK || !hasError) {
        return nullptr;
    }
    ani_error error = nullptr;
    if (env->GetUnhandledError(&error) != ANI_OK) {
        return nullptr;
    }
    ani_ref messageRef = nullptr;
    if (env->Object_GetPropertyByName_Ref(static_cast<ani_object>(error), "message",
                                          &messageRef) != ANI_OK) {
        return nullptr;
    }
    env->ResetError();
    return static_cast<ani_string>(messageRef);
}

ani_int GetEnumValueByName(ani_env *env, ani_object mgr, ani_string enumName, ani_string itemName)
{
    (void)mgr;
    ani_size enumSize = 0;
    ani_size itemSize = 0;
    if (env->String_GetUTF8Size(enumName, &enumSize) != ANI_OK ||
        env->String_GetUTF8Size(itemName, &itemSize) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    std::vector<char> enumBuf(enumSize + 1);
    std::vector<char> itemBuf(itemSize + 1);
    ani_size out1 = 0;
    ani_size out2 = 0;
    env->String_GetUTF8(enumName, enumBuf.data(), enumBuf.size(), &out1);
    env->String_GetUTF8(itemName, itemBuf.data(), itemBuf.size(), &out2);
    ani_enum enumObj = nullptr;
    if (FindEnumWithFallback(env, enumBuf.data(), &enumObj) != ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_enum_item enumItem = nullptr;
    if (env->Enum_GetEnumItemByName(enumObj, itemBuf.data(), &enumItem) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    return (env->EnumItem_GetValue_Int(enumItem, &value) == ANI_OK)
               ? value : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_int GetEnumItemCount(ani_env *env, ani_object mgr, ani_string enumName)
{
    (void)mgr;
    ani_size enumSize = 0;
    if (env->String_GetUTF8Size(enumName, &enumSize) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    std::vector<char> enumBuf(enumSize + 1);
    ani_size out = 0;
    env->String_GetUTF8(enumName, enumBuf.data(), enumBuf.size(), &out);
    ani_enum enumObj = nullptr;
    if (FindEnumWithFallback(env, enumBuf.data(), &enumObj) != ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int count = 0;
    ani_enum_item item = nullptr;
    while (env->Enum_GetEnumItemByIndex(enumObj, static_cast<ani_size>(count), &item) == ANI_OK) {
        count++;
    }
    return count;
}

ani_object FindClassByNameApi(ani_env *env, ani_object mgr, ani_string className)
{
    (void)mgr;
    ani_size size = 0;
    if (env->String_GetUTF8Size(className, &size) != ANI_OK) {
        return nullptr;
    }
    std::vector<char> buf(size + 1);
    ani_size out = 0;
    env->String_GetUTF8(className, buf.data(), buf.size(), &out);
    ani_class cls = nullptr;
    if (env->FindClass(buf.data(), &cls) != ANI_OK) {
        return nullptr;
    }
    return static_cast<ani_object>(cls);
}

ani_int GetModuleFunction(ani_env *env, ani_object mgr, ani_string moduleName, ani_string funcName)
{
    (void)mgr;
    ani_size mSize = 0;
    ani_size fSize = 0;
    env->String_GetUTF8Size(moduleName, &mSize);
    env->String_GetUTF8Size(funcName, &fSize);
    std::vector<char> mBuf(mSize + 1);
    std::vector<char> fBuf(fSize + 1);
    ani_size o1 = 0;
    ani_size o2 = 0;
    env->String_GetUTF8(moduleName, mBuf.data(), mBuf.size(), &o1);
    env->String_GetUTF8(funcName, fBuf.data(), fBuf.size(), &o2);
    ani_namespace ns = nullptr;
    if (FindNamespaceWithFallback(env, mBuf.data(), &ns) == ANI_TRUE) {
        ani_function nsFunc = nullptr;
        if (env->Namespace_FindFunction(ns, fBuf.data(), ":i", &nsFunc) == ANI_OK) {
            ani_int nsResult = 0;
            if (env->Function_Call_Int(nsFunc, &nsResult) == ANI_OK) {
                return nsResult;
            }
        }
    }
    ani_module module = nullptr;
    if (env->FindModule(mBuf.data(), &module) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_function func = nullptr;
    if (env->Module_FindFunction(module, fBuf.data(), ":i", &func) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int result = 0;
    return (env->Function_Call_Int(static_cast<ani_function>(func), &result) == ANI_OK)
               ? result : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_boolean PrepareStringArgs(ani_env *env, ani_string s1, ani_string s2,
                              std::vector<char> &out1, std::vector<char> &out2);

ani_int GetNamespaceFunction(ani_env *env, ani_object mgr, ani_string nsName,
                             ani_string funcName, ani_array args)
{
    (void)mgr;
    std::vector<char> nBuf;
    std::vector<char> fBuf;
    if (!PrepareStringArgs(env, nsName, funcName, nBuf, fBuf)) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_namespace ns = nullptr;
    if (FindNamespaceWithFallback(env, nBuf.data(), &ns) != ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_function func = nullptr;
    if (env->Namespace_FindFunction(ns, fBuf.data(), "ii:i", &func) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_ref elemA = nullptr;
    ani_ref elemB = nullptr;
    ani_int a = 0;
    ani_int b = 0;
    if (env->Array_Get(args, 0, &elemA) != ANI_OK ||
        env->Array_Get(args, 1, &elemB) != ANI_OK ||
        env->Primitive_Unbox_Int(static_cast<ani_object>(elemA), &a) != ANI_OK ||
        env->Primitive_Unbox_Int(static_cast<ani_object>(elemB), &b) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int result = 0;
    return (env->Function_Call_Int(static_cast<ani_function>(func), &result, a, b) == ANI_OK)
               ? result : (RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
}

ani_boolean PrepareStringArgs(ani_env *env, ani_string s1, ani_string s2,
                              std::vector<char> &out1, std::vector<char> &out2)
{
    ani_size s1Size = 0;
    ani_size s2Size = 0;
    if (env->String_GetUTF8Size(s1, &s1Size) != ANI_OK ||
        env->String_GetUTF8Size(s2, &s2Size) != ANI_OK) {
        return ANI_FALSE;
    }
    out1.resize(s1Size + 1);
    out2.resize(s2Size + 1);
    ani_size o1 = 0;
    ani_size o2 = 0;
    env->String_GetUTF8(s1, out1.data(), out1.size(), &o1);
    env->String_GetUTF8(s2, out2.data(), out2.size(), &o2);
    return ANI_TRUE;
}

const ani_native_function g_aniObjectTypeMethods[] = {
    {"createBoxedBoolean", "z:z", reinterpret_cast<void *>(CreateBoxedBoolean)},
    {"createBoxedChar", "i:i", reinterpret_cast<void *>(CreateBoxedChar)},
    {"createBoxedByte", "i:i", reinterpret_cast<void *>(CreateBoxedByte)},
    {"createBoxedShort", "i:i", reinterpret_cast<void *>(CreateBoxedShort)},
    {"createBoxedInt", "i:i", reinterpret_cast<void *>(CreateBoxedInt)},
    {"createBoxedLong", "l:l", reinterpret_cast<void *>(CreateBoxedLong)},
    {"createBoxedFloat", "f:f", reinterpret_cast<void *>(CreateBoxedFloat)},
    {"createBoxedDouble", "d:d", reinterpret_cast<void *>(CreateBoxedDouble)},
    {"verifyBoxedBoolean", ":z", reinterpret_cast<void *>(VerifyBoxedBoolean)},
    {"verifyBoxedChar", ":i", reinterpret_cast<void *>(VerifyBoxedChar)},
    {"verifyBoxedByte", ":i", reinterpret_cast<void *>(VerifyBoxedByte)},
    {"verifyBoxedShort", ":i", reinterpret_cast<void *>(VerifyBoxedShort)},
    {"verifyBoxedInt", ":i", reinterpret_cast<void *>(VerifyBoxedInt)},
    {"verifyBoxedLong", ":l", reinterpret_cast<void *>(VerifyBoxedLong)},
    {"verifyBoxedFloat", ":f", reinterpret_cast<void *>(VerifyBoxedFloat)},
    {"verifyBoxedDouble", ":d", reinterpret_cast<void *>(VerifyBoxedDouble)},
    {"createUtf8String", "C{std.core.String}:C{std.core.String}",
     reinterpret_cast<void *>(CreateUtf8String)},
    {"getStringLength", ":i", reinterpret_cast<void *>(GetStringLength)},
    {"getSubstring", "ii:C{std.core.String}", reinterpret_cast<void *>(GetSubstring)},
    {"createObjectArray", "i:C{std.core.Array}", reinterpret_cast<void *>(CreateObjectArray)},
    {"setArrayElement", "iC{std.core.Object}:", reinterpret_cast<void *>(SetArrayElement)},
    {"getArrayElement", "i:X{C{std.core.Null}C{std.core.Object}}",
     reinterpret_cast<void *>(GetArrayElement)},
    {"getArrayLength", ":i", reinterpret_cast<void *>(GetDynamicArrayLength)},
    {"createIntFixedArray", "i:A{C{std.core.Int}}", reinterpret_cast<void *>(CreateIntFixedArray7)},
    {"setIntRegion", "iiC{std.core.Array}:", reinterpret_cast<void *>(SetIntRegion7)},
    {"getIntElement", "i:i", reinterpret_cast<void *>(GetIntElement7)},
    {"createBooleanFixedArray", "i:A{C{std.core.Boolean}}",
     reinterpret_cast<void *>(CreateBooleanFixedArray)},
    {"setBooleanElement", "iz:", reinterpret_cast<void *>(SetBooleanElement)},
    {"getBooleanElement", "i:z", reinterpret_cast<void *>(GetBooleanElement)},
    {"createCharFixedArray", "i:A{C{std.core.Int}}", reinterpret_cast<void *>(CreateCharFixedArray)},
    {"setCharElement", "ii:", reinterpret_cast<void *>(SetCharElement)},
    {"getCharElement", "i:i", reinterpret_cast<void *>(GetCharElement)},
    {"createByteFixedArray", "i:A{C{std.core.Int}}", reinterpret_cast<void *>(CreateByteFixedArray)},
    {"setByteElement", "ii:", reinterpret_cast<void *>(SetByteElement)},
    {"getByteElement", "i:i", reinterpret_cast<void *>(GetByteElement)},
    {"createShortFixedArray", "i:A{C{std.core.Int}}",
     reinterpret_cast<void *>(CreateShortFixedArray)},
    {"setShortElement", "ii:", reinterpret_cast<void *>(SetShortElement)},
    {"getShortElement", "i:i", reinterpret_cast<void *>(GetShortElement)},
    {"createLongFixedArray", "i:A{C{std.core.Long}}",
     reinterpret_cast<void *>(CreateLongFixedArray)},
    {"setLongElement", "il:", reinterpret_cast<void *>(SetLongElement)},
    {"getLongElement", "i:l", reinterpret_cast<void *>(GetLongElement)},
    {"createFloatFixedArray", "i:A{C{std.core.Float}}",
     reinterpret_cast<void *>(CreateFloatFixedArray)},
    {"setFloatElement", "if:", reinterpret_cast<void *>(SetFloatElement)},
    {"getFloatElement", "i:f", reinterpret_cast<void *>(GetFloatElement)},
    {"createDoubleFixedArray", "i:A{C{std.core.Double}}",
     reinterpret_cast<void *>(CreateDoubleFixedArray)},
    {"setDoubleElement", "id:", reinterpret_cast<void *>(SetDoubleElement)},
    {"getDoubleElement", "i:d", reinterpret_cast<void *>(GetDoubleElement)},
    {"createRefFixedArray", "i:A{C{std.core.Object}}",
     reinterpret_cast<void *>(CreateRefFixedArray7)},
    {"getRefElement", "i:X{C{std.core.Null}C{std.core.Object}}",
     reinterpret_cast<void *>(GetRefElement7)},
    {"createArrayBuffer", "i:C{std.core.ArrayBuffer}",
     reinterpret_cast<void *>(CreateArrayBuffer)},
    {"getByteLength", ":i", reinterpret_cast<void *>(GetByteLength)},
    {"createAndCallFunction", ":d", reinterpret_cast<void *>(CreateAndCallFunction)},
    {"callWithCallback", "C{std.core.Function1}i:i",
     reinterpret_cast<void *>(CallWithCallback)},
    {"storeCallback", "C{std.core.Function0}:", reinterpret_cast<void *>(StoreCallback)},
    {"executeStoredCallback", ":", reinterpret_cast<void *>(ExecuteStoredCallback)},
    {"throwCustomError", "C{std.core.String}:", reinterpret_cast<void *>(ThrowCustomError)},
    {"catchAndHandleError", ":X{C{std.core.Null}C{std.core.String}}",
     reinterpret_cast<void *>(CatchAndHandleError)},
    {"getEnumValueByName", "C{std.core.String}C{std.core.String}:i",
     reinterpret_cast<void *>(GetEnumValueByName)},
    {"getEnumItemCount", "C{std.core.String}:i", reinterpret_cast<void *>(GetEnumItemCount)},
    {"findClassByName", "C{std.core.String}:X{C{std.core.Null}C{std.core.Object}}",
     reinterpret_cast<void *>(FindClassByNameApi)},
    {"getModuleFunction", "C{std.core.String}C{std.core.String}:i",
     reinterpret_cast<void *>(GetModuleFunction)},
    {"getNamespaceFunction", "C{std.core.String}C{std.core.String}C{std.core.Array}:i",
     reinterpret_cast<void *>(GetNamespaceFunction)},
};

const char *const CLASS_PRIMITIVE = "entry.src.main.src.ets.Index.PrimitiveTypeManager";
const char *const CLASS_STRING = "entry.src.main.src.ets.Index.StringObjectManager";
const char *const CLASS_DYNARRAY = "entry.src.main.src.ets.Index.DynamicArrayObjectManager";
const char *const CLASS_FIXED = "entry.src.main.src.ets.Index.FixedArrayTypeManager";
const char *const CLASS_BUFFER = "entry.src.main.src.ets.Index.ArrayBufferObjectManager";
const char *const CLASS_FUNCTION = "entry.src.main.src.ets.Index.FunctionObjectManager";
const char *const CLASS_ERROR = "entry.src.main.src.ets.Index.ErrorObjectManager";
const char *const CLASS_ENUM = "entry.src.main.src.ets.Index.EnumObjectManager";
const char *const CLASS_CLASS = "entry.src.main.src.ets.Index.ClassObjectManager";
const char *const CLASS_MODULE = "entry.src.main.src.ets.Index.ModuleObjectManager";
const char *const CLASS_NAMESPACE = "entry.src.main.src.ets.Index.NamespaceObjectManager";

}  // namespace

ani_status BindAniObjectTypeTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("AniObjectTypeTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    const char *const classes[] = {
        CLASS_PRIMITIVE, CLASS_STRING,   CLASS_DYNARRAY, CLASS_FIXED,
        CLASS_BUFFER,    CLASS_FUNCTION, CLASS_ERROR,    CLASS_ENUM,
        CLASS_CLASS,     CLASS_MODULE,   CLASS_NAMESPACE
    };
    const ani_size methodCount = sizeof(g_aniObjectTypeMethods) / sizeof(g_aniObjectTypeMethods[0]);
    for (const char *clsName : classes) {
        BindClassMethods(env, clsName, g_aniObjectTypeMethods, methodCount, "AniObjectTypeTest");
    }
    return ANI_OK;
}

void CleanupAniObjectTypeTest(ani_env *env)
{
    SafeDeleteGlobalRef(env, g_storedCallbackRef);
}
