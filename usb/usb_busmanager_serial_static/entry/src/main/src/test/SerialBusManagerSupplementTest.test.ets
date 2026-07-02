'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import serial from "@ohos.busManager.serial";
import bundleManager from '@ohos.bundle.bundleManager';
import buffer from '@ohos.buffer';

const TAG: string = "[SerialBusManagerSupplementStaticTest]";

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

async function driveFn(): Promise<void> {
  console.info(TAG, '**************driveFn**************');
  try {
    const driver: Driver = Driver.create();
    await driver.delayMs(1000);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    const buttons = await driver.findComponents(ON.text('允许', MatchPattern.EQUALS));
    console.info(TAG, `buttons is ${JSON.stringify(buttons)}`);
    if (buttons && buttons.length > 0) {
      await buttons[0].click();
    }
  } catch (error) {
    console.info(TAG, 'driveFn error: ' + error);
  }
}

async function checkDevice(): Promise<boolean> {
  try {
    const portList: serial.SerialPort[] = await serial.getSerialPortList();
    if (portList && portList.length > 0) {
      console.info(TAG, 'Test serial device detected');
      return true;
    } else {
      console.info(TAG, 'Test no serial device detected');
      return false;
    }
  } catch (err) {
    console.error(TAG, 'checkDevice error: ', JSON.stringify(err));
    return false;
  }
}

export default function SerialBusManagerSupplementTest(): void {
  describe('SerialBusManagerSupplementTest', (): void => {
    console.info(TAG, 'describe start');
    let gPort: serial.SerialPort | null = null;
    let gPortInfo: serial.SerialPortInfo | null = null;
    let gPort1: serial.SerialPort | null = null;

    beforeAll(async (done: () => void): Promise<void> => {
      console.info(TAG, 'beforeAll start');
      try {
        const portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList && portList.length > 0) {
          gPort = portList[0];
          gPortInfo = portList[0].portInfo;
          if (portList.length > 1) {
            gPort1 = portList[1];
          }
          console.info(TAG, 'beforeAll portInfo: ', JSON.stringify(gPortInfo));
          done()
        }
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
        done()
      }
    })

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG, 'afterAll');
      if (gPort != null) {
        try {
          gPort?.close();
          done()
        } catch (err) {
          console.error(TAG, 'afterAll close error: ', JSON.stringify(err));
          done()
        }
      } 
      if (gPort1 != null) {
        try {
          await gPort1?.close();
          done()
        } catch (err) {
          console.error(TAG, 'afterAll close error: ', JSON.stringify(err));
          done()
        }
      }
    })

    /**
     * @tc.name   testSerialPortInfoVendorId001
     * @tc.number SUB_BusManager_Serial_Static_SerialPortInfo_VENDORID_PARAM_0100
     * @tc.desc   SerialPortInfo vendorId optional attribute test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerialPortInfoVendorId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testSerialPortInfoVendorId001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          const portList: serial.SerialPort[] = await serial.getSerialPortList();
          if (portList.length > 0) {
            const portInfo: serial.SerialPortInfo = portList[0].portInfo;
            const vendorId: int | undefined = portInfo.vendorId;
            console.info(TAG, 'testSerialPortInfoVendorId001 vendorId: ', vendorId);
            if (vendorId !== undefined) {
              expect(typeof vendorId === 'int').assertTrue();
            } else {
              console.info(TAG, 'testSerialPortInfoVendorId001 vendorId is undefined (optional attribute)');
            }
            expect(vendorId === undefined || typeof vendorId === 'int').assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, 'testSerialPortInfoVendorId001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSerialPortInfoProductId001
     * @tc.number SUB_BusManager_Serial_Static_SerialPortInfo_PRODUCTID_PARAM_0100
     * @tc.desc   SerialPortInfo productId optional attribute test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerialPortInfoProductId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testSerialPortInfoProductId001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          const portList: serial.SerialPort[] = await serial.getSerialPortList();
          if (portList.length > 0) {
            const portInfo: serial.SerialPortInfo = portList[0].portInfo;
            const productId: int | undefined = portInfo.productId;
            console.info(TAG, 'testSerialPortInfoProductId001 productId: ', productId);
            if (productId !== undefined) {
              expect(typeof productId === 'int').assertTrue();
            } else {
              console.info(TAG, 'testSerialPortInfoProductId001 productId is undefined (optional attribute)');
            }
            expect(productId === undefined || typeof productId === 'int').assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, 'testSerialPortInfoProductId001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSerialPortInfoManufacturer001
     * @tc.number SUB_BusManager_Serial_Static_SerialPortInfo_MANUFACTURER_PARAM_0100
     * @tc.desc   SerialPortInfo manufacturer optional attribute test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerialPortInfoManufacturer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testSerialPortInfoManufacturer001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          const portList: serial.SerialPort[] = await serial.getSerialPortList();
          if (portList.length > 0) {
            const portInfo: serial.SerialPortInfo = portList[0].portInfo;
            const manufacturer: string | undefined = portInfo.manufacturer;
            console.info(TAG, 'testSerialPortInfoManufacturer001 manufacturer: ', manufacturer);
            if (manufacturer !== undefined) {
              expect(manufacturer.length >= 0).assertTrue();
            } else {
              console.info(TAG, 'testSerialPortInfoManufacturer001 manufacturer is undefined (optional attribute)');
            }
            expect(manufacturer === undefined || typeof manufacturer === 'string').assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, 'testSerialPortInfoManufacturer001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })
  })
}
