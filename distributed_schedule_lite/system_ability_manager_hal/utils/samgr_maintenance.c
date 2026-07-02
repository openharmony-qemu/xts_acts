/*
 * Copyright (c) 2020 Huawei Device Co., Ltd.
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

#include "samgr_maintenance.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "securec.h"
#include "unity.h"
#include "service_impl.h"
#include "samgr_lite_inner.h"

#ifdef SAMGR_LITE_DEBUG
void SAMGR_PrintServices(void)
{
    SamgrLiteImpl *samgr = GET_OBJECT(SAMGR_GetInstance(), SamgrLiteImpl, vtbl);
    int16 num = VECTOR_Num(&samgr->services);
    printf("[hctest][Maintenance]Print Services(%d) Information:\n", num);
    if (num == 0) {
        return;
    }

    MUTEX_Lock(samgr->mutex);
    int16 size = VECTOR_Size(&(samgr->services));
    int i;
    for (i = 0; i < size; ++i) {
        ServiceImpl *impl = VECTOR_At(&(samgr->services), i);
        if (impl == NULL) {
            continue;
        }

        MUTEX_Unlock(samgr->mutex);
        const char *name = impl->service->GetName(impl->service);
        printf("[hctest][Service:%d]<status:%d, name:%s, default:%p, features:%d, task:%p>\n",
               impl->serviceId, impl->inited, name, impl->defaultApi, VECTOR_Num(&impl->features), impl->taskPool);

        TaskPool *pool = impl->taskPool;
        if (pool != NULL) {
            printf("[hctest][TaskPool:%p]<tid:%p, qid:%p, ref:%d, pri:%d, stack:0x%x>\n",
                   pool, pool->tasks[0], pool->queueId, pool->ref, pool->priority, pool->stackSize);
        }

        int16 featureSize = VECTOR_Size(&impl->features);
        int j;
        for (j = 0; j < featureSize; ++j) {
            FeatureImpl *feature = VECTOR_At(&impl->features, j);
            if (feature == NULL) {
                continue;
            }
            name = feature->feature->GetName(feature->feature);
            printf("[hctest][Feature:%d]<name:%s, api:%p>\n", j, name, feature->iUnknown);
        }
        MUTEX_Lock(samgr->mutex);
    }
    MUTEX_Unlock(samgr->mutex);
}
#endif

IUnknown *SamgrTestGetIUnknown(const char *serviceName, const char *featureName)
{
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(serviceName, featureName);
    if (iUnknown == NULL) {
        printf("[hctest]failed to GetFeatureApi.\n");
        return NULL;
    }
    IUnknown *result = NULL;
    int ret = iUnknown->QueryInterface(iUnknown, 0, (void **)&result);
    if (ret == 0 && result != NULL) {
        return result;
    }
    printf("[hctest]failed to QueryInterface.\n");
    return NULL;
}

IUnknown *SamgrTestGetDefaultIUnknown(const char *serviceName)
{
    IUnknown *iUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi(serviceName);
    if (iUnknown == NULL) {
        printf("[hctest]failed to GetFeatureApi.\n");
        return NULL;
    }
    IUnknown *result = NULL;
    int ret = iUnknown->QueryInterface(iUnknown, 0, (void **)&result);
    if (ret == 0 && result != NULL) {
        return result;
    }
    printf("[hctest]failed to QueryInterface.\n");
    return NULL;
}


int32 SamgrTestSendRequestProxy(const Identity *identity, const Request *request, Handler handler)
{
    return SAMGR_SendRequest(identity, request, handler);
}

void SamgrTestDefaultHandler(const Request *request, const Response *response)
{
    (void)request;
    (void)response;
}

/* Internal types for shared Initialize/FEATURE_OnInitialize */
typedef struct {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(SamgrTestApi);
    Identity identity;
} SamgrIpcSvc;

typedef struct {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(SamgrTestApi);
    Identity identity;
} SamgrIpcFtr;

BOOL SamgrTestDefaultInitialize(Service *service, Identity identity)
{
    ((SamgrIpcSvc *)service)->identity = identity;
    return TRUE;
}

void SamgrTestDefaultFeatureOnInitialize(Feature *feature, Service *parent, Identity identity)
{
    ((SamgrIpcFtr *)feature)->identity = identity;
    (void)parent;
}

/* Shared registration helpers */
BOOL SamgrTestRegisterService(Service *service)
{
    BOOL result = SAMGR_GetInstance()->RegisterService(service);
    if (result == FALSE) {
        printf("[hctest]E RegisterService failed.\n");
    }
    return result;
}

BOOL SamgrTestRegisterFeature(const char *serviceName, Feature *feature)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature(serviceName, feature);
    if (result == FALSE) {
        printf("[hctest]E RegisterFeature failed.\n");
    }
    return result;
}

BOOL SamgrTestRegisterFeatureApi(const char *serviceName, const char *featureName, IUnknown *api)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi(serviceName, featureName, api);
    if (result == FALSE) {
        printf("[hctest]E RegisterFeatureApi failed.\n");
    }
    return result;
}

BOOL SamgrTestRegisterDefaultFeatureApi(const char *serviceName, IUnknown *api)
{
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi(serviceName, api);
    if (result == FALSE) {
        printf("[hctest]E RegisterDefaultFeatureApi failed.\n");
    }
    return result;
}

/* Shared service callbacks */
const char *SamgrTestGetName(Service *service)
{
    return ((SamgrTestService *)service)->name;
}

BOOL SamgrTestInitialize(Service *service, Identity identity)
{
    ((SamgrTestService *)service)->identity = identity;
    return TRUE;
}

BOOL SamgrTestServiceExInitialize(Service *service, Identity identity)
{
    ((SamgrTestServiceEx *)service)->identity = identity;
    return TRUE;
}

BOOL SamgrTestMessageHandle(Service *service, Request *msg)
{
    (void)service;
    (void)msg;
    return FALSE;
}

BOOL SamgrTestMessageHandleTrue(Service *service, Request *msg)
{
    (void)service;
    (void)msg;
    return TRUE;
}

TaskConfig SamgrTestGetTaskConfig(Service *service)
{
    (void)service;
    TaskConfig config = {LEVEL_HIGH, PRI_ABOVE_NORMAL, 0x800, 20, SHARED_TASK};
    return config;
}

BOOL SamgrTestDummyApiHandler(IUnknown *iUnknown, char *para1)
{
    (void)iUnknown;
    (void)para1;
    return TRUE;
}

/* Internal types for Family A (2 extra API ptrs = 20B, entry = 24B) */
typedef struct {
    INHERIT_IUNKNOWN;
    int dummy1;
    int dummy2;
} SamgrApi20B;

typedef struct {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(SamgrApi20B);
    Identity identity;
} SamgrFeatureIdAt44;

typedef struct {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(SamgrApi20B);
    Identity identity;
    int featureCalledCount;
} SamgrFeatureWithCount44;

typedef struct {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(SamgrApi20B);
    Identity identity;
    int serviceCalledCount;
} SamgrServiceWithCount40;

BOOL SamgrTestServiceInitializeId40(Service *service, Identity identity)
{
    ((SamgrServiceWithCount40 *)service)->identity = identity;
    return TRUE;
}

void SamgrTestFeatureOnInitializeId44(Feature *feature, Service *parent, Identity identity)
{
    ((SamgrFeatureIdAt44 *)feature)->identity = identity;
    (void)parent;
}

BOOL SamgrTestFeatureOnMessageIncrement(Feature *feature, Request *request)
{
    (void)request;
    ((SamgrFeatureWithCount44 *)feature)->featureCalledCount++;
    return TRUE;
}

/* Internal types for features with 1 extra Api ptr (16B, entry=20B, identity at 40) */
typedef struct {
    INHERIT_IUNKNOWN;
    int dummy1;
} SamgrApi16B;

typedef struct {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(SamgrApi16B);
    Identity identity;
} SamgrFeatureIdAt40;

void SamgrTestFeatureOnInitializeId40(Feature *feature, Service *parent, Identity identity)
{
    ((SamgrFeatureIdAt40 *)feature)->identity = identity;
    (void)parent;
}

/* Internal type for 64B DemoFeature (20B Api, entry=24B, +identity +3 fields).
   Used by SamgrTestFeatureOnMessageWithSwitch for sendrequest/sendsharerequest. */
typedef struct {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(SamgrApi20B);
    Identity identity;
    int featureCalledCount;
    BOOL featureStatus;
    char *latestRequest;
} SamgrFeatureWithAllFields;

enum {
    MSG_ID_NO = 0,
    MSG_ID_RT = 1,
    MSG_ID_FW = 2,
};

BOOL SamgrTestFeatureOnMessageWithSwitch(Feature *feature, Request *request)
{
    int32 returnCode = 0;
    SamgrFeatureWithAllFields *demoFeature = (SamgrFeatureWithAllFields *)feature;
    demoFeature->featureCalledCount++;

    if (demoFeature->latestRequest != NULL) {
        free(demoFeature->latestRequest);
    }
    int requestLen;
    if (request->len > 0) {
        requestLen = request->len;
    } else {
        requestLen = strlen((char *)request->data) + 1;
    }
    demoFeature->latestRequest = (char *)malloc(requestLen * sizeof(char));
    if (demoFeature->latestRequest == NULL) {
        TEST_FAIL();
    }
    errno_t error = strcpy_s(demoFeature->latestRequest, requestLen, (char *)request->data);
    if (error != EOK) {
        TEST_FAIL();
    }

    switch (request->msgId) {
        case MSG_ID_NO:
            returnCode = 0;
            break;
        case MSG_ID_RT:
            {
                Response response = {
                    .data = "Yes, you did!",
                    .len = 0,
                };
                returnCode = SAMGR_SendResponse(request, &response);
            };
            break;
        case MSG_ID_FW:
            {
                returnCode = 0;
            };
            break;
        default:
            break;
    }
    demoFeature->featureStatus = ((returnCode == 0) ? TRUE : FALSE);
    return demoFeature->featureStatus;
}

/* Shared feature callbacks */
const char *SamgrTestFeatureGetName(Feature *feature)
{
    return ((SamgrTestFeature *)feature)->name;
}

const char *SamgrTestGetFeatureName501(Feature *feature)
{
    (void)feature;
    return "featureName501";
}

void SamgrTestFeatureOnInitialize(Feature *feature, Service *parent, Identity identity)
{
    ((SamgrTestFeature *)feature)->identity = identity;
    (void)parent;
}

void SamgrTestFeatureOnStop(Feature *feature, Identity identity)
{
    (void)feature;
    (void)identity;
}

BOOL SamgrTestFeatureOnMessage(Feature *feature, Request *request)
{
    (void)feature;
    (void)request;
    return TRUE;
}