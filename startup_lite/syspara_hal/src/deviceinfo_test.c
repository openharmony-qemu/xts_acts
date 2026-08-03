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

#include <securec.h>
#include "hctest.h"
#include "ohos_types.h"
#include "parameter.h"
#include "parameter_utils.h"

#define QUERY_TIMES 50

LITE_TEST_SUIT(startup, deviceinfo, DeviceInfoTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DeviceInfoTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DeviceInfoTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testGetDeviceType
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0100
 * @tc.desc   test GetDeviceType not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDeviceType,
               Function | MediumTest | Level1)
{
    const char *value1 = GetDeviceType();
    printf("Device Type=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetDeviceType();
    }
    const char *value2 = GetDeviceType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetManufacture
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0200
 * @tc.desc   test GetManufacture not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetManufacture,
               Function | MediumTest | Level1)
{
    const char *value1 = GetManufacture();
    printf("Manufacture=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetManufacture();
    }
    const char *value2 = GetManufacture();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBrand
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0300
 * @tc.desc   test GetBrand not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBrand,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBrand();
    printf("Brand=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBrand();
    }
    const char *value2 = GetBrand();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetMarketName
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0400
 * @tc.desc   test GetMarketName not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetMarketName,
               Function | MediumTest | Level1)
{
    const char *value1 = GetMarketName();
    printf("Market Name=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetMarketName();
    }
    const char *value2 = GetMarketName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetProductSeries
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0500
 * @tc.desc   test GetProductSeries not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetProductSeries,
               Function | MediumTest | Level1)
{
    const char *value1 = GetProductSeries();
    printf("Product Series=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetProductSeries();
    }
    const char *value2 = GetProductSeries();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetProductModel
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0600
 * @tc.desc   test GetProductModel not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetProductModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetProductModel();
    printf("Product Model=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetProductModel();
    }
    const char *value2 = GetProductModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetHardwareModel
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0700
 * @tc.desc   test GetHardwareModel not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetHardwareModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetHardwareModel();
    printf("Hardware Model=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetHardwareModel();
    }
    const char *value2 = GetHardwareModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetHardwareProfile
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0800
 * @tc.desc   test GetHardwareProfile not empty, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetHardwareProfile,
               Function | MediumTest | Level1)
{
    const char *value1 = GetHardwareProfile();
    printf("Hardware Profile=%s\n", value1);
    AssertNotEmpty(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetHardwareProfile();
    }
    const char *value2 = GetHardwareProfile();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetSerial
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_0900
 * @tc.desc   test GetSerial length ≤ 64, consistent across queries (may be NULL).
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSerial,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSerial();
    if (value1 == NULL) {
        printf("The serial number needs to be written\n");
        TEST_IGNORE();
    }
    if (value1 != NULL) {
        printf("Serial=%s\n", value1);
        AssertNotEmpty(value1);
        TEST_ASSERT_NOT_NULL(value1);
        TEST_ASSERT_TRUE(strlen(value1) <= 64);
    }
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSerial();
    }
    const char *value2 = GetSerial();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetOSFullName
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1000
 * @tc.desc   test GetOSFullName not empty, length ≤ 64, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetOSFullName,
               Function | MediumTest | Level1)
{
    const char *value1 = GetOSFullName();
    printf("Os Name=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetOSFullName();
    }
    const char *value2 = GetOSFullName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDisplayVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1100
 * @tc.desc   test GetDisplayVersion not empty, length ≤ 64, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDisplayVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetDisplayVersion();
    printf("Display Version=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetDisplayVersion();
    }
    const char *value2 = GetDisplayVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBootloaderVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1200
 * @tc.desc   test GetBootloaderVersion not empty, length ≤ 64, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBootloaderVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBootloaderVersion();
    printf("Bootloader Version=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBootloaderVersion();
    }
    const char *value2 = GetBootloaderVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetSecurityPatchTag
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1300
 * @tc.desc   test GetSecurityPatchTag not empty, length ≤ 64, format valid, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSecurityPatchTag,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSecurityPatchTag();
    printf("Secure Patch Level=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    int year, month, day;
    int ret = sscanf_s(value1, "%04d/%02d/%02d", &year, &month, &day);
    TEST_ASSERT_TRUE(ret >= 0);
    printf("%04d/%02d/%02d\n", year, month, day);
    TEST_ASSERT_TRUE(year > 1900 && year < 2056);
    TEST_ASSERT_TRUE(month <= 12 && month > 0);
    TEST_ASSERT_TRUE(day <= 31 && day > 0);
    char str[32] = {0};
    ret = sprintf_s(str, sizeof(str), "%d/%02d/%02d", year, month, day);
    TEST_ASSERT_TRUE(ret >= 0);
    printf("str=%s\n", str);
    TEST_ASSERT_EQUAL_STRING(str, value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSecurityPatchTag();
    }
    const char *value2 = GetSecurityPatchTag();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetAbiList
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1400
 * @tc.desc   test GetAbiList not empty, length ≤ 64, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetAbiList,
               Function | MediumTest | Level1)
{
    const char *value1 = GetAbiList();
    printf("Abi List=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetAbiList();
    }
    const char *value2 = GetAbiList();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetFirstApiVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1500
 * @tc.desc   test GetFirstApiVersion > 0, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetFirstApiVersion,
               Function | MediumTest | Level1)
{
    int value1 = GetFirstApiVersion();
    printf("First Api Level=%d\n", value1);
    TEST_ASSERT_TRUE(value1 > 0);
    TEST_ASSERT_NOT_NULL(&value1);
    TEST_ASSERT_TRUE((int)value1 == value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        int value = GetFirstApiVersion();
    }
    int value2 = GetFirstApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetIncrementalVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1600
 * @tc.desc   test GetIncrementalVersion not empty, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetIncrementalVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetIncrementalVersion();
    printf("Incremental Version=%s\n", value1);
    AssertNotEmpty(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetIncrementalVersion();
    }
    const char *value2 = GetIncrementalVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetVersionId
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1700
 * @tc.desc   test GetVersionId not empty, length ≤ 127, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetVersionId,
               Function | MediumTest | Level1)
{
    const char *value1 = GetVersionId();
    printf("Version Id=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 127);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetVersionId();
    }
    const char *value2 = GetVersionId();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBuildType
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1800
 * @tc.desc   test GetBuildType not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildType,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildType();
    printf("Build Type=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildType();
    }
    const char *value2 = GetBuildType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBuildUser
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_1900
 * @tc.desc   test GetBuildUser not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildUser,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildUser();
    printf("Build User=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildUser();
    }
    const char *value2 = GetBuildUser();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBuildHost
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2000
 * @tc.desc   test GetBuildHost not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildHost,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildHost();
    printf("Build Host=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildHost();
    }
    const char *value2 = GetBuildHost();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBuildTime
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2100
 * @tc.desc   test GetBuildTime not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildTime,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildTime();
    printf("Build Time=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildTime();
    }
    const char *value2 = GetBuildTime();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetBuildRootHash
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2200
 * @tc.desc   test GetBuildRootHash not null, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildRootHash,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildRootHash();
    printf("Build Root Hash=%s\n", value1);
    TEST_ASSERT_NOT_NULL(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildRootHash();
    }
    const char *value2 = GetBuildRootHash();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetSoftwareModel
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2300
 * @tc.desc   test GetSoftwareModel not empty, length ≤ 32, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSoftwareModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSoftwareModel();
    printf("Software Model=%s\n", value1);
    AssertNotEmpty(value1);
    TEST_ASSERT_NOT_NULL(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSoftwareModel();
    }
    const char *value2 = GetSoftwareModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetSdkApiVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2400
 * @tc.desc   test GetSdkApiVersion > 0, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSdkApiVersion,
               Function | MediumTest | Level1)
{
    int value1 = GetSdkApiVersion();
    printf("Sdk Api Level=%d\n", value1);
    TEST_ASSERT_TRUE(value1 > 0);
    TEST_ASSERT_NOT_NULL(&value1);
    TEST_ASSERT_TRUE((int)value1 == value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        int value = GetSdkApiVersion();
    }
    int value2 = GetSdkApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

RUN_TEST_SUITE(DeviceInfoTestSuite);
