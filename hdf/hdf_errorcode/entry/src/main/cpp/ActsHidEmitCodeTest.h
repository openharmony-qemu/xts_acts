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

#ifndef PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
#define PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addHidEmitErrorCodeTest(std::vector<napi_property_descriptor>& descData);
napi_value IsHidDevice(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropPointer(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropPointingStick(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropButtonPad(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropSemiMt(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropTopButtonPad(napi_env env, napi_callback_info info);
napi_value HidCreateDevicePropAccelerometer(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceEventTypeHidEVRel(napi_env env, napi_callback_info info);
napi_value HidSynEventReport(napi_env env, napi_callback_info info);
napi_value HidSynEventConfig(napi_env env, napi_callback_info info);
napi_value HidSynEventMtReport(napi_env env, napi_callback_info info);
napi_value HidSynEventDropped(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYA(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYB(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYC(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYD(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYF(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYG(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYH(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYI(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYJ(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYK(napi_env env, napi_callback_info info);
#endif //PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
