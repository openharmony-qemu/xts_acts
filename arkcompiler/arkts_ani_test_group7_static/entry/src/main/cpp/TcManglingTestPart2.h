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

#ifndef TC_MANGLING_TEST_PART2_H
#define TC_MANGLING_TEST_PART2_H
void test_ComplexOptional(ani_env *env, ani_object object, ani_int a, ani_ref b, ani_ref c, ani_ref d)
{
    (void)env;
    (void)object;
    (void)b;
    (void)c;
    (void)d;
    if (a == ani_tc_mangling::MANGLING_COMPLEX_A_VALUE) {
        ani_tc_mangling::g_complexCallCount++;
    }
}
ani_boolean test_CheckComplexOptional(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_complexCallCount ==
        ani_tc_mangling::MANGLING_COMPLEX_EXPECTED_COUNT;
    ani_tc_mangling::ResetComplexOptionalState();
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_OptionalBasicAndRef(ani_env *env, ani_object object, ani_ref a, ani_ref b, ani_ref c)
{
    (void)object;
    ani_tc_mangling::g_optionalBasicCallCount++;
    if (ani_tc_mangling::g_optionalBasicCallCount ==
        ani_tc_mangling::MANGLING_OPTIONAL_BASIC_CALL_ONE) {
        ani_tc_mangling::g_optionalBasicCall1Ok =
            ani_tc_mangling::IsUndefinedRef(env, a) &&
            ani_tc_mangling::IsUndefinedRef(env, b) &&
            ani_tc_mangling::IsUndefinedRef(env, c);
        return;
    }
    if (ani_tc_mangling::g_optionalBasicCallCount ==
        ani_tc_mangling::MANGLING_OPTIONAL_BASIC_CALL_TWO) {
        ani_tc_mangling::g_optionalBasicCall2Ok =
            (ani_tc_mangling::UnboxIntByMethod(env, a) ==
                ani_tc_mangling::MANGLING_OPTIONAL_BASIC_VALUE) &&
            ani_tc_mangling::IsUndefinedRef(env, b) &&
            ani_tc_mangling::IsUndefinedRef(env, c);
        return;
    }
    if (ani_tc_mangling::g_optionalBasicCallCount ==
        ani_tc_mangling::MANGLING_OPTIONAL_BASIC_CALL_THREE) {
        ani_tc_mangling::g_optionalBasicCall3Ok =
            (ani_tc_mangling::UnboxIntByMethod(env, a) ==
                ani_tc_mangling::MANGLING_OPTIONAL_BASIC_VALUE) &&
            !ani_tc_mangling::IsUndefinedRef(env, b) &&
            !ani_tc_mangling::IsUndefinedRef(env, c);
    }
}
ani_boolean test_CheckOptionalBasicAndRef(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_optionalBasicCallCount ==
        ani_tc_mangling::MANGLING_OPTIONAL_BASIC_EXPECTED_COUNT &&
        ani_tc_mangling::g_optionalBasicCall1Ok &&
        ani_tc_mangling::g_optionalBasicCall2Ok &&
        ani_tc_mangling::g_optionalBasicCall3Ok;
    ani_tc_mangling::ResetOptionalBasicState();
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_RestLog(ani_env *env, ani_object object, ani_string prefix, ani_fixedarray_int args)
{
    std::string prefixValue = ani_tc_mangling::ManglingStringToStd(env, prefix);
    ani_int sum = test_ProcessFixed(env, object, args);
    ani_tc_mangling::g_restLogOk =
        (prefixValue == "nums" && sum == ani_tc_mangling::MANGLING_REST_EXPECTED_SUM);
}
ani_boolean test_CheckRestLog(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_restLogOk;
    ani_tc_mangling::g_restLogOk = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_ExecFunction(ani_env *env, ani_object object, ani_fn_object f, ani_fn_object g, ani_fn_object h)
{
    (void)object;
    ani_tc_mangling::g_execFunctionOk = false;
    if (f == nullptr || g == nullptr || h == nullptr) {
        return;
    }
    ani_tc_mangling::g_execFunctionOk = true;
    env->FunctionalObject_Call(f, 0, nullptr, nullptr);
    ani_ref gResult {};
    env->FunctionalObject_Call(g, 0, nullptr, &gResult);
}
ani_boolean test_CheckExecFunction(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_execFunctionOk;
    ani_tc_mangling::g_execFunctionOk = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
ani_ref test_GenericFunc(ani_env *env, ani_object object, ani_ref arg)
{
    (void)env;
    (void)object;
    return arg;
}
void test_DoNothing(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_tc_mangling::g_doNothingCalled = true;
}
ani_boolean test_CheckDoNothing(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_doNothingCalled;
    ani_tc_mangling::g_doNothingCalled = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_DoNothingAgain(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_tc_mangling::g_doNothingAgainCalled = true;
}
ani_boolean test_CheckDoNothingAgain(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_doNothingAgainCalled;
    ani_tc_mangling::g_doNothingAgainCalled = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_UseMyClass(ani_env *env, ani_object object, ani_object value)
{
    (void)object;
    ani_int fieldValue = 0;
    ani_status status = env->Object_GetPropertyByName_Int(value, "value", &fieldValue);
    ani_tc_mangling::g_useMyClassOk =
        (status == ANI_OK && fieldValue == ani_tc_mangling::MANGLING_MY_CLASS_EXPECTED_VALUE);
}
ani_boolean test_CheckUseMyClass(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_useMyClassOk;
    ani_tc_mangling::g_useMyClassOk = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
ani_int test_AddWrongSignature(ani_env *env, ani_object object, ani_double a, ani_double b)
{
    (void)env;
    (void)object;
    return static_cast<ani_int>(a + b);
}
ani_int test_ProcessMatrix(ani_env *env, ani_object object, ani_fixedarray_ref matrix)
{
    return test_ProcessNested(env, object, matrix);
}
void test_UpdateUser(ani_env *env, ani_object object, ani_object partial)
{
    (void)object;
    ani_ref nameRef {};
    ani_status nameStatus = env->Object_GetPropertyByName_Ref(partial, "name", &nameRef);
    ani_int age = 0;
    ani_status ageStatus = env->Object_GetPropertyByName_Int(partial, "age", &age);
    bool hasName = (nameStatus == ANI_OK && nameRef != nullptr &&
        !ani_tc_mangling::IsUndefinedRef(env, nameRef));
    bool hasAge = (ageStatus == ANI_OK && age > 0);
    ani_tc_mangling::g_updateUserOk = hasName || hasAge;
}
ani_boolean test_CheckUpdateUser(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_updateUserOk;
    ani_tc_mangling::g_updateUserOk = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
#endif
