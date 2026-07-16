/**
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Description : testcases for distributedschedule_lite subsystem
 * Create      : 2020/04/19
 */

#include "cmsis_os.h"
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define OPER_INTERVAL 200    // 200 ms

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
    BOOL (*FeatureApi001)(IUnknown *iUnknown, char *para1);
} DemoApi;

typedef struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
} DemoFeature;

typedef struct DefaultFeatureApi {
    INHERIT_IUNKNOWN;
    BOOL (*DefaultApi001)(IUnknown *iUnknown, char *para1);
} DefaultFeatureApi;

typedef struct DemoService {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(DefaultFeatureApi);
    Identity identity;
} DemoService;

static const char *GetName(Service *service)
{
    (void)service;
    return "Service_NoTask";
}

static BOOL Initialize(Service *service, Identity identity)
{
    DemoService *demoService = (DemoService *)service;
    demoService->identity = identity;
    return TRUE;
}

static TaskConfig GetTaskConfig(Service *service)
{
    (void)service;
    TaskConfig config = {LEVEL_HIGH, PRI_NORMAL, 0x800, 20, NO_TASK};
    return config;
}

static DemoService g_createService = {
    .GetName = GetName,
    .Initialize = Initialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = GetTaskConfig,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .DefaultApi001 = SamgrTestDummyApiHandler,
    }
};

static BOOL FEATURE_OnMessage(Feature *feature, Request *request)
{
    (void)feature;
    Response response = {
        .data = "Yes, you did!",
        .len = 0
    };
    SAMGR_SendResponse(request, &response);
    return TRUE;
}

static DemoFeature g_createFeature = {
    .GetName = SamgrTestGetFeatureName501,
    .OnInitialize = SamgrTestFeatureOnInitializeId40,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = FEATURE_OnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .FeatureApi001 = SamgrTestDummyApiHandler,
    },
    .identity = {-1, -1, NULL},
};

static void ServiceInit(void)
{
    SamgrTestRegisterService((Service *)&g_createService);
}
SYSEX_SERVICE_INIT(ServiceInit);

static void FeatureInit(void)
{
    SamgrTestRegisterDefaultFeatureApi("Service_NoTask", GET_IUNKNOWN(g_createService));
    SamgrTestRegisterFeature("Service_NoTask", (Feature *)&g_createFeature);
    SamgrTestRegisterFeatureApi("Service_NoTask", "featureName501", GET_IUNKNOWN(g_createFeature));
}
SYSEX_FEATURE_INIT(FeatureInit);

LITE_TEST_SUIT(distributedschedule, samgr, TaskPoolNoTaskFuncTestSuite);

static BOOL TaskPoolNoTaskFuncTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL TaskPoolNoTaskFuncTestSuiteTearDown(void)
{
    return TRUE;
}

/**
 * @tc.name   testNoTask0010
 * @tc.number DMSLite_SAMGR_Taskpool_NoTask_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(TaskPoolNoTaskFuncTestSuite, testNoTask0010, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("Service_NoTask", "featureName501");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    BOOL result = demoApi->FeatureApi001((IUnknown *)demoApi, "xxxx");
    TEST_ASSERT_EQUAL_INT(result, TRUE);
    demoApi->Release((IUnknown *)demoApi);

    DefaultFeatureApi *defaultApi = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown("Service_NoTask");
    if (defaultApi == NULL) {
        TEST_FAIL();
    }
    result = defaultApi->DefaultApi001((IUnknown *)defaultApi, "yyyy");
    TEST_ASSERT_EQUAL_INT(result, TRUE);
};

RUN_TEST_SUITE(TaskPoolNoTaskFuncTestSuite);