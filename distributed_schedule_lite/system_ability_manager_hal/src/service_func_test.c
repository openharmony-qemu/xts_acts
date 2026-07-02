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


#define OPER_INTERVAL 200    // 200 ms
#define PRESSURE_BASE (1024 * 10)

static SamgrTestServiceEx g_service = {
    .GetName = SamgrTestGetName,
    .Initialize = SamgrTestServiceExInitialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .name = "serviceName101",
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    }
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
    .name = "featureName101",
    .identity = {-1, -1, NULL},
};

LITE_TEST_SUIT(test, samgr, ServiceTestSuite);

static BOOL ServiceTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL ServiceTestSuiteTearDown(void)
{
    return TRUE;
}

/**
 * @tc.name   testRegisterServiceLifecycle0010
 * @tc.number DMSLite_SAMGR_RegisterService_Lifecycle_0010
 * @tc.desc   Register service and duplicate registration lifecycle.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ServiceTestSuite, testRegisterServiceLifecycle0010, Function | MediumTest | Level1)
{
    BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName101");
    TEST_ASSERT_EQUAL_INT(strcmp(resultService->GetName(resultService), "serviceName101"), 0);
};

/**
 * @tc.name   testRegisterService0020
 * @tc.number DMSLite_SAMGR_RegisterService_0020
 * @tc.desc   NULL service should fail
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testRegisterService0020, Function | MediumTest | Level2)
{
    BOOL result = SAMGR_GetInstance()->RegisterService(NULL);
    TEST_ASSERT_EQUAL_INT(result, FALSE);
}

/**
 * @tc.name   testUnregisterServiceInvalidParams0020
 * @tc.number DMSLite_SAMGR_UnregisterService_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testUnregisterServiceInvalidParams0020, Function | MediumTest | Level2)
{
    const char *cases[] = {
        NULL,
        "",
        "noExistServiceName",
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        Service *resultService = SAMGR_GetInstance()->UnregisterService(cases[i]);
        TEST_ASSERT_EQUAL_INT(resultService == NULL, TRUE);
    }
}

/**
 * @tc.name   testUnregisterService0040
 * @tc.number DMSLite_SAMGR_UnregisterService_0040
 * @tc.desc   cannot unregister service when its default api is registered
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testUnregisterService0040, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName101", GET_IUNKNOWN(g_service));

    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName101");
    TEST_ASSERT_EQUAL_INT(resultService == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName101");
    SAMGR_GetInstance()->UnregisterService("serviceName101");
}

/**
 * @tc.name   testUnregisterService0050
 * @tc.number DMSLite_SAMGR_UnregisterService_0050
 * @tc.desc   cannot unregister service when feature is registered
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testUnregisterService0050, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName101", (Feature *)&g_feature);

    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName101");
    TEST_ASSERT_EQUAL_INT(resultService == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName101", "featureName101");
    SAMGR_GetInstance()->UnregisterService("serviceName101");
}

/**
 * @tc.name   testUnregisterService0060
 * @tc.number DMSLite_SAMGR_UnregisterService_0060
 * @tc.desc   pressure test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testUnregisterService0060, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
        TEST_ASSERT_EQUAL_INT(result, TRUE);

        Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName101");
        TEST_ASSERT_EQUAL_INT(strcmp(resultService->GetName(resultService), "serviceName101"), 0);
    }
}

/**
 * @tc.name   testBootstrap0010
 * @tc.number DMSLite_SAMGR_Bootstrap_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(ServiceTestSuite, testBootstrap0010, Function | MediumTest | Level2)
{
    SAMGR_Bootstrap();
    osDelay(OPER_INTERVAL);

    SamgrLite *samgrLite = SAMGR_GetInstance();
    TEST_ASSERT_EQUAL_INT(TRUE, samgrLite != NULL);
};

RUN_TEST_SUITE(ServiceTestSuite);
