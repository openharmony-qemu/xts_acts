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

#ifndef OHOS_LITE_SAMGR_MAINTENANCE_H
#define OHOS_LITE_SAMGR_MAINTENANCE_H
#include "samgr_lite.h"
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif
#ifdef SAMGR_LITE_DEBUG
void SAMGR_PrintServices(void);
#endif

/* Shared types for test service/feature definitions */
typedef struct SamgrTestApi {
    INHERIT_IUNKNOWN;
} SamgrTestApi;

typedef struct SamgrTestService {
    INHERIT_SERVICE;
    const char *name;
    Identity identity;
} SamgrTestService;

typedef struct SamgrTestServiceEx {
    INHERIT_SERVICE;
    const char *name;
    INHERIT_IUNKNOWNENTRY(SamgrTestApi);
    Identity identity;
} SamgrTestServiceEx;

typedef struct SamgrTestFeature {
    INHERIT_FEATURE;
    const char *name;
    INHERIT_IUNKNOWNENTRY(SamgrTestApi);
    Identity identity;
} SamgrTestFeature;

/* Shared service callbacks */
const char *SamgrTestGetName(Service *service);
BOOL SamgrTestInitialize(Service *service, Identity identity);
BOOL SamgrTestServiceExInitialize(Service *service, Identity identity);
BOOL SamgrTestMessageHandle(Service *service, Request *msg);
BOOL SamgrTestMessageHandleTrue(Service *service, Request *msg);
TaskConfig SamgrTestGetTaskConfig(Service *service);

/* Shared Initialize/FEATURE_OnInitialize for services/features with
   INHERIT_SERVICE/INHERIT_FEATURE + INHERIT_IUNKNOWNENTRY(SamgrTestApi) + Identity layout.
   WARNING: Only safe when INHERIT_IUNKNOWNENTRY(T) uses T=SamgrTestApi (=12B IUnknown),
   giving a 16B entry. If T has extra function pointers, the entry is larger
   (e.g. 20B/24B) and identity will be written at the wrong offset — memory corruption! */
BOOL SamgrTestDefaultInitialize(Service *service, Identity identity);
void SamgrTestDefaultFeatureOnInitialize(Feature *feature, Service *parent, Identity identity);

/* Shared registration helpers (wrap SAMGR_GetInstance()->Register* + error print) */
BOOL SamgrTestRegisterService(Service *service);
BOOL SamgrTestRegisterFeature(const char *serviceName, Feature *feature);
BOOL SamgrTestRegisterFeatureApi(const char *serviceName, const char *featureName, IUnknown *api);
BOOL SamgrTestRegisterDefaultFeatureApi(const char *serviceName, IUnknown *api);

/* Shared Initialize for services where DefaultFeatureApi has 2 extra ptrs
   (DefaultApi001 + SendRequestProxyDF, entry = 24B, identity at offset 40).
   SAFE for: singletask/sharedtask/specifiedtask DemoService. */
BOOL SamgrTestServiceInitializeId40(Service *service, Identity identity);

/* Shared FEATURE_OnInitialize for features where DemoApi has 1 extra ptr
   (entry = 20B, identity at offset 40).
   SAFE for: sendresponse/notask DemoFeature. */
void SamgrTestFeatureOnInitializeId40(Feature *feature, Service *parent, Identity identity);

/* Shared FEATURE_OnInitialize for features where DemoApi has 2 extra ptrs
   (entry = 24B, identity at offset 44).
   SAFE for: singletask/sharedtask/specifiedtask/sendrequest/sendsharerequest DemoFeature. */
void SamgrTestFeatureOnInitializeId44(Feature *feature, Service *parent, Identity identity);

/* Shared FEATURE_OnMessage that increments featureCalledCount and returns TRUE.
   SAFE for: singletask/specifiedtask DemoFeature (featureCalledCount at offset 52). */
BOOL SamgrTestFeatureOnMessageIncrement(Feature *feature, Request *request);

/* Shared FEATURE_OnMessage with full send-response switch/case.
   Accesses featureCalledCount (52), latestRequest (60), featureStatus (56).
   SAFE for: sendrequest/sendsharerequest DemoFeature (64B layout with 20B DemoApi). */
BOOL SamgrTestFeatureOnMessageWithSwitch(Feature *feature, Request *request);

/* Shared dummy handler for DefaultApi001/FeatureApi001 */
BOOL SamgrTestDummyApiHandler(IUnknown *iUnknown, char *para1);

/* Shared feature callbacks */
const char *SamgrTestFeatureGetName(Feature *feature);
const char *SamgrTestGetFeatureName501(Feature *feature);
void SamgrTestFeatureOnInitialize(Feature *feature, Service *parent, Identity identity);
void SamgrTestFeatureOnStop(Feature *feature, Identity identity);
BOOL SamgrTestFeatureOnMessage(Feature *feature, Request *request);

/* Existing utility functions */
IUnknown *SamgrTestGetIUnknown(const char *serviceName, const char *featureName);
IUnknown *SamgrTestGetDefaultIUnknown(const char *serviceName);
int32 SamgrTestSendRequestProxy(const Identity *identity, const Request *request, Handler handler);
void SamgrTestDefaultHandler(const Request *request, const Response *response);
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
#endif // OHOS_LITE_SAMGR_MAINTENANCE_H
