/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_TUPLE_OPERATIONS_H
#define ARKTS_ANI_TEST_TUPLE_OPERATIONS_H

#include "Common.h"
#include <thread>
#include <cstring>

// NOTE: TupleValue interface names are derived from ANI naming conventions.
// If the actual ani.h exposes different names, adjust accordingly.
// Expected 19 interfaces:
//   TupleValue_GetNumberOfItems
//   TupleValue_GetItem_{Boolean,Char,Byte,Short,Int,Long,Float,Double,Ref}
//   TupleValue_SetItem_{Boolean,Char,Byte,Short,Int,Long,Float,Double,Ref}

constexpr int K_INDEX_0 = 0;
constexpr int K_INDEX_1 = 1;
constexpr int K_INDEX_2 = 2;
constexpr int K_INDEX_3 = 3;
constexpr int K_INDEX_4 = 4;
constexpr int K_INDEX_5 = 5;
constexpr int K_INDEX_6 = 6;

constexpr int K_VAL_1 = 1;
constexpr int K_VAL_2 = 2;
constexpr int K_VAL_4 = 4;
constexpr int K_VAL_10 = 10;
constexpr int K_VAL_11 = 11;
constexpr int K_VAL_20 = 20;
constexpr int K_VAL_22 = 22;
constexpr int K_VAL_30 = 30;
constexpr int K_VAL_33 = 33;
constexpr int K_VAL_42 = 42;
constexpr int K_VAL_44 = 44;
constexpr int K_VAL_99 = 99;
constexpr int K_VAL_100 = 100;
constexpr int K_VAL_200 = 200;
constexpr int K_VAL_300 = 300;
constexpr int K_VAL_400 = 400;
constexpr int K_VAL_555 = 555;
constexpr int K_VAL_999 = 999;

constexpr double K_VAL_1_5 = 1.5;
constexpr double K_VAL_3_14 = 3.14;
constexpr float K_VAL_5_0 = 5.0f;
constexpr float K_VAL_5_5 = 5.5f;
constexpr double K_VAL_6_6 = 6.6;
constexpr double K_VAL_9_9 = 9.9;

constexpr ani_size K_SIZE_3 = 3;
constexpr ani_size K_SIZE_4 = 4;

constexpr int K_LOOP_100 = 100;
constexpr int K_LOOP_1000 = 1000;
constexpr int K_THREAD_2 = 2;
constexpr int K_THREAD_4 = 4;

constexpr int K_SCOPE_REFS_100 = 100;

inline ani_vm *g_tuple_vm = nullptr;

ani_tuple_value GetTuple(ani_env *env, const char *fnName)
{
    ani_module mod {};
    if (env->FindModule("entry.src.main.src.ets.TupleOperations", &mod) != ANI_OK) {
        return nullptr;
    }
    ani_function fn {};
    if (env->Module_FindFunction(mod, fnName, nullptr, &fn) != ANI_OK) {
        return nullptr;
    }
    ani_ref result {};
    if (env->Function_Call_Ref(fn, &result) != ANI_OK) {
        return nullptr;
    }
    return static_cast<ani_tuple_value>(result);
}

inline ani_string TupleCreateString(ani_env *env, const char *str)
{
    ani_string result {};
    env->String_NewUTF8(str, strlen(str), &result);
    return result;
}

inline std::string TupleGetString(ani_env *env, ani_string str)
{
    ani_size sz {};
    env->String_GetUTF8Size(str, &sz);
    std::string buf(sz + 1, '\0');
    ani_size written {};
    env->String_GetUTF8SubString(str, 0, sz, buf.data(), buf.size(), &written);
    buf.resize(written);
    return buf;
}

// ==================== NORM (21) ====================

ani_int test_Tuple_Norm_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    ASSERT_EQ(size, K_SIZE_4);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getBoolTuple");
    ASSERT_NE(tuple, nullptr);
    ani_boolean val {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_1, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_20);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getDoubleTuple");
    ASSERT_NE(tuple, nullptr);
    ani_double val {};
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_1_5);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0005([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getRefTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref val {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_NE(val, nullptr);
    std::string s = TupleGetString(env, static_cast<ani_string>(val));
    ASSERT_STREQ(s.c_str(), "test");
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0006([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ani_byte val {};
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, K_INDEX_1, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_1);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0007([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ani_short val {};
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, K_INDEX_2, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_2);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0008([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ani_long val {};
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, K_INDEX_4, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_4);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0009([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ani_float val {};
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, K_INDEX_5, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_5_0);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0010([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_char val {};
    ani_status s = env->TupleValue_GetItem_Char(tuple, K_INDEX_0, &val);
    ASSERT_EQ(s, ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0011([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getBoolTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, K_INDEX_0, ANI_FALSE), ANI_OK);
    ani_boolean val {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0012([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, K_VAL_99), ANI_OK);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_99);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0013([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getDoubleTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, K_INDEX_1, K_VAL_9_9), ANI_OK);
    ani_double val {};
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, K_INDEX_1, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_9_9);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0014([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getRefTuple");
    ASSERT_NE(tuple, nullptr);
    ani_string str = TupleCreateString(env, "newstr");
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, K_INDEX_0, str), ANI_OK);
    ani_ref val {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &val), ANI_OK);
    std::string s = TupleGetString(env, static_cast<ani_string>(val));
    ASSERT_STREQ(s.c_str(), "newstr");
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0015([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, K_INDEX_1, K_VAL_100), ANI_OK);
    ani_byte val {};
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, K_INDEX_1, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_100);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0016([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, K_INDEX_2, K_VAL_200), ANI_OK);
    ani_short val {};
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, K_INDEX_2, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_200);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0017([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, K_INDEX_4, K_VAL_400), ANI_OK);
    ani_long val {};
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, K_INDEX_4, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_400);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0018([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, K_INDEX_5, K_VAL_5_5), ANI_OK);
    ani_float val {};
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, K_INDEX_5, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_5_5);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0019([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_status s = env->TupleValue_SetItem_Char(tuple, K_INDEX_0, 'X');
    if (s != ANI_OK && s != ANI_INVALID_TYPE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0020([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int v0 {};
    ani_int v2 {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &v0), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_2, &v2), ANI_OK);
    ASSERT_EQ(v0, K_VAL_10);
    ASSERT_EQ(v2, K_VAL_30);
    return ANI_TRUE;
}

ani_int test_Tuple_Norm_0021([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    ASSERT_EQ(size, K_SIZE_4);
    return ANI_TRUE;
}

// ==================== ABNM (12) ====================

ani_int test_Tuple_Abnm_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, nullptr, &size), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(nullptr, tuple, &size), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int val {};
    ani_status s = env->TupleValue_GetItem_Int(tuple, K_VAL_100, &val);
    ASSERT_NE(s, ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0005([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0006([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref val {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(nullptr, K_INDEX_0, &val), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0007([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_status s = env->TupleValue_SetItem_Int(tuple, K_VAL_100, K_VAL_99);
    ASSERT_NE(s, ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0008([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str = TupleCreateString(env, "x");
    ASSERT_EQ(env->TupleValue_SetItem_Ref(nullptr, K_INDEX_0, str), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0009([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_boolean val {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &val), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0010([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getBoolTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0011([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_status s = env->TupleValue_SetItem_Boolean(tuple, K_INDEX_0, ANI_TRUE);
    if (s != ANI_OK && s != ANI_INVALID_TYPE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_Tuple_Abnm_0012([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(nullptr, nullptr, &size), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

// ==================== FUNC (8) ====================

ani_int test_Tuple_Func_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    ASSERT_EQ(size, K_SIZE_4);
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_10);
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getTupleForSet");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, K_VAL_999), ANI_OK);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_999);
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getRefTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref val {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &val), ANI_OK);
    std::string s = TupleGetString(env, static_cast<ani_string>(val));
    ASSERT_STREQ(s.c_str(), "test");
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0005([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getRefTuple");
    ASSERT_NE(tuple, nullptr);
    ani_string str = TupleCreateString(env, "newval");
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, K_INDEX_0, str), ANI_OK);
    ani_ref val {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &val), ANI_OK);
    std::string s = TupleGetString(env, static_cast<ani_string>(val));
    ASSERT_STREQ(s.c_str(), "newval");
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0006([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, K_INDEX_0, ANI_FALSE), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, K_INDEX_1, K_VAL_11), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, K_INDEX_2, K_VAL_22), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_3, K_VAL_33), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, K_INDEX_4, K_VAL_44), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, K_INDEX_5, K_VAL_5_5), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, K_INDEX_6, K_VAL_6_6), ANI_OK);
    ani_boolean b {};
    ani_byte by {};
    ani_short s {};
    ani_int i {};
    ani_long l {};
    ani_float f {};
    ani_double d {};
    env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &b);
    env->TupleValue_GetItem_Byte(tuple, K_INDEX_1, &by);
    env->TupleValue_GetItem_Short(tuple, K_INDEX_2, &s);
    env->TupleValue_GetItem_Int(tuple, K_INDEX_3, &i);
    env->TupleValue_GetItem_Long(tuple, K_INDEX_4, &l);
    env->TupleValue_GetItem_Float(tuple, K_INDEX_5, &f);
    env->TupleValue_GetItem_Double(tuple, K_INDEX_6, &d);
    ASSERT_EQ(b, ANI_FALSE);
    ASSERT_EQ(by, K_VAL_11);
    ASSERT_EQ(s, K_VAL_22);
    ASSERT_EQ(i, K_VAL_33);
    ASSERT_EQ(l, K_VAL_44);
    ASSERT_EQ(f, K_VAL_5_5);
    ASSERT_EQ(d, K_VAL_6_6);
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0007([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int v0 {};
    ani_int v2 {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &v0), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_2, &v2), ANI_OK);
    ASSERT_EQ(v0, K_VAL_10);
    ASSERT_EQ(v2, K_VAL_30);
    return ANI_TRUE;
}

ani_int test_Tuple_Func_0008([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size s1 {};
    ani_size s2 {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &s1), ANI_OK);
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &s2), ANI_OK);
    ASSERT_EQ(s1, s2);
    return ANI_TRUE;
}

// ==================== RETV (4) ====================

ani_int test_Tuple_Retv_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ani_status s = env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size);
    ASSERT_EQ(s, ANI_OK);
    ASSERT_NE(size, 0);
    return ANI_TRUE;
}

ani_int test_Tuple_Retv_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getAllPrimitiveTuple");
    ASSERT_NE(tuple, nullptr);
    ani_boolean b {};
    ani_int i {};
    ani_double d {};
    ani_ref r {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &b), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_3, &i), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, K_INDEX_6, &d), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Retv_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getRefTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref val {};
    ani_status s = env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &val);
    ASSERT_EQ(s, ANI_OK);
    ASSERT_NE(val, nullptr);
    return ANI_TRUE;
}

ani_int test_Tuple_Retv_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ani_status s = env->c_api->TupleValue_GetNumberOfItems(env, nullptr, &size);
    ASSERT_EQ(s, ANI_INVALID_ARGS);
    return ANI_TRUE;
}

// ==================== ERCD (5) ====================

ani_int test_Tuple_Ercd_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, nullptr, &size), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, nullptr, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Ercd_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int val {};
    ani_status s1 = env->TupleValue_GetItem_Int(tuple, K_LOOP_1000, &val);
    ani_status s2 = env->TupleValue_SetItem_Int(tuple, K_LOOP_1000, 0);
    ASSERT_NE(s1, ANI_OK);
    ASSERT_NE(s2, ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Ercd_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value ti = GetTuple(env, "getIntTuple");
    ani_tuple_value tb = GetTuple(env, "getBoolTuple");
    ASSERT_NE(ti, nullptr);
    ASSERT_NE(tb, nullptr);
    ani_boolean bv {};
    ani_int iv {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(ti, K_INDEX_0, &bv), ANI_INVALID_TYPE);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tb, K_INDEX_0, &iv), ANI_INVALID_TYPE);
    ani_status setS = env->TupleValue_SetItem_Boolean(ti, K_INDEX_0, ANI_TRUE);
    if (setS != ANI_OK && setS != ANI_INVALID_TYPE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_Tuple_Ercd_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(nullptr, nullptr, &size), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Tuple_Ercd_0005([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, nullptr, &size), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, nullptr, nullptr), ANI_INVALID_ARGS);
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_boolean bv {};
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_0, &bv), ANI_INVALID_TYPE);
    ani_int iv {};
    ani_status s = env->TupleValue_GetItem_Int(tuple, K_VAL_100, &iv);
    ASSERT_NE(s, ANI_OK);
    return ANI_TRUE;
}

// ==================== COMB (5) ====================

ani_int test_Tuple_Comb_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    ASSERT_EQ(size, K_SIZE_4);
    ani_int i {};
    ani_ref r {};
    ani_boolean b {};
    ani_double d {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &i), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_1, &r), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, K_INDEX_2, &b), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, K_INDEX_3, &d), ANI_OK);
    ASSERT_EQ(i, K_VAL_42);
    ASSERT_EQ(b, ANI_TRUE);
    ASSERT_EQ(d, K_VAL_3_14);
    return ANI_TRUE;
}

ani_int test_Tuple_Comb_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, K_VAL_100), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_1, K_VAL_200), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_2, K_VAL_300), ANI_OK);
    ani_int v0 {};
    ani_int v1 {};
    ani_int v2 {};
    env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &v0);
    env->TupleValue_GetItem_Int(tuple, K_INDEX_1, &v1);
    env->TupleValue_GetItem_Int(tuple, K_INDEX_2, &v2);
    ASSERT_EQ(v0, K_VAL_100);
    ASSERT_EQ(v1, K_VAL_200);
    ASSERT_EQ(v2, K_VAL_300);
    return ANI_TRUE;
}

ani_int test_Tuple_Comb_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_int orig {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &orig), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, K_VAL_555), ANI_OK);
    ani_int mid {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &mid), ANI_OK);
    ASSERT_EQ(mid, K_VAL_555);
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, orig), ANI_OK);
    ani_int restored {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &restored), ANI_OK);
    ASSERT_EQ(restored, orig);
    return ANI_TRUE;
}

ani_int test_Tuple_Comb_0004([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    ani_size size {};
    ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    ASSERT_EQ(size, K_SIZE_4);
    ani_int val {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
    ASSERT_EQ(val, K_VAL_42);
    return ANI_TRUE;
}

ani_int test_Tuple_Comb_0005([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value t1 = GetTuple(env, "getIntTuple");
    ani_tuple_value t2 = GetTuple(env, "getMixedTuple");
    ASSERT_NE(t1, nullptr);
    ASSERT_NE(t2, nullptr);
    ani_int v1 {};
    ani_double v2 {};
    ASSERT_EQ(env->TupleValue_GetItem_Int(t1, K_INDEX_0, &v1), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Double(t2, K_INDEX_3, &v2), ANI_OK);
    ASSERT_EQ(v1, K_VAL_10);
    ASSERT_EQ(v2, K_VAL_3_14);
    return ANI_TRUE;
}

// ==================== STAB (3) ====================

ani_int test_Tuple_Stab_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getMixedTuple");
    ASSERT_NE(tuple, nullptr);
    for (int i = 0; i < K_LOOP_1000; i++) {
        ani_size size {};
        ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
        ASSERT_EQ(size, K_SIZE_4);
    }
    return ANI_TRUE;
}

ani_int test_Tuple_Stab_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    for (int i = 0; i < K_LOOP_1000; i++) {
        ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, K_INDEX_0, i), ANI_OK);
        ani_int val {};
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
        ASSERT_EQ(val, i);
    }
    return ANI_TRUE;
}

ani_int test_Tuple_Stab_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    for (int i = 0; i < K_LOOP_1000; i++) {
        ani_int v0 {};
        ani_int v2 {};
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &v0), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_2, &v2), ANI_OK);
        ASSERT_EQ(v0, K_VAL_10);
        ASSERT_EQ(v2, K_VAL_30);
    }
    return ANI_TRUE;
}

// ==================== THRD (3) ====================

void TupleThrdReadWorker(ani_vm *vm, ani_ref gref, bool &ok)
{
    ani_env *threadEnv {};
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) == ANI_OK) {
        for (int i = 0; i < K_LOOP_100; i++) {
            ani_int val {};
            if (threadEnv->TupleValue_GetItem_Int(static_cast<ani_tuple_value>(gref), K_INDEX_0, &val) != ANI_OK) {
                ok = false;
            }
        }
        vm->DetachCurrentThread();
    } else {
        ok = false;
    }
}

void TupleThrdWriteWorker(ani_vm *vm, ani_ref gref, int threadId, bool &ok)
{
    ani_env *threadEnv {};
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) == ANI_OK) {
        for (int i = 0; i < K_LOOP_100; i++) {
            ani_status s = threadEnv->TupleValue_SetItem_Int(static_cast<ani_tuple_value>(gref), K_INDEX_0, threadId);
            if (s != ANI_OK) {
                ok = false;
            }
        }
        vm->DetachCurrentThread();
    } else {
        ok = false;
    }
}

ani_int test_Tuple_Thrd_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (g_tuple_vm == nullptr) {
        return ANI_FALSE;
    }
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref gref {};
    ASSERT_EQ(env->GlobalReference_Create(tuple, &gref), ANI_OK);
    bool ok = false;
    std::thread t([&ok, &gref]() {
        ani_env *threadEnv {};
        if (g_tuple_vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) == ANI_OK) {
            ani_tuple_value tref = static_cast<ani_tuple_value>(gref);
            ani_size size {};
            if (threadEnv->c_api->TupleValue_GetNumberOfItems(threadEnv, tref, &size) == ANI_OK && size == K_SIZE_3) {
                ok = true;
            }
            g_tuple_vm->DetachCurrentThread();
        }
    });
    t.join();
    env->GlobalReference_Delete(gref);
    ASSERT_EQ(ok, true);
    return ANI_TRUE;
}

ani_int test_Tuple_Thrd_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (g_tuple_vm == nullptr) {
        return ANI_FALSE;
    }
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref gref {};
    ASSERT_EQ(env->GlobalReference_Create(tuple, &gref), ANI_OK);
    bool ok = true;
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_4; t++) {
        threads.emplace_back([&ok, &gref]() {
            TupleThrdReadWorker(g_tuple_vm, gref, ok);
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(gref);
    ASSERT_EQ(ok, true);
    return ANI_TRUE;
}

ani_int test_Tuple_Thrd_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (g_tuple_vm == nullptr) {
        return ANI_FALSE;
    }
    ani_tuple_value tuple = GetTuple(env, "getIntTuple");
    ASSERT_NE(tuple, nullptr);
    ani_ref gref {};
    ASSERT_EQ(env->GlobalReference_Create(tuple, &gref), ANI_OK);
    bool ok = true;
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_2; t++) {
        threads.emplace_back([&ok, &gref, t]() {
            TupleThrdWriteWorker(g_tuple_vm, gref, t, ok);
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(gref);
    ASSERT_EQ(ok, true);
    return ANI_TRUE;
}

// ==================== MEML (3) ====================

ani_int test_Tuple_Meml_0001([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    for (int i = 0; i < K_LOOP_100; i++) {
        ani_tuple_value tuple = GetTuple(env, "getIntTuple");
        if (tuple == nullptr) {
            return ANI_FALSE;
        }
        ani_size size {};
        ASSERT_EQ(env->c_api->TupleValue_GetNumberOfItems(env, tuple, &size), ANI_OK);
    }
    ASSERT_EQ(env->EnsureEnoughReferences(K_SCOPE_REFS_100), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Meml_0002([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    for (int i = 0; i < K_LOOP_100; i++) {
        ani_tuple_value tuple = GetTuple(env, "getRefTuple");
        if (tuple == nullptr) {
            return ANI_FALSE;
        }
        ani_ref ref {};
        ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, K_INDEX_0, &ref), ANI_OK);
    }
    ASSERT_EQ(env->EnsureEnoughReferences(K_SCOPE_REFS_100), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Tuple_Meml_0003([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    for (int i = 0; i < K_LOOP_100; i++) {
        ASSERT_EQ(env->CreateLocalScope(K_SCOPE_REFS_100), ANI_OK);
        ani_tuple_value tuple = GetTuple(env, "getIntTuple");
        if (tuple == nullptr) {
            return ANI_FALSE;
        }
        ani_int val {};
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, K_INDEX_0, &val), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_TUPLE_OPERATIONS_H
