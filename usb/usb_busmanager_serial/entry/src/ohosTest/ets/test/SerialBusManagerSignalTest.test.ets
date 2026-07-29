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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { JSON } from '@kit.ArkTS';
import { serial } from "@kit.BasicServicesKit";

const TAG: string = "[SerialBusManagerSignalTest]";

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function driveFn() {
  console.info('**************driveFn**************');
  try {
    let driver: Driver = Driver.create();
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    let button = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    if (button) {
      await button.click();
    }
  } catch (err) {
    console.info(TAG, `err: ${err}`);
    return;
  }
}

async function checkDevice(): Promise<boolean> {
  try {
    let portList: serial.SerialPort[] = await serial.getSerialPortList();
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

export default function SerialBusManagerSignalTest() {
  describe('SerialBusManagerSignalTest', () => {
    let gPort: serial.SerialPort | null = null;
    let gPort1: serial.SerialPort | null = null;

    beforeAll(async (done: Function) => {
      console.info(TAG, 'beforeAll start');
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList && portList.length > 0) {
          gPort = portList[0];
          gPort1 = portList[1];
        }
        done();
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
        done();
      }
    })

    afterAll(async () => {
      console.info(TAG, 'afterAll');
      if (gPort != null) {
        try {
          await gPort.close();
        } catch (err) {
          console.error(TAG, 'afterAll close error: ', JSON.stringify(err));
        }
      }
    })

    /**
     * @tc.name   testGetCts004
     * @tc.number SUB_BusManager_Serial_JS_getCts_RETURN_0200
     * @tc.desc   getCts returns true when remote port setRts(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetCts004 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      if (gPort1 === null) {
        console.info(TAG, 'testGetCts004 gPort1 is null, skip');
        done();
        return;
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
      } catch (err) {
        console.error(TAG, 'testGetCts004 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetCts005
     * @tc.number SUB_BusManager_Serial_JS_getCts_RETURN_0300
     * @tc.desc   getCts returns false when remote port setRts(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetCts005 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      if (gPort1 === null) {
        console.info(TAG, 'testGetCts005 gPort1 is null, skip');
        done();
        return;
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
      } catch (err) {
        console.error(TAG, 'testGetCts005 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testGetDsr004
     * @tc.number SUB_BusManager_Serial_JS_getDsr_RETURN_0200
     * @tc.desc   getDsr returns true when remote port setDtr(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetDsr004 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      if (gPort1 === null) {
        console.info(TAG, 'testGetDsr004 gPort1 is null, skip');
        done();
        return;
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
        expect(dsr).assertTrue();
        await gPort!.close();
        await gPort1!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetDsr004 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetDsr005
     * @tc.number SUB_BusManager_Serial_JS_getDsr_RETURN_0300
     * @tc.desc   getDsr returns false when remote port setDtr(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetDsr005 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      if (gPort1 === null) {
        console.info(TAG, 'testGetDsr005 gPort1 is null, skip');
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        gPort1!.open();
        await sleep(500);
        await driveFn();
        await gPort1!.setDtr(false);
        await sleep(1000);
        let dsr: boolean = await gPort!.getDsr();
        console.info(TAG, 'testGetDsr005 getDsr after setDtr(false): ', dsr);
        expect(dsr).assertFalse();
        await gPort!.close();
        await gPort1!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetDsr005 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

  })
}