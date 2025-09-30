//
// Created on 2025/9/20.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef HDF_ERRORCODE_ACTSHIDEMITCODETEST4_H
#define HDF_ERRORCODE_ACTSHIDEMITCODETEST4_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addHidEmitErrorCodeTest4(std::vector<napi_property_descriptor>& descData);
napi_value HidDdkErrCodeHIDRELX(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELY(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELZ(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELRX(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELRY(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELRZ(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELHWHEEL(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELDIAL(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELWHEEL(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELMISC(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELRESERVED(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELWHEELHIRES(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHIDRELHWHEELHIRES(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceHIDMSCSERIAL(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceHIDMSCPULSELED(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceHIDMSCGESTURE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceHIDMSCRAW(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceHIDMSCTIMESTAMP(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSHIDEMITCODETEST4_H
