/**
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

#ifndef ARKTS_ANI_TEST_VALUEARRAY_H
#define ARKTS_ANI_TEST_VALUEARRAY_H
#include "ArrayTestCommon.h"


ani_int test_ValueArray_GetLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->ValueArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_GetLength_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->ValueArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_GetLength_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_size arraySize = LENGTH_5;
    ani_size length = 0;
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(arraySize, &array), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_char array2 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(arraySize, &array2), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array2, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_byte array3 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(arraySize, &array3), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array3, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_short array4 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(arraySize, &array4), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array4, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_int array5 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(arraySize, &array5), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array5, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_long array6 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(arraySize, &array6), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array6, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_float array7 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(arraySize, &array7), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array7, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_valuearray_double array8 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(arraySize, &array8), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetLength(array8, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean nativeBuffer[LENGTH_10] = {ANI_TRUE};
    ASSERT_EQ(env->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean nativeBuffer[LENGTH_10] = {ANI_TRUE};
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean initBuffer[LENGTH_5] = {ANI_TRUE, ANI_TRUE, ANI_TRUE, ANI_TRUE, ANI_TRUE};
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_boolean nativeBuffer[LENGTH_5] = {ANI_FALSE};
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[1U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[2U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[3U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[4U], ANI_TRUE);

    ani_boolean changeBuffer[LENGTH_5] = {ANI_TRUE, ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE};
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[1U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[2U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[3U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[4U], ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean setBuffer[LENGTH_5] = {ANI_FALSE, ANI_FALSE, ANI_FALSE, ANI_FALSE, ANI_FALSE};
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, setBuffer), ANI_OK);

    ani_boolean nativeBuffer[LENGTH_5] = {ANI_TRUE};
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[1U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[2U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[3U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[4U], ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer2 = {ANI_FALSE};
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer3 = {ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE};
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Boolean_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &array), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    std::array<ani_boolean, LENGTH_5> nativeBuffer2 = {ANI_FALSE};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte initBuffer[LENGTH_5] = {static_cast<ani_byte>(TEST_VALUE_1), static_cast<ani_byte>(TEST_VALUE_2),
                                     static_cast<ani_byte>(TEST_VALUE_3), static_cast<ani_byte>(TEST_VALUE_4),
                                     static_cast<ani_byte>(TEST_VALUE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_byte nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_byte>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_byte>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_byte>(TEST_VALUE_3));
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_byte>(TEST_VALUE_4));
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_byte>(TEST_VALUE_5));

    ani_byte changeBuffer[LENGTH_5] = {static_cast<ani_byte>(TEST_VALUE_1), static_cast<ani_byte>(TEST_VALUE_2),
                                       TEST_UPDATE_4, static_cast<ani_byte>(TEST_VALUE_4), TEST_UPDATE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_byte>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_byte>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_4);
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_byte>(TEST_VALUE_4));
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte initBuffer[LENGTH_5] = {static_cast<ani_byte>(TEST_VALUE_1), static_cast<ani_byte>(TEST_VALUE_2),
                                     static_cast<ani_byte>(TEST_VALUE_3), static_cast<ani_byte>(TEST_VALUE_4),
                                     static_cast<ani_byte>(TEST_VALUE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_byte setBuffer[LENGTH_3] = {TEST_UPDATE_4, TEST_UPDATE_6, TEST_UPDATE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_byte nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_byte>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_byte>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPDATE_6);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);

    const ani_byte minByteValue = -128;
    const ani_byte maxByteValue = 127;
    std::array<ani_byte, LENGTH_5> nativeBuffer = {minByteValue, maxByteValue, static_cast<ani_byte>(0),
                                                   static_cast<ani_byte>(-1), static_cast<ani_byte>(1)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minByteValue);
    ASSERT_EQ(nativeBuffer2[1U], maxByteValue);
    ASSERT_EQ(nativeBuffer2[2U], static_cast<ani_byte>(0));
    ASSERT_EQ(nativeBuffer2[3U], static_cast<ani_byte>(-1));
    ASSERT_EQ(nativeBuffer2[4U], static_cast<ani_byte>(1));
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4,
                                                   TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2,
                                                    TEST_VAL_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Byte_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_byte array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &array), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4,
                                                   TEST_VAL_5};
    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_char array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Char(LENGTH_5, &array), ANI_OK);
    ani_char nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Char_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_char array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_5, &array), ANI_OK);
    ani_char nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Char_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_char array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_10, &array), ANI_OK);

    const std::array<ani_char, LENGTH_10> nativeBuffer = {'a', '0', '\n', '\r', '\t', '\b', '\a', '\v', '\f', '\0'};
    ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer.data()), ANI_OK);

    std::array<ani_char, LENGTH_10> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], 'a');
    ASSERT_EQ(nativeBuffer2[1U], '0');
    ASSERT_EQ(nativeBuffer2[2U], '\n');
    ASSERT_EQ(nativeBuffer2[3U], '\r');
    ASSERT_EQ(nativeBuffer2[4U], '\t');
    ASSERT_EQ(nativeBuffer2[5U], '\b');
    ASSERT_EQ(nativeBuffer2[6U], '\a');
    ASSERT_EQ(nativeBuffer2[7U], '\v');
    ASSERT_EQ(nativeBuffer2[8U], '\f');
    ASSERT_EQ(nativeBuffer2[9U], '\0');
    return ANI_TRUE;
}

ani_int test_ValueArray_Char_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_char array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_5, &array), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer = {'a', 'b', 'c', 'd', 'e'};
    ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    std::array<ani_char, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer3 = {'a', 'c', 'e', 'x', 'y'};
    ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Char_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_char array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_5, &array), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer = {'a', 'b', 'c', 'd', 'e'};
    std::array<ani_char, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_short nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ani_short changeBuffer[LENGTH_5] = {TEST_UPDATE_1, TEST_UPDATE_2, TEST_UPDATE_3, TEST_UPDATE_4, TEST_UPDATE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_UPDATE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_UPDATE_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPDATE_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_short setBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_short nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPT_3);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);
    const ani_short maxShortValue = 32767;
    const ani_short minShortValue = -32768;
    const std::array<ani_short, LENGTH_5> nativeBuffer = {minShortValue, maxShortValue, 0, -1, 1};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minShortValue);
    ASSERT_EQ(nativeBuffer2[1U], maxShortValue);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer = {TEST_VL_1, TEST_VL_2, TEST_VL_3, TEST_VL_4, TEST_VL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Short_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_short array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &array), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer = {TEST_VL_1, TEST_VL_2, TEST_VL_3, TEST_VL_4, TEST_VL_5};
    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_int nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ani_int changeBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_UPT_4, TEST_VAL_4, TEST_UPT_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_int setBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_int nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPT_3);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);

    const std::array<ani_int, LENGTH_5> nativeBuffer = {-2147483648, 2147483647, 0, -1, 1};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    const ani_int minIntValue = -2147483648;
    const ani_int maxIntValue = 2147483647;
    ASSERT_EQ(nativeBuffer2[0U], minIntValue);
    ASSERT_EQ(nativeBuffer2[1U], maxIntValue);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    ASSERT_EQ(nativeBuffer2[4U], 1);
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Int_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_int array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &array), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_long nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ani_long changeBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_UPT_4, TEST_VAL_4, TEST_UPT_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long initBuffer[LENGTH_5] = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_long setBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_long nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPT_3);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long max = std::numeric_limits<int64_t>::max();
    ani_long min = std::numeric_limits<int64_t>::min();
    const std::array<ani_long, LENGTH_5> nativeBuffer = {min, max, 0, -1, 1};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], min);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    ASSERT_EQ(nativeBuffer2[4U], 1);
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Long_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_long array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &array), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float initBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_float nativeBuffer[LENGTH_5] = {0.0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VALUE_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VALUE_5);

    ani_float changeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, static_cast<ani_float>(TEST_UPDATE_4),
                                        TEST_VALUE_4, static_cast<ani_float>(TEST_UPDATE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2);
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_float>(TEST_UPDATE_4));
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4);
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_float>(TEST_UPDATE_5));
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float initBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_float setBuffer[LENGTH_3] = {static_cast<ani_float>(TEST_UPDATE_4), static_cast<ani_float>(TEST_UPDATE_6),
                                     static_cast<ani_float>(TEST_UPDATE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_float nativeBuffer[LENGTH_5] = {0.0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2);
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_float>(TEST_UPDATE_4));
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_float>(TEST_UPDATE_6));
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_float>(TEST_UPDATE_5));
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_6, &array), ANI_OK);
    ani_float max = std::numeric_limits<float>::max();
    ani_float minPositive = std::numeric_limits<float>::min();
    ani_float min = -std::numeric_limits<float>::max();
    const std::array<ani_float, LENGTH_6> nativeBuffer = {minPositive, max, min, 0.0F, -1.0F, 1.0F};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_6, nativeBuffer.data()), ANI_OK);

    std::array<ani_float, LENGTH_6> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_6, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minPositive);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], min);
    ASSERT_EQ(nativeBuffer2[3U], 0.0F);
    ASSERT_EQ(nativeBuffer2[4U], -1.0F);
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                    TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer3 = {TEST_VALUE_1, TEST_VALUE_3, TEST_VALUE_5, TEST_VALUE_2,
                                                     TEST_VALUE_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Float_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_float array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &array), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                    TEST_VALUE_5};
    std::array<ani_float, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_10] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_10] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double initBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_double nativeBuffer[LENGTH_5] = {0.0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_double>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_double>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_double>(TEST_VALUE_3));
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_double>(TEST_VALUE_4));
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_double>(TEST_VALUE_5));

    ani_double changeBuffer[LENGTH_5] = {static_cast<ani_double>(TEST_VALUE_1), static_cast<ani_double>(TEST_VALUE_2),
                                         static_cast<ani_double>(TEST_UPDATE_4), static_cast<ani_double>(TEST_VALUE_4),
                                         static_cast<ani_double>(TEST_UPDATE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, changeBuffer), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_double>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_double>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_double>(TEST_UPDATE_4));
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_double>(TEST_VALUE_4));
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_double>(TEST_UPDATE_5));
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double initBuffer[LENGTH_5] = {static_cast<ani_double>(TEST_VALUE_1), static_cast<ani_double>(TEST_VALUE_2),
                                       static_cast<ani_double>(TEST_VALUE_3), static_cast<ani_double>(TEST_VALUE_4),
                                       static_cast<ani_double>(TEST_VALUE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, initBuffer), ANI_OK);

    ani_double setBuffer[LENGTH_3] = {static_cast<ani_double>(TEST_UPDATE_4), static_cast<ani_double>(TEST_UPDATE_6),
                                      static_cast<ani_double>(TEST_UPDATE_5)};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_2, LENGTH_3, setBuffer), ANI_OK);

    ani_double nativeBuffer[LENGTH_5] = {0.0};
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], static_cast<ani_double>(TEST_VALUE_1));
    ASSERT_EQ(nativeBuffer[1U], static_cast<ani_double>(TEST_VALUE_2));
    ASSERT_EQ(nativeBuffer[2U], static_cast<ani_double>(TEST_UPDATE_4));
    ASSERT_EQ(nativeBuffer[3U], static_cast<ani_double>(TEST_UPDATE_6));
    ASSERT_EQ(nativeBuffer[4U], static_cast<ani_double>(TEST_UPDATE_5));
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_6, &array), ANI_OK);

    ani_double max = std::numeric_limits<double>::max();
    ani_double minPositive = std::numeric_limits<double>::min();
    ani_double min = -std::numeric_limits<double>::max();

    const std::array<ani_double, LENGTH_6> nativeBuffer = {minPositive, max, min, 0.0, -1.0, 1.0};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_6, nativeBuffer.data()), ANI_OK);

    std::array<ani_double, LENGTH_6> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_6, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minPositive);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], min);
    ASSERT_EQ(nativeBuffer2[3U], 0.0);
    ASSERT_EQ(nativeBuffer2[4U], -1.0);
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                     TEST_VALUE_5};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    std::array<ani_double, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer3 = {TEST_VALUE_1, TEST_VALUE_3, TEST_VALUE_5, TEST_VALUE_2,
                                                      TEST_VALUE_4};
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_Double_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_double array = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &array), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                     TEST_VALUE_5};
    std::array<ani_double, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->ValueArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->ValueArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_ValueArray_New([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_size length = 0;
    ani_valuearray_boolean booleanArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, &booleanArray), ANI_OK);
    ASSERT_NE(booleanArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(booleanArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_char charArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_5, &charArray), ANI_OK);
    ASSERT_NE(charArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(charArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_byte byteArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, &byteArray), ANI_OK);
    ASSERT_NE(byteArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(byteArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_short shortArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, &shortArray), ANI_OK);
    ASSERT_NE(shortArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(shortArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_int intArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, &intArray), ANI_OK);
    ASSERT_NE(intArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(intArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_long longArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, &longArray), ANI_OK);
    ASSERT_NE(longArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(longArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_float floatArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, &floatArray), ANI_OK);
    ASSERT_NE(floatArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(floatArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_valuearray_double doubleArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, &doubleArray), ANI_OK);
    ASSERT_NE(doubleArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(doubleArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_ValueArray_New_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_size length = LENGTH_5;
    ani_valuearray_boolean booleanArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(ZERO, &booleanArray), ANI_OK);
    ASSERT_NE(booleanArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(booleanArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_char charArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(ZERO, &charArray), ANI_OK);
    ASSERT_NE(charArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(charArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_byte byteArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(ZERO, &byteArray), ANI_OK);
    ASSERT_NE(byteArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(byteArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_short shortArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(ZERO, &shortArray), ANI_OK);
    ASSERT_NE(shortArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(shortArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_int intArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(ZERO, &intArray), ANI_OK);
    ASSERT_NE(intArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(intArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_long longArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(ZERO, &longArray), ANI_OK);
    ASSERT_NE(longArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(longArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_float floatArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(ZERO, &floatArray), ANI_OK);
    ASSERT_NE(floatArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(floatArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);

    ani_valuearray_double doubleArray = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(ZERO, &doubleArray), ANI_OK);
    ASSERT_NE(doubleArray, nullptr);
    ASSERT_EQ(env_->ValueArray_GetLength(doubleArray, &length), ANI_OK);
    ASSERT_EQ(length, ZERO);
    return ANI_TRUE;
}

ani_int test_ValueArray_New_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env_->ValueArray_New_Boolean(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Char(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Byte(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Short(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Int(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Long(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Float(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->ValueArray_New_Double(LENGTH_5, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_ValueArray_New_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_valuearray_boolean array = nullptr;
    ani_valuearray_boolean array1 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Boolean(ARRAYSIZE_10K, &array), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Boolean(ARRAYSIZE_100K, &array1), ANI_OK);
    ani_valuearray_char array2 = nullptr;
    ani_valuearray_char array22 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Char(ARRAYSIZE_10K, &array2), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Char(ARRAYSIZE_100K, &array22), ANI_OK);
    ani_valuearray_byte array3 = nullptr;
    ani_valuearray_byte array33 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Byte(ARRAYSIZE_10K, &array3), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Byte(ARRAYSIZE_100K, &array33), ANI_OK);
    ani_valuearray_short array4 = nullptr;
    ani_valuearray_short array44 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Short(ARRAYSIZE_10K, &array4), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Short(ARRAYSIZE_100K, &array44), ANI_OK);
    ani_valuearray_int array5 = nullptr;
    ani_valuearray_int array55 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Int(ARRAYSIZE_10K, &array5), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Int(ARRAYSIZE_100K, &array55), ANI_OK);
    ani_valuearray_long array6 = nullptr;
    ani_valuearray_long array66 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Long(ARRAYSIZE_10K, &array6), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Long(ARRAYSIZE_100K, &array66), ANI_OK);
    ani_valuearray_float array7 = nullptr;
    ani_valuearray_float array77 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Float(ARRAYSIZE_10K, &array7), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Float(ARRAYSIZE_100K, &array77), ANI_OK);
    ani_valuearray_double array8 = nullptr;
    ani_valuearray_double array88 = nullptr;
    ASSERT_EQ(env_->ValueArray_New_Double(ARRAYSIZE_10K, &array8), ANI_OK);
    ASSERT_EQ(env_->ValueArray_New_Double(ARRAYSIZE_100K, &array88), ANI_OK);
    return ANI_TRUE;
}


#endif // ARKTS_ANI_TEST_VALUEARRAY_H
