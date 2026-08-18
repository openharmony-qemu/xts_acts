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


#define OPER_INTERVAL 200    // 200 ms
#define PRESSURE_BASE (1024 * 10)

enum MessageId {
    MSG_NO, // receiver does not send response
    MSG_RT, // receiver send response
    MSG_FW, // receiver forward message
};

struct Payload {
    int id;
    const char *name;
    int value;
};

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
    uint32 *(*SAMGR_SendSharedRequestProxy)(const Identity *identity, const Request *request, uint32 *token,
                                            Handler handler);
    int32 (*SAMGR_SendSharedDirectRequestProxy)(const Identity *id, const Request *req, const Response *resp,
                                                uint32 **ref, Handler handler);
} DemoApi;

typedef struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
    int featureCalledCount;
    BOOL featureStatus;
    char *latestRequest;
} DemoFeature;

typedef struct DefaultFeatureApi {
    INHERIT_IUNKNOWN;
} DefaultFeatureApi;

typedef struct ExampleService {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(DefaultFeatureApi);
    Identity identity;
} ExampleService;

static uint32 *SAMGR_SendSharedRequestProxy(const Identity *identity, const Request *request, uint32 *token,
                                            Handler handler)
{
    return SAMGR_SendSharedRequest(identity, request, token, handler);
}

static int32 SAMGR_SendSharedDirectRequestProxy(const Identity *id, const Request *req, const Response *resp,
                                                uint32 **ref, Handler handler)
{
    return SAMGR_SendSharedDirectRequest(id, req, resp, ref, handler);
}

static const char *GetName(Service *service)
{
    (void)service;
    return "S_sendShareReq";
}

static ExampleService g_service = {
    .GetName = GetName,
    .Initialize = SamgrTestDefaultInitialize,
    .MessageHandle = SamgrTestMessageHandle,
    .GetTaskConfig = SamgrTestGetTaskConfig,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    }
};

static const char *FEATURE_GetName(Feature *feature)
{
    (void)feature;
    return "feature01";
}

static const char *FEATURE_GetName02(Feature *feature)
{
    (void)feature;
    return "feature02";
}

static const char *FEATURE_GetName03(Feature *feature)
{
    (void)feature;
    return "feature03";
}

static BOOL FEATURE_OnMessage(Feature *feature, Request *request)
{
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->featureCalledCount++;
    demoFeature->latestRequest = (char *)request->data;

    demoFeature->featureStatus = TRUE;
    return TRUE;
}

static DemoFeature g_feature = {
    .GetName = FEATURE_GetName,
    .OnInitialize = SamgrTestFeatureOnInitializeId44,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = FEATURE_OnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SAMGR_SendSharedRequestProxy = SAMGR_SendSharedRequestProxy,
        .SAMGR_SendSharedDirectRequestProxy = SAMGR_SendSharedDirectRequestProxy,
    },
    .identity = {-1, -1, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};
static DemoFeature g_feature02 = {
    .GetName = FEATURE_GetName02,
    .OnInitialize = SamgrTestFeatureOnInitializeId44,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessageWithSwitch,
    .ref = 0,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SAMGR_SendSharedRequestProxy = SAMGR_SendSharedRequestProxy,
        .SAMGR_SendSharedDirectRequestProxy = SAMGR_SendSharedDirectRequestProxy,
    },
    .identity = {-1, 1, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};
static DemoFeature g_feature03 = {
    .GetName = FEATURE_GetName03,
    .OnInitialize = SamgrTestFeatureOnInitializeId44,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessageWithSwitch,
    .ref = 0,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SAMGR_SendSharedRequestProxy = SAMGR_SendSharedRequestProxy,
        .SAMGR_SendSharedDirectRequestProxy = SAMGR_SendSharedDirectRequestProxy,
    },
    .identity = {-1, 2, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};

static void ServiceInit(void)
{
    SamgrTestRegisterService((Service *)&g_service);
}
SYSEX_SERVICE_INIT(ServiceInit);

static void FeatureInit(void)
{
    SamgrTestRegisterDefaultFeatureApi("S_sendShareReq", GET_IUNKNOWN(g_feature));
    SamgrTestRegisterFeature("S_sendShareReq", (Feature *)&g_feature02);
    SamgrTestRegisterFeatureApi("S_sendShareReq", "feature02", GET_IUNKNOWN(g_feature02));
    SamgrTestRegisterFeature("S_sendShareReq", (Feature *)&g_feature03);
    SamgrTestRegisterFeatureApi("S_sendShareReq", "feature03", GET_IUNKNOWN(g_feature03));
}
SYSEX_FEATURE_INIT(FeatureInit);

static void DemoHandlerAndCheck(const Request *request, const Response *response)
{
    char *requestData = "I wanna async call good result!";
    TEST_ASSERT_EQUAL_INT(strcmp((char *)request->data, requestData), 0);

    char *responseData = "Yes, you did!";
    TEST_ASSERT_EQUAL_INT(strcmp((char *)response->data, responseData), 0);
}

LITE_TEST_SUIT(test, samgr, SendSharedRequestTestSuite);

static BOOL SendSharedRequestTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL SendSharedRequestTestSuiteTearDown(void)
{
    SAMGR_GetInstance()->UnregisterFeatureApi("S_sendShareReq", "feature02");
    SAMGR_GetInstance()->UnregisterFeature("S_sendShareReq", "feature02");
    SAMGR_GetInstance()->UnregisterFeatureApi("S_sendShareReq", "feature03");
    SAMGR_GetInstance()->UnregisterFeature("S_sendShareReq", "feature03");
    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("S_sendShareReq");
    SAMGR_GetInstance()->UnregisterService("S_sendShareReq");

    return TRUE;
}

/**
 * @tc.name   testSendSharedRequest0010
 * @tc.number DMSLite_SAMGR_SendSharedRequest_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendSharedRequestTestSuite, testSendSharedRequest0010, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("S_sendShareReq", "feature02");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("S_sendShareReq", "feature03");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    uint32 *token = NULL;
    token = demoApi->SAMGR_SendSharedRequestProxy(&feature->identity, &request, token, DemoHandlerAndCheck);
    
    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount, 1);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendSharedDirectRequest0010
 * @tc.number DMSLite_SAMGR_SendSharedDirectRequest_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendSharedRequestTestSuite, testSendSharedDirectRequest0010, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("S_sendShareReq", "feature02");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("S_sendShareReq", "feature03");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    Response response = {
        .data = "Yes, you did!", 
        .len = 0,
        };
    uint32 *token = NULL;
    int32 result = demoApi->SAMGR_SendSharedDirectRequestProxy(&feature->identity, &request, &response, 
                                                &token, DemoHandlerAndCheck);
    TEST_ASSERT_EQUAL_INT(result, 0);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount, 0);

    demoApi->Release((IUnknown *)demoApi);
}


/**
 * @tc.name   testSendSharedRequest0050
 * @tc.number DMSLite_SAMGR_SendSharedRequest_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendSharedRequestTestSuite, testSendSharedRequest0050, Function | MediumTest | Level2) /* NOLINT(G.NAM.03-CPP) */
{
    Request request = {.msgId = MSG_NO, .msgValue = 0};
    Identity identity = {0, 0, NULL};
    uint32 *token = NULL;
    uint32 *result = SAMGR_SendSharedRequest(NULL, &request, token, NULL);
    TEST_ASSERT_NULL(result);
    result = SAMGR_SendSharedRequest(&identity, NULL, token, NULL);
    TEST_ASSERT_NULL(result);
    result = SAMGR_SendSharedRequest(NULL, NULL, token, NULL);
    TEST_ASSERT_NULL(result);
}

/**
 * @tc.name   testSendSharedDirectRequest0040
 * @tc.number DMSLite_SAMGR_SendSharedDirectRequest_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendSharedRequestTestSuite, testSendSharedDirectRequest0040, Function | MediumTest | Level2) /* NOLINT(G.NAM.03-CPP) */
{
    uint32 *ref = NULL;
    int32 result = SAMGR_SendSharedDirectRequest(NULL, NULL, NULL, NULL, NULL);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
    result = SAMGR_SendSharedDirectRequest(NULL, NULL, NULL, &ref, NULL);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
    result = SAMGR_SendSharedDirectRequest(NULL, NULL, NULL, NULL, DemoHandlerAndCheck);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
}

RUN_TEST_SUITE(SendSharedRequestTestSuite);