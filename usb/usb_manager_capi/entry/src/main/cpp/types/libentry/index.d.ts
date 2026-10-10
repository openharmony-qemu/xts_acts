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
export const getUsbDeviceListNoDevice: () => number;

export const freeUsbDeviceListSafeNoop: () => number;

export const connectDeviceNullDevice: () => number;

export const hasPermissionNullDeviceName: () => number;

export const requestPermissionNullCallback: () => number;

export const getFileDescriptorNullPipe: () => number;

export const closePipeNullPipe: () => number;

export const errorCodeEnumValues: () => number[];

export const requestDirectionEnumValues: () => number[];

export interface HasPermissionResult {
  ret: number;
  result: boolean;
}

export interface RequestPermissionResult {
  ret: number;
  cbFired: boolean;
  cbErrCode: number;
  cbResult: boolean;
}

export interface FullFieldCheckResult {
  ret: number;
  deviceCount: number;
  devCoverage: number;
  cfgCoverage: number;
  ifCoverage: number;
  epCoverage: number;
  totalConfigs: number;
  totalInterfaces: number;
  totalEndpoints: number;
  stringsNonNull: boolean;
  nameFormatOk: boolean;
  countPtrOk: boolean;
  directionOk: boolean;
  interfaceIdOk: boolean;
  configCountOk: boolean;
}

export interface PipeEchoResult {
  ret: number;
  deviceCount: number;
  inBus: number;
  inAddr: number;
  pipeBus: number;
  pipeAddr: number;
  closeRet: number;
}

export interface UsbDeviceScalar {
  busNum: number;
  devAddress: number;
  name: string;
  manufacturerName: string;
  productName: string;
  version: string;
  vendorId: number;
  productId: number;
  clazz: number;
  subClass: number;
  protocol: number;
}

export interface DeviceListScalars {
  ret: number;
  count: number;
  list: UsbDeviceScalar[];
}

export const getUsbDeviceListNullDevices: () => number;

export const getUsbDeviceListNullCount: () => number;

export const getUsbDeviceListNullBoth: () => number;

export const connectDeviceNullPipe: () => number;

export const connectDeviceNullBoth: () => number;

export const connectDeviceFakeDevice: () => number;

export const connectDeviceGarbageFields: () => number;

export const connectDeviceBoundaryZero: () => number;

export const hasPermissionNullResult: () => number;

export const hasPermissionNullBoth: () => number;

export const hasPermissionInvalidName: () => HasPermissionResult;

export const requestPermissionNullName: () => number;

export const requestPermissionWithCallback: (deviceName: string) => RequestPermissionResult;

export const getFileDescriptorNullFd: () => number;

export const getFileDescriptorFakePipe: () => number;

export const closePipeFakePipe: () => number;

export const getDeviceListFullFieldCheck: () => FullFieldCheckResult;

export const connectDevicePipeEcho: () => PipeEchoResult;

export const getDeviceListScalars: () => DeviceListScalars;

export interface CtxPassthroughResult {
  ret: number;
  cbFired: boolean;
  cbErrCode: number;
  cbResult: boolean;
  ctxMatch: boolean;
}

export interface FdFlowResult {
  ret: number;
  deviceCount: number;
  fdRet: number;
  fd: number;
  closeRet: number;
}

export interface AfterCloseFdResult {
  ret: number;
  deviceCount: number;
  closeRet: number;
  fdRet: number;
}

export const hasPermissionByName: (deviceName: string) => HasPermissionResult;

export const requestPermissionCtxPassthrough: (useNullCtx: boolean) => CtxPassthroughResult;

export const connectDeviceByAddr: (busNum: number, devAddress: number) => number;

export const getFileDescriptorByAddr: (busNum: number, devAddress: number) => number;

export const closePipeByAddr: (busNum: number, devAddress: number) => number;

export const getFileDescriptorFlow: () => FdFlowResult;

export const getFileDescriptorAfterClose: () => AfterCloseFdResult;

export const connectDevicePipeEchoByAddr: (busNum: number, devAddress: number) => PipeEchoResult;

export interface RequestPermissionBeginResult {
  ret: number;
  deviceCount: number;
}

export interface RequestPermissionPollResult {
  cbFired: boolean;
  cbErrCode: number;
  cbResult: boolean;
}

export const requestPermissionBegin: () => RequestPermissionBeginResult;

export const requestPermissionPoll: () => RequestPermissionPollResult;
