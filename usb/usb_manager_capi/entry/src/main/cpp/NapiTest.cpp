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

#include <chrono>
#include <condition_variable>
#include <cstdio>
#include <cstring>
#include <mutex>
#include <string>

namespace {
constexpr uint32_t ERROR_CODE_COUNT = 7;
constexpr uint32_t DIRECTION_COUNT = 2;
constexpr uint32_t CALLBACK_WAIT_SECONDS = 5;
constexpr int32_t DEVICE_FIELD_COUNT = 13;
constexpr int32_t CONFIG_FIELD_COUNT = 8;
constexpr int32_t INTERFACE_FIELD_COUNT = 8;
constexpr int32_t ENDPOINT_FIELD_COUNT = 8;
constexpr uint8_t FAKE_BUS_NUM = 255;
constexpr uint8_t FAKE_DEV_ADDR = 255;
constexpr uint8_t GARBAGE_BUS_NUM = 250;
constexpr uint8_t GARBAGE_DEV_ADDR = 251;
constexpr const char *FAKE_DEVICE_NAME = "255-255";

napi_value CreateInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value CreateBool(napi_env env, bool value)
{
    napi_value result = nullptr;
    napi_get_boolean(env, value, &result);
    return result;
}

napi_value CreateString(napi_env env, const char *value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

void SetIntProp(napi_env env, napi_value obj, const char *name, int32_t value)
{
    napi_set_named_property(env, obj, name, CreateInt32(env, value));
}

void SetBoolProp(napi_env env, napi_value obj, const char *name, bool value)
{
    napi_set_named_property(env, obj, name, CreateBool(env, value));
}

void SetStrProp(napi_env env, napi_value obj, const char *name, const char *value)
{
    napi_set_named_property(env, obj, name, CreateString(env, value));
}

// Builds a device whose identity fields point at a device that never exists on a real bus.
OH_UsbManager_UsbDevice MakeFakeDevice(uint8_t busNum, uint8_t devAddr)
{
    OH_UsbManager_UsbDevice device = {};
    device.busNum = busNum;
    device.devAddress = devAddr;
    return device;
}

napi_value CreateRetObject(napi_env env, int32_t ret)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    SetIntProp(env, obj, "ret", ret);
    return obj;
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
 * @tc.desc          Verify OH_UsbManager_FreeUsbDeviceList is a safe no-op for null array and zero count,
 *                   plus boundary deviceCount values 255 and 256.
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
    OH_UsbManager_FreeUsbDeviceList(nullptr, 255);
    OH_UsbManager_FreeUsbDeviceList(nullptr, 256);
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

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1000
 * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects a null devices pointer.
 * @tc.type          Function
 */
static napi_value GetUsbDeviceListNullDevices(napi_env env, napi_callback_info info)
{
    uint32_t deviceCount = 0;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetUsbDeviceList(nullptr, &deviceCount);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1100
 * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects a null deviceCount pointer.
 * @tc.type          Function
 */
static napi_value GetUsbDeviceListNullCount(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetUsbDeviceList(&devices, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1200
 * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects both output pointers being null.
 * @tc.type          Function
 */
static napi_value GetUsbDeviceListNullBoth(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetUsbDeviceList(nullptr, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1800
 * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a null pipe pointer.
 * @tc.type          Function
 */
static napi_value ConnectDeviceNullPipe(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice device = MakeFakeDevice(FAKE_BUS_NUM, FAKE_DEV_ADDR);
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(&device, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1900
 * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects device and pipe both being null.
 * @tc.type          Function
 */
static napi_value ConnectDeviceNullBoth(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(nullptr, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2000
 * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a device absent from the bus.
 *                   The service permission precheck fails for unknown devices, which maps to
 *                   OH_USBMANAGER_ERROR_PERMISSION_DENIED (see usb_service.cpp CheckDevicePermission).
 * @tc.type          Function
 */
static napi_value ConnectDeviceFakeDevice(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice device = MakeFakeDevice(FAKE_BUS_NUM, FAKE_DEV_ADDR);
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(&device, &pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2100
 * @tc.desc          Verify OH_UsbManager_ConnectDevice only consumes busNum/devAddress and ignores
 *                   every other field: garbage in all other fields must not change the result
 *                   (identical to the fake-device baseline case).
 * @tc.type          Function
 */
static napi_value ConnectDeviceGarbageFields(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice device = {};
    device.busNum = GARBAGE_BUS_NUM;
    device.devAddress = GARBAGE_DEV_ADDR;
    device.name = "garbage-name";
    device.manufacturerName = "garbage-manufacturer";
    device.productName = "garbage-product";
    device.version = "garbage-version";
    device.vendorId = 0xFFFF;
    device.productId = 0xFFFF;
    device.clazz = 0xFF;
    device.subClass = 0xFF;
    device.protocol = 0xFF;
    device.configs = nullptr;
    device.configCount = 0xFFFFFFFF;
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(&device, &pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2200
 * @tc.desc          Verify OH_UsbManager_ConnectDevice with boundary busNum=0/devAddress=0 rejects
 *                   the nonexistent device the same way as other absent devices.
 * @tc.type          Function
 */
static napi_value ConnectDeviceBoundaryZero(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice device = MakeFakeDevice(0, 0);
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(&device, &pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2600
 * @tc.desc          Verify OH_UsbManager_HasPermission rejects a null result pointer.
 * @tc.type          Function
 */
static napi_value HasPermissionNullResult(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_HasPermission(FAKE_DEVICE_NAME, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2700
 * @tc.desc          Verify OH_UsbManager_HasPermission rejects both parameters being null.
 * @tc.type          Function
 */
static napi_value HasPermissionNullBoth(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_HasPermission(nullptr, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2800
 * @tc.desc          Verify OH_UsbManager_HasPermission on an absent device name reports
 *                   SUCCESS with result=false (service always returns UEC_OK and folds
 *                   "device not found" into hasRight=false, see UsbService::HasRight).
 *                   result is preset to true so a missing write is observable.
 * @tc.type          Function
 */
static napi_value HasPermissionInvalidName(napi_env env, napi_callback_info info)
{
    bool result = true;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_HasPermission(FAKE_DEVICE_NAME, &result);
    napi_value obj = CreateRetObject(env, static_cast<int32_t>(ret));
    SetBoolProp(env, obj, "result", result);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3300
 * @tc.desc          Verify OH_UsbManager_RequestPermission rejects a null deviceName while the
 *                   callback is valid; the callback must not fire on this path.
 * @tc.type          Function
 */
static void NoopPermissionCallback(OH_UsbManager_ErrorCode errorCode, bool result, void *userContext)
{
    (void)errorCode;
    (void)result;
    (void)userContext;
}

static napi_value RequestPermissionNullName(napi_env env, napi_callback_info info)
{
    OH_UsbManager_ErrorCode ret = OH_UsbManager_RequestPermission(nullptr, NoopPermissionCallback, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

namespace {
struct PermissionCbContext {
    std::mutex mtx;
    std::condition_variable cv;
    bool fired = false;
    bool abandoned = false;
    int32_t errCode = -1;
    bool result = false;
    void *receivedCtx = nullptr;
};

// Static on purpose: the CAPI delivers the callback from a detached thread, so the context
// must outlive the wrapper when a timeout abandons the wait. Cases run sequentially.
PermissionCbContext g_permissionCbCtx;

void PermissionCaptureCallback(OH_UsbManager_ErrorCode errorCode, bool result, void *userContext)
{
    std::lock_guard<std::mutex> lock(g_permissionCbCtx.mtx);
    if (g_permissionCbCtx.abandoned) {
        return;
    }
    g_permissionCbCtx.errCode = static_cast<int32_t>(errorCode);
    g_permissionCbCtx.result = result;
    g_permissionCbCtx.receivedCtx = userContext;
    g_permissionCbCtx.fired = true;
    g_permissionCbCtx.cv.notify_all();
}
} // namespace

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3400 / SUB_USB_USBMANAGER_CAPI_TEST_3500
 * @tc.desc          Verify OH_UsbManager_RequestPermission accepts a syntactically valid but
 *                   absent device name: the call returns SUCCESS synchronously and the callback
 *                   reports OH_USBMANAGER_ERROR_SERVICE_EXCEPTION with result=false (the service
 *                   fails the name lookup before any dialog can appear).
 *                   cbFired=false marks a callback wait timeout (environment issue).
 * @tc.type          Function
 */
static napi_value RequestPermissionWithCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t nameLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &nameLen);
    std::string deviceName(nameLen, '\0');
    napi_get_value_string_utf8(env, args[0], &deviceName[0], nameLen + 1, &nameLen);

    {
        std::lock_guard<std::mutex> lock(g_permissionCbCtx.mtx);
        g_permissionCbCtx.fired = false;
        g_permissionCbCtx.abandoned = false;
        g_permissionCbCtx.errCode = -1;
        g_permissionCbCtx.result = false;
    }
    OH_UsbManager_ErrorCode syncRet =
        OH_UsbManager_RequestPermission(deviceName.c_str(), PermissionCaptureCallback, &g_permissionCbCtx);
    if (syncRet == OH_USBMANAGER_SUCCESS) {
        std::unique_lock<std::mutex> lock(g_permissionCbCtx.mtx);
        bool fired = g_permissionCbCtx.cv.wait_for(lock, std::chrono::seconds(CALLBACK_WAIT_SECONDS),
            [] { return g_permissionCbCtx.fired; });
        if (!fired) {
            g_permissionCbCtx.abandoned = true;
        }
    }

    napi_value obj = CreateRetObject(env, static_cast<int32_t>(syncRet));
    SetBoolProp(env, obj, "cbFired", g_permissionCbCtx.fired);
    SetIntProp(env, obj, "cbErrCode", g_permissionCbCtx.errCode);
    SetBoolProp(env, obj, "cbResult", g_permissionCbCtx.result);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4100
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a null fd pointer.
 * @tc.type          Function
 */
static napi_value GetFileDescriptorNullFd(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {FAKE_BUS_NUM, FAKE_DEV_ADDR};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetFileDescriptor(&pipe, nullptr);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4200
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a pipe that was not obtained
 *                   from OH_UsbManager_ConnectDevice (unknown device fails the permission
 *                   precheck and maps to OH_USBMANAGER_ERROR_PERMISSION_DENIED).
 * @tc.type          Function
 */
static napi_value GetFileDescriptorFakePipe(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {FAKE_BUS_NUM, FAKE_DEV_ADDR};
    int32_t fd = -1;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetFileDescriptor(&pipe, &fd);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4800
 * @tc.desc          Verify OH_UsbManager_ClosePipe rejects a pipe that was not obtained from
 *                   OH_UsbManager_ConnectDevice (same permission precheck as above).
 * @tc.type          Function
 */
static napi_value ClosePipeFakePipe(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {FAKE_BUS_NUM, FAKE_DEV_ADDR};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ClosePipe(&pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

namespace {
struct FieldCheckResult {
    int32_t ret = -1;
    int32_t deviceCount = 0;
    int32_t devCoverage = 0;
    int32_t cfgCoverage = 0;
    int32_t ifCoverage = 0;
    int32_t epCoverage = 0;
    int32_t totalConfigs = 0;
    int32_t totalInterfaces = 0;
    int32_t totalEndpoints = 0;
    bool stringsNonNull = true;
    bool nameFormatOk = true;
    bool countPtrOk = true;
    bool directionOk = true;
    bool interfaceIdOk = true;
    bool configCountOk = true;
};

bool CountPtrConsistent(uint32_t count, const void *ptr)
{
    return (count == 0) == (ptr == nullptr);
}

// Reads every endpoint field (coverage++ per field) and applies the contract checks that have a
// fixed expectation: direction stays inside the enum domain and interfaceId links to the parent
// interface (usb_descriptor_parser.cpp assigns it from the parent interface id).
void CheckEndpoint(const OH_UsbManager_UsbEndpoint &ep, uint8_t parentInterfaceId, FieldCheckResult &res)
{
    uint8_t address = ep.address;
    res.epCoverage++;
    uint8_t attributes = ep.attributes;
    res.epCoverage++;
    uint8_t interval = ep.interval;
    res.epCoverage++;
    uint16_t maxPacketSize = ep.maxPacketSize;
    res.epCoverage++;
    OH_UsbManager_RequestDirection direction = ep.direction;
    res.epCoverage++;
    uint8_t number = ep.number;
    res.epCoverage++;
    uint8_t type = ep.type;
    res.epCoverage++;
    uint8_t interfaceId = ep.interfaceId;
    res.epCoverage++;
    (void)address;
    (void)attributes;
    (void)interval;
    (void)maxPacketSize;
    (void)number;
    (void)type;
    if (direction != OH_USBMANAGER_REQUEST_DIR_TO_DEVICE && direction != OH_USBMANAGER_REQUEST_DIR_FROM_DEVICE) {
        res.directionOk = false;
    }
    if (interfaceId != parentInterfaceId) {
        res.interfaceIdOk = false;
    }
}

void CheckInterface(const OH_UsbManager_UsbInterface &iface, FieldCheckResult &res)
{
    uint8_t id = iface.id;
    res.ifCoverage++;
    uint8_t protocol = iface.protocol;
    res.ifCoverage++;
    uint8_t clazz = iface.clazz;
    res.ifCoverage++;
    uint8_t subClass = iface.subClass;
    res.ifCoverage++;
    uint8_t alternateSetting = iface.alternateSetting;
    res.ifCoverage++;
    const char *name = iface.name;
    res.ifCoverage++;
    const OH_UsbManager_UsbEndpoint *endpoints = iface.endpoints;
    res.ifCoverage++;
    uint32_t endpointCount = iface.endpointCount;
    res.ifCoverage++;
    (void)protocol;
    (void)clazz;
    (void)subClass;
    (void)alternateSetting;
    if (name == nullptr) {
        res.stringsNonNull = false;
    }
    if (!CountPtrConsistent(endpointCount, endpoints)) {
        res.countPtrOk = false;
    }
    res.totalInterfaces++;
    res.totalEndpoints += static_cast<int32_t>(endpointCount);
    for (uint32_t e = 0; e < endpointCount; ++e) {
        CheckEndpoint(endpoints[e], id, res);
    }
}

void CheckConfig(const OH_UsbManager_UsbConfig &config, FieldCheckResult &res)
{
    uint8_t id = config.id;
    res.cfgCoverage++;
    uint8_t attributes = config.attributes;
    res.cfgCoverage++;
    uint8_t maxPower = config.maxPower;
    res.cfgCoverage++;
    const char *name = config.name;
    res.cfgCoverage++;
    bool isRemoteWakeup = config.isRemoteWakeup;
    res.cfgCoverage++;
    bool isSelfPowered = config.isSelfPowered;
    res.cfgCoverage++;
    const OH_UsbManager_UsbInterface *interfaces = config.interfaces;
    res.cfgCoverage++;
    uint32_t interfaceCount = config.interfaceCount;
    res.cfgCoverage++;
    (void)id;
    (void)attributes;
    (void)maxPower;
    (void)isRemoteWakeup;
    (void)isSelfPowered;
    if (name == nullptr) {
        res.stringsNonNull = false;
    }
    if (!CountPtrConsistent(interfaceCount, interfaces)) {
        res.countPtrOk = false;
    }
    res.totalConfigs++;
    for (uint32_t i = 0; i < interfaceCount; ++i) {
        CheckInterface(interfaces[i], res);
    }
}

void CheckDevice(const OH_UsbManager_UsbDevice &dev, FieldCheckResult &res)
{
    uint8_t busNum = dev.busNum;
    res.devCoverage++;
    uint8_t devAddress = dev.devAddress;
    res.devCoverage++;
    const char *name = dev.name;
    res.devCoverage++;
    const char *manufacturerName = dev.manufacturerName;
    res.devCoverage++;
    const char *productName = dev.productName;
    res.devCoverage++;
    const char *version = dev.version;
    res.devCoverage++;
    uint16_t vendorId = dev.vendorId;
    res.devCoverage++;
    uint16_t productId = dev.productId;
    res.devCoverage++;
    uint8_t clazz = dev.clazz;
    res.devCoverage++;
    uint8_t subClass = dev.subClass;
    res.devCoverage++;
    uint8_t protocol = dev.protocol;
    res.devCoverage++;
    const OH_UsbManager_UsbConfig *configs = dev.configs;
    res.devCoverage++;
    uint32_t configCount = dev.configCount;
    res.devCoverage++;
    (void)vendorId;
    (void)productId;
    (void)clazz;
    (void)subClass;
    (void)protocol;
    if (name == nullptr || manufacturerName == nullptr || productName == nullptr || version == nullptr) {
        res.stringsNonNull = false;
    }
    if (name != nullptr) {
        char expected[8] = {0};
        (void)snprintf(expected, sizeof(expected), "%u-%u", busNum, devAddress);
        if (strcmp(name, expected) != 0) {
            res.nameFormatOk = false;
        }
    }
    if (!CountPtrConsistent(configCount, configs)) {
        res.countPtrOk = false;
    }
    if (configCount < 1) {
        res.configCountOk = false;
    }
    for (uint32_t c = 0; c < configCount; ++c) {
        CheckConfig(configs[c], res);
    }
}
} // namespace

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5300
 * @tc.desc          Walk the whole device list hierarchy and read every field of
 *                   OH_UsbManager_UsbDevice/UsbConfig/UsbInterface/UsbEndpoint (37 fields per
 *                   fully populated device). Checks fixed contracts: strings are never null
 *                   (StrdupSafe), device name is "<busNum>-<devAddress>", count/pointer pairs
 *                   are consistent, endpoint direction stays in the enum domain, endpoint
 *                   interfaceId links to the parent interface, and every device exposes at
 *                   least one configuration. The list is freed via
 *                   OH_UsbManager_FreeUsbDeviceList before returning.
 * @tc.type          Function
 */
static napi_value GetDeviceListFullFieldCheck(napi_env env, napi_callback_info info)
{
    FieldCheckResult res;
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    res.ret = static_cast<int32_t>(OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount));
    res.deviceCount = static_cast<int32_t>(deviceCount);
    if (res.ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
        for (uint32_t d = 0; d < deviceCount; ++d) {
            CheckDevice(devices[d], res);
        }
        OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
    }

    napi_value obj = CreateRetObject(env, res.ret);
    SetIntProp(env, obj, "deviceCount", res.deviceCount);
    SetIntProp(env, obj, "devCoverage", res.devCoverage);
    SetIntProp(env, obj, "cfgCoverage", res.cfgCoverage);
    SetIntProp(env, obj, "ifCoverage", res.ifCoverage);
    SetIntProp(env, obj, "epCoverage", res.epCoverage);
    SetIntProp(env, obj, "totalConfigs", res.totalConfigs);
    SetIntProp(env, obj, "totalInterfaces", res.totalInterfaces);
    SetIntProp(env, obj, "totalEndpoints", res.totalEndpoints);
    SetBoolProp(env, obj, "stringsNonNull", res.stringsNonNull);
    SetBoolProp(env, obj, "nameFormatOk", res.nameFormatOk);
    SetBoolProp(env, obj, "countPtrOk", res.countPtrOk);
    SetBoolProp(env, obj, "directionOk", res.directionOk);
    SetBoolProp(env, obj, "interfaceIdOk", res.interfaceIdOk);
    SetBoolProp(env, obj, "configCountOk", res.configCountOk);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5400
 * @tc.desc          Connect to the first enumerated device using only busNum/devAddress and
 *                   verify OH_UsbManager_UsbPipe echoes the same busNum/devAddress; then close
 *                   the pipe via OH_UsbManager_ClosePipe. ret carries the ConnectDevice result
 *                   so the caller can distinguish "no permission" (environment) from failure.
 * @tc.type          Function
 */
static napi_value ConnectDevicePipeEcho(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    int32_t ret = static_cast<int32_t>(OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount));
    int32_t inBus = -1;
    int32_t inAddr = -1;
    int32_t pipeBus = -1;
    int32_t pipeAddr = -1;
    int32_t closeRet = -1;
    if (ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS) && deviceCount > 0) {
        OH_UsbManager_UsbDevice input = {};
        input.busNum = devices[0].busNum;
        input.devAddress = devices[0].devAddress;
        inBus = input.busNum;
        inAddr = input.devAddress;
        OH_UsbManager_UsbPipe pipe = {0};
        ret = static_cast<int32_t>(OH_UsbManager_ConnectDevice(&input, &pipe));
        if (ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
            pipeBus = pipe.busNum;
            pipeAddr = pipe.devAddress;
            closeRet = static_cast<int32_t>(OH_UsbManager_ClosePipe(&pipe));
        }
    }
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);

    napi_value obj = CreateRetObject(env, ret);
    SetIntProp(env, obj, "deviceCount", static_cast<int32_t>(deviceCount));
    SetIntProp(env, obj, "inBus", inBus);
    SetIntProp(env, obj, "inAddr", inAddr);
    SetIntProp(env, obj, "pipeBus", pipeBus);
    SetIntProp(env, obj, "pipeAddr", pipeAddr);
    SetIntProp(env, obj, "closeRet", closeRet);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5500
 * @tc.desc          Return the scalar fields of every enumerated device so the ETS side can
 *                   diff them against the native ArkTS usbManager.getDevices() result field by
 *                   field (busNum/devAddress/name/manufacturerName/productName/version/vendorId/
 *                   productId/clazz/subClass/protocol).
 * @tc.type          Function
 */
static napi_value GetDeviceListScalars(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    int32_t ret = static_cast<int32_t>(OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount));

    napi_value list = nullptr;
    napi_create_array_with_length(env, 0, &list);
    uint32_t outCount = 0;
    if (ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
        for (uint32_t d = 0; d < deviceCount; ++d) {
            napi_value item = nullptr;
            napi_create_object(env, &item);
            SetIntProp(env, item, "busNum", devices[d].busNum);
            SetIntProp(env, item, "devAddress", devices[d].devAddress);
            SetStrProp(env, item, "name", devices[d].name != nullptr ? devices[d].name : "");
            SetStrProp(env, item, "manufacturerName",
                devices[d].manufacturerName != nullptr ? devices[d].manufacturerName : "");
            SetStrProp(env, item, "productName", devices[d].productName != nullptr ? devices[d].productName : "");
            SetStrProp(env, item, "version", devices[d].version != nullptr ? devices[d].version : "");
            SetIntProp(env, item, "vendorId", devices[d].vendorId);
            SetIntProp(env, item, "productId", devices[d].productId);
            SetIntProp(env, item, "clazz", devices[d].clazz);
            SetIntProp(env, item, "subClass", devices[d].subClass);
            SetIntProp(env, item, "protocol", devices[d].protocol);
            napi_set_element(env, list, outCount, item);
            outCount++;
        }
        OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
    }

    napi_value obj = CreateRetObject(env, ret);
    SetIntProp(env, obj, "count", static_cast<int32_t>(outCount));
    napi_set_named_property(env, obj, "list", list);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2900 / 3000 / 3200 / 5600
 * @tc.desc          Verify OH_UsbManager_HasPermission on a caller-supplied device name and
 *                   return both the error code and the result. result is preset to true so a
 *                   missing write on the false path is observable.
 * @tc.type          Function
 */
static napi_value HasPermissionByName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t nameLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &nameLen);
    std::string deviceName(nameLen, '\0');
    napi_get_value_string_utf8(env, args[0], &deviceName[0], nameLen + 1, &nameLen);

    bool result = true;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_HasPermission(deviceName.c_str(), &result);
    napi_value obj = CreateRetObject(env, static_cast<int32_t>(ret));
    SetBoolProp(env, obj, "result", result);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3600 / 3700
 * @tc.desc          Verify OH_UsbManager_RequestPermission passes userContext through to the
 *                   callback unchanged, for both a null and a non-null context. An absent
 *                   device name is used so the callback arrives deterministically without a
 *                   device or a dialog.
 * @tc.type          Function
 */
static napi_value RequestPermissionCtxPassthrough(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool useNullCtx = true;
    napi_get_value_bool(env, args[0], &useNullCtx);

    void *expected = useNullCtx ? nullptr : static_cast<void *>(&g_permissionCbCtx);
    {
        std::lock_guard<std::mutex> lock(g_permissionCbCtx.mtx);
        g_permissionCbCtx.fired = false;
        g_permissionCbCtx.abandoned = false;
        g_permissionCbCtx.errCode = -1;
        g_permissionCbCtx.result = false;
        g_permissionCbCtx.receivedCtx = nullptr;
    }
    OH_UsbManager_ErrorCode syncRet =
        OH_UsbManager_RequestPermission(FAKE_DEVICE_NAME, PermissionCaptureCallback, expected);
    if (syncRet == OH_USBMANAGER_SUCCESS) {
        std::unique_lock<std::mutex> lock(g_permissionCbCtx.mtx);
        bool fired = g_permissionCbCtx.cv.wait_for(lock, std::chrono::seconds(CALLBACK_WAIT_SECONDS),
            [] { return g_permissionCbCtx.fired; });
        if (!fired) {
            g_permissionCbCtx.abandoned = true;
        }
    }
    bool ctxMatch = g_permissionCbCtx.fired && (g_permissionCbCtx.receivedCtx == expected);

    napi_value obj = CreateRetObject(env, static_cast<int32_t>(syncRet));
    SetBoolProp(env, obj, "cbFired", g_permissionCbCtx.fired);
    SetIntProp(env, obj, "cbErrCode", g_permissionCbCtx.errCode);
    SetBoolProp(env, obj, "cbResult", g_permissionCbCtx.result);
    SetBoolProp(env, obj, "ctxMatch", ctxMatch);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2300
 * @tc.desc          Verify OH_UsbManager_ConnectDevice on an enumerated device without access
 *                   permission returns OH_USBMANAGER_ERROR_PERMISSION_DENIED. An unexpected
 *                   success is closed immediately to avoid leaking the pipe.
 * @tc.type          Function
 */
static napi_value ConnectDeviceByAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t busNum = 0;
    int32_t devAddr = 0;
    napi_get_value_int32(env, args[0], &busNum);
    napi_get_value_int32(env, args[1], &devAddr);

    OH_UsbManager_UsbDevice device = MakeFakeDevice(static_cast<uint8_t>(busNum), static_cast<uint8_t>(devAddr));
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ConnectDevice(&device, &pipe);
    if (ret == OH_USBMANAGER_SUCCESS) {
        OH_UsbManager_ClosePipe(&pipe);
    }
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4600
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor on a pipe whose device the caller
 *                   has no permission for returns OH_USBMANAGER_ERROR_PERMISSION_DENIED. An
 *                   unexpected success is closed immediately.
 * @tc.type          Function
 */
static napi_value GetFileDescriptorByAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t busNum = 0;
    int32_t devAddr = 0;
    napi_get_value_int32(env, args[0], &busNum);
    napi_get_value_int32(env, args[1], &devAddr);

    OH_UsbManager_UsbPipe pipe = {static_cast<uint8_t>(busNum), static_cast<uint8_t>(devAddr)};
    int32_t fd = -1;
    OH_UsbManager_ErrorCode ret = OH_UsbManager_GetFileDescriptor(&pipe, &fd);
    if (ret == OH_USBMANAGER_SUCCESS) {
        OH_UsbManager_ClosePipe(&pipe);
    }
    return CreateInt32(env, static_cast<int32_t>(ret));
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5100
 * @tc.desc          Verify OH_UsbManager_ClosePipe on a pipe whose device the caller has no
 *                   permission for returns OH_USBMANAGER_ERROR_PERMISSION_DENIED.
 * @tc.type          Function
 */
static napi_value ClosePipeByAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t busNum = 0;
    int32_t devAddr = 0;
    napi_get_value_int32(env, args[0], &busNum);
    napi_get_value_int32(env, args[1], &devAddr);

    OH_UsbManager_UsbPipe pipe = {static_cast<uint8_t>(busNum), static_cast<uint8_t>(devAddr)};
    OH_UsbManager_ErrorCode ret = OH_UsbManager_ClosePipe(&pipe);
    return CreateInt32(env, static_cast<int32_t>(ret));
}

namespace {
// Enumerates the device list, connects to the first entry and releases the list. The returned
// code is the ConnectDevice result so callers can distinguish "no permission" from failure.
int32_t ConnectFirstDevice(OH_UsbManager_UsbPipe &pipe, uint32_t &deviceCount)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    deviceCount = 0;
    int32_t ret = static_cast<int32_t>(OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount));
    if (ret != static_cast<int32_t>(OH_USBMANAGER_SUCCESS) || deviceCount == 0) {
        OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
        return ret;
    }
    OH_UsbManager_UsbDevice input = {};
    input.busNum = devices[0].busNum;
    input.devAddress = devices[0].devAddress;
    ret = static_cast<int32_t>(OH_UsbManager_ConnectDevice(&input, &pipe));
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
    return ret;
}
} // namespace

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4300
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor on a freshly opened pipe returns
 *                   SUCCESS and a valid fd (fd >= 0), then releases the pipe. ret carries the
 *                   ConnectDevice result so the caller can skip on missing permission.
 * @tc.type          Function
 */
static napi_value GetFileDescriptorFlow(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {0};
    uint32_t deviceCount = 0;
    int32_t connectRet = ConnectFirstDevice(pipe, deviceCount);
    int32_t fdRet = -1;
    int32_t fd = -1;
    int32_t closeRet = -1;
    if (connectRet == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
        fdRet = static_cast<int32_t>(OH_UsbManager_GetFileDescriptor(&pipe, &fd));
        closeRet = static_cast<int32_t>(OH_UsbManager_ClosePipe(&pipe));
    }

    napi_value obj = CreateRetObject(env, connectRet);
    SetIntProp(env, obj, "deviceCount", static_cast<int32_t>(deviceCount));
    SetIntProp(env, obj, "fdRet", fdRet);
    SetIntProp(env, obj, "fd", fd);
    SetIntProp(env, obj, "closeRet", closeRet);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4400
 * @tc.desc          Verify OH_UsbManager_GetFileDescriptor fails after the pipe was closed
 *                   (state isolation): connect, close, then query the fd. When the device is
 *                   still present the service maps the driver "no device handle" error to a
 *                   service error, so the documented CAPI contract returns
 *                   OH_USBMANAGER_ERROR_SERVICE_EXCEPTION (see ohusb_manager.cpp
 *                   ConvertErrCodeForGetFd); NO_DEVICE is reserved for a detached device.
 * @tc.type          Function
 */
static napi_value GetFileDescriptorAfterClose(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbPipe pipe = {0};
    uint32_t deviceCount = 0;
    int32_t connectRet = ConnectFirstDevice(pipe, deviceCount);
    int32_t closeRet = -1;
    int32_t fdRet = -1;
    if (connectRet == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
        closeRet = static_cast<int32_t>(OH_UsbManager_ClosePipe(&pipe));
        int32_t fd = -1;
        fdRet = static_cast<int32_t>(OH_UsbManager_GetFileDescriptor(&pipe, &fd));
    }

    napi_value obj = CreateRetObject(env, connectRet);
    SetIntProp(env, obj, "deviceCount", static_cast<int32_t>(deviceCount));
    SetIntProp(env, obj, "closeRet", closeRet);
    SetIntProp(env, obj, "fdRet", fdRet);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5700
 * @tc.desc          Connect to the device identified by the caller-supplied busNum/devAddress
 *                   (mirrored from the ArkTS enumeration) and report the pipe fields plus the
 *                   close result, so the ETS side can diff the outcome category against the
 *                   native ArkTS usbManager.connectDevice().
 * @tc.type          Function
 */
static napi_value ConnectDevicePipeEchoByAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t busNum = 0;
    int32_t devAddr = 0;
    napi_get_value_int32(env, args[0], &busNum);
    napi_get_value_int32(env, args[1], &devAddr);

    OH_UsbManager_UsbDevice input = {};
    input.busNum = static_cast<uint8_t>(busNum);
    input.devAddress = static_cast<uint8_t>(devAddr);
    OH_UsbManager_UsbPipe pipe = {0};
    int32_t ret = static_cast<int32_t>(OH_UsbManager_ConnectDevice(&input, &pipe));
    int32_t pipeBus = -1;
    int32_t pipeAddr = -1;
    int32_t closeRet = -1;
    if (ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS)) {
        pipeBus = pipe.busNum;
        pipeAddr = pipe.devAddress;
        closeRet = static_cast<int32_t>(OH_UsbManager_ClosePipe(&pipe));
    }

    napi_value obj = CreateRetObject(env, ret);
    SetIntProp(env, obj, "deviceCount", 0);
    SetIntProp(env, obj, "inBus", busNum);
    SetIntProp(env, obj, "inAddr", devAddr);
    SetIntProp(env, obj, "pipeBus", pipeBus);
    SetIntProp(env, obj, "pipeAddr", pipeAddr);
    SetIntProp(env, obj, "closeRet", closeRet);
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3800 / 3900
 * @tc.desc          Begin OH_UsbManager_RequestPermission on the first enumerated device and
 *                   return immediately after the synchronous result; the dialog decision is
 *                   delivered asynchronously and can be read via RequestPermissionPoll. This
 *                   split lets the ETS side drive the system dialog with UiTest while the
 *                   request is in flight.
 * @tc.type          Function
 */
static napi_value RequestPermissionBegin(napi_env env, napi_callback_info info)
{
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    int32_t ret = static_cast<int32_t>(OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount));
    if (ret == static_cast<int32_t>(OH_USBMANAGER_SUCCESS) && deviceCount > 0) {
        char deviceName[8] = {0};
        (void)snprintf(deviceName, sizeof(deviceName), "%u-%u", devices[0].busNum, devices[0].devAddress);
        {
            std::lock_guard<std::mutex> lock(g_permissionCbCtx.mtx);
            g_permissionCbCtx.fired = false;
            g_permissionCbCtx.abandoned = false;
            g_permissionCbCtx.errCode = -1;
            g_permissionCbCtx.result = false;
            g_permissionCbCtx.receivedCtx = nullptr;
        }
        ret = static_cast<int32_t>(
            OH_UsbManager_RequestPermission(deviceName, PermissionCaptureCallback, nullptr));
    }
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);

    napi_value obj = CreateRetObject(env, ret);
    SetIntProp(env, obj, "deviceCount", static_cast<int32_t>(deviceCount));
    return obj;
}

/**
 * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3800 / 3900
 * @tc.desc          Non-blocking snapshot of the pending permission callback state; the ETS
 *                   side polls it after driving the dialog.
 * @tc.type          Function
 */
static napi_value RequestPermissionPoll(napi_env env, napi_callback_info info)
{
    bool fired;
    int32_t errCode;
    bool result;
    {
        std::lock_guard<std::mutex> lock(g_permissionCbCtx.mtx);
        fired = g_permissionCbCtx.fired;
        errCode = g_permissionCbCtx.errCode;
        result = g_permissionCbCtx.result;
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    SetBoolProp(env, obj, "cbFired", fired);
    SetIntProp(env, obj, "cbErrCode", errCode);
    SetBoolProp(env, obj, "cbResult", result);
    return obj;
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
         nullptr},
        {"getUsbDeviceListNullDevices", nullptr, GetUsbDeviceListNullDevices, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getUsbDeviceListNullCount", nullptr, GetUsbDeviceListNullCount, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getUsbDeviceListNullBoth", nullptr, GetUsbDeviceListNullBoth, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"connectDeviceNullPipe", nullptr, ConnectDeviceNullPipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"connectDeviceNullBoth", nullptr, ConnectDeviceNullBoth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"connectDeviceFakeDevice", nullptr, ConnectDeviceFakeDevice, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"connectDeviceGarbageFields", nullptr, ConnectDeviceGarbageFields, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"connectDeviceBoundaryZero", nullptr, ConnectDeviceBoundaryZero, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"hasPermissionNullResult", nullptr, HasPermissionNullResult, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"hasPermissionNullBoth", nullptr, HasPermissionNullBoth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasPermissionInvalidName", nullptr, HasPermissionInvalidName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"requestPermissionNullName", nullptr, RequestPermissionNullName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"requestPermissionWithCallback", nullptr, RequestPermissionWithCallback, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getFileDescriptorNullFd", nullptr, GetFileDescriptorNullFd, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getFileDescriptorFakePipe", nullptr, GetFileDescriptorFakePipe, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"closePipeFakePipe", nullptr, ClosePipeFakePipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDeviceListFullFieldCheck", nullptr, GetDeviceListFullFieldCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"connectDevicePipeEcho", nullptr, ConnectDevicePipeEcho, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDeviceListScalars", nullptr, GetDeviceListScalars, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasPermissionByName", nullptr, HasPermissionByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestPermissionCtxPassthrough", nullptr, RequestPermissionCtxPassthrough, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"connectDeviceByAddr", nullptr, ConnectDeviceByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFileDescriptorByAddr", nullptr, GetFileDescriptorByAddr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"closePipeByAddr", nullptr, ClosePipeByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFileDescriptorFlow", nullptr, GetFileDescriptorFlow, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getFileDescriptorAfterClose", nullptr, GetFileDescriptorAfterClose, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"connectDevicePipeEchoByAddr", nullptr, ConnectDevicePipeEchoByAddr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"requestPermissionBegin", nullptr, RequestPermissionBegin, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"requestPermissionPoll", nullptr, RequestPermissionPoll, nullptr, nullptr, nullptr, napi_default,
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
