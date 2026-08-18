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

#include "cmsis_os.h"
#include <ohos_errno.h>
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"
/* G.NAM.03 要求参数 camelBack 命名；hctest 框架枚举 Function 为 PascalCase，定义同值小写别名 */
#define function Function



#define SERVICE_NAME "S_iunknown"
#define FEATURE_NAME "F_iunknown"

static SamgrTestService g_service = {
    .GetName = SamgrTestGetName,
    .Initialize = SamgrTestInitialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .name = SERVICE_NAME,
    .identity = {-1, -1, NULL},
};

static SamgrTestFeature g_feature = {
    .GetName = SamgrTestFeatureGetName,
    .OnInitialize = SamgrTestFeatureOnInitialize,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessage,
    .ver = DEFAULT_VERSION,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .name = FEATURE_NAME,
    .identity = {-1, -1, NULL},
};

static SamgrTestApi g_api = {
    .AddRef = IUNKNOWN_AddRef,
    .QueryInterface = IUNKNOWN_QueryInterface,
    .Release = IUNKNOWN_Release,
};

LITE_TEST_SUIT(test, samgr, IUnknownTestSuite);

static BOOL IUnknownTestSuiteSetUp(void)
{
    BOOL result1 = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    BOOL result2 = SAMGR_GetInstance()->RegisterFeature(SERVICE_NAME, (Feature *)&g_feature);
    if (result1 == TRUE && result2 == TRUE) {
        return TRUE;
    } else {
        printf("[hctest]E failed to register service or feature \n");
        return FALSE;
    }
}

static BOOL IUnknownTestSuiteTearDown(void)
{
    SAMGR_GetInstance()->UnregisterFeature(SERVICE_NAME, FEATURE_NAME);
    SAMGR_GetInstance()->UnregisterService(SERVICE_NAME);
    return TRUE;
}

/**
 * @tc.name   testGetIUnknown0010
 * @tc.number DMSLite_SAMGR_GetIUnknown_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testGetIUnknown0010, Function | MediumTest | Level2)
{
    IUnknown *iUnknown = GET_IUNKNOWN(g_feature);
    TEST_ASSERT_EQUAL_INT(TRUE, iUnknown != NULL);
}

/**
 * @tc.name   testGetObject0010
 * @tc.number DMSLite_SAMGR_GetObject_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testGetObject0010, Function | MediumTest | Level2)
{
    IUnknown *iUnknown = GET_IUNKNOWN(g_feature);
    IUnknownEntry *entry = GET_OBJECT(iUnknown, IUnknownEntry, iUnknown);
    TEST_ASSERT_EQUAL_INT(DEFAULT_VERSION, entry->ver);
    TEST_ASSERT_EQUAL_INT(1, entry->ref);
    int resultAdd = iUnknown->AddRef(iUnknown);
    int resultRelease = iUnknown->Release(iUnknown);
    TEST_ASSERT_EQUAL_INT(1, resultAdd - resultRelease);
}

/**
 * @tc.name   testQueryInterface0010
 * @tc.number DMSLite_SAMGR_QueryInterface_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testQueryInterface0010, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeatureApi(SERVICE_NAME, FEATURE_NAME, GET_IUNKNOWN(g_feature));

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(SERVICE_NAME, FEATURE_NAME);
    SamgrTestApi *demoApi = NULL;
    int resultQuery = iUnknown->QueryInterface(iUnknown, DEFAULT_VERSION, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_SUCCESS, resultQuery);
    TEST_ASSERT_EQUAL_INT(TRUE, demoApi != NULL);
    int resultRelease = iUnknown->Release(iUnknown);
    TEST_ASSERT_EQUAL_INT(1, resultRelease);
    SAMGR_GetInstance()->UnregisterFeatureApi(SERVICE_NAME, FEATURE_NAME);
}

/**
 * @tc.name   testQueryInterface0020
 * @tc.number DMSLite_SAMGR_QueryInterface_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testQueryInterface0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeatureApi(SERVICE_NAME, FEATURE_NAME, GET_IUNKNOWN(g_feature));

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(SERVICE_NAME, FEATURE_NAME);
    SamgrTestApi *demoApi = NULL;
    int resultQuery = iUnknown->QueryInterface(iUnknown, 0x30, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, resultQuery);

    SAMGR_GetInstance()->UnregisterFeatureApi(SERVICE_NAME, FEATURE_NAME);
}

/**
 * @tc.name   testQueryInterface0030
 * @tc.number DMSLite_SAMGR_QueryInterface_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testQueryInterface0030, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeatureApi(SERVICE_NAME, FEATURE_NAME, (IUnknown *)&g_api);
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(SERVICE_NAME, FEATURE_NAME);
    SamgrTestApi *demoApi = NULL;
    int resultQuery = iUnknown->QueryInterface(iUnknown, 0, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_SUCCESS, resultQuery);
    TEST_ASSERT_EQUAL_INT(TRUE, demoApi != NULL);
    demoApi->Release((IUnknown *)demoApi);

    SAMGR_GetInstance()->UnregisterFeatureApi(SERVICE_NAME, FEATURE_NAME);
}

/**
 * @tc.name   testAddRef0020
 * @tc.number DMSLite_SAMGR_AddRef_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testAddRef0020, function | MediumTest | Level2)
{
    IUnknown *iUnknown = GET_IUNKNOWN(g_feature);
    int resultAdd = IUNKNOWN_AddRef(iUnknown);
    TEST_ASSERT_TRUE(resultAdd > 0);
}

/**
 * @tc.name   testQueryInterface0040
 * @tc.number DMSLite_SAMGR_QueryInterface_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testQueryInterface0040, function | MediumTest | Level2)
{
    IUnknown *iUnknown = GET_IUNKNOWN(g_feature);
    SamgrTestApi *demoApi = NULL;
    int resultQuery = IUNKNOWN_QueryInterface(iUnknown, DEFAULT_VERSION, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_SUCCESS, resultQuery);
    TEST_ASSERT_EQUAL_INT(TRUE, demoApi != NULL);
    resultQuery = IUNKNOWN_QueryInterface(iUnknown, 0x30, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, resultQuery);
    resultQuery = IUNKNOWN_QueryInterface(NULL, DEFAULT_VERSION, (void **)&demoApi);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, resultQuery);
}

/**
 * @tc.name   testRelease0020
 * @tc.number DMSLite_SAMGR_Release_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(IUnknownTestSuite, testRelease0020, function | MediumTest | Level2)
{
    IUnknown *iUnknown = GET_IUNKNOWN(g_feature);
    int resultRelease = IUNKNOWN_Release(iUnknown);
    TEST_ASSERT_TRUE(resultRelease >= 0);
    resultRelease = IUNKNOWN_Release(NULL);
    TEST_ASSERT_TRUE(resultRelease < 0);
}

RUN_TEST_SUITE(IUnknownTestSuite);

/* 释放别名，避免影响后续代码 */
#undef function
