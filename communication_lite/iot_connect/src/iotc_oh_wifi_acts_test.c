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

#include "iotc_ble_def.h"
#include "iotc_conf.h"
#include "iotc_def.h"
#include "iotc_errcode.h"
#include "iotc_event.h"
#include "iotc_prof_def.h"
#include "iotc_oh_device.h"
#include "iotc_oh_sdk.h"
#include "iotc_oh_wifi.h"

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

static int32_t GetRootCA(const char **ca[], uint32_t *num)
{
    return IOTC_OK;
}

LITE_TEST_SUIT(communication, iot_connect, ActsIotcOhWifiTest);

/**
 * @tc.setup     : setup for every testcase
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL ActsIotcOhWifiTestSetUp(void)
{
    printf("ActsIotcOhWifiTestSetUp \r\n");
    return TRUE;
}

/**
 * @tc.teardown  : teardown for every testcase
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL ActsIotcOhWifiTestTearDown(void)
{
    printf("ActsIotcOhWifiTestTearDown \r\n");
    return TRUE;
}

/**
 * @tc.name testIotcOhWifiFlow0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_FLOW_0100
 * @tc.desc Test iotconnect wifi flow.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiFlow0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
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
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiEnable0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_ENABLE_0100
 * @tc.desc Test IotcOhWifiEnable after main start returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiEnable0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiEnable();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiDisable0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_DISABLE_0100
 * @tc.desc Test IotcOhWifiDisable after main start returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiDisable0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0100
 * @tc.desc Test set WIFI send buffer size with valid values success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 3072;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0200
 * @tc.desc Test set WIFI send buffer size with resSize equal to maxSize success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 2048;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0300
 * @tc.desc Test set WIFI send buffer size with maxSize equal to default max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0400
 * @tc.desc Test set WIFI send buffer size with maxSize exceeding default max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0500
 * @tc.desc Test set WIFI send buffer size with maxSize less than resSize returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0600
 * @tc.desc Test set WIFI send buffer size with maxSize zero returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0700
 * @tc.desc Test set WIFI send buffer size with max boundary values success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0800
 * @tc.desc Test set WIFI send buffer size with values exceeding buffer max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 1024;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 2048;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_SEND_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf0900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_0900
 * @tc.desc Test set WIFI send buffer size with resSize zero returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf0900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 0;
    uint32_t maxSize = 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiSendBuf1000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_SEND_BUF_1000
 * @tc.desc Test set WIFI send buffer size without enable returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiSendBuf1000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    uint32_t resSize = 2048;
    uint32_t maxSize = 3072;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_SEND_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0100
 * @tc.desc Test set WIFI recv buffer size with valid values success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 3072;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0200
 * @tc.desc Test set WIFI recv buffer size with resSize equal to maxSize success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 2048;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0300
 * @tc.desc Test set WIFI recv buffer size with maxSize equal to default max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0400
 * @tc.desc Test set WIFI recv buffer size with maxSize exceeding default max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0500
 * @tc.desc Test set WIFI recv buffer size with maxSize less than resSize returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0600
 * @tc.desc Test set WIFI recv buffer size with maxSize zero returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 2048;
    uint32_t maxSize = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0700
 * @tc.desc Test set WIFI recv buffer size with max boundary values success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0800
 * @tc.desc Test set WIFI recv buffer size with values exceeding buffer max success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 1024;
    uint32_t maxSize = IOTC_CONF_WIFI_BUFFER_MAX_SIZE + 2048;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    resSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_SIZE;
    maxSize = IOTC_CONF_WIFI_DEFAULT_RECV_BUFFER_MAX_SIZE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf0900
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_0900
 * @tc.desc Test set WIFI recv buffer size with resSize zero returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf0900, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t resSize = 0;
    uint32_t maxSize = 1024;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiRecvBuf1000
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_RECV_BUF_1000
 * @tc.desc Test set WIFI recv buffer size without enable returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiRecvBuf1000, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    uint32_t resSize = 2048;
    uint32_t maxSize = 3072;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_RECV_BUFFER_SIZE, resSize, maxSize);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0100
 * @tc.desc Test set WIFI netcfg mode to NONE success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_NONE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0200
 * @tc.desc Test set WIFI netcfg mode to SOFTAP success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_SOFTAP;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0300
 * @tc.desc Test set WIFI netcfg mode to BLE_SUP success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_BLE_SUP;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0400
 * @tc.desc Test set WIFI netcfg mode to BLE_AGT success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_BLE_AGT;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0500
 * @tc.desc Test set WIFI netcfg mode with invalid MAX value returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_MAX;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0600
 * @tc.desc Test set WIFI netcfg mode with out of range value returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    int32_t mode = IOTC_NET_CONFIG_MODE_MAX + 1;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgMode0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_MODE_0700
 * @tc.desc Test set WIFI netcfg mode without enable returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgMode0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    int32_t mode = IOTC_NET_CONFIG_MODE_NONE;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_MODE, mode);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgTimeout0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_TIMEOUT_0100
 * @tc.desc Test set WIFI netcfg timeout with valid value success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgTimeout0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t timeout = 60000;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_TIMEOUT, timeout);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgTimeout0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_TIMEOUT_0200
 * @tc.desc Test set WIFI netcfg timeout with zero value success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgTimeout0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t timeout = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_TIMEOUT, timeout);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiNetcfgTimeout0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_NETCFG_TIMEOUT_0300
 * @tc.desc Test set WIFI netcfg timeout without enable returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiNetcfgTimeout0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    uint32_t timeout = 60000;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_NETCFG_TIMEOUT, timeout);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiCertCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_CERT_CB_0100
 * @tc.desc Test register WIFI get cert callback success.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiCertCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_GET_CERT_CALLBACK, GetRootCA);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiCertCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_CERT_CB_0200
 * @tc.desc Test register WIFI get cert callback with NULL returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiCertCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhWifiEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_GET_CERT_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhWifiDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name testIotcOhWifiCertCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_WIFI_CERT_CB_0300
 * @tc.desc Test register WIFI get cert callback without enable returns failure.
 * @tc.type FUNCTION
 * @tc.size MEDIUMTEST
 * @tc.level LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhWifiTest, testIotcOhWifiCertCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_WIFI_GET_CERT_CALLBACK, GetRootCA);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

RUN_TEST_SUITE(ActsIotcOhWifiTest);