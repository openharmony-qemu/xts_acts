/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
#include "napi/native_api.h"
#include <hilog/log.h>
#include <network/netmanager_ext/net_ethernet.h>
#include <network/netmanager_ext/net_ethernet_type.h>
 
#define NETWORK_LOG_TAG "LogTagNetwork"
#define NETWORK_LOG_DOMAIN 0x0000
 
static napi_value OHEthGetNetAddress(napi_env env, napi_callback_info info)
{
    Ethernet_NetAddrList netAddrList = {};
    int status = OH_Ethernet_GetNetAddress(&netAddrList);
    OH_LOG_Print(LOG_APP, LOG_INFO, NETWORK_LOG_DOMAIN, NETWORK_LOG_TAG, "netAddrListSize: %{public}d", netAddrList.netAddrListSize);
    OH_LOG_Print(LOG_APP, LOG_INFO, NETWORK_LOG_DOMAIN, NETWORK_LOG_TAG, "netAddrListSize: ifaceName: %{public}s, netAddr: %{public}s,  netAddrSize: %{public}d, family: %{public}d, prefixlen: %{public}d, port: %{public}d",
                 netAddrList.netAddrList[0].ifaceName, netAddrList.netAddrList[0].netAddrInfo[0].address, netAddrList.netAddrList[0].netAddrInfoSize,
                 netAddrList.netAddrList[0].netAddrInfo[0].family, netAddrList.netAddrList[0].netAddrInfo[0].prefixlen, netAddrList.netAddrList[0].netAddrInfo[0].port);
    napi_value result = nullptr;
    napi_create_int32(env, status, &result);
    return result;
}
 
static napi_value OHEthGetMacAddress(napi_env env, napi_callback_info info)
{
    Ethernet_MacAddrInfoList macAddrList = {};
    int status = OH_Ethernet_GetMacAddress(&macAddrList);
    OH_LOG_Print(LOG_APP, LOG_INFO, NETWORK_LOG_DOMAIN, NETWORK_LOG_TAG, "MacAddrInfoList: %{public}d", macAddrList.macInfoListSize);
    OH_LOG_Print(LOG_APP, LOG_INFO, NETWORK_LOG_DOMAIN, NETWORK_LOG_TAG, "MacAddrInfoList: ifaceName: %{public}s, macAddr: %{public}s", macAddrList.macInfoList[0].ifaceName, macAddrList.macInfoList[0].macAddr);
    napi_value result = nullptr;
    napi_create_int32(env, status, &result);
    return result;
}
 
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"OHEthGetNetAddress", nullptr, OHEthGetNetAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHEthGetMacAddress", nullptr, OHEthGetMacAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
 
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "testNetExtNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
 
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
 