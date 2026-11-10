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
export const ddkCreateAshmem: () => number;
export const ddkMapAshmem: () => number;
export const ddkUnmapAshmem: () => number;
export const ddkDestroyAshmem: () => number;

export const hidCreateDevice: () => number;
export const hidEmitEvent: () => number;
export const hidDestroyDevice: () => number;
export const hidInit: () => number;
export const hidRelease: () => number;
export const hidOpen: () => number;
export const hidClose: () => number;
export const hidWrite: () => number;
export const hidReadTimeout: () => number;
export const hidRead: () => number;
export const hidSetNonBlocking: () => number;
export const hidGetRawInfo: () => number;
export const hidGetRawName: () => number;
export const hidGetPhysicalAddress: () => number;
export const hidGetRawUniqueId: () => number;
export const hidSendReport: () => number;
export const hidGetReport: () => number;
export const hidGetReportDescriptor: () => number;

export const scsiInit: () => number;
export const scsiRelease: () => number;
export const scsiOpen: () => number;
export const scsiClose: () => number;
export const scsiTestUnitReady: () => number;
export const scsiInquiry: () => number;
export const scsiReadCapacity10: () => number;
export const scsiRequestSense: () => number;
export const scsiRead10: () => number;
export const scsiWrite10: () => number;
export const scsiVerify10: () => number;
export const scsiSendRequestByCdb: () => number;
export const scsiCreateDeviceMemMap: () => number;
export const scsiDestroyDeviceMemMap: () => number;
export const scsiParseBasicSenseInfo: () => number;

export const usbInit: () => number;
export const usbRelease: () => number;
export const usbReleaseResource: () => number;
export const usbGetDeviceDescriptor: () => number;
export const usbGetConfigDescriptor: () => number;
export const usbFreeConfigDescriptor: () => number;
export const usbClaimInterface: () => number;
export const usbReleaseInterface: () => number;
export const usbSelectInterfaceSetting: () => number;
export const usbGetCurrentInterfaceSetting: () => number;
export const usbSendControlReadRequest: () => number;
export const usbSendControlWriteRequest: () => number;
export const usbSendPipeRequest: () => number;
export const usbSendPipeRequestWithAshmem: () => number;
export const usbCreateDeviceMemMap: () => number;
export const usbDestroyDeviceMemMap: () => number;
export const usbGetDevices: () => number;
export const usbControlTransfer: () => number;
export const usbGetNonRootHubs: () => number;

export const usbSerialInit: () => number;
export const usbSerialRelease: () => number;
export const usbSerialOpen: () => number;
export const usbSerialClose: () => number;
export const usbSerialRead: () => number;
export const usbSerialWrite: () => number;
export const usbSerialSetBaudRate: () => number;
export const usbSerialSetParams: () => number;
export const usbSerialSetTimeout: () => number;
export const usbSerialSetFlowControl: () => number;
export const usbSerialFlush: () => number;
export const usbSerialFlushInput: () => number;
export const usbSerialFlushOutput: () => number;
