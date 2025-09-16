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
#include "ActsHidEmitCodeTest.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include <cctype>
#include <vector>

struct Hid_DeviceHandle {
    int32_t fd = -1;
    int32_t nonBlock = 0;
};

Hid_DeviceHandle *NewHidDeviceHandle()
{
    return new Hid_DeviceHandle;
}

void DeleteHidDeviceHandle(Hid_DeviceHandle **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

constexpr const char* DEVICE_NAME = "VSoC_keyboard";
constexpr const char* KEYBOARD_SUFFIX = "keyboard";
const uint32_t PARAM_0 = 0;
const uint32_t PARAM_1 = 1;
const uint64_t HID_DDK_INVALID_DEVICE_ID = 0xFFFFFFFFFFFFFFFF;
const uint32_t DATA_BUFF_SIZE  = 1024;
const uint32_t GET_REPORT_BUFF_SIZE = 9;
const uint32_t INVALID_BUFF_SIZE = HID_MAX_REPORT_BUFFER_SIZE + 1;
const uint32_t READ_TIME_OUT = 10000;
const uint32_t SIXTEEN_BIT = 16;
const uint32_t THIRTYTWO_BIT = 32;
const uint32_t BUS_NUM_MASK = 0xFFFF0000;
const uint32_t DEVICE_NUM_MASK = 0x0000FFFF;
const uint32_t INVALID_NON_BLOCK = 2;
#define BUFF_LENTH 10
#define PARAM_0 0
#define PORT_READ 0x01
#define PORT_WRITE 0x02
#define PORT_ILLEGAL 0x08

void addHidEmitErrorCodeTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"IsHidDevice", nullptr, IsHidDevice,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropDirect", nullptr, HidCreateDevicePropDirect,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropPointingStick", nullptr, HidCreateDevicePropPointingStick,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropButtonPad", nullptr, HidCreateDevicePropButtonPad,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropSemiMt", nullptr, HidCreateDevicePropSemiMt,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropTopButtonPad", nullptr, HidCreateDevicePropTopButtonPad,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDevicePropAccelerometer", nullptr, HidCreateDevicePropAccelerometer,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceEventTypeHidEVRel", nullptr, HidCreateDeviceEventTypeHidEVRel,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidSynEventReport", nullptr, HidSynEventReport,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidSynEventConfig", nullptr, HidSynEventConfig,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidSynEventMtReport", nullptr, HidSynEventMtReport,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidSynEventDropped", nullptr, HidSynEventDropped,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYA", nullptr, HidCreateDeviceKeyCodeKEYA,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYB", nullptr, HidCreateDeviceKeyCodeKEYB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYC", nullptr, HidCreateDeviceKeyCodeKEYC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYD", nullptr, HidCreateDeviceKeyCodeKEYD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYE", nullptr, HidCreateDeviceKeyCodeKEYE,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYF", nullptr, HidCreateDeviceKeyCodeKEYF,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYG", nullptr, HidCreateDeviceKeyCodeKEYG,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYH", nullptr, HidCreateDeviceKeyCodeKEYH,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYI", nullptr, HidCreateDeviceKeyCodeKEYI,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYJ", nullptr, HidCreateDeviceKeyCodeKEYJ,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCreateDeviceKeyCodeKEYK", nullptr, HidCreateDeviceKeyCodeKEYK,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    
}
uint64_t ConvertDeviceId(uint64_t deviceId64)
{
    int32_t deviceId32 = static_cast<uint32_t>(deviceId64 >> THIRTYTWO_BIT);
    uint32_t busNum = (deviceId32 & BUS_NUM_MASK) >> SIXTEEN_BIT;
    uint32_t deviceNum = deviceId32 & DEVICE_NUM_MASK;
    uint64_t deviceId = ((static_cast<uint64_t>(busNum) << THIRTYTWO_BIT) | deviceNum);

    return deviceId;
}

uint64_t GetDeviceId(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t tmpDeviceId;
    napi_get_value_int64(env, args[0], &tmpDeviceId);
    uint64_t deviceId = ConvertDeviceId(tmpDeviceId);
    return deviceId;
}

napi_value IsHidDevice(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDeviceId(env, info);
    int32_t returnValue = OH_Hid_Init();
    Hid_DeviceHandle *deviceHandle = nullptr;

    returnValue = OH_Hid_Open(deviceId, 0, &deviceHandle);
    bool boolRet = returnValue == HID_DDK_SUCCESS ? true : false;
    OH_Hid_Close(&deviceHandle);
    OH_Hid_Release();
    napi_value result = nullptr;
    napi_status status = napi_get_boolean(env, boolRet, &result);
    NAPI_CALL(env, status);
    return result;
}

int32_t CreateTestDevicePropDirect(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_TRIPLE_TAP };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropDirect(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropDirect(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDevicePropPointingStick(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_POINTING_STICK };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropPointingStick(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropPointingStick(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDevicePropButtonPad(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_BUTTON_PAD };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropButtonPad(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropButtonPad(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDevicePropSemiMt(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_SEMI_MT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropSemiMt(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropSemiMt(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDevicePropTopButtonPad(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_TOP_BUTTON_PAD };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropTopButtonPad(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropTopButtonPad(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDevicePropAccelerometer(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_ACCELEROMETER };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDevicePropAccelerometer(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropAccelerometer(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceEventTypeHidEVRel(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_ACCELEROMETER };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC, HID_EV_REL };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceEventTypeHidEVRel(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceEventTypeHidEVRel(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

napi_value HidSynEventReport(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropDirect(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_SYN_REPORT,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue , &result);
    return result;
}

napi_value HidSynEventConfig(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropDirect(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_SYN_CONFIG,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue , &result);
    return result;
}

napi_value HidSynEventMtReport(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropDirect(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_SYN_MT_REPORT ,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue , &result);
    return result;
}

napi_value HidSynEventDropped(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevicePropDirect(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_SYN_DROPPED,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYA(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_A };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYA(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYA(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYB(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_B };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYB(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYB(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYC(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_C };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYC(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYC(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYD(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_D };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYD(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYD(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYE(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_E };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYE(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYE(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYF(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_F };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYF(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYF(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYG(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_G };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYG(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYG(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYH(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_H };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYH(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYH(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYI(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_I };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYI(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYI(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYJ(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_J };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYJ(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYJ(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}

int32_t CreateTestDeviceKeyCodeKEYK(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_KEY_K };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidCreateDeviceKeyCodeKEYK(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceKeyCodeKEYK(DEVICE_NAME);
    napi_create_int32(env, deviceId , &result);
    return result;
}