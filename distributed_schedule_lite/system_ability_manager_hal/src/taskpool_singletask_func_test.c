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

#include <stdlib.h>
#include <string.h>
#include "cmsis_os.h"
#include "securec.h"
#include "hctest.h"
#include "samgr_lite.h"
#include "samgr_maintenance.h"


#define OPER_INTERVAL 200 // 200 ms
#define SERVICE_NUM 4
#define INDEX0 0
#define INDEX1 1
#define INDEX2 2
#define INDEX3 3

static char *g_serviceNameArray[] = {"SingleTS01", "SingleTS02", "SingleTS03", "SingleTS04"};

static const char *GetName(Service *service);
static BOOL Initialize(Service *service, Identity identity);
static BOOL MessageHandle(Service *service, Request *msg);
static TaskConfig GetTaskConfig(Service *service);

#ifdef XTS_OVERLAY_ENABLE
static Vector g_nodeVector __attribute__((section(".sbss")));
#else
static Vector g_nodeVector;
#endif
typedef struct Node {
    int id;
    const char *name;
} Node;
static const Node *GetNode(const Node *node)
{
    return node;
}
static int CompareNode(const Node *node1, const Node *node2)
{
    if (node1->id < node2->id) {
        return -1;
    } else if (node1->id == node2->id) {
        return 0;
    } else {
        return 1;
    }
}

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
    BOOL (*FeatureApi001)(IUnknown *iUnknown, char *para1);
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
    BOOL (*DefaultApi001)(IUnknown *iUnknown, char *para1);
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
        .Initialize = Initialize,
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
        .Initialize = Initialize,
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
        .Initialize = Initialize,
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
        .Initialize = Initialize,
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
    if (service == (Service *)&g_service[INDEX0]) {
        return g_serviceNameArray[INDEX0];
    } else if (service == (Service *)&g_service[INDEX1]) {
        return g_serviceNameArray[INDEX1];
    } else if (service == (Service *)&g_service[INDEX2]) {
        return g_serviceNameArray[INDEX2];
    } else {
        return g_serviceNameArray[INDEX3];
    }
}

#ifdef XTS_OVERLAY_ENABLE
static int g_initlizationOrder __attribute__((section(".sbss")));
#else
static int g_initlizationOrder = 0;
#endif
static BOOL Initialize(Service *service, Identity identity)
{
    DemoService *demoService = (DemoService *)service;
    demoService->identity = identity;

    g_initlizationOrder++;
    Node *node = (Node *)malloc(sizeof(Node));
    if (node == NULL) {
        TEST_FAIL();
    }
    node->id = g_initlizationOrder;
    node->name = service->GetName(service);
    VECTOR_Add(&g_nodeVector, node);
    return TRUE;
}

static BOOL MessageHandle(Service *service, Request *msg)
{
    (void)msg;
    DemoService *demoService = (DemoService *)service;
    demoService->serviceCalledCount++;
    return TRUE;
}

static TaskConfig GetTaskConfig(Service *service)
{
    // stackSize: valid stackSize is [1600, 342000), the L0 RAM size is 342000, if stackSize <= 800, system will crash
    // queueSize: [0, system upper limit), 0: will not create taskpool, the max value depends on RAM size
    // priority: PRI_ABOVE_NORMAL PRI_NORMAL PRI_BELOW_NORMAL PRI_LOW

    TaskConfig config = { LEVEL_HIGH, PRI_NORMAL, 1600, 2, SINGLE_TASK };
    if (service == (Service *)&g_service[INDEX0]) {
        config.priority = PRI_LOW;
    } else if (service == (Service *)&g_service[INDEX1]) {
        config.priority = PRI_BELOW_NORMAL;
    } else if (service == (Service *)&g_service[INDEX2]) {
        config.priority = PRI_NORMAL;
    } else {
        config.priority = PRI_ABOVE_NORMAL;
    }
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
    g_nodeVector = VECTOR_Make((VECTOR_Key)GetNode, (VECTOR_Compare)CompareNode);
    for (int i = 0; i < SERVICE_NUM; i++) {
        SamgrTestRegisterService((Service *)&g_service[i]);
    }
}
SYS_SERVICE_INIT(ServiceInit);

static void FeatureInit(void)
{
    for (int i = 0; i < SERVICE_NUM; i++) {
        SamgrTestRegisterDefaultFeatureApi(g_service[i].GetName((Service *)&g_service[i]),
                                           GET_IUNKNOWN(g_service[i]));
        SamgrTestRegisterFeature(g_service[i].GetName((Service *)&g_service[i]),
                                 (Feature *)&g_createFeature);
        SamgrTestRegisterFeatureApi(g_service[i].GetName((Service *)&g_service[i]),
                                    "featureName501", GET_IUNKNOWN(g_createFeature));
    }
}
SYS_FEATURE_INIT(FeatureInit);

LITE_TEST_SUIT(distributedschedule, samgr, SingleTaskFuncTestSuite);

static BOOL SingleTaskFuncTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL SingleTaskFuncTestSuiteTearDown(void)
{
    for (int i = 0; i < SERVICE_NUM; i++) {
        SAMGR_GetInstance()->UnregisterFeatureApi(g_service[i].GetName((Service *)&g_service[i]), "featureName501");
        SAMGR_GetInstance()->UnregisterFeature(g_service[i].GetName((Service *)&g_service[i]), "featureName501");
        SAMGR_GetInstance()->UnregisterDefaultFeatureApi(g_service[i].GetName((Service *)&g_service[i]));
        SAMGR_GetInstance()->UnregisterService(g_service[i].GetName((Service *)&g_service[i]));
    }

    for (int i = 0; i < VECTOR_Num(&g_nodeVector); i++) {
        Node *vectorAt = (Node *)VECTOR_At(&g_nodeVector, i);
        if (vectorAt != NULL) {
            free(vectorAt);
        }
    }
    VECTOR_Clear(&g_nodeVector);

    return TRUE;
}

static void CheckSingleTaskFeatureApi(const char *serviceName)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown(serviceName, "featureName501");
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
    free(request.data);
    request.data = NULL;
    demoApi->Release((IUnknown *)demoApi);
}

static void CheckSingleTaskDefaultApi(const char *serviceName, Identity *identity, int *calledCount)
{
    DefaultFeatureApi *defaultApi = (DefaultFeatureApi *)SamgrTestGetDefaultIUnknown(serviceName);
    if (defaultApi == NULL) {
        TEST_FAIL();
    }
    BOOL result = defaultApi->DefaultApi001((IUnknown *)defaultApi, "yyyy");
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    Request request = {.msgId = 0, .msgValue = 0};
    char *body = "I want to call defaultFeature!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);
    int32 result2 = defaultApi->SendRequestProxyDF(identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result2 == 0, TRUE);
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(*calledCount == 1, TRUE);
    free(request.data);
    request.data = NULL;
    defaultApi->Release((IUnknown *)defaultApi);
}

static void CheckSingleTaskService(int index)
{
    CheckSingleTaskFeatureApi(g_serviceNameArray[index]);
    CheckSingleTaskDefaultApi(g_serviceNameArray[index], &g_service[index].identity,
                              &g_service[index].serviceCalledCount);
}

/**
 * @tc.name   testSingleTask0010
 * @tc.number DMSLite_SAMGR_Taskpool_SingleTask_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SingleTaskFuncTestSuite, testSingleTask0010, Function | MediumTest | Level2)
{
    CheckSingleTaskService(INDEX0);
};

/**
 * @tc.name   testSingleTask0020
 * @tc.number DMSLite_SAMGR_Taskpool_SingleTask_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SingleTaskFuncTestSuite, testSingleTask0020, Function | MediumTest | Level2)
{
    CheckSingleTaskService(INDEX1);
};

/**
 * @tc.name   testSingleTask0030
 * @tc.number DMSLite_SAMGR_Taskpool_SingleTask_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SingleTaskFuncTestSuite, testSingleTask0030, Function | MediumTest | Level2)
{
    CheckSingleTaskService(INDEX2);
};

/**
 * @tc.name   testSingleTask0040
 * @tc.number DMSLite_SAMGR_Taskpool_SingleTask_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SingleTaskFuncTestSuite, testSingleTask0040, Function | MediumTest | Level2)
{
    CheckSingleTaskService(INDEX3);
};

/**
 * @tc.name   testSingleTask0050
 * @tc.number DMSLite_SAMGR_Taskpool_SingleTask_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SingleTaskFuncTestSuite, testSingleTask0050, Function | MediumTest | Level2)
{
    for (int i = 0; i < VECTOR_Num(&g_nodeVector); i++) {
        Node *vectorAt = (Node *)VECTOR_At(&g_nodeVector, i);
        if (vectorAt == NULL) {
            continue;
        }
        TEST_ASSERT_EQUAL_INT(vectorAt->id, i + 1);
        TEST_ASSERT_EQUAL_INT(strcmp(vectorAt->name, g_serviceNameArray[SERVICE_NUM - (i + 1)]), 0);
    }
};

RUN_TEST_SUITE(SingleTaskFuncTestSuite);