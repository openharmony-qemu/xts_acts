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

#ifndef TC_TYPE_TEST_PART2_H
#define TC_TYPE_TEST_PART2_H
ani_string test_Identify(ani_env *env, ani_object object, ani_object data)
{
    (void)object;
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_STRING_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "string");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_ARRAYBUFFER_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "ArrayBuffer");
    }
    return ani_tc_type::TypeStdStringToAniString(env, "other");
}
ani_string test_IdentifyFixedInt(ani_env *env, ani_object object, ani_object data)
{
    (void)object;
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_FIXEDARRAY_INT_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "FixedArray<int>");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_STRING_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "string");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_ARRAYBUFFER_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "ArrayBuffer");
    }
    return ani_tc_type::TypeStdStringToAniString(env, "other");
}
ani_string test_IdentifyFixedString(ani_env *env, ani_object object, ani_object data)
{
    (void)object;
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_FIXEDARRAY_STRING_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "FixedArray<string>");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_FIXEDARRAY_INT_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "FixedArray<int>");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_STRING_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "string");
    }
    if (ani_tc_type::TypeObjectInstanceOf(env, data, ani_tc_type::TYPE_ARRAYBUFFER_CLASS) == ANI_TRUE) {
        return ani_tc_type::TypeStdStringToAniString(env, "ArrayBuffer");
    }
    return ani_tc_type::TypeStdStringToAniString(env, "other");
}
void test_ProcessUnionBatch(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    ani_tc_type::g_typeProcessUnionBatchOk = false;
    if (env == nullptr || array == nullptr) {
        return;
    }
    ani_ref stringGlobal {};
    ani_ref arrayBufferGlobal {};
    ani_ref fixedIntGlobal {};
    bool ok = ani_tc_type::TypeFindAndCacheClass(env, ani_tc_type::TYPE_STRING_CLASS, &stringGlobal) &&
        ani_tc_type::TypeFindAndCacheClass(env, ani_tc_type::TYPE_ARRAYBUFFER_CLASS, &arrayBufferGlobal) &&
        ani_tc_type::TypeFindAndCacheClass(env, ani_tc_type::TYPE_FIXEDARRAY_INT_CLASS, &fixedIntGlobal);
    if (!ok) {
        return;
    }
    bool sawString = ani_tc_type::TypeArrayHasInstance(env, array, static_cast<ani_class>(stringGlobal));
    bool sawArrayBuffer = ani_tc_type::TypeArrayHasInstance(env, array, static_cast<ani_class>(arrayBufferGlobal));
    bool sawFixedInt = ani_tc_type::TypeArrayHasInstance(env, array, static_cast<ani_class>(fixedIntGlobal));
    env->GlobalReference_Delete(stringGlobal);
    env->GlobalReference_Delete(arrayBufferGlobal);
    env->GlobalReference_Delete(fixedIntGlobal);
    ani_tc_type::g_typeProcessUnionBatchOk = sawString && sawArrayBuffer && sawFixedInt;
}
ani_boolean test_CheckProcessUnionBatch(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    return ani_tc_type::g_typeProcessUnionBatchOk ? ANI_TRUE : ANI_FALSE;
}
void test_ThrowMyError(ani_env *env, ani_object object)
{
    (void)object;
    ani_status status = ani_tc_type::TypeThrowError(env, "Native custom error");
    std::cout << "test_ThrowMyError TypeThrowError status: " << status << std::endl;
}
ani_string test_CallWithCallback(ani_env *env, ani_object object, ani_fn_object callback)
{
    (void)object;
    if (env == nullptr || callback == nullptr) {
        return nullptr;
    }
    ani_ref result {};
    ani_status status = env->FunctionalObject_Call(callback, 0, nullptr, &result);
    if (!AssertEqMsg(status, ANI_OK, "FunctionalObject_Call failed")) {
        return nullptr;
    }
    return static_cast<ani_string>(result);
}
ani_int test_GetEnumValue(ani_env *env, ani_object object, ani_enum_item color)
{
    (void)object;
    if (env == nullptr || color == nullptr) {
        return ani_tc_type::TYPE_ERROR_INT_RETURN;
    }
    ani_int value = ani_tc_type::TYPE_ERROR_INT_RETURN;
    ani_status status = env->EnumItem_GetValue_Int(color, &value);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetValue_Int failed")) {
        return ani_tc_type::TYPE_ERROR_INT_RETURN;
    }
    return value;
}
#endif
