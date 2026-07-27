/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { DeviceManager } from 'iotmanagementkit';

export default class IotDevice {
  private pinCode: string | undefined = undefined;
  private deviceInfo: DeviceManager.DeviceInfo

  constructor(deviceInfo: DeviceManager.DeviceInfo) {
    this.deviceInfo = deviceInfo;
  }

  setPinCode(pinCode: string) {
    this.pinCode = pinCode;
  }

  getName() {
    return this.deviceInfo.mLocalName;
  }

  getPinCode() {
    return this.pinCode;
  }

  getUnionCode(): string {
    return this.deviceInfo.udid;
  }

  getScannedProtocol(): DeviceManager.ScanProtocol {
    return this.deviceInfo.scannedProtocol;
  }

  getSignalStrength(): number {
    return this.deviceInfo.rssi;
  }

  getProductID(): string {
    return this.deviceInfo.prodId;
  }

  getRandomFlag(): string {
    return this.deviceInfo.mDeviceSn;
  }
}