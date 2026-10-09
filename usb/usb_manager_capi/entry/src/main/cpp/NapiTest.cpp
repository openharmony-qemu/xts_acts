/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <BasicServicesKit/ohusb_manager.h>
#include <napi/native_api.h>

namespace {
constexpr uint32_t ERROR_CODE_COUNT = 7;
constexpr uint32_t DIRECTION_COUNT = 2;

napi_value CreateInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}
} // namespace

/**
 * @tc.name          SUB_USB_USBMANAGER_0100
 * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList returns an empty list when no peripheral is attached.
 * @tc.type          Function
 */
static napi_value GetUsbDeviceListNoDevice(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount);
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
    if (ret != OH_USBMANAGER_SUCCESS) {
        return CreateInt32(env, static_cast<int32_t>(ret));
    }
    return CreateInt32(env, static_cast<int32_t>(deviceCount));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0200
 * @tc.desc          Verify OH_UsbManager_FreeUsbDeviceList is a safe no-op for null array and zero count.
 * @tc.type          Function
 */
static napi_value FreeUsbDeviceListSafeNoop(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount);
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
    OH_UsbManager_FreeUsbDeviceList(nullptr, 0);
    OH_UsbManager_FreeUsbDeviceList(nullptr, 1);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0300
 * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a null device pointer.
 * @tc.type          Function
 */
static napi_value ConnectDeviceNullDevice(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(nullptr, &pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0400
 * @tc.desc          Verify OH_UsbManager_HasPermission rejects a null device name pointer.
 * @tc.type          Function
 */
static napi_value HasPermissionNullDeviceName(napi_env env, napi_callback_info info)
{
    bool hasPermission = false;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_HasPermission(nullptr, &hasPermission);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0500
 * @tc.desc          Verify OH_UsbManager_RequestPermission rejects a null callback pointer.
 * @tc.type          Function
 */
static napi_value RequestPermissionNullCallback(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_RequestPermission("0-0", nullptr, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0600
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a null pipe pointer.
 * @tc.type          Function
 */
static napi_value GetFileDescriptorNullPipe(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetFileDescriptor(nullptr, &fd);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0700
 * @tc.desc          Verify OH_UsbManager_ClosePipe rejects a null pipe pointer.
 * @tc.type          Function
 */
static napi_value ClosePipeNullPipe(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ClosePipe(nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0800
 * @tc.desc          Verify the numeric values of OH_UsbManager_ErrorCode.
 * @tc.type          Function
 */
static napi_value ErrorCodeEnumValues(napi_env env, napi_callback_info info)
{
    const int32_t codes[ERROR_CODE_COUNT] = {
        static_cast<int32_t>(OH_USBMANAGER_SUCCESS),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_PERMISSION_DENIED),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_SERVICE_EXCEPTION),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_NO_DEVICE),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_NO_MEMORY),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_IO_ERROR),
        static_cast<int32_t>(OH_USBMANAGER_ERROR_INVALID_PARAMETER)
    };
    napi_value result = nullptr;
    napi_create_array_with_length(env, ERROR_CODE_COUNT, &result);
    for (uint32_t i = 0; i < ERROR_CODE_COUNT; i++) {
        napi_set_element(env, result, i, CreateInt32(env, codes[i]));
    }
    return result;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_0900
 * @tc.desc          Verify the numeric values of OH_UsbManager_RequestDirection.
 * @tc.type          Function
 */
static napi_value RequestDirectionEnumValues(napi_env env, napi_callback_info info)
{
    const int32_t directions[DIRECTION_COUNT] = {
        static_cast<int32_t>(OH_USBMANAGER_REQUEST_DIR_TO_DEVICE),
        static_cast<int32_t>(OH_USBMANAGER_REQUEST_DIR_FROM_DEVICE)
    };
    napi_value result = nullptr;
    napi_create_array_with_length(env, DIRECTION_COUNT, &result);
    for (uint32_t i = 0; i < DIRECTION_COUNT; i++) {
        napi_set_element(env, result, i, CreateInt32(env, directions[i]));
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getUsbDeviceListNoDevice", nullptr, GetUsbDeviceListNoDevice, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"freeUsbDeviceListSafeNoop", nullptr, FreeUsbDeviceListSafeNoop, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"connectDeviceNullDevice", nullptr, ConnectDeviceNullDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasPermissionNullDeviceName", nullptr, HasPermissionNullDeviceName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"requestPermissionNullCallback", nullptr, RequestPermissionNullCallback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getFileDescriptorNullPipe", nullptr, GetFileDescriptorNullPipe, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"closePipeNullPipe", nullptr, ClosePipeNullPipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"errorCodeEnumValues", nullptr, ErrorCodeEnumValues, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestDirectionEnumValues", nullptr, RequestDirectionEnumValues, nullptr, nullptr, nullptr, napi_default,
         nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module usbManagerCapiModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterUsbManagerCapiModule(void)
{
    napi_module_register(&usbManagerCapiModule);
}
