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

static BOOL DeviceInfoTestSuiteSetUp(void)
{
    return TRUE;
}

static BOOL DeviceInfoTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDeviceType,
               Function | MediumTest | Level1)
{
    const char *value1 = GetDeviceType();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetDeviceType();
    }
    const char *value2 = GetDeviceType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetManufacture,
               Function | MediumTest | Level1)
{
    const char *value1 = GetManufacture();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetManufacture();
    }
    const char *value2 = GetManufacture();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBrand,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBrand();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBrand();
    }
    const char *value2 = GetBrand();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetMarketName,
               Function | MediumTest | Level1)
{
    const char *value1 = GetMarketName();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetMarketName();
    }
    const char *value2 = GetMarketName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetProductSeries,
               Function | MediumTest | Level1)
{
    const char *value1 = GetProductSeries();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetProductSeries();
    }
    const char *value2 = GetProductSeries();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetProductModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetProductModel();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetProductModel();
    }
    const char *value2 = GetProductModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetHardwareModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetHardwareModel();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetHardwareModel();
    }
    const char *value2 = GetHardwareModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetHardwareProfile,
               Function | MediumTest | Level1)
{
    const char *value1 = GetHardwareProfile();
    AssertNotEmpty(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetHardwareProfile();
    }
    const char *value2 = GetHardwareProfile();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSerial,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSerial();
    if (value1 == NULL) {
        TEST_IGNORE();
    }
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSerial();
    }
    const char *value2 = GetSerial();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetOSFullName,
               Function | MediumTest | Level1)
{
    const char *value1 = GetOSFullName();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetOSFullName();
    }
    const char *value2 = GetOSFullName();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetDisplayVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetDisplayVersion();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetDisplayVersion();
    }
    const char *value2 = GetDisplayVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBootloaderVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBootloaderVersion();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBootloaderVersion();
    }
    const char *value2 = GetBootloaderVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSecurityPatchTag,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSecurityPatchTag();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    int year, month, day;
    int ret = sscanf_s(value1, "%04d/%02d/%02d", &year, &month, &day);
    TEST_ASSERT_TRUE(ret >= 0);
    TEST_ASSERT_TRUE(year > 1900 && year < 2056);
    TEST_ASSERT_TRUE(month <= 12 && month > 0);
    TEST_ASSERT_TRUE(day <= 31 && day > 0);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSecurityPatchTag();
    }
    const char *value2 = GetSecurityPatchTag();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetAbiList,
               Function | MediumTest | Level1)
{
    const char *value1 = GetAbiList();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 64);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetAbiList();
    }
    const char *value2 = GetAbiList();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetFirstApiVersion,
               Function | MediumTest | Level1)
{
    int value1 = GetFirstApiVersion();
    TEST_ASSERT_TRUE(value1 > 0);
    for (int i = 0; i < QUERY_TIMES; i++) {
        int value = GetFirstApiVersion();
    }
    int value2 = GetFirstApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetIncrementalVersion,
               Function | MediumTest | Level1)
{
    const char *value1 = GetIncrementalVersion();
    AssertNotEmpty(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetIncrementalVersion();
    }
    const char *value2 = GetIncrementalVersion();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetVersionId,
               Function | MediumTest | Level1)
{
    const char *value1 = GetVersionId();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 127);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetVersionId();
    }
    const char *value2 = GetVersionId();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildType,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildType();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildType();
    }
    const char *value2 = GetBuildType();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildUser,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildUser();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildUser();
    }
    const char *value2 = GetBuildUser();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildHost,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildHost();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildHost();
    }
    const char *value2 = GetBuildHost();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildTime,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildTime();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildTime();
    }
    const char *value2 = GetBuildTime();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetBuildRootHash,
               Function | MediumTest | Level1)
{
    const char *value1 = GetBuildRootHash();
    TEST_ASSERT_NOT_NULL(value1);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetBuildRootHash();
    }
    const char *value2 = GetBuildRootHash();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSoftwareModel,
               Function | MediumTest | Level1)
{
    const char *value1 = GetSoftwareModel();
    AssertNotEmpty(value1);
    TEST_ASSERT_TRUE(strlen(value1) <= 32);
    for (int i = 0; i < QUERY_TIMES; i++) {
        const char *value = GetSoftwareModel();
    }
    const char *value2 = GetSoftwareModel();
    TEST_ASSERT_EQUAL_STRING(value1, value2);
};

LITE_TEST_CASE(DeviceInfoTestSuite,
               testGetSdkApiVersion,
               Function | MediumTest | Level1)
{
    int value1 = GetSdkApiVersion();
    TEST_ASSERT_TRUE(value1 > 0);
    for (int i = 0; i < QUERY_TIMES; i++) {
        int value = GetSdkApiVersion();
    }
    int value2 = GetSdkApiVersion();
    TEST_ASSERT_EQUAL_INT(value1, value2);
};

RUN_TEST_SUITE(DeviceInfoTestSuite);
