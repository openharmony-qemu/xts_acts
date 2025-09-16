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
#include "ActsBaseDDkTest.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <unistd.h>
#include <vector>

#define BUFF_LENTH 10
#define PARAM_0 0
#define PORT_READ 0x01
#define PORT_WRITE 0x02
#define PORT_ILLEGAL 0x08


void addBaseDDkErrorCodeTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back(
        {"DdkMapAshmemAshmemFd", nullptr, DdkMapAshmemAshmemFd, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemAddress", nullptr, DdkMapAshmemAddress, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemSize", nullptr, DdkMapAshmemSize, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemOffset", nullptr, DdkMapAshmemOffset, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemBufferLength", nullptr, DdkMapAshmemBufferLength, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"DdkMapAshmemTransferredLength", nullptr, DdkMapAshmemTransferredLength, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemFailure", nullptr, DdkMapAshmemFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemInvalidParameter", nullptr, DdkMapAshmemInvalidParameter, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemInvalidOperation", nullptr, DdkMapAshmemInvalidOperation, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemNullPTR", nullptr, DdkMapAshmemNullPTR, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value DdkMapAshmemAshmemFd(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemAddress(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->address = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->size;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->offset = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemBufferLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->bufferLength = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemTransferredLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->transferredLength = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_FAILURE ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = PARAM_0;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_create_int32(env, returnValue == DDK_INVALID_PARAMETER ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemInvalidOperation(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_ILLEGAL;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemNullPTR(napi_env env, napi_callback_info info)
{
    napi_value result;
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t returnValue = OH_DDK_MapAshmem(nullptr, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_NULL_PTR ? 0 : 1, &result);
    return result;
}