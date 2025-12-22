/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export const initWithSurface: (faceID : string) => number;
export const captureSessionStart: () => number;
export const captureSessionIsVideoStabilizationModeSupported: () => number;
export const captureSessionSetVideoStabilizationMode: () => number;
export const captureSessionIsFlashModeSupported: () => number;
export const captureSessionGetFlashMode: () => number;
export const captureSessionRelease: () => number;
export const captureSessionIsExposureModeSupported: () => number;
export const captureSessionEnableControlCenter: (a:number) => number;
export const captureSessionEnableAutoDeviceSwitch: (a:number) => number;
export const captureSessionEnableMacro: (a:number) => number;
export const captureSessionIsMacroSupported: () => boolean;
export const captureSessionIsAutoDeviceSwitchSupported: () => boolean;
export const captureSessionSetWhiteBalance: (a:number) => number;
export const captureSessionGetWhiteBalanceRange: () => number;
export const captureSessionAddPreviewOutput: (a:string) => number;
export const captureSessionRemovePreviewOutput: (a:string) => number;
export const captureSessionBeginConfig: (a:string) => number;
export const captureSessionEnableMacroConfigAllow: () => number;
export const captureSessionEmu: (a:number) => number;
export const OHCameraInputOpenConcurrentCameras: (a:number) => number;
export const OHCaptureSessionDeleteSupportedEffectTypes: (a:number) => number;
export const OHCaptureSessionGetSupportedEffectTypesSupp: () => number;