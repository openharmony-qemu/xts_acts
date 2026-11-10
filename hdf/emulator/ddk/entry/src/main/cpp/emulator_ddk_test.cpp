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

#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
#include "scsi_peripheral/scsi_peripheral_api.h"
#include "scsi_peripheral/scsi_peripheral_types.h"
#include "usb/usb_ddk_api.h"
#include "usb/usb_ddk_types.h"
#include "usb_serial/usb_serial_api.h"
#include "usb_serial/usb_serial_types.h"
#include <cstdint>

#define BUFF_LENGTH 16

static napi_value GetInt32Result(napi_env env, int32_t returnValue)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkCreateAshmem(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    int32_t returnValue = OH_DDK_CreateAshmem(name, BUFF_LENGTH, &ashmem);
    return GetInt32Result(env, returnValue);
}

static napi_value DdkMapAshmem(napi_env env, napi_callback_info info)
{
    const uint8_t ashmemMapType = 0x01;
    int32_t returnValue = OH_DDK_MapAshmem(nullptr, ashmemMapType);
    return GetInt32Result(env, returnValue);
}

static napi_value DdkUnmapAshmem(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_DDK_UnmapAshmem(nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value DdkDestroyAshmem(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_DDK_DestroyAshmem(nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value HidCreateDevice(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_CreateDevice(nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value HidEmitEvent(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_EmitEvent(0, nullptr, 0);
    return GetInt32Result(env, returnValue);
}

static napi_value HidDestroyDevice(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_DestroyDevice(0);
    return GetInt32Result(env, returnValue);
}

static napi_value HidInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_Init();
    return GetInt32Result(env, returnValue);
}

static napi_value HidRelease(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_Release();
    return GetInt32Result(env, returnValue);
}

static napi_value HidOpen(napi_env env, napi_callback_info info)
{
    Hid_DeviceHandle *dev = nullptr;
    int32_t returnValue = OH_Hid_Open(1, 0, &dev);
    return GetInt32Result(env, returnValue);
}

static napi_value HidClose(napi_env env, napi_callback_info info)
{
    Hid_DeviceHandle *dev = nullptr;
    int32_t returnValue = OH_Hid_Close(&dev);
    return GetInt32Result(env, returnValue);
}

static napi_value HidWrite(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    uint32_t bytesWritten = 0;
    int32_t returnValue = OH_Hid_Write(nullptr, data, sizeof(data), &bytesWritten);
    return GetInt32Result(env, returnValue);
}

static napi_value HidReadTimeout(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_ReadTimeout(nullptr, data, sizeof(data), 100, &bytesRead);
    return GetInt32Result(env, returnValue);
}

static napi_value HidRead(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_Read(nullptr, data, sizeof(data), &bytesRead);
    return GetInt32Result(env, returnValue);
}

static napi_value HidSetNonBlocking(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_SetNonBlocking(nullptr, 1);
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetRawInfo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_GetRawInfo(nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetRawName(napi_env env, napi_callback_info info)
{
    char data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Hid_GetRawName(nullptr, data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetPhysicalAddress(napi_env env, napi_callback_info info)
{
    char data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Hid_GetPhysicalAddress(nullptr, data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetRawUniqueId(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Hid_GetRawUniqueId(nullptr, data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value HidSendReport(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Hid_SendReport(nullptr, static_cast<Hid_ReportType>(0), data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetReport(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Hid_GetReport(nullptr, static_cast<Hid_ReportType>(0), data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value HidGetReportDescriptor(napi_env env, napi_callback_info info)
{
    uint8_t buf[BUFF_LENGTH] = {};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_GetReportDescriptor(nullptr, buf, sizeof(buf), &bytesRead);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Init();
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiRelease(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Release();
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiOpen(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *dev = nullptr;
    int32_t returnValue = OH_ScsiPeripheral_Open(1, 0, &dev);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiClose(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *dev = nullptr;
    int32_t returnValue = OH_ScsiPeripheral_Close(&dev);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiTestUnitReady(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_TestUnitReady(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiInquiry(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Inquiry(nullptr, nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiReadCapacity10(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_ReadCapacity10(nullptr, nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiRequestSense(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_RequestSense(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiRead10(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Read10(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiWrite10(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Write10(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiVerify10(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Verify10(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiSendRequestByCdb(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_SendRequestByCdb(nullptr, nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiCreateDeviceMemMap(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    int32_t returnValue = OH_ScsiPeripheral_CreateDeviceMemMap(nullptr, 1024, &devMmap);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiDestroyDeviceMemMap(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_DestroyDeviceMemMap(nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value ScsiParseBasicSenseInfo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_ParseBasicSenseInfo(nullptr, 0, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_Init();
    return GetInt32Result(env, returnValue);
}

static napi_value UsbRelease(napi_env env, napi_callback_info info)
{
    OH_Usb_Release();
    return GetInt32Result(env, 0);
}

static napi_value UsbReleaseResource(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_ReleaseResource();
    return GetInt32Result(env, returnValue);
}

static napi_value UsbGetDeviceDescriptor(napi_env env, napi_callback_info info)
{
    struct UsbDeviceDescriptor *desc = nullptr;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(1, desc);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbGetConfigDescriptor(napi_env env, napi_callback_info info)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(1, 0, &config);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbFreeConfigDescriptor(napi_env env, napi_callback_info info)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_FreeConfigDescriptor(config);
    return GetInt32Result(env, 0);
}

static napi_value UsbClaimInterface(napi_env env, napi_callback_info info)
{
    uint64_t interfaceHandle = 0;
    int32_t returnValue = OH_Usb_ClaimInterface(1, 0, &interfaceHandle);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbReleaseInterface(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_ReleaseInterface(0);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSelectInterfaceSetting(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(0, 0);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbGetCurrentInterfaceSetting(napi_env env, napi_callback_info info)
{
    uint8_t settingIndex = 0;
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(0, &settingIndex);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSendControlReadRequest(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    uint32_t dataLen = sizeof(data);
    int32_t returnValue = OH_Usb_SendControlReadRequest(0, nullptr, 1000, data, &dataLen);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSendControlWriteRequest(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Usb_SendControlWriteRequest(0, nullptr, 1000, data, sizeof(data));
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSendPipeRequest(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_SendPipeRequest(nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSendPipeRequestWithAshmem(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbCreateDeviceMemMap(napi_env env, napi_callback_info info)
{
    UsbDeviceMemMap *devMmap = nullptr;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(1, 1024, &devMmap);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbDestroyDeviceMemMap(napi_env env, napi_callback_info info)
{
    UsbDeviceMemMap *devMmap = nullptr;
    OH_Usb_DestroyDeviceMemMap(devMmap);
    return GetInt32Result(env, 0);
}

static napi_value UsbGetDevices(napi_env env, napi_callback_info info)
{
    struct Usb_DeviceArray *devices = nullptr;
    int32_t returnValue = OH_Usb_GetDevices(devices);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbControlTransfer(napi_env env, napi_callback_info info)
{
    uint8_t data[BUFF_LENGTH] = {};
    int32_t returnValue = OH_Usb_ControlTransfer(1, nullptr, data, 1000);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbGetNonRootHubs(napi_env env, napi_callback_info info)
{
    struct Usb_NonRootHubArray *nonRootHub = nullptr;
    int32_t returnValue = OH_Usb_GetNonRootHubs(nonRootHub);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialRelease(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Release();
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialOpen(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *dev = nullptr;
    int32_t returnValue = OH_UsbSerial_Open(1, 0, &dev);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialClose(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *dev = nullptr;
    int32_t returnValue = OH_UsbSerial_Close(&dev);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialRead(napi_env env, napi_callback_info info)
{
    uint8_t buff[BUFF_LENGTH] = {};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_UsbSerial_Read(nullptr, buff, sizeof(buff), &bytesRead);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialWrite(napi_env env, napi_callback_info info)
{
    uint8_t buff[BUFF_LENGTH] = {};
    uint32_t bytesWritten = 0;
    int32_t returnValue = OH_UsbSerial_Write(nullptr, buff, sizeof(buff), &bytesWritten);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialSetBaudRate(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_SetBaudRate(nullptr, 115200);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialSetParams(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_SetParams(nullptr, nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialSetTimeout(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_SetTimeout(nullptr, 100);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialSetFlowControl(napi_env env, napi_callback_info info)
{
    UsbSerial_FlowControl flowControl = {};
    int32_t returnValue = OH_UsbSerial_SetFlowControl(nullptr, flowControl);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialFlush(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Flush(nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialFlushInput(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_FlushInput(nullptr);
    return GetInt32Result(env, returnValue);
}

static napi_value UsbSerialFlushOutput(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_FlushOutput(nullptr);
    return GetInt32Result(env, returnValue);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ddkCreateAshmem", nullptr, DdkCreateAshmem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkMapAshmem", nullptr, DdkMapAshmem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkUnmapAshmem", nullptr, DdkUnmapAshmem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkDestroyAshmem", nullptr, DdkDestroyAshmem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCreateDevice", nullptr, HidCreateDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEvent", nullptr, HidEmitEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDevice", nullptr, HidDestroyDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidInit", nullptr, HidInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidRelease", nullptr, HidRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpen", nullptr, HidOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidClose", nullptr, HidClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidWrite", nullptr, HidWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeout", nullptr, HidReadTimeout, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidRead", nullptr, HidRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSetNonBlocking", nullptr, HidSetNonBlocking, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawInfo", nullptr, HidGetRawInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawName", nullptr, HidGetRawName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetPhysicalAddress", nullptr, HidGetPhysicalAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawUniqueId", nullptr, HidGetRawUniqueId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReport", nullptr, HidSendReport, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReport", nullptr, HidGetReport, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportDescriptor", nullptr, HidGetReportDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiInit", nullptr, ScsiInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiRelease", nullptr, ScsiRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiOpen", nullptr, ScsiOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiClose", nullptr, ScsiClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiTestUnitReady", nullptr, ScsiTestUnitReady, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiInquiry", nullptr, ScsiInquiry, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiReadCapacity10", nullptr, ScsiReadCapacity10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiRequestSense", nullptr, ScsiRequestSense, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiRead10", nullptr, ScsiRead10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiWrite10", nullptr, ScsiWrite10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiVerify10", nullptr, ScsiVerify10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiSendRequestByCdb", nullptr, ScsiSendRequestByCdb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiCreateDeviceMemMap", nullptr, ScsiCreateDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiDestroyDeviceMemMap", nullptr, ScsiDestroyDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiParseBasicSenseInfo", nullptr, ScsiParseBasicSenseInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbInit", nullptr, UsbInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbRelease", nullptr, UsbRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseResource", nullptr, UsbReleaseResource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDeviceDescriptor", nullptr, UsbGetDeviceDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetConfigDescriptor", nullptr, UsbGetConfigDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbFreeConfigDescriptor", nullptr, UsbFreeConfigDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterface", nullptr, UsbClaimInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseInterface", nullptr, UsbReleaseInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSelectInterfaceSetting", nullptr, UsbSelectInterfaceSetting, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetCurrentInterfaceSetting", nullptr, UsbGetCurrentInterfaceSetting, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendControlReadRequest", nullptr, UsbSendControlReadRequest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbSendControlWriteRequest", nullptr, UsbSendControlWriteRequest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbSendPipeRequest", nullptr, UsbSendPipeRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSendPipeRequestWithAshmem", nullptr, UsbSendPipeRequestWithAshmem, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbCreateDeviceMemMap", nullptr, UsbCreateDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbDestroyDeviceMemMap", nullptr, UsbDestroyDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDevices", nullptr, UsbGetDevices, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbControlTransfer", nullptr, UsbControlTransfer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetNonRootHubs", nullptr, UsbGetNonRootHubs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialInit", nullptr, UsbSerialInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialRelease", nullptr, UsbSerialRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialOpen", nullptr, UsbSerialOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialClose", nullptr, UsbSerialClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialRead", nullptr, UsbSerialRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialWrite", nullptr, UsbSerialWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetBaudRate", nullptr, UsbSerialSetBaudRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetParams", nullptr, UsbSerialSetParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetTimeout", nullptr, UsbSerialSetTimeout, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetFlowControl", nullptr, UsbSerialSetFlowControl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlush", nullptr, UsbSerialFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlushInput", nullptr, UsbSerialFlushInput, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlushOutput", nullptr, UsbSerialFlushOutput, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libemulatorddk",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
