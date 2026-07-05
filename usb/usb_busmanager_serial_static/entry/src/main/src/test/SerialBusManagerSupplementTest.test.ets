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

    /**
     * @tc.name   testOffDisconnect003
     * @tc.number SUB_BusManager_Serial_Static_offDisconnect_PARAM_0100
     * @tc.desc   offDisconnect with specific callback parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDisconnect003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOffDisconnect003 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          let disconnectCallback = (): void => {
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
     * @tc.name   testGetDsr003
     * @tc.number SUB_BusManager_Serial_Static_getDsr_RETURN_0100
     * @tc.desc   getDsr return value type is boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetDsr003 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          let dsr: boolean = await gPort!.getDsr();
          console.info(TAG, 'testGetDsr003 getDsr: ', dsr);
          expect(typeof dsr === 'boolean').assertTrue();
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetDsr003 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetDsr004
     * @tc.number SUB_BusManager_Serial_Static_getDsr_RETURN_0200
     * @tc.desc   getDsr returns true when remote port setDtr(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetDsr004 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          console.info(TAG, 'testGetDsr004 gPort1 is null, skip');
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          gPort1!.open();
          await sleep(500);
          await driveFn();
          await gPort1!.setDtr(true);
          await sleep(100);
          let dsr: boolean = await gPort!.getDsr();
          console.info(TAG, 'testGetDsr004 getDsr after setDtr(true): ', dsr);
          expect(dsr === true).assertTrue();
          await gPort!.close();
          await gPort1!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetDsr004 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetDsr005
     * @tc.number SUB_BusManager_Serial_Static_getDsr_RETURN_0300
     * @tc.desc   getDsr returns false when remote port setDtr(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetDsr005 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          console.info(TAG, 'testGetDsr005 gPort1 is null, skip');
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          gPort1!.open();
          await sleep(500);
          await driveFn();
          await gPort1!.setDtr(false);
          await sleep(100);
          let dsr: boolean = await gPort!.getDsr();
          console.info(TAG, 'testGetDsr005 getDsr after setDtr(false): ', dsr);
          expect(dsr === false).assertTrue();
          await gPort!.close();
          await gPort1!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetDsr005 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetCts003
     * @tc.number SUB_BusManager_Serial_Static_getCts_RETURN_0100
     * @tc.desc   getCts return value type is boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetCts003 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          let cts: boolean = await gPort!.getCts();
          console.info(TAG, 'testGetCts003 getCts: ', cts);
          expect(typeof cts === 'boolean').assertTrue();
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetCts003 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetCts004
     * @tc.number SUB_BusManager_Serial_Static_getCts_RETURN_0200
     * @tc.desc   getCts returns true when remote port setRts(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetCts004 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          console.info(TAG, 'testGetCts004 gPort1 is null, skip');
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          gPort1!.open();
          await sleep(500);
          await driveFn();
          await gPort1!.setRts(true);
          await sleep(100);
          let cts: boolean = await gPort!.getCts();
          console.info(TAG, 'testGetCts004 getCts after setRts(true): ', cts);
          expect(cts === true).assertTrue();
          await gPort!.close();
          await gPort1!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetCts004 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetCts005
     * @tc.number SUB_BusManager_Serial_Static_getCts_RETURN_0300
     * @tc.desc   getCts returns false when remote port setRts(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetCts005 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          console.info(TAG, 'testGetCts005 gPort1 is null, skip');
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          gPort1!.open();
          await sleep(500);
          await driveFn();
          await gPort1!.setRts(false);
          await sleep(100);
          let cts: boolean = await gPort!.getCts();
          console.info(TAG, 'testGetCts005 getCts after setRts(false): ', cts);
          expect(cts === false).assertTrue();
          await gPort!.close();
          await gPort1!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testGetCts005 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testWrite014
     * @tc.number SUB_BusManager_Serial_Static_write_RETURN_0100
     * @tc.desc   write return value type is int and greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testWrite014 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.open();
          await driveFn();
          let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
          let writeLen: int = await gPort!.write(writeData, 2000);
          console.info(TAG, 'testWrite014 writeLen: ', writeLen);
          expect(typeof writeLen === 'int').assertTrue();
          expect(writeLen > 0).assertTrue();
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testWrite014 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOnDataRead003
     * @tc.number SUB_BusManager_Serial_Static_onDataRead_RETURN_0100
     * @tc.desc   onDataRead callback data is Uint8Array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOnDataRead003 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          console.info(TAG, 'testOnDataRead003 gPort1 is null, skip');
          done();
          return Promise.resolve();
        }
        try {
          gPort1!.open();
          await driveFn();
          await sleep(500);
          gPort1!.onDataRead((data: Uint8Array): void => {
            console.info(TAG, 'testOnDataRead003 received data length: ', data.length);
            expect(data instanceof Uint8Array).assertTrue();
            expect(data.length >= 0).assertTrue();
          });
          console.info(TAG, 'testOnDataRead003 onDataRead register success');
          let writeData: Uint8Array = new Uint8Array(buffer.from('TestData', 'utf-8').buffer);
          await gPort1!.write(writeData, 1000);
          await sleep(500);
          gPort1!.offDataRead();
          await gPort1!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOnDataRead003 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenDatabitsEight001
     * @tc.number SUB_BusManager_Serial_Static_open_DATABITS_0100
     * @tc.desc   open with DataBits.EIGHT(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenDatabitsEight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenDatabitsEight001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            dataBits: serial.DataBits.EIGHT
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenDatabitsEight001 open with DataBits.EIGHT success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenDatabitsEight001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenDatabitsSeven001
     * @tc.number SUB_BusManager_Serial_Static_open_DATABITS_0200
     * @tc.desc   open with DataBits.SEVEN(7).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenDatabitsSeven001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenDatabitsSeven001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            dataBits: serial.DataBits.SEVEN
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenDatabitsSeven001 open with DataBits.SEVEN success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenDatabitsSeven001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenDatabitsSix001
     * @tc.number SUB_BusManager_Serial_Static_open_DATABITS_0300
     * @tc.desc   open with DataBits.SIX(6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenDatabitsSix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenDatabitsSix001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            dataBits: serial.DataBits.SIX
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenDatabitsSix001 open with DataBits.SIX success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenDatabitsSix001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenDatabitsFive001
     * @tc.number SUB_BusManager_Serial_Static_open_DATABITS_0400
     * @tc.desc   open with DataBits.FIVE(5).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenDatabitsFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenDatabitsFive001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            dataBits: serial.DataBits.FIVE
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenDatabitsFive001 open with DataBits.FIVE success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenDatabitsFive001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenStopbitsOne001
     * @tc.number SUB_BusManager_Serial_Static_open_STOPBITS_0100
     * @tc.desc   open with StopBits.ONE(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenStopbitsOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenStopbitsOne001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            stopBits: serial.StopBits.ONE
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenStopbitsOne001 open with StopBits.ONE success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenStopbitsOne001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenStopbitsTwo001
     * @tc.number SUB_BusManager_Serial_Static_open_STOPBITS_0200
     * @tc.desc   open with StopBits.TWO(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenStopbitsTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenStopbitsTwo001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            stopBits: serial.StopBits.TWO
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenStopbitsTwo001 open with StopBits.TWO success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenStopbitsTwo001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpenParityNone001
     * @tc.number SUB_BusManager_Serial_Static_open_PARITY_0100
     * @tc.desc   open with Parity.NONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenParityNone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testOpenParityNone001 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          let config: serial.SerialConfigs = {
            baudRate: 115200,
            parity: serial.Parity.NONE
          };
          gPort!.open(config);
          await driveFn();
          console.info(TAG, 'testOpenParityNone001 open with Parity.NONE success');
          await gPort!.close();
          done();
        } catch (error) {
          console.error(TAG, 'testOpenParityNone001 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetSerialPortList003
     * @tc.number SUB_BusManager_Serial_Static_getSerialPortList_RETURN_0100
     * @tc.desc   getSerialPortList returns empty array when no device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetSerialPortList003 start');
        try {
          const portList: serial.SerialPort[] = await serial.getSerialPortList();
          console.info(TAG, 'testGetSerialPortList003 portList length: ', portList.length);
          expect(portList instanceof Array).assertTrue();
          expect(typeof portList.length === 'int').assertTrue();
          expect(portList.length >= 0).assertTrue();
          if (portList.length === 0) {
            expect(portList.length).assertEqual(0);
            console.info(TAG, 'testGetSerialPortList003 empty array coverage success');
          } else {
            console.info(TAG, 'testGetSerialPortList003 device detected, cannot test empty case');
          }
          done();
        } catch (error) {
          console.error(TAG, 'testGetSerialPortList003 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetSerialPortList004
     * @tc.number SUB_BusManager_Serial_Static_getSerialPortList_RETURN_0200
     * @tc.desc   getSerialPortList returns non-empty array with valid SerialPort structure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG, 'testGetSerialPortList004 start');
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          const portList: serial.SerialPort[] = await serial.getSerialPortList();
          console.info(TAG, 'testGetSerialPortList004 portList length: ', portList.length);
          expect(portList instanceof Array).assertTrue();
          expect(portList.length > 0).assertTrue();
          for (let i: int = 0; i < portList.length; i++) {
            let port: serial.SerialPort = portList[i];
            expect(port.portInfo != null).assertTrue();
            expect(port.portInfo != undefined).assertTrue();
            let portInfo: serial.SerialPortInfo = port.portInfo;
            expect(typeof portInfo.portName === 'string').assertTrue();
            expect(portInfo.portName.length > 0).assertTrue();
            console.info(TAG, 'testGetSerialPortList004 port[', i, '] portName: ', portInfo.portName);
          }
          done();
        } catch (error) {
          console.error(TAG, 'testGetSerialPortList004 catch err: ', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })
  })
}
