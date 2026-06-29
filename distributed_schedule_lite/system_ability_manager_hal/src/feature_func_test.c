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

#include <string.h>
#include "cmsis_os.h"
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define PRESSURE_BASE (1024 * 10)

static SamgrTestService g_service = {
    .GetName = SamgrTestGetName,
    .Initialize = SamgrTestInitialize,
    .MessageHandle = SamgrTestMessageHandleTrue,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .name = "serviceName201",
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
    .name = "featureName201",
    .identity = {-1, -1, NULL},
};
static SamgrTestFeature g_feature2 = {
    .GetName = SamgrTestFeatureGetName,
    .OnInitialize = SamgrTestFeatureOnInitialize,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .name = "featureName202",
    .identity = {-1, -1, NULL},
};

LITE_TEST_SUIT(test, samgr, FeatureTestSuite);

static BOOL FeatureTestSuiteSetUp(void)
{
    BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    return result;
}

static BOOL FeatureTestSuiteTearDown(void)
{
    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName201");
    if (strcmp(resultService->GetName(resultService), "serviceName201") == 0) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @tc.name   testRegisterFeatureLifecycle0010
 * @tc.number DMSLite_SAMGR_RegisterFeature_Lifecycle_0010
 * @tc.desc   Register feature, duplicate register, and register multiple features.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeatureLifecycle0010, Function | MediumTest | Level1)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature2);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName202");
}

/**
 * @tc.name   testRegisterFeatureInvalidParams0020
 * @tc.number DMSLite_SAMGR_RegisterFeature_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeatureInvalidParams0020, Function | MediumTest | Level2)
{
    struct {
        const char *svc;
        Feature *feat;
    } cases[] = {
        {NULL, (Feature *)&g_feature},
        {"serviceName201", NULL},
        {"noExistServiceName", (Feature *)&g_feature},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        BOOL result = SAMGR_GetInstance()->RegisterFeature(cases[i].svc, cases[i].feat);
        TEST_ASSERT_EQUAL_INT(result, FALSE);
    }
}

/**
 * @tc.name   testUnregisterFeature0010
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0010, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    TEST_ASSERT_EQUAL_INT(strcmp(resultFeature->GetName(resultFeature), "featureName201"), 0);
}

/**
 * @tc.name   testUnregisterFeatureInvalidParams0020
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040/0050)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeatureInvalidParams0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    struct {
        const char *svc;
        const char *feat;
    } cases[] = {
        {NULL, "featureName201"},
        {"", "featureName201"},
        {"serviceName201", NULL},
        {"serviceName201", ""},
        {"noExistService", "featureName201"},
        {"serviceName201", "noExistFeature"},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature(cases[i].svc, cases[i].feat);
        TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);
    }

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0060
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0060
 * @tc.desc   cannot unregister feature when its api is registered
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0060, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName201", "featureName201", GET_IUNKNOWN(g_feature));

    Feature *result = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName201", "featureName201");
    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0070
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0070
 * @tc.desc   pressure test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0070, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
        TEST_ASSERT_EQUAL_INT(result, TRUE);

        Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
        TEST_ASSERT_EQUAL_INT(strcmp(resultFeature->GetName(resultFeature), "featureName201"), 0);
    }
}

RUN_TEST_SUITE(FeatureTestSuite);
