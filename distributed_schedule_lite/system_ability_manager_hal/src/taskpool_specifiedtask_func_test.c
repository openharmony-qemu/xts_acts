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
 * Create      : 2020/05/16
 */

#include <stdlib.h>
#include "cmsis_os.h"
#include "securec.h"
#include "cmsis_os2.h"
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define OPER_INTERVAL 200    // 200 ms
#define TARGET_NUM 2

static const char *GetName(Service *service);
static BOOL MessageHandle(Service *service, Request *msg);
static TaskConfig GetTaskConfig(Service *service);

static void *g_servicePoint1;
static void *g_servicePoint2;

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
    BOOL(*FeatureApi001)
    (IUnknown *iUnknown, char *para1);
    int32 (*SendRequestProxyF)(const Identity *identity, const Request *request, Handler handler);
} DemoApi;

typedef struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
    int featureCalledCount;
} DemoFeature;

typedef struct DefaultFeatureApi {
    INHERIT_IUNKNOWN;
    BOOL(*DefaultApi001)
    (IUnknown *iUnknown, char *para1);
    int32 (*SendRequestProxyDF)(const Identity *identity, const Request *request, Handler handler);
} DefaultFeatureApi;

typedef struct DemoService {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(DefaultFeatureApi);
    Identity identity;
    int serviceCalledCount;
} DemoService;

static DemoService g_service[] = {
    {
        .GetName = GetName,
        .Initialize = SamgrTestServiceInitializeId40,
        .MessageHandle = MessageHandle,
        .GetTaskConfig = GetTaskConfig,
        .ref = 1,
        .iUnknown = {
            DEFAULT_IUNKNOWN_IMPL,
            .DefaultApi001 = SamgrTestDummyApiHandler,
            .SendRequestProxyDF = SamgrTestSendRequestProxy,
        },
        .serviceCalledCount = 0,
    },
    {
        .GetName = GetName,
        .Initialize = SamgrTestServiceInitializeId40,
        .MessageHandle = MessageHandle,
        .GetTaskConfig = GetTaskConfig,
        .ref = 1,
        .iUnknown = {
            DEFAULT_IUNKNOWN_IMPL,
            .DefaultApi001 = SamgrTestDummyApiHandler,
            .SendRequestProxyDF = SamgrTestSendRequestProxy,
        },
        .serviceCalledCount = 0,
    }
};

static const char *GetName(Service *service)
{
    if (service == (Service *)&g_service[0]) {
        return "SpecifiedT01";
    } else {
        return "SpecifiedT02";
    }
}

static BOOL MessageHandle(Service *service, Request *msg)
{
    (void)msg;
    DemoService *demoService = (DemoService *)service;
    demoService->serviceCalledCount++;

    if (service == (Service *)&g_service[0]) {
        g_servicePoint1 =  osThreadGetId();
    } else {
        g_servicePoint2 =  osThreadGetId();
    }

    return TRUE;
}

static TaskConfig GetTaskConfig(Service *service)
{
    (void)service;
    TaskConfig config = {LEVEL_HIGH, PRI_NORMAL, 1600, 20, SPECIFIED_TASK};
    return config;
}

static DemoFeature g_createFeature = {
    .GetName = SamgrTestGetFeatureName501,
    .OnInitialize = SamgrTestFeatureOnInitializeId44,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessageIncrement,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .FeatureApi001 = SamgrTestDummyApiHandler,
        .SendRequestProxyF = SamgrTestSendRequestProxy,
    },
    .identity = {-1, -1, NULL},
    .featureCalledCount = 0,
};

static void ServiceInit(void)
{
    for (int i = 0; i < TARGET_NUM; i++) {
        SamgrTestRegisterService((Service *)&g_service[i]);
    }
}
SYS_SERVICE_INIT(ServiceInit);

static void FeatureInit(void)
{
    for (int i = 0; i < TARGET_NUM; i++) {
        SamgrTestRegisterDefaultFeatureApi(g_service[i].GetName((Service *)&g_service[i]),
                                           GET_IUNKNOWN(g_service[i]));
        SamgrTestRegisterFeature(g_service[i].GetName((Service *)&g_service[i]),
                                 (Feature *)&g_createFeature);
        SamgrTestRegisterFeatureApi(g_service[i].GetName((Service *)&g_service[i]),
                                    "featureName501", GET_IUNKNOWN(g_createFeature));
    }
}
SYS_FEATURE_INIT(FeatureInit);

LITE_TEST_SUIT(distributedschedule, taskpool, SpecifiedTaskFuncTestSuite);

static BOOL SpecifiedTaskFuncTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL SpecifiedTaskFuncTestSuiteTearDown(void)
{
    SAMGR_GetInstance()->UnregisterFeatureApi("SpecifiedT01", "featureName501");
    SAMGR_GetInstance()->UnregisterFeature("SpecifiedT01", "featureName501");
    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("SpecifiedT01");
    SAMGR_GetInstance()->UnregisterService("SpecifiedT01");

    SAMGR_GetInstance()->UnregisterFeatureApi("SpecifiedT02", "featureName501");
    SAMGR_GetInstance()->UnregisterFeature("SpecifiedT02", "featureName501");
    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("SpecifiedT02");
    SAMGR_GetInstance()->UnregisterService("SpecifiedT02");

    return TRUE;
}

/**
 * @tc.name   testSpecifiedTask0010
 * @tc.number DMSLite_SAMGR_Taskpool_SpecifiedTask_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SpecifiedTaskFuncTestSuite, testSpecifiedTask0010, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("SpecifiedT01", "featureName501");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    BOOL result = demoApi->FeatureApi001((IUnknown *)demoApi, "xxxx");
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    g_createFeature.featureCalledCount = 0;
    Request request = {.msgId = 0, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);
    int32 result2 = demoApi->SendRequestProxyF(&(g_createFeature.identity), &request, NULL);
    TEST_ASSERT_EQUAL_INT(result2 == 0, TRUE);
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(g_createFeature.featureCalledCount == 1, TRUE);

    // *************************** //
    DefaultFeatureApi *defaultApi = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown("SpecifiedT01");
    if (defaultApi == NULL) {
        TEST_FAIL();
    }
    result = defaultApi->DefaultApi001((IUnknown *)defaultApi, "yyyy");
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    g_service[0].serviceCalledCount = 0;
    Request request2 = {.msgId = 0, .msgValue = 0};
    char *body2 = "I want to call defaultFeature!";
    request2.len = (int16)(strlen(body2) + 1);
    request2.data = malloc(request2.len);
    if (request2.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request2.data, request2.len, body2);
    result2 = defaultApi->SendRequestProxyDF(&(g_service[0].identity), &request2, NULL);
    TEST_ASSERT_EQUAL_INT(result2 == 0, TRUE);
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(g_service[0].serviceCalledCount == 1, TRUE);

    defaultApi->Release((IUnknown *)defaultApi);
    demoApi->Release((IUnknown *)demoApi);
};

/**
 * @tc.name   testSpecifiedTask0020
 * @tc.number DMSLite_SAMGR_Taskpool_SpecifiedTask_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SpecifiedTaskFuncTestSuite, testSpecifiedTask0020, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("SpecifiedT02", "featureName501");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    BOOL result = demoApi->FeatureApi001((IUnknown *)demoApi, "xxxx");
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    g_createFeature.featureCalledCount = 0;
    Request request = {.msgId = 0, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);
    int32 result2 = demoApi->SendRequestProxyF(&(g_createFeature.identity), &request, NULL);
    TEST_ASSERT_EQUAL_INT(result2 == 0, TRUE);
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(g_createFeature.featureCalledCount == 1, TRUE);

    // *************************** //
    DefaultFeatureApi *defaultApi = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown("SpecifiedT02");
    if (defaultApi == NULL) {
        TEST_FAIL();
    }
    result = defaultApi->DefaultApi001((IUnknown *)defaultApi, "yyyy");
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    g_service[0].serviceCalledCount = 0;
    Request request2 = {.msgId = 0, .msgValue = 0};
    char *body2 = "I want to call defaultFeature!";
    request2.len = (int16)(strlen(body2) + 1);
    request2.data = malloc(request2.len);
    if (request2.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request2.data, request2.len, body2);
    result2 = defaultApi->SendRequestProxyDF(&(g_service[0].identity), &request2, NULL);
    TEST_ASSERT_EQUAL_INT(result2 == 0, TRUE);
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(g_service[0].serviceCalledCount == 1, TRUE);

    defaultApi->Release((IUnknown *)defaultApi);
    demoApi->Release((IUnknown *)demoApi);
};

/**
 * @tc.name   testSpecifiedTask0030
 * @tc.number DMSLite_SAMGR_Taskpool_SpecifiedTask_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SpecifiedTaskFuncTestSuite, testSpecifiedTask0030, Function | MediumTest | Level2)
{
    DefaultFeatureApi *defaultApi = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown("SpecifiedT01");
    if (defaultApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = 0, .msgValue = 0};
    char *body = "I want to call defaultFeature!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);
    defaultApi->SendRequestProxyDF(&(g_service[0].identity), &request, NULL);

    DefaultFeatureApi *defaultApi2 = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown("SpecifiedT01");
    if (defaultApi2 == NULL) {
        TEST_FAIL();
    }
    Request request2 = {.msgId = 0, .msgValue = 0};
    char *body2 = "I want to call defaultFeature!";
    request2.len = (int16)(strlen(body2) + 1);
    request2.data = malloc(request2.len);
    if (request2.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request2.data, request2.len, body2);
    defaultApi2->SendRequestProxyDF(&(g_service[1].identity), &request2, NULL);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(g_servicePoint1 == g_servicePoint2, TRUE);
    defaultApi2->Release((IUnknown *)defaultApi2);
    defaultApi->Release((IUnknown *)defaultApi);
};
RUN_TEST_SUITE(SpecifiedTaskFuncTestSuite);