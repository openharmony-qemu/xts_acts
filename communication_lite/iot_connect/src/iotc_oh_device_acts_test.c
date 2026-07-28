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

#include "securec.h"
#include "hctest.h"
#include "cmsis_os2.h"
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include "cJSON.h"

#include "iotc_conf.h"
#include "iotc_def.h"
#include "iotc_errcode.h"
#include "iotc_event.h"
#include "iotc_prof_def.h"
#include "iotc_oh_device.h"
#include "iotc_oh_sdk.h"
#include "utils_common.h"

#define ONE_THOUSAND 1000

static bool g_iotcInitalizedEvent = false;

static void TestIotcEventCallback(int32_t event)
{
    if (event == IOTC_CORE_COMM_EVENT_MAIN_INITIALIZED) {
        g_iotcInitalizedEvent = true;
    }
}

static void ClearIotcInitivalized(void)
{
    g_iotcInitalizedEvent = false;
}

static int WaitIotcInitivalized(void)
{
    int cnt = ONE_THOUSAND;
    while (cnt > 0) {
        if (g_iotcInitalizedEvent) {
            return IOTC_OK;
        }
        cnt--;
        sleep(1);
    }
    return IOTC_ERROR;
}

static IotcCharState g_repChar = {
    .svcId = "test",
    .data = "1",
    .len = 1,
};

static IotcCharState g_repChar1 = {
    .svcId = NULL,
    .data = "1",
    .len = 1,
};

static IotcCharState g_repChar2 = {
    .svcId = "test",
    .data = NULL,
    .len = 1,
};

static IotcCharState g_repChar3 = {
    .svcId = "test",
    .data = "1",
    .len = 0,
};

LITE_TEST_SUIT(communication, iot_connect, ActsIotcOhDeviceTest);

static BOOL ActsIotcOhDeviceTestSetUp(void)
{
    printf("ActsIotcOhDeviceTestSetUp \r\n");
    return TRUE;
}

static BOOL ActsIotcOhDeviceTestTearDown(void)
{
    printf("ActsIotcOhDeviceTestSetUp \r\n");
    return TRUE;
}

/**
 * @tc.name   testIotcOhDeviceInit0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_INIT_0100
 * @tc.desc   Test IotcOhDevInit called returns true.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceInit0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceInit0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_INIT_0200
 * @tc.desc   Test IotcOhDevInit called twice returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceInit0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevInit();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceDeinit0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_DEINIT_0100
 * @tc.desc   Test IotcOhDevDeinit before IotcOhStop returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceDeinit0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0100
 * @tc.desc   Test IotcOhDevReportCharState after init and main success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevReportCharState(&g_repChar, 1);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0200
 * @tc.desc   Test IotcOhDevReportCharState without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(&g_repChar, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0300
 * @tc.desc   Test IotcOhDevReportCharState without main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevReportCharState(&g_repChar, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0400
 * @tc.desc   Test IotcOhDevReportCharState after main stop returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevReportCharState(&g_repChar, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0500
 * @tc.desc   Test IotcOhDevReportCharState with NULL pointer returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(NULL, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0600
 * @tc.desc   Test IotcOhDevReportCharState with zero length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(&g_repChar, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0700
 * @tc.desc   Test IotcOhDevReportCharState with NULL svcId returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(&g_repChar1, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0800
 * @tc.desc   Test IotcOhDevReportCharState with NULL data returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(&g_repChar2, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhDeviceReportChar0900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_DEVICE_REPORT_CHAR_0900
 * @tc.desc   Test IotcOhDevReportCharState with zero data length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhDeviceTest, testIotcOhDeviceReportChar0900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevReportCharState(&g_repChar3, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

RUN_TEST_SUITE(ActsIotcOhDeviceTest);