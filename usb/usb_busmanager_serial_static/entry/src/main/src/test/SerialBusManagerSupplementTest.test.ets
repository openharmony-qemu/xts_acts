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
          await gPort?.close();
          done()
        } catch (err) {
          console.error(TAG, 'afterAll close error: ', JSON.stringify(err));
          done()
        }
      } else {
        done()
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
            expect(typeof vendorId === 'number').assertTrue();
          } else {
            console.info(TAG, 'testSerialPortInfoVendorId001 vendorId is undefined (optional attribute)');
          }
          expect(vendorId === undefined || typeof vendorId === 'number').assertTrue();
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
            expect(typeof productId === 'number').assertTrue();
          } else {
            console.info(TAG, 'testSerialPortInfoProductId001 productId is undefined (optional attribute)');
          }
          expect(productId === undefined || typeof productId === 'number').assertTrue();
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

    /**
     * @tc.name   testAddPortAuthorization004
     * @tc.number SUB_BusManager_Serial_Static_addPortAuthorization_ErrCode_0400
     * @tc.desc   addPortAuthorization permission denied - 35700008 or non-system 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddPortAuthorization004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.info(TAG, 'testAddPortAuthorization004 start');
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      try {
        const bundleFlags: int = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        const tokenId: string = String(bundleInfo?.appInfo?.accessTokenId);
        const deviceId: string = gPortInfo!.portName;
        await serial.addPortAuthorization(tokenId, deviceId);
        console.info(TAG, 'testAddPortAuthorization004 success - no error thrown');
        done();
      } catch (err) {
        console.error(TAG, 'testAddPortAuthorization004 catch err code: ', err.code, ', message: ', err.message);
        if (err.code === 202) {
          console.info(TAG, 'testAddPortAuthorization004 got 202 (non-system app)');
          expect(err.code).assertEqual(202);
        } else if (err.code === 35700008) {
          console.info(TAG, 'testAddPortAuthorization004 got 35700008 (permission denied)');
          expect(err.code).assertEqual(35700008);
        } else {
          console.info(TAG, 'testAddPortAuthorization004 unexpected error code: ', err.code);
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testOffDisconnect003
     * @tc.number SUB_BusManager_Serial_Static_offDisconnect_Func_0200
     * @tc.desc   offDisconnect unregister specific callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOffDisconnect003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info(TAG, 'testOffDisconnect003 start');
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        const disconnectCallback: () => void = (): void => {
          console.info(TAG, 'testOffDisconnect003 disconnect callback');
        };
        gPort!.onDisconnect(disconnectCallback);
        gPort!.offDisconnect(disconnectCallback);
        console.info(TAG, 'testOffDisconnect003 unregister specific callback success');
        await gPort!.close();
        done();
      } catch (error) {
        console.error(TAG, 'testOffDisconnect003 catch err: ', JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWriteReturn001
     * @tc.number SUB_BusManager_Serial_Static_write_RETURN_0100
     * @tc.desc   write return value validation - verify write length and received data consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWriteReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info(TAG, 'testWriteReturn001 start');
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      if (gPort1 == null) {
        console.info(TAG, 'testWriteReturn001 gPort1 is null, skip loopback test');
        done();
        return Promise.resolve();
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        gPort1!.open();
        await sleep(500);
        let receivedLength: int = 0;
        let receivedData: Uint8Array | null = null;
        gPort1!.onDataRead((data: Uint8Array): void => {
          receivedData = data;
          receivedLength = data.length;
          console.info(TAG, 'testWriteReturn001 received length: ', receivedLength);
        });
        const sendData: Uint8Array = new Uint8Array(buffer.from('Hello Serial', 'utf-8').buffer);
        const writeLen: int = await gPort!.write(sendData, 2000);
        console.info(TAG, 'testWriteReturn001 writeLen: ', writeLen);
        expect(writeLen > 0).assertTrue();
        await sleep(1000);
        if (receivedData !== null) {
          expect(receivedLength).assertEqual(sendData.length);
        }
        gPort1!.offDataRead();
        await gPort!.close();
        await gPort1!.close();
        done();
      } catch (error) {
        console.error(TAG, 'testWriteReturn001 catch err: ', JSON.stringify(error));
        expect().assertFail();
        try {
          if (gPort != null) {
            await gPort!.close();
          }
          if (gPort1 != null) {
            await gPort1!.close();
          }
        } catch (closeErr) {
          console.error(TAG, 'testWriteReturn001 close error: ', JSON.stringify(closeErr));
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead003
     * @tc.number SUB_BusManager_Serial_Static_onDataRead_Func_0200
     * @tc.desc   onDataRead multiple callback registration and selective removal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnDataRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.info(TAG, 'testOnDataRead003 start');
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      if (gPort1 == null) {
        console.info(TAG, 'testOnDataRead003 gPort1 is null, skip');
        done();
        return Promise.resolve();
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        gPort1!.open();
        await sleep(500);
        let callback1Triggered: boolean = false;
        let callback2Triggered: boolean = false;
        const callback1: (data: Uint8Array) => void = (data: Uint8Array): void => {
          callback1Triggered = true;
          console.info(TAG, 'testOnDataRead003 callback1 received length: ', data.length);
        };
        const callback2: (data: Uint8Array) => void = (data: Uint8Array): void => {
          callback2Triggered = true;
          console.info(TAG, 'testOnDataRead003 callback2 received length: ', data.length);
        };
        gPort1!.onDataRead(callback1);
        gPort1!.onDataRead(callback2);
        await gPort!.write(new Uint8Array([0xAA]), 2000);
        await sleep(1000);
        expect(callback1Triggered || callback2Triggered).assertTrue();
        gPort1!.offDataRead(callback1);
        callback1Triggered = false;
        callback2Triggered = false;
        await gPort!.write(new Uint8Array([0xBB]), 2000);
        await sleep(1000);
        expect(callback2Triggered).assertTrue();
        expect(callback1Triggered).assertFalse();
        gPort1!.offDataRead(callback2);
        await gPort!.close();
        await gPort1!.close();
        done();
      } catch (error) {
        console.error(TAG, 'testOnDataRead003 catch err: ', JSON.stringify(error));
        expect().assertFail();
        try {
          if (gPort != null) {
            await gPort!.close();
          }
          if (gPort1 != null) {
            await gPort1!.close();
          }
        } catch (closeErr) {
          console.error(TAG, 'testOnDataRead003 close error: ', JSON.stringify(closeErr));
        }
        done();
      }
    })
  })
}
