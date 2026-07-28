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
#include "iotc_oh_ble.h"
#include "iotc_oh_device.h"
#include "iotc_oh_sdk.h"

#define TEST_SVC_UUID "16F1E600A27743FCA484DD39EF8A9100"
#define TEST_SVC_INDICATE_UUID "16F1E601A27743FCA484DD39EF8A9100"

#define ONE_THOUSAND 1000

static bool g_iotcInitalizedEvent = false;
static bool g_iotcBleSvcStartEvent = false;

static void TestIotcEventCallback(int32_t event)
{
    if (event == IOTC_CORE_COMM_EVENT_MAIN_INITIALIZED) {
        g_iotcInitalizedEvent = true;
    }
    if (event == IOTC_CORE_COMM_BLE_SVC_START) {
        g_iotcBleSvcStartEvent = true;
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

static void ClearIotcBleSvcStart(void)
{
    g_iotcBleSvcStartEvent = false;
}

static int WaitIotcBleSvcStart(void)
{
    int cnt = ONE_THOUSAND;
    while (cnt > 0) {
        if (g_iotcBleSvcStartEvent) {
            return IOTC_OK;
        }
        cnt--;
        sleep(1);
    }
    return IOTC_ERROR;
}

static const IotcDeviceInfo DEV_INFO = {
    .sn = "12345678",
    .prodId = "12345",
    .subProdId = "",
    .model = "MODEL",
    .devTypeId = "1234",
    .devTypeName = "Dev Type Name",
    .manuId = "123",
    .manuName = "Manu Name",
    .devName = "One Connect Dev Name",
    .fwv = "1.0.0",
    .hwv = "1.0.0",
    .swv = "1.0.0",
    .protType = IOTC_PROT_TYPE_BLE,
};

static IotcBleGattProfileChar g_gattTestChar[] = {
    {
        .uuid = TEST_SVC_INDICATE_UUID,
        .permission = IOTC_BLE_GATT_PERMISSION_READ_ENCRYPTED | IOTC_BLE_GATT_PERMISSION_WRITE_ENCRYPTED,
        .property = IOTC_BLE_GATT_CHARACTER_PROPERTY_BIT_INDICATE,
        .readFunc = NULL,
        .writeFunc = NULL,
        .indicateFunc = NULL,
        .desc = NULL,
        .descNum = 0,
    }
};
static IotcBleGattProfileSvc g_bleGattSvcBuf[] = {
    {
        .uuid = TEST_SVC_UUID,
        .character = g_gattTestChar,
        .charNum = (sizeof(g_gattTestChar) / sizeof(IotcBleGattProfileChar)),
    },
};

static IotcBleGattProfileSvcList g_bleGattSvcList = {
    .svc = g_bleGattSvcBuf,
    .svcNum = sizeof(g_bleGattSvcBuf) / sizeof(IotcBleGattProfileSvc),
};

static int32_t RecvNetCfgInfoCallback(const char *netInfo, uint32_t len)
{
    return 0;
}

static int32_t RecvCustomSecDataCallback(const uint8_t *data, uint32_t len)
{
    return 0;
}

LITE_TEST_SUIT(communication, iot_connect, ActsIotcOhBleTest);

static BOOL ActsIotcOhBleTestSetUp(void)
{
    printf("ActsIotcOhBleTestSetUp \r\n");
    return TRUE;
}

static BOOL ActsIotcOhBleTestTearDown(void)
{
    printf("ActsIotcOhBleTestTearDown \r\n");
    return TRUE;
}

/**
 * @tc.name   testIotcOhBleEnMain0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_EN_MAIN_0100
 * @tc.desc   Test BLE module enable, run main and disable success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleEnMain0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleEnable0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ENABLE_0100
 * @tc.desc   Test enable BLE before main start returns already running error.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleEnable0100, Function | MediumTest | LEVEL3)
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
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_CORE_COMM_FWK_ERR_MAIN_ALREADY_RUNNING);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleDisable0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_DISABLE_0100
 * @tc.desc   Test disable BLE without main start returns already running error.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleDisable0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_CORE_COMM_FWK_ERR_MAIN_ALREADY_RUNNING);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleRelease0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_RELEASE_0100
 * @tc.desc   Test start BLE adv after release returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleRelease0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleRelease0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_RELEASE_0200
 * @tc.desc   Test release BLE without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleRelease0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleRelease0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_RELEASE_0300
 * @tc.desc   Test release BLE during main run returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleRelease0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleRelease0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_RELEASE_0400
 * @tc.desc   Test release BLE with enable but without main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleRelease0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleRelease0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_RELEASE_0500
 * @tc.desc   Test release BLE after main stop returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleRelease0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStart0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_START_0100
 * @tc.desc   Test start BLE adv with 1ms duration success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStart0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(1);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStart0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_START_0200
 * @tc.desc   Test start BLE adv with 0ms duration and stop success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStart0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(0);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStart0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_START_0300
 * @tc.desc   Test start BLE adv with UINT32_MAX duration and stop success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStart0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(UINT32_MAX);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStart0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_START_0400
 * @tc.desc   Test start BLE adv consecutively with different durations success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStart0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(UINT32_MAX);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(1);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(0);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}


/**
 * @tc.name   testIotcOhBleAdvStart0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_START_0500
 * @tc.desc   Test start BLE adv with 1ms duration and stop success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStart0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStartAdv(1);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleDeviceInfo0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_DEVICE_INFO_0100
 * @tc.desc   Test set device info with empty IotcDeviceInfo returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleDeviceInfo0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    static const IotcDeviceInfo devInfo = {0};
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &devInfo);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStop0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_STOP_0100
 * @tc.desc   Test stop BLE adv twice in sequence success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStop0100, Function | MediumTest | LEVEL0)
{
    int ret = 0;
    ret = IotcOhDevInit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_DEVICE_DEV_INFO, &DEV_INFO);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ClearIotcBleSvcStart();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcBleSvcStart();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleRelease();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhDevDeinit();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStop0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_STOP_0200
 * @tc.desc   Test stop BLE adv without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStop0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStop0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_STOP_0300
 * @tc.desc   Test stop BLE adv after enable without main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStop0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvStop0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_STOP_0400
 * @tc.desc   Test stop BLE adv after main start without peer returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvStop0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleStopAdv();
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0100
 * @tc.desc   Test send BLE custom sec data after enable and main success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0200
 * @tc.desc   Test send BLE custom sec data without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0300
 * @tc.desc   Test send BLE custom sec data after enable without main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0400
 * @tc.desc   Test send BLE custom sec data after main without peer returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0500
 * @tc.desc   Test send BLE custom sec data with NULL data returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendCustomSecData(NULL, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleSecSend0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_SEC_SEND_0600
 * @tc.desc   Test send BLE custom sec data with zero length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleSecSend0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendCustomSecData((unsigned char *)"1", 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0100
 * @tc.desc   Test send BLE indicate data twice after main success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0200
 * @tc.desc   Test send BLE indicate data without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0300
 * @tc.desc   Test send BLE indicate data after enable without main returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0400
 * @tc.desc   Test send BLE indicate data twice after main without peer returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_SDK_REG_EVENT_LISTENER, TestIotcEventCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ClearIotcInitivalized();
    ret = IotcOhMain();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = WaitIotcInitivalized();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhStop();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0500
 * @tc.desc   Test send BLE indicate data with NULL svc uuid returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendIndicateData(NULL, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0600
 * @tc.desc   Test send BLE indicate data with NULL char uuid returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, NULL, (unsigned char *)"1", 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0700
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0700
 * @tc.desc   Test send BLE indicate data with NULL value returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0700, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, NULL, 1);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleIndSend0800
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_IND_SEND_0800
 * @tc.desc   Test send BLE indicate data with zero length returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleIndSend0800, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleSendIndicateData(TEST_SVC_UUID, TEST_SVC_INDICATE_UUID, (unsigned char *)"1", 0);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleNetcfgCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_NETCFG_0100
 * @tc.desc   Test register BLE netcfg receive callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleNetcfgCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_NETCFG_CALLBACK, RecvNetCfgInfoCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleNetcfgCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_NETCFG_0200
 * @tc.desc   Test register BLE netcfg receive callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleNetcfgCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_NETCFG_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleNetcfgCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_NETCFG_0300
 * @tc.desc   Test register BLE netcfg receive callback without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleNetcfgCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_NETCFG_CALLBACK, RecvNetCfgInfoCallback);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleCustDataCb0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_CUST_DATA_0100
 * @tc.desc   Test register BLE custom data receive callback success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleCustDataCb0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_CUSTOM_DATA_CALLBACK, RecvCustomSecDataCallback);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleCustDataCb0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_CUST_DATA_0200
 * @tc.desc   Test register BLE custom data receive callback with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleCustDataCb0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_CUSTOM_DATA_CALLBACK, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleCustDataCb0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_CUST_DATA_0300
 * @tc.desc   Test register BLE custom data receive callback without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleCustDataCb0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_RECV_CUSTOM_DATA_CALLBACK, RecvCustomSecDataCallback);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvTimeout0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_TIMEOUT_0100
 * @tc.desc   Test set BLE startup adv timeout with valid value success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvTimeout0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t timeout = 60000;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_START_UP_ADV_TIMEOUT, timeout);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvTimeout0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_TIMEOUT_0200
 * @tc.desc   Test set BLE startup adv timeout with zero success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvTimeout0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    uint32_t timeout = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_START_UP_ADV_TIMEOUT, timeout);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleAdvTimeout0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_ADV_TIMEOUT_0300
 * @tc.desc   Test set BLE startup adv timeout without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleAdvTimeout0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    uint32_t timeout = 60000;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_START_UP_ADV_TIMEOUT, timeout);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0100
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0100
 * @tc.desc   Test set BLE GATT profile service list success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0100, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, &g_bleGattSvcList);
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0200
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0200
 * @tc.desc   Test set BLE GATT profile service list with NULL returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0200, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, NULL);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0300
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0300
 * @tc.desc   Test set BLE GATT profile service list with NULL svc returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0300, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_bleGattSvcList.svc = NULL;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, &g_bleGattSvcList);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_bleGattSvcList.svc = g_bleGattSvcBuf;
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0400
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0400
 * @tc.desc   Test set BLE GATT profile service list with zero svc num returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0400, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhBleEnable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
    g_bleGattSvcList.svcNum = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, &g_bleGattSvcList);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
    g_bleGattSvcList.svcNum = sizeof(g_bleGattSvcBuf) / sizeof(IotcBleGattProfileSvc);
    ret = IotcOhBleDisable();
    TEST_ASSERT_EQUAL_INT(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0500
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0500
 * @tc.desc   Test set BLE GATT profile service list without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0500, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, &g_bleGattSvcList);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

/**
 * @tc.name   testIotcOhBleGatt0600
 * @tc.number SUB_COMMUNICATION_IOTCONNECT_BLE_GATT_0600
 * @tc.desc   Test set BLE GATT profile service list without enable returns failure.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
LITE_TEST_CASE(ActsIotcOhBleTest, testIotcOhBleGatt0600, Function | MediumTest | LEVEL3)
{
    int ret = 0;
    ret = IotcOhSetOption(IOTC_OH_OPTION_BLE_GATT_PROFILE_SVC_LIST, &g_bleGattSvcList);
    TEST_ASSERT_NOT_EQUAL(ret, IOTC_OK);
}

RUN_TEST_SUITE(ActsIotcOhBleTest);