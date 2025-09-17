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
export const DdkMapAshmemAddress: () => number;
export const DdkMapAshmemSize: () => number;
export const DdkMapAshmemOffset: () => number;
export const DdkMapAshmemBufferLength: () => number;
export const DdkMapAshmemTransferredLength: () => number;
export const DdkMapAshmemFailure: () => number;
export const DdkMapAshmemInvalidParameter: () => number;
export const DdkMapAshmemInvalidOperation: () => number;
export const DdkMapAshmemNullPTR: () => number;
export const IsHidDevice: (a: number) => number;
export const HidCreateDevicePropPointer: () => number;
export const HidCreateDevicePropPointingStick: () => number;
export const HidCreateDevicePropButtonPad: () => number;
export const HidCreateDevicePropSemiMt: () => number;
export const HidCreateDevicePropTopButtonPad: () => number;
export const HidCreateDevicePropAccelerometer: () => number;
export const HidCreateDeviceEventTypeHidEVRel: () => number;
export const HidSynEventReport: () => number;
export const HidSynEventConfig: () => number;
export const HidSynEventMtReport: () => number;
export const HidSynEventDropped: () => number;
export const HidCreateDeviceKeyCodeKEYA: () => number;
export const HidCreateDeviceKeyCodeKEYB: () => number;
export const HidCreateDeviceKeyCodeKEYC: () => number;
export const HidCreateDeviceKeyCodeKEYD: () => number;
export const HidCreateDeviceKeyCodeKEYE: () => number;
export const HidCreateDeviceKeyCodeKEYF: () => number;
export const HidCreateDeviceKeyCodeKEYG: () => number;
export const HidCreateDeviceKeyCodeKEYH: () => number;
export const HidCreateDeviceKeyCodeKEYI: () => number;
export const HidCreateDeviceKeyCodeKEYJ: () => number;
export const HidCreateDeviceKeyCodeKEYK: () => number;
