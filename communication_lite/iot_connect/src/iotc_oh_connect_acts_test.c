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

static bool g_iotcInitalizedEvent2 = false;

static void TestIotcEventCallback2(int32_t event)
{
    if (event == IOTC_CORE_COMM_EVENT_MAIN_INITIALIZED) {
        g_iotcInitalizedEvent2 = true;
    }
}

static void ClearIotcInitivalized2(void)
{
    g_iotcInitalizedEvent2 = false;
}

static int WaitIotcInitivalized2(void)
{
    int cnt = ONE_THOUSAND;
    while (cnt > 0) {
        if (g_iotcInitalizedEvent2) {
            return IOTC_OK;
        }
        cnt--;
        sleep(1);
    }
    return IOTC_ERROR;
}

static int32_t PutCharState(const IotcCharState state[], uint32_t num)
{
    return 0;
}

static int32_t GetCharState(const IotcCharState state[], char *out[], uint32_t len[], uint32_t num)
{
    return 0;
}

static int32_t ReportAll(void)
{
    return 0;
}

static int32_t GetPincode(uint8_t *buf, uint32_t bufLen)
{
    return 0;
}

static int32_t GetAcKey(uint8_t *buf, uint32_t bufLen)
{
    return 0;
}

static int32_t NoticeReboot(IotcRebootReason res)
{
    return 0;
}

int32_t DevTrng(uint8_t *buf, uint32_t len)
{
    return 0;
}

static IotcDeviceInfo g_devInfo = {
    .sn = "12345678",
    .prodId = "2F6R0",
    .subProdId = "",
    .model = "DL-01W",
    .devTypeId = "0460",
    .devTypeName = "Table Lamp",
    .manuId = "17C",
    .manuName = "DALEN",
    .devName = "One Connect Dev Name",
    .fwv = "1.0.0",
    .hwv = "1.0.0",
    .swv = "1.0.0",
    .protType = IOTC_PROT_TYPE_BLE,
};

static IotcServiceInfo g_svcInfo[] = {
    {"switch", "switch"},
};

LITE_TEST_SUIT(communication, iot_connect, ActsIotcOhConnectTest);

static BOOL ActsIotcOhConnectTestSetUp(void)
{
    printf("ActsIotcOhConnectTestSetUp \r\n");
    return TRUE;
}

static BOOL ActsIotcOhConnectTestTearDown(void)
{
    printf("ActsIotcOhConnectTestTearDown \r\n");
    return TRUE;
}

/**
 * @tc.name   testIotcOhConnectReset0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESET_0100
 * @tc.desc   Test SDK reset after main start success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReset0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReset0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESET_0200
 * @tc.desc   Test SDK reset after main start twice success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReset0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRestore0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESTORE_0100
 * @tc.desc   Test SDK restore and reset cycle success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRestore0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_AC_KEY_CALLBACK, GetAcKey);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, NoticeReboot);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhRestore();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhRestore();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReset0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESET_0300
 * @tc.desc   Test SDK reset before main returns main task not exists error.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReset0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_SDK_MNGR_ERR_MAIN_TASK_NOT_EXISTS);
}

/**
 * @tc.name   testIotcOhConnectStop0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_STOP_0100
 * @tc.desc   Test SDK stop before main start returns success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectStop0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReset0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESET_0400
 * @tc.desc   Test SDK reset after stop returns main task not exists error.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReset0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_SDK_MNGR_ERR_MAIN_TASK_NOT_EXISTS);
}

/**
 * @tc.name   testIotcOhConnectStop0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_STOP_0200
 * @tc.desc   Test SDK stop twice after reset returns success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectStop0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectMain0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_MAIN_0100
 * @tc.desc   Test SDK main called twice returns already running error.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectMain0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_CORE_COMM_FWK_ERR_MAIN_ALREADY_RUNNING);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRestore0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESTORE_0200
 * @tc.desc   Test SDK restore before main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRestore0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhRestore();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRestore0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_RESTORE_0300
 * @tc.desc   Test SDK restore after stop returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRestore0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhRestore();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0100
 * @tc.desc   Test set SDK log level to MIN success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, IOTC_LOG_LEVEL_MIN);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0200
 * @tc.desc   Test set SDK log level to MAX success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, IOTC_LOG_LEVEL_MAX);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0300
 * @tc.desc   Test set SDK log level to MAX success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, IOTC_LOG_LEVEL_MAX);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0400
 * @tc.desc   Test set SDK log level to NOTICE success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, IOTC_LOG_LEVEL_NOTICE);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0500
 * @tc.desc   Test set SDK log level to custom value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, 100);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectLogLvl0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_LOG_LVL_0600
 * @tc.desc   Test set SDK log level with invalid value returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectLogLvl0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_LOG_LEVEL, 257);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectMainTaskSize0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_MAIN_TASK_SIZE_0100
 * @tc.desc   Test set SDK main task size to zero returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectMainTaskSize0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_MAIN_TASK_SIZE, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectMainTaskSize0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_MAIN_TASK_SIZE_0200
 * @tc.desc   Test set SDK main task size with valid value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectMainTaskSize0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_MAIN_TASK_SIZE, 32 * 1024);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectMonTaskSize0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_MON_TASK_SIZE_0100
 * @tc.desc   Test set SDK monitor task size to zero returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectMonTaskSize0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_MONITOR_TASK_SIZE, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectMonTaskSize0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_MON_TASK_SIZE_0200
 * @tc.desc   Test set SDK monitor task size with valid value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectMonTaskSize0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_MONITOR_TASK_SIZE, 32 * 1024);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectConfigPath0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_CONFIG_PATH_0100
 * @tc.desc   Test set SDK config path with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectConfigPath0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_CONFIG_PATH, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectConfigPath0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_CONFIG_PATH_0200
 * @tc.desc   Test set SDK config path with empty string success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectConfigPath0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_CONFIG_PATH, "");
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectConfigPath0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_CONFIG_PATH_0300
 * @tc.desc   Test set SDK config path exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectConfigPath0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    char buf[130] = {0};
    memset_s(buf, sizeof(buf), 'c', sizeof(buf) - 1);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_CONFIG_PATH, buf);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectConfigPath0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_CONFIG_PATH_0400
 * @tc.desc   Test set SDK config path with max length success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectConfigPath0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    char buf[129] = {0};
    memset_s(buf, sizeof(buf), 'c', sizeof(buf) - 1);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_CONFIG_PATH, buf);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_CONFIG_PATH, "iotc");
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRegEventListener0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REG_EVENT_LISTENER_0100
 * @tc.desc   Test register SDK event listener with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRegEventListener0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRegEventListener0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REG_EVENT_LISTENER_0200
 * @tc.desc   Test unregister SDK event listener before register returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRegEventListener0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_UNREG_EVENT_LISTENER, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRegEventListener0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REG_EVENT_LISTENER_0300
 * @tc.desc   Test register two SDK event listeners and unregister success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRegEventListener0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback2);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_AC_KEY_CALLBACK, GetAcKey);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcInitivalized2();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized2();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcInitivalized2();
    ret = IotcOhReset();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized2();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhRestore();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_UNREG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_UNREG_EVENT_LISTENER, TestIotcEventCallback2);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}


/**
 * @tc.name   testIotcOhConnectPutCharCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PUT_CHAR_CB_0100
 * @tc.desc   Test register device put char state callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPutCharCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_PUT_CHAR_STATE_CALLBACK, PutCharState);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectPutCharCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PUT_CHAR_CB_0200
 * @tc.desc   Test register device put char state callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPutCharCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_PUT_CHAR_STATE_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectPutCharCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PUT_CHAR_CB_0300
 * @tc.desc   Test register device put char state callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPutCharCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_PUT_CHAR_STATE_CALLBACK, PutCharState);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectGetCharCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_GET_CHAR_CB_0100
 * @tc.desc   Test register device get char state callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectGetCharCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_CHAR_STATE_CALLBACK, GetCharState);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectGetCharCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_GET_CHAR_CB_0200
 * @tc.desc   Test register device get char state callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectGetCharCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_CHAR_STATE_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectGetCharCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_GET_CHAR_CB_0300
 * @tc.desc   Test register device get char state callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectGetCharCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_CHAR_STATE_CALLBACK, GetCharState);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReportAllCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REPORT_ALL_CB_0100
 * @tc.desc   Test register device report all callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReportAllCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REPORT_ALL_CALLBACK, ReportAll);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReportAllCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REPORT_ALL_CB_0200
 * @tc.desc   Test register device report all callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReportAllCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REPORT_ALL_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectReportAllCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REPORT_ALL_CB_0300
 * @tc.desc   Test register device report all callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectReportAllCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REPORT_ALL_CALLBACK, ReportAll);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectPincodeCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PINCODE_CB_0100
 * @tc.desc   Test register device get pincode callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPincodeCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_PINCODE_CALLBACK, GetPincode);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectPincodeCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PINCODE_CB_0200
 * @tc.desc   Test register device get pincode callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPincodeCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_PINCODE_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectPincodeCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_PINCODE_CB_0300
 * @tc.desc   Test register device get pincode callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectPincodeCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_PINCODE_CALLBACK, GetPincode);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectAcKeyCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_AC_KEY_CB_0100
 * @tc.desc   Test register device get ac key callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectAcKeyCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_AC_KEY_CALLBACK, GetAcKey);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectAcKeyCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_AC_KEY_CB_0200
 * @tc.desc   Test register device get ac key callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectAcKeyCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_AC_KEY_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectAcKeyCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_AC_KEY_CB_0300
 * @tc.desc   Test register device get ac key callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectAcKeyCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_GET_AC_KEY_CALLBACK, GetAcKey);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDataFreeCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DATA_FREE_CB_0100
 * @tc.desc   Test register device data free callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDataFreeCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DATA_FREE_CALLBACK, cJSON_free);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDataFreeCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DATA_FREE_CB_0200
 * @tc.desc   Test register device data free callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDataFreeCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DATA_FREE_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDataFreeCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DATA_FREE_CB_0300
 * @tc.desc   Test register device data free callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDataFreeCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DATA_FREE_CALLBACK, cJSON_free);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRebootCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REBOOT_CB_0100
 * @tc.desc   Test register device reboot callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRebootCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, NoticeReboot);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRebootCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REBOOT_CB_0200
 * @tc.desc   Test register device reboot callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRebootCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectRebootCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_REBOOT_CB_0300
 * @tc.desc   Test register device reboot callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectRebootCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, NoticeReboot);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectTrngCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_TRNG_CB_0100
 * @tc.desc   Test register device trng callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectTrngCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, DevTrng);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectTrngCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_TRNG_CB_0200
 * @tc.desc   Test register device trng callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectTrngCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectTrngCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_TRNG_CB_0300
 * @tc.desc   Test register device trng callback without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectTrngCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_REBOOT_CALLBACK, DevTrng);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0100
 * @tc.desc   Test set device info with valid value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0200
 * @tc.desc   Test set device info with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0300
 * @tc.desc   Test set device info with NULL sn returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.sn = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.sn = "12345678";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0400
 * @tc.desc   Test set device info with NULL prod id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.prodId = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.prodId = "2F6R0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0500
 * @tc.desc   Test set device info with NULL sub prod id success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.subProdId = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.subProdId = "";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0600
 * @tc.desc   Test set device info with NULL model returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.model = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.model = "DL-01W";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0700
 * @tc.desc   Test set device info with NULL dev type id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.devTypeId = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeId = "0460";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0800
 * @tc.desc   Test set device info with NULL dev type name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.devTypeName = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeName = "Table Lamp";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo0900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_0900
 * @tc.desc   Test set device info with NULL manu id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo0900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.manuId = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuId = "17C";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1000
 * @tc.desc   Test set device info with NULL manu name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.manuName = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuName = "DALEN";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1100
 * @tc.desc   Test set device info with NULL firmware version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.fwv = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.fwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1200
 * @tc.desc   Test set device info with NULL hardware version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.hwv = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.hwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1300
 * @tc.desc   Test set device info with NULL software version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.swv = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.swv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1400
 * @tc.desc   Test set device info with min length sn returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.sn = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.sn = "12345678";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1500
 * @tc.desc   Test set device info with min length prod id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_PRO_ID_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_PRO_ID_STR_LEN - 1);
    g_devInfo.prodId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.prodId = "2F6R0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1600
 * @tc.desc   Test set device info with min length model returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.model = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.model = "DL-01W";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1700
 * @tc.desc   Test set device info with min length dev type id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_DEV_TYPE_ID_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_DEV_TYPE_ID_STR_LEN - 1);
    g_devInfo.devTypeId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeId = "0460";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1800
 * @tc.desc   Test set device info with min length dev type name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.devTypeName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeName = "Table Lamp";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo1900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_1900
 * @tc.desc   Test set device info with min length manu id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo1900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_MANU_ID_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_MANU_ID_STR_LEN - 1);
    g_devInfo.manuId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuId = "17C";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2000
 * @tc.desc   Test set device info with min length manu name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.manuName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuName = "17C";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2100
 * @tc.desc   Test set device info with min length firmware version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.fwv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.fwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2200
 * @tc.desc   Test set device info with min length hardware version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.hwv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.hwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2300
 * @tc.desc   Test set device info with min length software version returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.swv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.swv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2400
 * @tc.desc   Test set device info with sn exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_SN_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_SN_STR_MAX_LEN + 1);
    g_devInfo.sn = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.sn = "12345678";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2500
 * @tc.desc   Test set device info with prod id exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_PRO_ID_STR_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_PRO_ID_STR_LEN + 1);
    g_devInfo.prodId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.prodId = "2F6R0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2600
 * @tc.desc   Test set device info with model exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_MODEL_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_MODEL_STR_MAX_LEN + 1);
    g_devInfo.model = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.model = "DL-01W";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2700
 * @tc.desc   Test set device info with dev type id exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_DEV_TYPE_ID_STR_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_DEV_TYPE_ID_STR_LEN + 1);
    g_devInfo.devTypeId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeId = "0460";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2800
 * @tc.desc   Test set device info with dev type name exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_DEV_TYPE_NAME_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_DEV_TYPE_NAME_STR_MAX_LEN + 1);
    g_devInfo.devTypeName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devTypeName = "Table Lamp";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo2900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_2900
 * @tc.desc   Test set device info with manu id exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo2900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_MANU_ID_STR_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_MANU_ID_STR_LEN + 1);
    g_devInfo.manuId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuId = "17C";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3000
 * @tc.desc   Test set device info with manu name exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_MANU_NAME_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_MANU_NAME_STR_MAX_LEN + 1);
    g_devInfo.manuName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.manuName = "17C";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3100
 * @tc.desc   Test set device info with firmware version exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 1);
    g_devInfo.fwv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.fwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3200
 * @tc.desc   Test set device info with hardware version exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 1);
    g_devInfo.hwv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.hwv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3300
 * @tc.desc   Test set device info with software version exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_FIRMWARE_VER_STR_MAX_LEN + 1);
    g_devInfo.swv = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.swv = "1.0.0";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3400
 * @tc.desc   Test set device info with invalid prot type returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.protType = IOTC_PROT_TYPE_VIRTUAL + 1;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.protType = IOTC_PROT_TYPE_BLE;
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3500
 * @tc.desc   Test set device info without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0100
 * @tc.desc   Test set device service info with valid value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0200
 * @tc.desc   Test set device service info with zero num returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0300
 * @tc.desc   Test set device service info with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, NULL, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0400
 * @tc.desc   Test set device service info with NULL svc id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_svcInfo[0].svcId = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcId = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0500
 * @tc.desc   Test set device service info with NULL svc type returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_svcInfo[0].svcType = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcType = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0600
 * @tc.desc   Test set device service info with min length svc id returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_svcInfo[0].svcId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcId = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0700
 * @tc.desc   Test set device service info with min length svc type returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_svcInfo[0].svcType = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcType = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0800
 * @tc.desc   Test set device service info with svc id exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_SVC_ID_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_SVC_ID_STR_MAX_LEN + 1);
    g_svcInfo[0].svcId = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcId = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo0900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_0900
 * @tc.desc   Test set device service info with svc type exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo0900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_SVC_TYPE_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_SVC_TYPE_STR_MAX_LEN + 1);
    g_svcInfo[0].svcType = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_svcInfo[0].svcType = "switch";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectSvcInfo1000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_SVC_INFO_1000
 * @tc.desc   Test set device service info without init returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectSvcInfo1000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_SVC_INFO, g_svcInfo, sizeof(g_svcInfo) / sizeof(g_svcInfo[0]));
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3600
 * @tc.desc   Test set device info with NULL dev name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_devInfo.devName = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devName = "One Connect Dev Name";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3700
 * @tc.desc   Test set device info with min length dev name returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[UTILS_MIN_STR_LEN] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', UTILS_MIN_STR_LEN - 1);
    g_devInfo.devName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devName = "One Connect Dev Name";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhConnectDeviceInfo3800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_CONN_DEVICE_INFO_3800
 * @tc.desc   Test set device info with dev name exceeding max length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhConnectTest, testIotcOhConnectDeviceInfo3800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    char tmpStr[IOTC_OH_DEV_NAME_STR_MAX_LEN + 2] = {0};
    (void)memset_s(tmpStr, sizeof(tmpStr), 0, sizeof(tmpStr));
    (void)memset_s(tmpStr, sizeof(tmpStr), 'c', IOTC_OH_DEV_NAME_STR_MAX_LEN + 1);
    g_devInfo.devName = tmpStr;
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &g_devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_devInfo.devName = "One Connect Dev Name";
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

RUN_TEST_SUITE(ActsIotcOhConnectTest);