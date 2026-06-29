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
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define PRESSURE_BASE (1024 * 10)

static SamgrTestService g_service = {
    .GetName = SamgrTestGetName,
    .Initialize = SamgrTestInitialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .name = "serviceName401",
    .identity = {-1, -1, NULL},
};

static SamgrTestFeature g_feature = {
    .GetName = SamgrTestFeatureGetName,
    .OnInitialize = SamgrTestFeatureOnInitialize,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .name = "featureName401",
    .identity = {-1, -1, NULL},
};

LITE_TEST_SUIT(test, samgr, FeatureApiTestSuite);

static BOOL FeatureApiTestSuiteSetUp(void)
{
    return TRUE;
}

static BOOL FeatureApiTestSuiteTearDown(void)
{
    return TRUE;
}

/**
 * @tc.name   testRegisterFeatureApiLifecycle0010
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_Lifecycle_0010
 * @tc.desc   Register feature api and duplicate registration lifecycle.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testRegisterFeatureApiLifecycle0010, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401",
                                                          GET_IUNKNOWN(g_feature));
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401",
                                                     GET_IUNKNOWN(g_feature));
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApiInvalidParams0020
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040/0060/0070)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testRegisterFeatureApiInvalidParams0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    struct {
        const char *svc;
        const char *feat;
        IUnknown *api;
    } cases[] = {
        {NULL, "featureName401", GET_IUNKNOWN(g_feature)},
        {"", "featureName401", GET_IUNKNOWN(g_feature)},
        {"serviceName401", "", GET_IUNKNOWN(g_feature)},
        {"serviceName401", "featureName401", NULL},
        {"noExistService", "featureName401", GET_IUNKNOWN(g_feature)},
        {"serviceName401", "noExistFeature", GET_IUNKNOWN(g_feature)},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        BOOL result = SAMGR_GetInstance()->RegisterFeatureApi(cases[i].svc, cases[i].feat, cases[i].api);
        TEST_ASSERT_EQUAL_INT(result, FALSE);
    }

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0050
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0050
 * @tc.desc   feature is null, handle as default feature api
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testRegisterFeatureApi0050, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", NULL, GET_IUNKNOWN(g_feature));
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", NULL);
    TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApiLifecycle0010
 * @tc.number DMSLite_SAMGR_GetFeatureApi_Lifecycle
 * @tc.desc   Get feature api and verify repeated get returns the same instance.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testGetFeatureApiLifecycle0010, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown1 = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    TEST_ASSERT_EQUAL_INT(resultIUnknown1 != NULL, TRUE);
    IUnknown *resultIUnknown2 = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    TEST_ASSERT_EQUAL_INT(resultIUnknown1 == resultIUnknown2, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApiNotFound0020
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0020
 * @tc.desc   Merged invalid/not-found cases (was 0020/0030/0040/0050)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testGetFeatureApiNotFound0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    struct {
        const char *svc;
        const char *feat;
    } cases[] = {
        {NULL, "featureName401"},
        {"", "featureName401"},
        {"serviceName401", NULL},
        {"serviceName401", ""},
        {"noExistService", "featureName401"},
        {"serviceName401", "noExistFeature"},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi(cases[i].svc, cases[i].feat);
        TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
    }

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApiInvalidParams0020
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040/0050)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testUnregisterFeatureApiInvalidParams0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    struct {
        const char *svc;
        const char *feat;
    } cases[] = {
        {NULL, "featureName401"},
        {"", "featureName401"},
        {"serviceName401", ""},
        {"noExistService", "featureName401"},
        {"serviceName401", "noExistFeature"},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi(cases[i].svc, cases[i].feat);
        TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
    }

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0060
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0060
 * @tc.desc   pressure test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureApiTestSuite, testUnregisterFeatureApi0060, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
        TEST_ASSERT_EQUAL_INT(result, TRUE);
        result = SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
        TEST_ASSERT_EQUAL_INT(result, TRUE);
        result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));
        TEST_ASSERT_EQUAL_INT(result, TRUE);

        IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
        TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);
        Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
        TEST_ASSERT_EQUAL_INT(resultFeature != NULL, TRUE);
        Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName401");
        TEST_ASSERT_EQUAL_INT(resultService != NULL, TRUE);
    }
}

RUN_TEST_SUITE(FeatureApiTestSuite);
