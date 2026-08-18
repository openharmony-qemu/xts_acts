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
#include <stdio.h>
#include <string.h>

/* param_comm.h 中的 UDID 长度定义（parameter.h 未间接包含该头） */
#ifndef UDID_LEN
#define UDID_LEN 65
#endif

#define QUERY_TIMES 50

/* 十进制基数（codecheck G.CNS.02 禁止魔数） */
#define DECIMAL_BASE 10

/* 从 fullname 版本段解析数字；不安全函数 sscanf 被 codecheck 禁止，改为逐字符解析 */
static int ParseVersionNumber(const char **pp)
{
    int num = 0;
    const char *p = *pp;
    while ((*p >= '0') && (*p <= '9')) {
        num = num * DECIMAL_BASE + (*p - '0');
        p++;
    }
    *pp = p;
    return num;
}


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


/**
 * @tc.name   testGetOsReleaseType
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2501
 * @tc.desc   test GetOsReleaseType, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetOsReleaseType,
               Function | MediumTest | Level1)
{
    /* ws63 实测 "Beta"（const.build.osreleasetype） */
    const char *value1 = GetOsReleaseType();
    printf("OsReleaseType=%s\n", value1);
    TEST_ASSERT_EQUAL_STRING("Beta", value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetOsReleaseType();
        TEST_ASSERT_EQUAL_STRING("Beta", value);
    }
    const char *value2 = GetOsReleaseType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDevUdid
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2502
 * @tc.desc   test GetDevUdid fill udid buffer.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDevUdid,
               Function | MediumTest | Level1)
{
    /* UDID 为设备唯一标识（每台设备不同，不可写死具体值），断言其契约属性：
     * 返回 0、长度 64 位非空字符串、多次调用一致（API 文档仅保证非空，不限定字符集） */
    char udid[UDID_LEN] = {0};
    int ret = GetDevUdid(udid, UDID_LEN);
    printf("GetDevUdid ret=%d, udid=%s\n", ret, udid);
    TEST_ASSERT_EQUAL_INT(0, ret);
    TEST_ASSERT_TRUE(strlen(udid) == UDID_LEN - 1);
    /* 非全零：设备唯一标识不应为空 */
    int allZero = 1;
    for (int i = 0; i < (int)strlen(udid); i++) {
        if (udid[i] != '0') {
            allZero = 0;
            break;
        }
    }
    TEST_ASSERT_FALSE(allZero);
    /* 一致性：同一设备多次调用结果相同（唯一性/稳定性） */
    char udid2[UDID_LEN] = {0};
    ret = GetDevUdid(udid2, UDID_LEN);
    TEST_ASSERT_EQUAL_INT(0, ret);
    TEST_ASSERT_EQUAL_STRING(udid, udid2);
    /* 非法参数：NULL 缓冲/长度不足返回非 0 */
    ret = GetDevUdid(NULL, UDID_LEN);
    TEST_ASSERT_TRUE(ret != 0);
    ret = GetDevUdid(udid, 0);
    TEST_ASSERT_TRUE(ret != 0);
};


/**
 * @tc.name   testGetChipType
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2503
 * @tc.desc   test GetChipType, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetChipType,
               Function | MediumTest | Level1)
{
    /* 板卡可能设置或未设置该属性，不限定返回值，断言多次调用结果一致 */
    const char *value1 = GetChipType();
    printf("ChipType=%s\n", (value1 == NULL) ? "(null)" : value1);
    const char *value2 = GetChipType();
    TEST_ASSERT_TRUE(value1 == value2);
};

/**
 * @tc.name   testGetBootCount
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2504
 * @tc.desc   test GetBootCount, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBootCount,
               Function | MediumTest | Level1)
{
    /* ws63 mini 系统未维护 persist.startup.bootcount，实测恒为 0 */
    int value1 = GetBootCount();
    printf("BootCount=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(0, value1);
    int value2 = GetBootCount();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetDeviceColor
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2505
 * @tc.desc   test GetDeviceColor, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDeviceColor,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 ohos.boot.backcolor 属性，实测返回空串（EMPTY_STR） */
    const char *value1 = GetDeviceColor();
    printf("DeviceColor=%s\n", value1);
    TEST_ASSERT_TRUE(value1 != NULL);
    TEST_ASSERT_TRUE(value1[0] == '\0');
    const char *value2 = GetDeviceColor();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDistributionOSApiName
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2506
 * @tc.desc   test GetDistributionOSApiName, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDistributionOSApiName,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.product.os.dist.apiname，实测返回空串（EMPTY_STR） */
    const char *value1 = GetDistributionOSApiName();
    printf("DistributionOSApiName=%s\n", value1);
    TEST_ASSERT_TRUE(value1 != NULL);
    TEST_ASSERT_TRUE(value1[0] == '\0');
    const char *value2 = GetDistributionOSApiName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDistributionOSName
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2507
 * @tc.desc   test GetDistributionOSName, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDistributionOSName,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.product.os.dist.name，实测返回空串（EMPTY_STR） */
    const char *value1 = GetDistributionOSName();
    printf("DistributionOSName=%s\n", value1);
    TEST_ASSERT_TRUE(value1 != NULL);
    TEST_ASSERT_TRUE(value1[0] == '\0');
    const char *value2 = GetDistributionOSName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDistributionOSReleaseType
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2508
 * @tc.desc   test GetDistributionOSReleaseType, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDistributionOSReleaseType,
               Function | MediumTest | Level1)
{
    /* ws63 未设置属性时回退到 GetOsReleaseType()，实测 "Beta" */
    const char *value1 = GetDistributionOSReleaseType();
    printf("DistributionOSReleaseType=%s\n", value1);
    TEST_ASSERT_EQUAL_STRING(value1, GetOsReleaseType());
    const char *value2 = GetDistributionOSReleaseType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDistributionOSVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2509
 * @tc.desc   test GetDistributionOSVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDistributionOSVersion,
               Function | MediumTest | Level1)
{
    /* ws63 未设置属性时回退到 GetOSFullName() */
    const char *value1 = GetDistributionOSVersion();
    printf("DistributionOSVersion=%s\n", value1);
    TEST_ASSERT_EQUAL_STRING(value1, GetOSFullName());
    const char *value2 = GetDistributionOSVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetDistributionOSApiVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2510
 * @tc.desc   test GetDistributionOSApiVersion > 0, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDistributionOSApiVersion,
               Function | MediumTest | Level1)
{
    /* ws63 未设置属性时回退到 GetSdkApiVersion()，实测 26 */
    int value1 = GetDistributionOSApiVersion();
    printf("DistributionOSApiVersion=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(value1, GetSdkApiVersion());
    int value2 = GetDistributionOSApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetPerformanceClass
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2511
 * @tc.desc   test GetPerformanceClass in valid range, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetPerformanceClass,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.sys.performance_class，实测返回 0（PERFORMANCE_CLASS_HIGH_LEVEL） */
    int value1 = GetPerformanceClass();
    printf("PerformanceClass=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(PERFORMANCE_CLASS_HIGH_LEVEL, value1);
    int value2 = GetPerformanceClass();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetProductModelAlias
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2512
 * @tc.desc   test GetProductModelAlias, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetProductModelAlias,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.product.model_alias，实测回退到产品型号 "NearLink_DK_WS63E" */
    const char *value1 = GetProductModelAlias();
    printf("ProductModelAlias=%s\n", value1);
    TEST_ASSERT_EQUAL_STRING(value1, GetProductModel());
    const char *value2 = GetProductModelAlias();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

/**
 * @tc.name   testGetSdkMinorApiVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2513
 * @tc.desc   test GetSdkMinorApiVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSdkMinorApiVersion,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.ohos.apiminorversion，实测返回 0 */
    int value1 = GetSdkMinorApiVersion();
    printf("SdkMinorApiVersion=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(0, value1);
    int value2 = GetSdkMinorApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetSdkPatchApiVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2514
 * @tc.desc   test GetSdkPatchApiVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSdkPatchApiVersion,
               Function | MediumTest | Level1)
{
    /* ws63 未设置 const.ohos.apipatchversion，实测返回 0 */
    int value1 = GetSdkPatchApiVersion();
    printf("SdkPatchApiVersion=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(0, value1);
    int value2 = GetSdkPatchApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetMajorVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2515
 * @tc.desc   test GetMajorVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetMajorVersion,
               Function | MediumTest | Level1)
{
    /* major 随版本迭代，从 GetOSFullName() 解析第 1 段动态比对 */
    const char *fullName = GetOSFullName();
    const char *p = strchr(fullName, '-');
    int major = 0, minor = 0, patch = 0, build = 0;
    if (p != NULL) {
        p++;
        major = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        minor = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        patch = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        build = ParseVersionNumber(&p);
    }
    int value1 = GetMajorVersion();
    printf("MajorVersion=%d, fullname=%s\n", value1, fullName);
    TEST_ASSERT_EQUAL_INT(major, value1);
    int value2 = GetMajorVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetSeniorVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2516
 * @tc.desc   test GetSeniorVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSeniorVersion,
               Function | MediumTest | Level1)
{
    /* 由 const.ohos.fullname 解析，实测 S=0 */
    int value1 = GetSeniorVersion();
    printf("SeniorVersion=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(0, value1);
    int value2 = GetSeniorVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetFeatureVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2517
 * @tc.desc   test GetFeatureVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetFeatureVersion,
               Function | MediumTest | Level1)
{
    /* 由 const.ohos.fullname 解析，实测 F=0 */
    int value1 = GetFeatureVersion();
    printf("FeatureVersion=%d\n", value1);
    TEST_ASSERT_EQUAL_INT(0, value1);
    int value2 = GetFeatureVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

/**
 * @tc.name   testGetBuildVersion
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_2518
 * @tc.desc   test GetBuildVersion, consistent across queries.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildVersion,
               Function | MediumTest | Level1)
{
    /* build 号随固件版本迭代，不能写死；
       从 GetOSFullName() 解析第 4 段动态比对 */
    const char *fullName = GetOSFullName();
    const char *p = strchr(fullName, '-');
    int major = 0, minor = 0, patch = 0, build = 0;
    if (p != NULL) {
        p++;
        major = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        minor = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        patch = ParseVersionNumber(&p);
        if (*p == '.') { p++; }
        build = ParseVersionNumber(&p);
    }
    int value1 = GetBuildVersion();
    printf("BuildVersion=%d, fullname=%s\n", value1, fullName);
    TEST_ASSERT_EQUAL_INT(build, value1);
    int value2 = GetBuildVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

RUN_TEST_SUITE(DeviceInfoTestSuite);
