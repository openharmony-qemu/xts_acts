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


#include <hiview_util.h>
#include <securec.h>
#include <hiview_config.h>
#include <hiview_def.h>
#include "hiview_output_log.h"
#include "log.h"
#include "hctest.h"

#define TEST_LOG_VALUE 100

LITE_TEST_SUIT(dfx, dfxlite, DfxFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DfxFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DfxFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   subDfxDftHilog0100
 * @tc.number SUB_DFX_DFT_Hilog_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0100, LEVEL0)
{
    HILOG_DEBUG(HILOG_MODULE_HIVIEW, "debuglog test pass");
};


/**
 * @tc.name   subDfxDftHilog0200
 * @tc.number SUB_DFX_DFT_Hilog_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0200, LEVEL1)
{
    HILOG_INFO(HILOG_MODULE_HIVIEW, "infolog test pass");
};

/**
 * @tc.name   subDfxDftHilog0300
 * @tc.number SUB_DFX_DFT_Hilog_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0300, LEVEL1)
{
    HILOG_WARN(HILOG_MODULE_HIVIEW, "warnlog test pass");
};

/**
 * @tc.name   subDfxDftHilog0400
 * @tc.number SUB_DFX_DFT_Hilog_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0400, LEVEL1)
{
    HILOG_ERROR(HILOG_MODULE_HIVIEW, "errorlog test pass");
};

/**
 * @tc.name   subDfxDftHilog0500
 * @tc.number SUB_DFX_DFT_Hilog_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0500, LEVEL1)
{
    HILOG_FATAL(HILOG_MODULE_HIVIEW, "fatallog test pass");
};

/**
 * @tc.name   subDfxDftHilog0600
 * @tc.number SUB_DFX_DFT_Hilog_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0600, LEVEL0)
{
    BOOL ret = TRUE;
    ret = HiLogRegisterModule(HILOG_MODULE_HIVIEW, "HIVIEW");
    TEST_ASSERT_FALSE(ret);
};

/**
 * @tc.name   subDfxDftHilog0700
 * @tc.number SUB_DFX_DFT_Hilog_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0700, LEVEL0)
{
    const char * ret = HiLogGetModuleName(HILOG_MODULE_HIVIEW);
    TEST_ASSERT_EQUAL_STRING(ret, "HIVIEW"); 
};

static boolean g_procCalled = FALSE;
static boolean HilogOutputProc(const HiLogContent *hilogContent, uint32 len)
{
    printf("HilogOutputProc, len is %u\n", len);
    g_procCalled = TRUE;
    return TRUE;
}

static void HilogFileWatcher(const char *path, uint8 type, uint8 event)
{
    printf("HilogFileWatcher, path is %s, type is %d, event is %d\n", path, type, event);
}

/**
 * @tc.name   subDfxDftHilog1000
 * @tc.number SUB_DFX_DFT_Hilog_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1000, LEVEL0)
{
    HiLogRegisterProc(HilogOutputProc);
    g_procCalled = FALSE;
    HiLogPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_INFO, FUN_ARG_NUM(1), "hilog printf test %d", TEST_LOG_VALUE);
    TEST_ASSERT_TRUE(g_procCalled);
    g_procCalled = FALSE;
    HiLogPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_ERROR, FUN_ARG_NUM(0), "hilog printf no para");
    TEST_ASSERT_TRUE(g_procCalled);
    HiLogUnRegisterProc(HilogOutputProc);
};

/**
 * @tc.name   subDfxDftHilog1100
 * @tc.number SUB_DFX_DFT_Hilog_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1100, LEVEL0)
{
    HiLogRegisterProc(HilogOutputProc);
    g_procCalled = FALSE;
    HILOG_HashPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_INFO, FUN_ARG_NUM(1), 0x12345678, TEST_LOG_VALUE);
    TEST_ASSERT_TRUE(g_procCalled);
    g_procCalled = FALSE;
    HILOG_HashPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_ERROR, FUN_ARG_NUM(0), 0x87654321);
    TEST_ASSERT_TRUE(g_procCalled);
    HiLogUnRegisterProc(HilogOutputProc);
};

/**
 * @tc.name   subDfxDftHilog1300
 * @tc.number SUB_DFX_DFT_Hilog_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1300, LEVEL0)
{
    HiLogRegisterProc(HilogOutputProc);
    g_procCalled = FALSE;
    HiLogPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_INFO, FUN_ARG_NUM(1), "hilog register proc test %d", TEST_LOG_VALUE);
    TEST_ASSERT_TRUE(g_procCalled);
    HiLogRegisterProc(NULL);
    g_procCalled = FALSE;
    HiLogPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_INFO, FUN_ARG_NUM(1), "hilog after unregister proc %d", TEST_LOG_VALUE);
    TEST_ASSERT_FALSE(g_procCalled);
};

/**
 * @tc.name   subDfxDftHilog1400
 * @tc.number SUB_DFX_DFT_Hilog_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1400, LEVEL0)
{
    HiLogRegisterProc(HilogOutputProc);
    HiLogUnRegisterProc(HilogOutputProc);
    g_procCalled = FALSE;
    HiLogPrintf(HILOG_MODULE_HIVIEW, HILOG_LV_INFO, FUN_ARG_NUM(1), "hilog unregister proc test %d", TEST_LOG_VALUE);
    TEST_ASSERT_FALSE(g_procCalled);
    HiLogUnRegisterProc(NULL);
};

/**
 * @tc.name   subDfxDftHilog1500
 * @tc.number SUB_DFX_DFT_Hilog_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1500, LEVEL0)
{
    uint32 ret = HiLogGetConfigOption();
    printf("HiLogGetConfigOption ret=%u\n", ret);
    TEST_ASSERT_EQUAL_UINT32(1, ret);
};

/**
 * @tc.name   subDfxDftHilog1800
 * @tc.number SUB_DFX_DFT_Hilog_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog1800, LEVEL0)
{
    int ret = HiLogFileProc(HIVIEW_FILE_OUT_PATH_LOG, 0);
    printf("HiLogFileProc mode=0 ret=%d\n", ret);
    TEST_ASSERT_TRUE(ret < 0);
    ret = HiLogFileProc(HIVIEW_FILE_OUT_PATH_LOG, 1);
    printf("HiLogFileProc mode=1 ret=%d\n", ret);
    TEST_ASSERT_TRUE(ret < 0);
};

/**
 * @tc.name   subDfxDftHilog2100
 * @tc.number SUB_DFX_DFT_Hilog_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog2100, LEVEL0)
{
    uint32 oldLevel = HiLogGetLogLevel();
    BOOL ret = HiLogSetLogLevel(HILOG_LV_DEBUG);
    TEST_ASSERT_TRUE(ret);
    ret = HiLogSetLogLevel(HILOG_LV_MAX);
    TEST_ASSERT_FALSE(ret);
    ret = HiLogSetLogLevel(HILOG_LV_INVALID);
    TEST_ASSERT_FALSE(ret);
    ret = HiLogSetLogLevel(oldLevel);
    TEST_ASSERT_TRUE(ret);
};

/**
 * @tc.name   subDfxDftHilog2200
 * @tc.number SUB_DFX_DFT_Hilog_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog2200, LEVEL0)
{
    uint32 oldLevel = HiLogGetLogLevel();
    TEST_ASSERT_TRUE(oldLevel >= HILOG_LV_DEBUG);
    TEST_ASSERT_TRUE(oldLevel < HILOG_LV_MAX);
    HiLogSetLogLevel(HILOG_LV_ERROR);
    uint32 ret = HiLogGetLogLevel();
    TEST_ASSERT_EQUAL_UINT32(ret, HILOG_LV_ERROR);
    HiLogSetLogLevel(oldLevel);
};

RUN_TEST_SUITE(DfxFuncTestSuite);
