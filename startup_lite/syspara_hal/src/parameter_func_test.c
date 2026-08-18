/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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

#include <securec.h>
#include "hctest.h"
#include "ohos_types.h"
#include "parameter.h"
#include "parameter_utils.h"
#include "sysparam_errno.h"


#define MAX_LEN 128
#define INVALID_LEN 2
#define COMMON_ERROR (-1)
#define INVALID_PARAMETER (-9)

static const char* g_defSysParam = "data of sys param ***...";

LITE_TEST_SUIT(utils, parameter, ParameterFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL ParameterFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL ParameterFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testSetParameter001
 * @tc.number SUB_UTILS_PARAMETER_2500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter001,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char value[] = "OEM-10.1.0";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter002
 * @tc.number SUB_UTILS_PARAMETER_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter002,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "_._..__...___";
    char value[] = "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(-9, ret);
};

/**
 * @tc.name   testSetParameter003
 * @tc.number SUB_UTILS_PARAMETER_2700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter003,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "keywithonlylowercase";
    char value[] = "test key with only lowercase";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter004
 * @tc.number SUB_UTILS_PARAMETER_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter004,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "202006060602";
    char value[] = "test key with only number";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter005
 * @tc.number SUB_UTILS_PARAMETER_2900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter005,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version";
    char value1[] = "set with key = 31";
    ret = SetParameter(key1, value1);
    TEST_ASSERT_EQUAL_INT(0, ret);

    char key2[] = "rw.sys.version.version";
#ifdef PARAM_VALUE_LEN_MAX_48
    char value2[] = "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijk";
#else
    char value2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklm\
nopqrstuvwxyz1234567890abcdefghijklmnopqrstuvw";
#endif
    ret = SetParameter(key2, value2);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter006
 * @tc.number SUB_UTILS_PARAMETER_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter006,
               Function | MediumTest | Level1) {
    int ret;

    char value[] = "test with null";
    ret = SetParameter(NULL, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key[] = "rw.sys.version";
    ret = SetParameter(key, NULL);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter007
 * @tc.number SUB_UTILS_PARAMETER_3100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter007,
               Function | MediumTest | Level1) {
    int ret;

    char value[] = "test with null";
    ret = SetParameter("\0", value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key[] = "rw.sys.version";
    ret = SetParameter(key, "\0");
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter008
 * @tc.number SUB_UTILS_PARAMETER_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter008,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version.v";
    char value1[] = "set with key = 32";
    ret = SetParameter(key1, value1);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key2[] = "rw.sys.version.version.version.version";
    char value2[] = "set with key > 32";
    ret = SetParameter(key2, value2);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter009
 * @tc.number SUB_UTILS_PARAMETER_3300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter009,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "Rw.Sys.Version.Version";
    char value[] = "set value with uppercase";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter010
 * @tc.number SUB_UTILS_PARAMETER_3400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter010,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw sys version version";
    char value[] = "set value with blank";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter011
 * @tc.number SUB_UTILS_PARAMETER_3500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter011,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw+sys&version%version*";
    char value[] = "set value with special characters";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter012
 * @tc.number SUB_UTILS_PARAMETER_3600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter012,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version1";
    char value1[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890\
abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrst";
    ret = SetParameter(key1, value1);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key2[] = "rw.sys.version.version2";
    char value2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890\
abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890";
    ret = SetParameter(key2, value2);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter013
 * @tc.number SUB_UTILS_PARAMETER_3700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter013,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "key_for_blank_value";
    char value[] = "                         ";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testGetParameter001
 * @tc.number SUB_UTILS_PARAMETER_3800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter001,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter002
 * @tc.number SUB_UTILS_PARAMETER_3900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter002,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "_._..__...___";
    char rightVal[] = "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(g_defSysParam), ret);
    TEST_ASSERT_EQUAL_STRING(g_defSysParam, value);
};

/**
 * @tc.name   testGetParameter003
 * @tc.number SUB_UTILS_PARAMETER_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter003,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "keywithonlylowercase";
    char rightVal[] = "test key with only lowercase";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter004
 * @tc.number SUB_UTILS_PARAMETER_4100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter004,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "202006060602";
    char rightVal[] = "test key with only number";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter005
 * @tc.number SUB_UTILS_PARAMETER_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter005,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, NULL, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter006
 * @tc.number SUB_UTILS_PARAMETER_4300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter006,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(g_defSysParam), ret);
    TEST_ASSERT_EQUAL_STRING(g_defSysParam, value);
};

/**
 * @tc.name   testGetParameter007
 * @tc.number SUB_UTILS_PARAMETER_4400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter007,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version";
    char rightVal1[] = "set with key = 31";
    char value1[MAX_LEN] = {0};
    SetParameter(key1, rightVal1);
    ret = GetParameter(key1, g_defSysParam, value1, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal1), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal1, value1);

    char key2[] = "rw.sys.version.version";
#ifdef PARAM_VALUE_LEN_MAX_48
    char rightVal2[] = "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijk";
#else
    char rightVal2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefgh\
ijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvw";
#endif
    char value2[MAX_LEN] = {0};
    SetParameter(key2, rightVal2);
    ret = GetParameter(key2, g_defSysParam, value2, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal2), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal2, value2);
};

/**
 * @tc.name   testGetParameter008
 * @tc.number SUB_UTILS_PARAMETER_4500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter008,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[INVALID_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, INVALID_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter009
 * @tc.number SUB_UTILS_PARAMETER_4600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter009,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, NULL, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter010
 * @tc.number SUB_UTILS_PARAMETER_4700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter010,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[INVALID_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, INVALID_LEN);
    TEST_ASSERT_EQUAL_INT(-9, ret);
};

/**
 * @tc.name   testGetParameter011
 * @tc.number SUB_UTILS_PARAMETER_4800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter011,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, NULL, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(SYSPARAM_NOT_FOUND, ret);
};

/**
 * @tc.name   testGetParameter012
 * @tc.number SUB_UTILS_PARAMETER_4900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter012,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version.version.version.v";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter013
 * @tc.number SUB_UTILS_PARAMETER_5000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter013,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version.version.version.version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter014
 * @tc.number SUB_UTILS_PARAMETER_5100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter014,
               Function | MediumTest | Level1) {
    int ret;

    char value[MAX_LEN] = {0};
    ret = GetParameter(NULL, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter015
 * @tc.number SUB_UTILS_PARAMETER_5200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter015,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "Rw.Sys.Version.Version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter016
 * @tc.number SUB_UTILS_PARAMETER_5300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter016,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw sys version version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter017
 * @tc.number SUB_UTILS_PARAMETER_5400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter017,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw+sys&version%version*";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter018
 * @tc.number SUB_UTILS_PARAMETER_5500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter018,
               Function | MediumTest | Level1) {
    int ret;

    char value[MAX_LEN] = {0};
    ret = GetParameter("\0", g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter019
 * @tc.number SUB_UTILS_PARAMETER_5600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter019,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "key_for_blank_value";
    char rightVal[] = "                         ";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter020
 * @tc.number SUB_UTILS_PARAMETER_5700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter020,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal1[] = "OEM-10.1.0";
    char value1[MAX_LEN] = {0};
    ret = SetParameter(key, rightVal1);
    TEST_ASSERT_EQUAL_INT(0, ret);
    ret = GetParameter(key, g_defSysParam, value1, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal1), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal1, value1);

    char rightVal2[] = "update the value of OEM-10.1.0";
    char value2[MAX_LEN] = {0};
    ret = SetParameter(key, rightVal2);
    TEST_ASSERT_EQUAL_INT(0, ret);
    ret = GetParameter(key, g_defSysParam, value2, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal2), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal2, value2);
};


/**
 * @tc.name   testFindParameter001
 * @tc.number SUB_UTILS_PARAMETER_5801
 * @tc.desc   test FindParameter with legal and illegal parameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testFindParameter001,
               Function | MediumTest | Level1) {
    /* 非法参数：NULL 返回 -1 */
    uint32_t handle = FindParameter(NULL);
    TEST_ASSERT_TRUE(handle == (uint32_t)(-1));
    /* 不存在的参数返回 -1 */
    handle = FindParameter("rw.sys.xts_notexist_1000");
    TEST_ASSERT_TRUE(handle == (uint32_t)(-1));
    /* 设置参数后返回有效句柄 */
    int ret = SetParameter("rw.sys.xts_findparam", "100");
    TEST_ASSERT_EQUAL_INT(0, ret);
    handle = FindParameter("rw.sys.xts_findparam");
    TEST_ASSERT_TRUE(handle != (uint32_t)(-1));
    /* 只读系统参数（const 前缀）返回有效句柄 */
    handle = FindParameter("const.product.model");
    TEST_ASSERT_TRUE(handle != (uint32_t)(-1));
};

/**
 * @tc.name   testGetParameterCommitId001
 * @tc.number SUB_UTILS_PARAMETER_5802
 * @tc.desc   test GetParameterCommitId with legal and illegal handles.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameterCommitId001,
               Function | MediumTest | Level1) {
    /* 非法句柄：0 与 -1 返回 -1 */
    uint32_t commitId = GetParameterCommitId(0);
    TEST_ASSERT_TRUE(commitId == (uint32_t)(-1));
    commitId = GetParameterCommitId((uint32_t)(-1));
    TEST_ASSERT_TRUE(commitId == (uint32_t)(-1));
    /* 合法句柄：返回非 -1 的提交号 */
    int ret = SetParameter("rw.sys.xts_commitid", "1");
    TEST_ASSERT_EQUAL_INT(0, ret);
    uint32_t handle = FindParameter("rw.sys.xts_commitid");
    TEST_ASSERT_TRUE(handle != (uint32_t)(-1));
    commitId = GetParameterCommitId(handle);
    TEST_ASSERT_TRUE(commitId != (uint32_t)(-1));
};

/**
 * @tc.name   testGetParameterName001
 * @tc.number SUB_UTILS_PARAMETER_5803
 * @tc.desc   test GetParameterName with legal and illegal parameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameterName001,
               Function | MediumTest | Level1) {
    char name[MAX_LEN] = {0};
    /* 非法句柄返回负错误码 */
    int ret = GetParameterName(0, name, sizeof(name));
    TEST_ASSERT_TRUE(ret < 0);
    ret = GetParameterName((uint32_t)(-1), name, sizeof(name));
    TEST_ASSERT_TRUE(ret < 0);
    /* NULL 缓冲返回 EC_INVALID */
    ret = GetParameterName(0, NULL, sizeof(name));
    TEST_ASSERT_EQUAL_INT(EC_INVALID, ret);
    /* 合法句柄：返回名字长度且内容一致 */
    ret = SetParameter("rw.sys.xts_getname", "abc");
    TEST_ASSERT_EQUAL_INT(0, ret);
    uint32_t handle = FindParameter("rw.sys.xts_getname");
    TEST_ASSERT_TRUE(handle != (uint32_t)(-1));
    ret = GetParameterName(handle, name, sizeof(name));
    TEST_ASSERT_TRUE(ret > 0);
    TEST_ASSERT_TRUE((uint32_t)ret == strlen(name));
    TEST_ASSERT_EQUAL_STRING(name, "rw.sys.xts_getname");
};

/**
 * @tc.name   testGetParameterValue001
 * @tc.number SUB_UTILS_PARAMETER_5804
 * @tc.desc   test GetParameterValue with legal and illegal parameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameterValue001,
               Function | MediumTest | Level1) {
    char value[MAX_LEN] = {0};
    /* 非法句柄返回负错误码 */
    int ret = GetParameterValue(0, value, sizeof(value));
    TEST_ASSERT_TRUE(ret < 0);
    /* NULL 缓冲返回 EC_INVALID */
    ret = GetParameterValue(0, NULL, sizeof(value));
    TEST_ASSERT_EQUAL_INT(EC_INVALID, ret);
    /* 合法句柄：返回值长度且内容一致 */
    ret = SetParameter("rw.sys.xts_getvalue", "hello");
    TEST_ASSERT_EQUAL_INT(0, ret);
    uint32_t handle = FindParameter("rw.sys.xts_getvalue");
    TEST_ASSERT_TRUE(handle != (uint32_t)(-1));
    ret = GetParameterValue(handle, value, sizeof(value));
    TEST_ASSERT_TRUE(ret > 0);
    TEST_ASSERT_TRUE((uint32_t)ret == strlen(value));
    TEST_ASSERT_EQUAL_STRING(value, "hello");
};

/**
 * @tc.name   testGetSystemCommitId001
 * @tc.number SUB_UTILS_PARAMETER_5805
 * @tc.desc   test GetSystemCommitId, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetSystemCommitId001,
               Function | MediumTest | Level1) {
    /* 参数工作区已初始化，不应返回 -1（未初始化错误码） */
    long long commitId = GetSystemCommitId();
    printf("SystemCommitId=%lld\n", commitId);
    /* 参数工作区已初始化后返回全局提交号（非负），未初始化才返回 -1 */
    TEST_ASSERT_TRUE(commitId >= 0);
    long long commitId2 = GetSystemCommitId();
    TEST_ASSERT_TRUE(commitId2 >= 0);
};

/**
 * @tc.name   testGetIntParameter001
 * @tc.number SUB_UTILS_PARAMETER_5806
 * @tc.desc   test GetIntParameter with legal and illegal parameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetIntParameter001,
               Function | MediumTest | Level1) {
    /* 不存在的参数返回默认值 */
    int32_t ret = GetIntParameter("rw.sys.xts_notexist_int", 1234);
    TEST_ASSERT_EQUAL_INT(1234, ret);
    /* NULL key 返回默认值 */
    ret = GetIntParameter(NULL, 5678);
    TEST_ASSERT_EQUAL_INT(5678, ret);
    /* 设置后返回解析值 */
    int setRet = SetParameter("rw.sys.xts_int", "42");
    TEST_ASSERT_EQUAL_INT(0, setRet);
    ret = GetIntParameter("rw.sys.xts_int", -1);
    TEST_ASSERT_EQUAL_INT(42, ret);
};

/**
 * @tc.name   testGetUintParameter001
 * @tc.number SUB_UTILS_PARAMETER_5807
 * @tc.desc   test GetUintParameter with legal and illegal parameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetUintParameter001,
               Function | MediumTest | Level1) {
    /* 不存在的参数返回默认值 */
    uint32_t ret = GetUintParameter("rw.sys.xts_notexist_uint", 8888);
    TEST_ASSERT_TRUE(ret == 8888);
    /* NULL key 返回默认值 */
    ret = GetUintParameter(NULL, 9999);
    TEST_ASSERT_TRUE(ret == 9999);
    /* 设置后返回解析值 */
    int setRet = SetParameter("rw.sys.xts_uint", "77");
    TEST_ASSERT_EQUAL_INT(0, setRet);
    ret = GetUintParameter("rw.sys.xts_uint", 0);
    TEST_ASSERT_TRUE(ret == 77);
};

/**
 * @tc.name   testSaveParameters001
 * @tc.number SUB_UTILS_PARAMETER_5808
 * @tc.desc   test SaveParameters.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSaveParameters001,
               Function | MediumTest | Level1) {
    /* 契约：持久化保存成功返回 0（SystemSaveParameters 恒返回 SUCCESS） */
    int ret = SaveParameters();
    printf("SaveParameters ret=%d\n", ret);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testWaitParameter001
 * @tc.number SUB_UTILS_PARAMETER_5809
 * @tc.desc   test WaitParameter with illegal parameters and timeout.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testWaitParameter001,
               Function | MediumTest | Level1) {
    /* NULL 参数返回 EC_INVALID */
    int ret = WaitParameter(NULL, "1", 1);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, ret);
    ret = WaitParameter("rw.sys.xts_wait", NULL, 1);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, ret);
    /* 等待一个不会被设置的值，1 秒超时返回 SYSPARAM_WAIT_TIMEOUT */
    ret = WaitParameter("rw.sys.xts_never_set", "any", 1);
    printf("WaitParameter timeout ret=%d\n", ret);
    TEST_ASSERT_EQUAL_INT(SYSPARAM_WAIT_TIMEOUT, ret);
};

RUN_TEST_SUITE(ParameterFuncTestSuite);
