/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "hctest.h"
#include "iot_errno.h"
#include "iot_flash.h"


#define TEST_FLASH_SIZE 8
#define TEST_FLASH_SIZE_4K 4096
#define TEST_FLASH_OFFSET 0xFFFFFFFF

unsigned int (*g_ioTFlashWrite)(unsigned int flashOffset,
                                unsigned int size,
                                const unsigned char *ramData,
                                unsigned char doErase);
unsigned int (*g_ioTFlashRead)(unsigned int flashOffset, unsigned int size, unsigned char *ramData);
unsigned int (*g_ioTFlashErase)(unsigned int flashOffset, unsigned int size);
unsigned int (*g_ioTFlashInit)(void);
unsigned int (*g_ioTFlashDeinit)(void);

LITE_TEST_SUIT(wifiiot, wifiiotlite, IotFlashTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL IotFlashTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL IotFlashTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testIotFlash001
 * @tc.number SUB_UTILS_WIFIIOT_API_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash001, Function | MediumTest | Level1)
{
    g_ioTFlashInit = IoTFlashInit;
};

/**
 * @tc.name   testIotFlash002
 * @tc.number SUB_UTILS_WIFIIOT_API_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash002, Function | MediumTest | Level1)
{
    g_ioTFlashWrite = IoTFlashWrite;

};

/**
 * @tc.name   testIotFlash003
 * @tc.number SUB_UTILS_WIFIIOT_API_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash003, Function | MediumTest | Level1)
{
    g_ioTFlashRead = IoTFlashRead;
};

/**
 * @tc.name   testIotFlash004
 * @tc.number SUB_UTILS_WIFIIOT_API_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash004, Function | MediumTest | Level1)
{
    g_ioTFlashErase = IoTFlashErase;
};

/**
 * @tc.name   testIotFlash005
 * @tc.number SUB_UTILS_WIFIIOT_API_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash005, Function | MediumTest | Level1)
{
    g_ioTFlashDeinit = IoTFlashDeinit;
};

/**
 * @tc.name   testIotFlash006
 * @tc.number SUB_UTILS_WIFIIOT_API_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite,
               testIotFlash006,
               Function | MediumTest | Level1)
{
    unsigned int ret = IoTFlashInit();
    printf("IoTFlashInit return = %d\r\n", ret);
    TEST_ASSERT_TRUE((ret == IOT_SUCCESS) || (ret == IOT_FAILURE));
};

/**
 * @tc.name   testIotFlash007
 * @tc.number SUB_UTILS_WIFIIOT_API_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite,
               testIotFlash007,
               Function | MediumTest | Level1)
{
    unsigned char ramData[TEST_FLASH_SIZE] = {0};
    unsigned int ret = IoTFlashWrite(TEST_FLASH_OFFSET, TEST_FLASH_SIZE, ramData, 0);
    printf("IoTFlashWrite return = %d\r\n", ret);
    /* 非法偏移（0xFFFFFFFF）预期失败：成功返回 0，失败返回板卡实现错误码（ws63 返回 0x80000001） */
    /* ws63 对非法偏移 0xFFFFFFFF 返回驱动错误码 0x80000001（-2147483647） */
    TEST_ASSERT_EQUAL_INT(-2147483647, (int)ret);
    ret = IoTFlashWrite(TEST_FLASH_OFFSET, TEST_FLASH_SIZE, ramData, 1);
    printf("IoTFlashWrite with erase return = %d\r\n", ret);
    /* ws63 对非法偏移 0xFFFFFFFF 返回驱动错误码 0x80000001（-2147483647） */
    TEST_ASSERT_EQUAL_INT(-2147483647, (int)ret);
};

/**
 * @tc.name   testIotFlash008
 * @tc.number SUB_UTILS_WIFIIOT_API_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite,
               testIotFlash008,
               Function | MediumTest | Level1)
{
    unsigned char ramData[TEST_FLASH_SIZE] = {0};
    unsigned int ret = IoTFlashRead(TEST_FLASH_OFFSET, TEST_FLASH_SIZE, ramData);
    printf("IoTFlashRead return = %d\r\n", ret);
    /* 非法偏移/空缓冲预期失败：成功返回 0，失败返回板卡实现错误码 */
    /* ws63 对非法偏移 0xFFFFFFFF 返回驱动错误码 0x80000001（-2147483647） */
    TEST_ASSERT_EQUAL_INT(-2147483647, (int)ret);
    ret = IoTFlashRead(TEST_FLASH_OFFSET, TEST_FLASH_SIZE, NULL);
    printf("IoTFlashRead with null buffer return = %d\r\n", ret);
    /* ws63 对非法偏移 0xFFFFFFFF 返回驱动错误码 0x80000001（-2147483647） */
    TEST_ASSERT_EQUAL_INT(-2147483647, (int)ret);
};

/**
 * @tc.name   testIotFlash009
 * @tc.number SUB_UTILS_WIFIIOT_API_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite,
               testIotFlash009,
               Function | MediumTest | Level1)
{
    unsigned int ret = IoTFlashErase(TEST_FLASH_OFFSET, TEST_FLASH_SIZE_4K);
    printf("IoTFlashErase return = %d\r\n", ret);
    /* 非法偏移预期失败：成功返回 0，失败返回板卡实现错误码 */
    /* ws63 对非法偏移 0xFFFFFFFF 返回驱动错误码 0x80000001（-2147483647） */
    TEST_ASSERT_EQUAL_INT(-2147483647, (int)ret);
};

/**
 * @tc.name   testIotFlash010
 * @tc.number SUB_UTILS_WIFIIOT_API_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite,
               testIotFlash010,
               Function | MediumTest | Level1)
{
    unsigned int ret = IoTFlashDeinit();
    printf("IoTFlashDeinit return = %d\r\n", ret);
    TEST_ASSERT_TRUE((ret == IOT_SUCCESS) || (ret == IOT_FAILURE));
};

RUN_TEST_SUITE(IotFlashTestSuite);
