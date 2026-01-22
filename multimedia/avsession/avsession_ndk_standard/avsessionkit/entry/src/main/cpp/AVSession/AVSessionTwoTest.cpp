/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "AVSession/AVSession_Test.h"
#include "common/Common.h"
#include <multimedia/av_session/native_avmetadata.h>
#include <multimedia/av_session/native_avsession.h>
#include <multimedia/av_session/native_avsession_errors.h>

static int32_t g_trueValue = PARAM_1;
static int32_t g_falseValue = PARAM_0;

napi_value AVSessionRegisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterToggleFavoriteCallback(avsession, toggleFavoriteback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterToggleFavoriteCallback(avsession, toggleFavoriteback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterOutputDeviceChangeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    int32_t callbackResult = OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterOutputDeviceChangeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    int32_t callbackResult = OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterOutputDeviceChangeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    int32_t callbackResult = OH_AVSession_UnregisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    int32_t callbackResult = OH_AVSession_UnregisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (createResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrServiceException(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avmetadata = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avmetadata);
    int32_t setResult = OH_AVSession_SetAVMetadata(avsession, avmetadata);
    OH_AVSession_Destroy(avsession);
    OH_AVMetadata_Destroy(avmetadata);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SERVICE_EXCEPTION) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrCodeCommandInvalid(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    int32_t callbackResult = OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_CODE_COMMAND_INVALID) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}


napi_value AVSessionUnregisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireSessionSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t getResult = OH_AVSession_AcquireSession(sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireSessionInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t getResult = OH_AVSession_AcquireSession(sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateAVCastControllerSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastcontroller = nullptr;
    int32_t getResult = OH_AVSession_CreateAVCastController(avsession, &avcastcontroller);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateAVCastControllerInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVCastController *avcastcontroller = nullptr;
    int32_t getResult = OH_AVSession_CreateAVCastController(avsession, &avcastcontroller);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionStopCastingSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t stopResult = OH_AVSession_StopCasting(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (stopResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionStopCastingInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t stopResult = OH_AVSession_StopCasting(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (stopResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionReleaseOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    int32_t releaseResult = OH_AVSession_ReleaseOutputDevice(avsession, avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (releaseResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionReleaseOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t releaseResult = OH_AVSession_ReleaseOutputDevice(avsession, avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (releaseResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetAVCastCategorySuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    int32_t getResult = OH_DeviceInfo_GetAVCastCategory(ohDeviceInfo, &category);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetAVCastCategoryInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    AVSession_AVCastCategory category;
    int32_t getResult = OH_DeviceInfo_GetAVCastCategory(ohDeviceInfo, &category);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceIdSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    char *deviceId = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceId(ohDeviceInfo, &deviceId);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceIdInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    char *deviceId = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceId(ohDeviceInfo, &deviceId);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceNameSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    char *deviceName = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceName(ohDeviceInfo, &deviceName);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceNameInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    char *deviceName = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceName(ohDeviceInfo, &deviceName);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceTypeSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    AVSession_DeviceType deviceType;
    int32_t getResult = OH_DeviceInfo_GetDeviceType(ohDeviceInfo, &deviceType);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceTypeInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    AVSession_DeviceType deviceType;
    int32_t getResult = OH_DeviceInfo_GetDeviceType(ohDeviceInfo, &deviceType);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSupportedProtocolsSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    uint32_t protocols;
    int32_t getResult = OH_DeviceInfo_GetSupportedProtocols(ohDeviceInfo, &protocols);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSupportedProtocolsInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    uint32_t protocols;
    int32_t getResult = OH_DeviceInfo_GetSupportedProtocols(ohDeviceInfo, &protocols);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterSTATE(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_STATE;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterPOSITION(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_POSITION;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterSPEED(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_SPEED;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterVOLUME(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_VOLUME;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionOutputDeviceInfo(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    avdeviceinfo->size = 0;
    avdeviceinfo->deviceInfos = nullptr;
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (avdeviceinfo->size == 0 && avdeviceinfo->deviceInfos == nullptr) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}