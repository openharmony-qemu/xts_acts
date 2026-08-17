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

import { describe, beforeAll, afterAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { serial } from "@kit.BasicServicesKit";

const TAG: string = "[SerialBusManagerSignalTest]";
const SKIP_TAG: string = "[SKIP]";
let deviceExists: boolean = false;

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
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
      for (let i: number = 0; i < buttons.length; i++) {
        await buttons[i].click();
      }
    }
  } catch (error) {
    console.info(`${TAG} clickAllowButton error: ${error}`);
  }
}

async function checkDevice(): Promise<boolean> {
  if (deviceExists) {
    console.info(`${TAG} serial device detected (cached)`);
  } else {
    console.info(`${TAG} no serial device detected (cached)`);
  }
  return deviceExists;
}

async function safeClose(port: serial.SerialPort | null): Promise<void> {
  if (port === null) {
    return;
  }
  try {
    await port!.close();
  } catch (error) {
    console.info(`${TAG} safeClose ignore: ${JSON.stringify(error)}`);
  }
}

export default function SerialBusManagerSignalTest() {
  describe('SerialBusManagerSignalTest', () => {
    let port: serial.SerialPort | null = null;
    let port1: serial.SerialPort | null = null;
    let gAuthSuccess: boolean = false;

    beforeAll(async (done: Function) => {
      console.info(`${TAG} beforeAll start`);
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(`${TAG} beforeAll portList: ${JSON.stringify(portList)}`);
        let filterPortList: serial.SerialPort[] = portList.filter(p => p.portInfo?.portName != "ttyHW8");
        console.info(`${TAG} beforeAll filterPortList: ${JSON.stringify(filterPortList)}`);
        deviceExists = !!(filterPortList && filterPortList.length > 0);
        if (filterPortList && filterPortList.length > 1) {
          port = filterPortList[0];
          port1 = filterPortList[1];
          const openPromise0 = port!.open();
          await clickAllowButton();
          await openPromise0;
          const openPromise1 = port1!.open();
          await clickAllowButton();
          await openPromise1;
          await port!.close();
          await port1!.close();
          gAuthSuccess = true;
          console.info(`${TAG} beforeAll both ports authorized`);
        }
        done();
      } catch (error) {
        console.info(`${TAG} beforeAll error: ${JSON.stringify(error)}`);
        gAuthSuccess = false;
        done();
      }
    })

    afterAll(async (): Promise<void> => {
      console.info(`${TAG} afterAll`);
    })

    afterEach(async (): Promise<void> => {
      console.info(`${TAG} afterEach`);
      await safeClose(port);
      await safeClose(port1);
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
      console.info(`${TAG} testGetCts004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testGetCts004 port1 is null, skip`);
        done();
        return;
      }
      if (!gAuthSuccess) {
        console.info(`${TAG} ${SKIP_TAG} auth not granted, skip`);
        done();
        return;
      }
      try {
        await port!.open();
        await port1!.open();
        await sleep(100);
        await port1!.setRts(true);
        await sleep(100);
        let cts: boolean = await port!.getCts();
        console.info(`${TAG} testGetCts004 getCts after setRts(true): ${cts}`);
        expect(cts).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testGetCts004 catch err: ${JSON.stringify(error)}`);
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
      console.info(`${TAG} testGetCts005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testGetCts005 port1 is null, skip`);
        done();
        return;
      }
      if (!gAuthSuccess) {
        console.info(`${TAG} ${SKIP_TAG} auth not granted, skip`);
        done();
        return;
      }
      try {
        await port!.open();
        await port1!.open();
        await sleep(100);
        await port1!.setRts(false);
        await sleep(100);
        let cts: boolean = await port!.getCts();
        console.info(`${TAG} testGetCts005 getCts after setRts(false): ${cts}`);
        expect(cts).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} testGetCts005 catch err: ${JSON.stringify(error)}`);
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
      console.info(`${TAG} testGetDsr004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testGetDsr004 port1 is null, skip`);
        done();
        return;
      }
      if (!gAuthSuccess) {
        console.info(`${TAG} ${SKIP_TAG} auth not granted, skip`);
        done();
        return;
      }
      try {
        await port!.open();
        await port1!.open();
        await sleep(100);
        await port1!.setDtr(true);
        await sleep(100);
        let dsr: boolean = await port!.getDsr();
        console.info(`${TAG} testGetDsr004 getDsr after setDtr(true): ${dsr}`);
        expect(dsr).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDsr004 catch err: ${JSON.stringify(error)}`);
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
      console.info(`${TAG} testGetDsr005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testGetDsr005 port1 is null, skip`);
        done();
        return;
      }
      if (!gAuthSuccess) {
        console.info(`${TAG} ${SKIP_TAG} auth not granted, skip`);
        done();
        return;
      }
      try {
        await port!.open();
        await port1!.open();
        await sleep(100);
        await port!.setDtr(false);
        await sleep(100);
        let dsr: boolean = await port1!.getDsr();
        console.info(`${TAG} testGetDsr005 getDsr after setDtr(false): ${dsr}`);
        expect(dsr).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDsr005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

  })
}
