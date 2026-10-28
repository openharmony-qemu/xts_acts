'use static';
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

import UsbMgr from '@ohos.usbManager';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { afterAll, beforeEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

const TAG: string = "[UsbClaimInterfaceExclusiveTest]";
const SKIP_TAG: string = "[SKIP]";

let deviceList: Array<Readonly<UsbMgr.USBDevice>> = [];
let testDevice: UsbMgr.USBDevice | null = null;
let isDeviceConnected: boolean = false;
let hasClaimableInterface: boolean = false;

function deviceConnected(list: Array<Readonly<UsbMgr.USBDevice>>): boolean {
  if (list.length > 0) {
    console.info(`${TAG} USB device is connected`);
    return true;
  }
  console.info(`${TAG} USB device is not connected`);
  return false;
}

async function clickAllowButton(): Promise<void> {
  console.info(`${TAG} clickAllowButton`);
  try {
    let driver: Driver = Driver.create();
    await driver.delayMs(1000);
    let buttons = await driver.findComponents(ON.text('允许', MatchPattern.EQUALS));
    if (!buttons || buttons.length === 0) {
      buttons = await driver.findComponents(ON.text('Allow', MatchPattern.EQUALS));
    }
    if (buttons && buttons.length > 0) {
      for (let i: int = 0; i < buttons.length; i++) {
        await buttons[i].click();
      }
    }
  } catch (error) {
    console.error(`${TAG} clickAllowButton catch err: ${JSON.stringify(error)}`);
  }
}

async function ensurePermission(deviceName: string): Promise<void> {
  if (!UsbMgr.hasRight(deviceName)) {
    console.info(`${TAG} permission missing, requesting...`);
    const rightPromise = UsbMgr.requestRight(deviceName);
    await clickAllowButton();
    await rightPromise;
  }
}

/* Returns false and logs a skip when the device preconditions are not met. */
function preconditionReady(testName: string): boolean {
  if (!isDeviceConnected) {
    console.info(`${TAG} ${SKIP_TAG} ${testName}, no USB device connected`);
    return false;
  }
  if (!hasClaimableInterface) {
    console.info(`${TAG} ${SKIP_TAG} ${testName}, no claimable USB interface`);
    return false;
  }
  return true;
}

function teardownPipe(pipe: UsbMgr.USBDevicePipe | null): void {
  if (pipe !== null) {
    try {
      UsbMgr.closePipe(pipe);
    } catch (error) {
      console.error(`${TAG} teardownPipe catch err: ${JSON.stringify(error)}`);
    }
  }
}

/* usbManager.claimInterfaceExclusive and InterfaceConflictInfo test, the API is added since 26.0.1 */
export default function UsbClaimInterfaceExclusiveTest(): void {
  describe('UsbClaimInterfaceExclusiveTest', (): void => {

    beforeAll(async (): Promise<void> => {
      console.info(`${TAG} beforeAll start`);
      let rawList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      if (!rawList) {
        console.error(`${TAG} getDevices returned undefined`);
        return;
      }
      deviceList = rawList;
      isDeviceConnected = deviceConnected(deviceList);
      if (isDeviceConnected) {
        testDevice = deviceList[0]!;
        hasClaimableInterface = testDevice!.configs.length > 0 && testDevice!.configs[0]!.interfaces.length > 0;
        console.info(`${TAG} beforeAll hasClaimableInterface: ${hasClaimableInterface}`);
        await ensurePermission(testDevice!.name);
      }
    })

    beforeEach((): void => {
      console.info(`${TAG} beforeEach`);
    })

    afterAll((): void => {
      console.info(`${TAG} afterAll`);
    })

    /**
     * @tc.name   testClaimInterfaceExclusiveSuccess
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0100
     * @tc.desc   claimInterfaceExclusive with default force should claim and release every interface successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceExclusiveSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testClaimInterfaceExclusiveSuccess start`);
        if (!preconditionReady('testClaimInterfaceExclusiveSuccess')) {
          done();
          return Promise.resolve();
        }
        await ensurePermission(testDevice!.name);
        let localPipe: UsbMgr.USBDevicePipe | null = null;
        try {
          localPipe = UsbMgr.connectDevice(testDevice!);
          expect(localPipe !== null).assertTrue();
          for (let j: int = 0; j < deviceList[0].configs.length; j++) {
            for (let k: int = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
              let targetInterface: UsbMgr.USBInterface = deviceList[0].configs[j].interfaces[k];
              UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface);
              let releaseRet = UsbMgr.releaseInterface(localPipe!, targetInterface);
              console.info(`${TAG} claim exclusive iface ${targetInterface.id}, release result: ${releaseRet}`);
              expect(releaseRet).assertEqual(0);
            }
          }
        } catch (error) {
          console.error(`${TAG} testClaimInterfaceExclusiveSuccess catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownPipe(localPipe);
          done();
        }
      })

    /**
     * @tc.name   testClaimInterfaceExclusiveForceTrue
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0200
     * @tc.desc   claimInterfaceExclusive with force=true should claim and release successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceExclusiveForceTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testClaimInterfaceExclusiveForceTrue start`);
        if (!preconditionReady('testClaimInterfaceExclusiveForceTrue')) {
          done();
          return Promise.resolve();
        }
        await ensurePermission(testDevice!.name);
        let localPipe: UsbMgr.USBDevicePipe | null = null;
        try {
          localPipe = UsbMgr.connectDevice(testDevice!);
          expect(localPipe !== null).assertTrue();
          let targetInterface: UsbMgr.USBInterface = deviceList[0].configs[0]!.interfaces[0];
          UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface, true);
          let releaseRet = UsbMgr.releaseInterface(localPipe!, targetInterface);
          console.info(`${TAG} claim exclusive with force, release result: ${releaseRet}`);
          expect(releaseRet).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} testClaimInterfaceExclusiveForceTrue catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownPipe(localPipe);
          done();
        }
      })

    /**
     * @tc.name   testClaimInterfaceExclusiveWithConflictCallback
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0300
     * @tc.desc   claimInterfaceExclusive with force=false and onConflict callback, no conflict should occur in single app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceExclusiveWithConflictCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testClaimInterfaceExclusiveWithConflictCallback start`);
        if (!preconditionReady('testClaimInterfaceExclusiveWithConflictCallback')) {
          done();
          return Promise.resolve();
        }
        await ensurePermission(testDevice!.name);
        let conflictInvoked: boolean = false;
        let onConflict: (info: UsbMgr.InterfaceConflictInfo) => void = (info: UsbMgr.InterfaceConflictInfo): void => {
          conflictInvoked = true;
          console.info(`${TAG} onConflict busNum: ${info.busNum}, devAddr: ${info.devAddr}, ` +
            `interfaceId: ${info.interfaceId}`);
        };
        let localPipe: UsbMgr.USBDevicePipe | null = null;
        try {
          localPipe = UsbMgr.connectDevice(testDevice!);
          expect(localPipe !== null).assertTrue();
          let targetInterface: UsbMgr.USBInterface = deviceList[0].configs[0]!.interfaces[0];
          UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface, false, onConflict);
          let releaseRet = UsbMgr.releaseInterface(localPipe!, targetInterface);
          console.info(`${TAG} claim exclusive with callback, release result: ${releaseRet}`);
          expect(conflictInvoked).assertFalse();
          expect(releaseRet).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} testClaimInterfaceExclusiveWithConflictCallback catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownPipe(localPipe);
          done();
        }
      })

    /**
     * @tc.name   testClaimInterfaceExclusiveRepeat
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0400
     * @tc.desc   claimInterfaceExclusive called twice by the same app should both succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceExclusiveRepeat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testClaimInterfaceExclusiveRepeat start`);
        if (!preconditionReady('testClaimInterfaceExclusiveRepeat')) {
          done();
          return Promise.resolve();
        }
        await ensurePermission(testDevice!.name);
        let localPipe: UsbMgr.USBDevicePipe | null = null;
        try {
          localPipe = UsbMgr.connectDevice(testDevice!);
          expect(localPipe !== null).assertTrue();
          let targetInterface: UsbMgr.USBInterface = deviceList[0].configs[0]!.interfaces[0];
          UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface, true);
          UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface, true);
          let releaseRet = UsbMgr.releaseInterface(localPipe!, targetInterface);
          console.info(`${TAG} repeat claim exclusive, release result: ${releaseRet}`);
          expect(releaseRet).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} testClaimInterfaceExclusiveRepeat catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownPipe(localPipe);
          done();
        }
      })

    /**
     * @tc.name   testClaimInterfaceExclusiveNoPermission
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0500
     * @tc.desc   claimInterfaceExclusive without device permission should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceExclusiveNoPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testClaimInterfaceExclusiveNoPermission start`);
        if (!preconditionReady('testClaimInterfaceExclusiveNoPermission')) {
          done();
          return Promise.resolve();
        }
        await ensurePermission(testDevice!.name);
        let localPipe: UsbMgr.USBDevicePipe | null = null;
        try {
          localPipe = UsbMgr.connectDevice(testDevice!);
          let targetInterface: UsbMgr.USBInterface = deviceList[0].configs[0]!.interfaces[0];
          UsbMgr.removeRight(testDevice!.name);
          UsbMgr.claimInterfaceExclusive(localPipe!, targetInterface);
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${TAG} testClaimInterfaceExclusiveNoPermission catch err: ${JSON.stringify(error)}`);
          expect(err.code).assertEqual(14400001);
        } finally {
          try {
            await ensurePermission(testDevice!.name);
          } catch (error) {
            console.error(`${TAG} testClaimInterfaceExclusiveNoPermission restore permission err: ` +
              `${JSON.stringify(error)}`);
          }
          teardownPipe(localPipe);
          done();
        }
      })

    /**
     * @tc.name   testInterfaceConflictInfoFields
     * @tc.number SUB_USB_HostManager_ClaimExclusive_0800
     * @tc.desc   InterfaceConflictInfo should contain busNum, devAddr and interfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInterfaceConflictInfoFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testInterfaceConflictInfoFields start`);
      let conflictInfo: UsbMgr.InterfaceConflictInfo = { busNum: 3, devAddr: 5, interfaceId: 1 };
      console.info(`${TAG} conflictInfo: ${JSON.stringify(conflictInfo)}`);
      expect(conflictInfo.busNum).assertEqual(3);
      expect(conflictInfo.devAddr).assertEqual(5);
      expect(conflictInfo.interfaceId).assertEqual(1);
    })
  })
}
