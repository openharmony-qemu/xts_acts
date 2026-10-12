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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import usbManager from '@ohos.usbManager';

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';
export const SKIP_TAG: string = '[SKIP]';
export const ERR_CODE_SUCCESS: number = 0;
export const ERR_CODE_PERMISSION_DENIED: number = 14400001;
export const ERR_CODE_SERVICE_EXCEPTION: number = 14400004;
export const ERR_CODE_NO_DEVICE: number = 14400008;
export const ERR_CODE_IO_ERROR: number = 14400012;
export const ERR_CODE_INVALID_PARAMETER: number = 14400014;

/**
 * Returns the number of attached USB peripherals, or -1 when detection itself
 * failed (service unavailable). Callers treat any non-positive outcome as an
 * unmet precondition and skip with a [SKIP] log instead of passing silently.
 */
export function getAttachedUsbCount(): number {
  try {
    return usbManager.getDevices().length;
  } catch (err) {
    let errMsg = (err as BusinessError).message;
    hilog.error(DOMAIN, TAG, 'getDevices failed: ' + errMsg);
    return -1;
  }
}

/**
 * Emits the standard skip log for a case whose precondition is not met and
 * finishes the case. Repo convention: [SKIP] log first, then done()/return.
 */
export function skipCase(caseName: string, reason: string, done: Function): void {
  hilog.info(DOMAIN, TAG, SKIP_TAG + ' ' + caseName + ', ' + reason + ', skip');
  done();
}

export interface FirstUsbDevice {
  name: string;
  busNum: number;
  devAddress: number;
}

/**
 * Returns the first attached USB peripheral, or null when none is attached or
 * enumeration failed (service unavailable). Callers treat null as an unmet
 * precondition and skip with a [SKIP] log.
 */
export function getFirstUsbDevice(): FirstUsbDevice | null {
  try {
    let devices = usbManager.getDevices();
    if (devices.length === 0) {
      return null;
    }
    let first = devices[0];
    let result: FirstUsbDevice = {
      name: first.name,
      busNum: first.busNum,
      devAddress: first.devAddress
    };
    return result;
  } catch (err) {
    let errMsg = (err as BusinessError).message;
    hilog.error(DOMAIN, TAG, 'getDevices failed: ' + errMsg);
    return null;
  }
}
