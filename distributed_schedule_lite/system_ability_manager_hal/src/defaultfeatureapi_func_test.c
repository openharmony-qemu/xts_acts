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
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define PRESSURE_BASE (1024 * 10)

static SamgrTestApi g_api = {
    DEFAULT_IUNKNOWN_IMPL,
};

static SamgrTestService g_service = {
    .GetName = SamgrTestGetName,
    .Initialize = SamgrTestInitialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .name = "serviceName301",
    .identity = {-1, -1, NULL},
};

LITE_TEST_SUIT(test, samgr, DefaultFeatureApiTestSuite);

static BOOL DefaultFeatureApiTestSuiteSetUp(void)
{
    BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    return result;
}

static BOOL DefaultFeatureApiTestSuiteTearDown(void)
{
    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName301");
    if (strcmp(resultService->GetName(resultService), "serviceName301") == 0) {
        return TRUE;
    } else {
        printf("[hctest]failed to unregister service.\n");
        return FALSE;
    }
}

/**
 * @tc.name   testDefaultFeatureApiLifecycle0010
 * @tc.number DMSLite_SAMGR_DefaultFeatureApi_Lifecycle_0010
 * @tc.desc   Register/Get/Unregister default feature api lifecycle.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DefaultFeatureApiTestSuite, testDefaultFeatureApiLifecycle0010, Function | MediumTest | Level1)
{
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    IUnknown *resultIUnknown1 = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    TEST_ASSERT_EQUAL_INT(resultIUnknown1 != NULL, TRUE);
    IUnknown *resultIUnknown2 = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    TEST_ASSERT_EQUAL_INT(resultIUnknown1 == resultIUnknown2, TRUE);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
    TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);

    resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
}

/**
 * @tc.name   testRegisterDefaultFeatureApiInvalidParams0020
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(DefaultFeatureApiTestSuite, testRegisterDefaultFeatureApiInvalidParams0020, Function | MediumTest | Level2)
{
    struct {
        const char *svc;
        IUnknown *api;
    } cases[] = {
        {NULL, (IUnknown *)&g_api},
        {"noExistService", (IUnknown *)&g_api},
        {"serviceName301", NULL},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi(cases[i].svc, cases[i].api);
        TEST_ASSERT_EQUAL_INT(result, FALSE);
    }
}

/**
 * @tc.name   testGetDefaultFeatureApiInvalidParams0020
 * @tc.number DMSLite_SAMGR_GetDefaultFeatureApi_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(DefaultFeatureApiTestSuite, testGetDefaultFeatureApiInvalidParams0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    const char *cases[] = {
        NULL,
        "noExistService",
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi(cases[i]);
        TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
    }

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testUnregisterDefaultFeatureApiInvalidParams0020
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(DefaultFeatureApiTestSuite, testUnregisterDefaultFeatureApiInvalidParams0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    const char *cases[] = {
        NULL,
        "",
        "noExistService",
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi(cases[i]);
        TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
    }

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testUnregisterDefaultFeatureApi0040
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0040
 * @tc.desc   pressure test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(DefaultFeatureApiTestSuite, testUnregisterDefaultFeatureApi0040, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
        TEST_ASSERT_EQUAL_INT(result, TRUE);

        IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
        TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);

        resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
        TEST_ASSERT_EQUAL_INT(resultIUnknown != NULL, TRUE);

        resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
        TEST_ASSERT_EQUAL_INT(resultIUnknown == NULL, TRUE);
    }
}

RUN_TEST_SUITE(DefaultFeatureApiTestSuite);
