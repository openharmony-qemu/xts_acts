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
#include "broadcast_interface.h"


#define TEST_LEN 10
#define OPER_INTERVAL 200
#define BROADCASR_TEST_SERVICE "S_broadcast1"

static void C1Callback(Consumer *consumer, const Topic *topic, const Request *request)
{
    (void)consumer;
    (void)topic;
    (void)request;
}
static void C2Callback(Consumer *consumer, const Topic *topic, const Request *request)
{
    (void)consumer;
    (void)topic;
    (void)request;
}

static BOOL Equal(const Consumer *current, const Consumer *other)
{
    if (current->Notify == other->Notify) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static const char *GetName(Service *service)
{
    (void)service;
    return BROADCASR_TEST_SERVICE;
};

static Identity g_identity = { -1, -1, NULL};
static BOOL Initialize(Service *service, Identity identity)
{
    g_identity = identity;
    (void)service;
    return TRUE;
};

static BOOL MessageHandle(Service *service, Request *msg)
{
    (void)service;
    (void)msg;
    return FALSE;
};

static TaskConfig GetTaskConfig(Service *service)
{
    TaskConfig config = {LEVEL_HIGH, PRI_NORMAL, 0x800, 20, SHARED_TASK}; // share with broadcast
    (void)service;
    return config;
};

static Service g_service = {GetName, Initialize, MessageHandle, GetTaskConfig};
static void Init(void)
{
    BOOL result = SAMGR_GetInstance()->RegisterService(&g_service);
    if (result == FALSE) {
        printf("[hctest]E RegisterService failed. \n");
    }
}
SYSEX_SERVICE_INIT(Init);

static PubSubInterface *CASE_GetIUnknown(void)
{
    PubSubInterface *fapi = NULL;
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(BROADCAST_SERVICE, PUB_SUB_FEATURE);
    if (iUnknown == NULL) {
        printf("[hctest]failed to GetIUnknown ");
        return NULL;
    }

    int result = iUnknown->QueryInterface(iUnknown, 0, (void **)&fapi);
    if (result != 0 || fapi == NULL) {
        printf("[hctest]failed to QueryInterface ");
    }
    return fapi;
}

static void CASE_ReleaseIUnknown(PubSubInterface *fapi)
{
    fapi->Release((IUnknown *)fapi);
}

LITE_TEST_SUIT(test, broadcast, Broadcast01TestSuite);

static BOOL Broadcast01TestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);

    return TRUE;
}

static BOOL Broadcast01TestSuiteTearDown(void)
{
    return TRUE;
}

/**
 * @tc.name   testAddTopicLifecycle0010
 * @tc.number DMSLite_SAMGR_AddTopic_Lifecycle_0010
 * @tc.desc   Add topic success, NULL topic, and duplicate topic cases.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(Broadcast01TestSuite, testAddTopicLifecycle0010, Function | MediumTest | Level1)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }

    Topic topic0 = 11;
    int result = subscriber->AddTopic((IUnknown *)fapi, &topic0);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    result = subscriber->AddTopic((IUnknown *)fapi, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    result = subscriber->AddTopic((IUnknown *)fapi, &topic0);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    CASE_ReleaseIUnknown(fapi);
}

/**
 * @tc.name   testSubscribeLifecycle0010
 * @tc.number DMSLite_SAMGR_Subscribe_Lifecycle_0010
 * @tc.desc   Subscribe and unsubscribe success lifecycle.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(Broadcast01TestSuite, testSubscribeLifecycle0010, Function | MediumTest | Level1)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }
    static Consumer c1 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};

    Topic topic0 = 9;
    subscriber->AddTopic((IUnknown *)fapi, &topic0);
    int result = subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    Consumer *consumer = subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c1);
    TEST_ASSERT_EQUAL_INT(consumer != NULL, TRUE);

    CASE_ReleaseIUnknown(fapi);
}

/**
 * @tc.name   testSubscribeInvalidParams0020
 * @tc.number DMSLite_SAMGR_Subscribe_0020
 * @tc.desc   Merged invalid-param/duplicate cases (was 0020/0030/0040)
 *            - NULL topic
 *            - NULL consumer
 *            - duplicate subscribe with same consumer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(Broadcast01TestSuite, testSubscribeInvalidParams0020, Function | MediumTest | Level2)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }
    static Consumer c1 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};

    Topic topic0 = 0;
    subscriber->AddTopic((IUnknown *)fapi, &topic0);

    int result = subscriber->Subscribe((IUnknown *)fapi, NULL, &c1);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    result = subscriber->Subscribe((IUnknown *)fapi, &topic0, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);
    result = subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c1);
    CASE_ReleaseIUnknown(fapi);
}

/**
 * @tc.name   testUnsubscribeInvalidParams0020
 * @tc.number DMSLite_SAMGR_UnSubscribe_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030)
 *            - NULL topic
 *            - NULL consumer
 *            - consumer that was never subscribed
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(Broadcast01TestSuite, testUnsubscribeInvalidParams0020, Function | MediumTest | Level2)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }
    static Consumer c1 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};
    static Consumer c2 = {.identity = &g_identity, .Notify = C2Callback, .Equal = Equal};

    Topic topic0 = 0;
    subscriber->AddTopic((IUnknown *)fapi, &topic0);
    subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);

    Consumer *result = subscriber->Unsubscribe((IUnknown *)fapi, NULL, &c1);
    TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);

    result = subscriber->Unsubscribe((IUnknown *)fapi, &topic0, NULL);
    TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);

    result = subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c2);
    TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);

    subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c1);
    CASE_ReleaseIUnknown(fapi);
}

/**
 * @tc.name   testModifyConsumerLifecycle0010
 * @tc.number DMSLite_SAMGR_ModifyConsumer_Lifecycle
 * @tc.desc   Modify consumer success and modify to itself lifecycle.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(Broadcast01TestSuite, testModifyConsumerLifecycle0010, Function | MediumTest | Level2)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }
    static Consumer c1 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};
    static Consumer c2 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};

    Topic topic0 = 0;
    subscriber->AddTopic((IUnknown *)fapi, &topic0);
    subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);

    Consumer *result = subscriber->ModifyConsumer((IUnknown *)fapi, &topic0, &c1, &c2);
    TEST_ASSERT_EQUAL_INT(result != NULL, TRUE);

    result = subscriber->ModifyConsumer((IUnknown *)fapi, &topic0, &c2, &c2);
    TEST_ASSERT_EQUAL_INT(result != NULL, TRUE);

    subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c2);

    CASE_ReleaseIUnknown(fapi);
}

/**
 * @tc.name   testModifyConsumerInvalidParams0020
 * @tc.number DMSLite_SAMGR_ModifyConsumer_0020
 * @tc.desc   Merged invalid-param cases (was 0020/0030/0040)
 *            - NULL topic / NULL old consumer / NULL new consumer
 *            - non-existent topic
 *            - non-existent topic with different consumer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(Broadcast01TestSuite, testModifyConsumerInvalidParams0020, Function | MediumTest | Level2)
{
    PubSubInterface *fapi = CASE_GetIUnknown();
    if (fapi == NULL) {
        TEST_FAIL();
    }
    Subscriber *subscriber = &fapi->subscriber;
    if (subscriber == NULL) {
        TEST_FAIL();
    }
    static Consumer c1 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};
    static Consumer c2 = {.identity = &g_identity, .Notify = C1Callback, .Equal = Equal};

    Topic topic0 = 0;
    Topic noExistTopic = 99;
    subscriber->AddTopic((IUnknown *)fapi, &topic0);
    subscriber->Subscribe((IUnknown *)fapi, &topic0, &c1);

    struct {
        Topic    *topic;
        Consumer *oldC;
        Consumer *newC;
    } cases[] = {
        {NULL,          &c1, &c2},
        {&topic0,       NULL, &c2},
        {&topic0,       &c1, NULL},
        {&noExistTopic, &c1, &c2},
        {&noExistTopic, &c2, &c2},
    };
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        Consumer *result = subscriber->ModifyConsumer((IUnknown *)fapi, cases[i].topic,
                                                       cases[i].oldC, cases[i].newC);
        TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);
    }

    subscriber->Unsubscribe((IUnknown *)fapi, &topic0, &c1);

    CASE_ReleaseIUnknown(fapi);
}

RUN_TEST_SUITE(Broadcast01TestSuite);
