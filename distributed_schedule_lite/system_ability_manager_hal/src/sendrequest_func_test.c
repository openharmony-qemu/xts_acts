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
#define PRESSURE_BASE 10

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
    BOOL(*SyncCall)
    (IUnknown *iUnknown, struct Payload *payload);
    int32 (*SAMGR_SendRequestProxy)(const Identity *identity, const Request *request, Handler handler);
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

static BOOL SyncCall(IUnknown *iUnknown, struct Payload *payload)
{
    (void)iUnknown;
    if (payload != NULL && payload->id >= 0 && payload->name != NULL) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static const char *GetName(Service *service)
{
    (void)service;
    return "serviceName501";
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
    return "featureName501";
}

static const char *FEATURE_GetName02(Feature *feature)
{
    (void)feature;
    return "featureName502";
}

static const char *FEATURE_GetName03(Feature *feature)
{
    (void)feature;
    return "featureName503";
}

static DemoFeature g_feature = {
    .GetName = FEATURE_GetName,
    .OnInitialize = SamgrTestFeatureOnInitializeId44,
    .OnStop = SamgrTestFeatureOnStop,
    .OnMessage = SamgrTestFeatureOnMessageWithSwitch,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SamgrTestSendRequestProxy,
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
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SamgrTestSendRequestProxy,
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
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SamgrTestSendRequestProxy,
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
    SamgrTestRegisterDefaultFeatureApi("serviceName501", GET_IUNKNOWN(g_feature));
    SamgrTestRegisterFeature("serviceName501", (Feature *)&g_feature02);
    SamgrTestRegisterFeatureApi("serviceName501", "featureName502", GET_IUNKNOWN(g_feature02));
    SamgrTestRegisterFeature("serviceName501", (Feature *)&g_feature03);
    SamgrTestRegisterFeatureApi("serviceName501", "featureName503", GET_IUNKNOWN(g_feature03));
}
SYSEX_FEATURE_INIT(FeatureInit);

LITE_TEST_SUIT(test, samgr, SendRequestTestSuite);

static BOOL SendRequestTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL SendRequestTestSuiteTearDown(void)
{
    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName501", "featureName502");
    SAMGR_GetInstance()->UnregisterFeature("serviceName501", "featureName502");
    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName501", "featureName503");
    SAMGR_GetInstance()->UnregisterFeature("serviceName501", "featureName503");
    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName501");
    SAMGR_GetInstance()->UnregisterService("serviceName501");

    return TRUE;
}

/**
 * @tc.name   testSyncCall0010
 * @tc.number DMSLite_SAMGR_SyncCall_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(SendRequestTestSuite, testSyncCall0010, Function | MediumTest | Level1)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    struct Payload payload = {
        .id = 0, // api will return true
        .name = "I wanna sync call good result!",
        .value = 1};
    BOOL result = demoApi->SyncCall((IUnknown *)demoApi, &payload);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    struct Payload payloadX = {
        .id = -1,  // api will return false
        .name = "I wanna sync call good result!",
        .value = 1};
    result = demoApi->SyncCall((IUnknown *)demoApi, &payloadX);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0010
 * @tc.number DMSLite_SAMGR_SendRequest_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0010, Function | MediumTest | Level1)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
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

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0020
 * @tc.number DMSLite_SAMGR_SendRequest_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0020, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
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

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName502");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0030
 * @tc.number DMSLite_SAMGR_SendRequest_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0030, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
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

    Identity identityX = {-1, -200, NULL};
    int32 result = demoApi->SAMGR_SendRequestProxy(&identityX, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0040
 * @tc.number DMSLite_SAMGR_SendRequest_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0040, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    request.len = 0;
    request.data = "I wanna async call good result!";

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0050
 * @tc.number DMSLite_SAMGR_SendRequest_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0050, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(NULL, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    result = demoApi->SAMGR_SendRequestProxy(&feature->identity, NULL, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0060
 * @tc.number DMSLite_SAMGR_SendRequest_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0060, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_NO, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = 0;
    request.data = "I wanna async call good result!";
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    Request request2 = {.msgId = MSG_NO, .msgValue = 0};
    request2.len = (int16)(strlen(body) + 1);
    request2.data = malloc(request2.len);
    if (request2.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request2.data, request2.len, body);

    result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request2, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0070
 * @tc.number DMSLite_SAMGR_SendRequest_0070
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0070, Function | MediumTest | Level2)
{
    DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
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

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, SamgrTestDefaultHandler);
    TEST_ASSERT_EQUAL_INT(result, 0);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    demoApi->Release((IUnknown *)demoApi);
}

/**
 * @tc.name   testSendRequest0080
 * @tc.number DMSLite_SAMGR_SendRequest_0080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0080, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
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

        IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
        if (iUnknown == NULL) {
            TEST_FAIL();
        }
        DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

        int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, SamgrTestDefaultHandler);
        TEST_ASSERT_EQUAL_INT(result, 0);
        TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

        demoApi->Release((IUnknown *)demoApi);
    }
}

/**
 * @tc.name   testSendRequest0090
 * @tc.number DMSLite_SAMGR_SendRequest_0090
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0090, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        DemoApi *demoApi = (DemoApi *)SamgrTestGetIUnknown("serviceName501", "featureName502");
        if (demoApi == NULL) {
            TEST_FAIL();
        }
        Request request = {.msgId = MSG_RT, .msgValue = 0};
        char body[]= "I wanna async call good result!";
        request.len = 0;
        request.data = body;
        
        IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
        if (iUnknown == NULL) {
            TEST_FAIL();
        }
        DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

        int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, SamgrTestDefaultHandler);
        TEST_ASSERT_EQUAL_INT(result, 0);
        TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

        demoApi->Release((IUnknown *)demoApi);
    }
}

/**
 * @tc.name   testSendRequest0100
 * @tc.number DMSLite_SAMGR_SendRequest_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0100, Function | MediumTest | Level2)
{
    Request request = {.msgId = MSG_NO, .msgValue = 0};
    Identity identity = {0, 0, NULL};
    int32 result = SAMGR_SendRequest(NULL, &request, NULL);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
    result = SAMGR_SendRequest(&identity, NULL, NULL);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
    result = SAMGR_SendRequest(NULL, NULL, NULL);
    TEST_ASSERT_EQUAL_INT(EC_INVALID, result);
    /* 正常场景：向已注册服务发送请求应返回成功 */
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown != NULL) {
        DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);
        result = SAMGR_SendRequest(&feature->identity, &request, NULL);
        TEST_ASSERT_EQUAL_INT(EC_SUCCESS, result);
    }
}

RUN_TEST_SUITE(SendRequestTestSuite);
