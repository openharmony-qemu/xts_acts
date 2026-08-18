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
import { bundleManager } from "@kit.AbilityKit";
import { buffer } from '@kit.ArkTS';
import { serial, BusinessError } from "@kit.BasicServicesKit";

const TAG: string = "[SerialBusManagerTest]";
const SKIP_TAG: string = "[SKIP]";
let deviceExists: boolean = false;

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
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

async function clickRejectButton(): Promise<void> {
  console.info(`${TAG} clickRejectButton`);
  try {
    let driver: Driver = Driver.create();
    await driver.delayMs(1000);
    let buttons = await driver.findComponents(ON.text('不允许', MatchPattern.EQUALS));
    if (!buttons || buttons.length === 0) {
      buttons = await driver.findComponents(ON.text('Disallow', MatchPattern.EQUALS));
    }
    if (buttons && buttons.length > 0) {
      await buttons[0].click();
    }
  } catch (error) {
    console.info(`${TAG} clickRejectButton error: ${error}`);
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

export default function SerialBusManagerTest() {
  describe('SerialBusManagerTest', () => {
    let port: serial.SerialPort | null = null;
    let portInfo: serial.SerialPortInfo | null = null;
    let port1: serial.SerialPort | null = null;

    beforeAll(async (done: Function) => {
      console.info(`${TAG} beforeAll start`);
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        deviceExists = !!(portList && portList.length > 0);
        if (portList && portList.length > 0) {
          port = portList[0];
          portInfo = portList[0].portInfo;
          if (portList.length > 1) {
            port1 = portList[1];
          }
        }
        done();
      } catch (error) {
        console.info(`${TAG} beforeAll error: ${JSON.stringify(error)}`);
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
     * @tc.name   testOpen023
     * @tc.number SUB_BusManager_Serial_open_ErrCode_2200
     * @tc.desc   open rejected by user clicking 不允许 - 35700007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen023 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await Promise.all([port!.open(), clickRejectButton()]);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testOpen023 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700007);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   testGetSerialPortList001
     * @tc.number SUB_BusManager_Serial_JS_getSerialPortList_Func_0100
     * @tc.desc   getSerialPortList successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testGetSerialPortList001 start`);
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(`${TAG} testGetSerialPortList001 portList length: ${portList.length}`);
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(`${TAG} testGetSerialPortList001 portName: ${portInfo.portName}`);
          expect(portInfo.portName).not().assertNull();
        }
        expect(portList.length >= 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testGetSerialPortList001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSerialPortInfo001
     * @tc.number SUB_BusManager_Serial_JS_SerialPortInfo_Func_0100
     * @tc.desc   SerialPortInfo portName attribute test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerialPortInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSerialPortInfo001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(`${TAG} testSerialPortInfo001 portName: ${portInfo.portName}`);
          expect(portInfo.portName.length > 0).assertTrue();
        }
        done();
      } catch (error) {
        console.error(`${TAG} testSerialPortInfo001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen001
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0100
     * @tc.desc   open successfully with default config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen001 open success`);
      } catch (error) {
        console.error(`${TAG} testOpen001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOpen002
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0200
     * @tc.desc   open successfully with custom config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: serial.DataBits.EIGHT,
        stopBits: serial.StopBits.ONE,
        parity: serial.Parity.NONE
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen002 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen003
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0200
     * @tc.desc   open with invalid baudRate -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOpen003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: -1
        };
        await port!.open(config);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testOpen004
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0300
     * @tc.desc   open with baudRate 0 -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOpen004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: 0
        };
        await port!.open(config);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen004 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testOpen005
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0400
     * @tc.desc   open already opened port -35700004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOpen005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        await port!.open();
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testOpen005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700004);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOpen006
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0500
     * @tc.desc   open with different baudRate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen006 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        baudRate: 9600
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen006 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen007
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0300
     * @tc.desc   open with DataBits.FIVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen007 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.FIVE
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen007 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen007 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen008
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0400
     * @tc.desc   open with DataBits.SIX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen008 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.SIX
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen008 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen008 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen009
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0500
     * @tc.desc   open with DataBits.SEVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen009 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.SEVEN
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen009 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen009 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen010
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0600
     * @tc.desc   open with StopBits.ONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen010 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        stopBits: serial.StopBits.ONE
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen010 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen010 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen011
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0700
     * @tc.desc   open with StopBits.TWO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen011 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        stopBits: serial.StopBits.TWO
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen011 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen011 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen012
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0800
     * @tc.desc   open with Parity.NONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen012 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.NONE
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen012 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen012 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen013
     * @tc.number SUB_BusManager_Serial_JS_open_Func_0900
     * @tc.desc   open with Parity.EVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen013 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.EVEN
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen013 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen013 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen014
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1000
     * @tc.desc   open with Parity.ODD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen014 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.ODD
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen014 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen014 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen015
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1100
     * @tc.desc   open with Parity.MARK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen015 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.MARK
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen015 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen015 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen016
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1200
     * @tc.desc   open with Parity.SPACE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen016 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.SPACE
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen016 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen016 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen017
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1300
     * @tc.desc   open with rtscts true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen017 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        rtscts: true
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen017 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen017 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen018
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1400
     * @tc.desc   open with rtscts false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen018 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        rtscts: false
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen018 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen018 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen019
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1500
     * @tc.desc   open with xon true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen019 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        xon: true
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen019 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen019 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen020
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1600
     * @tc.desc   open with xoff true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen020 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        xoff: true
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen020 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen020 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen021
     * @tc.number SUB_BusManager_Serial_JS_open_Func_1700
     * @tc.desc   open with xany true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen021 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        xany: true
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen021 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen021 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testClose001
     * @tc.number SUB_BusManager_Serial_JS_close_Func_0100
     * @tc.desc   close successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testClose001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.close();
        console.info(`${TAG} testClose001 close success`);
        done();
      } catch (error) {
        console.error(`${TAG} testClose001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testClose002
     * @tc.number SUB_BusManager_Serial_JS_close_ErrCode_0100
     * @tc.desc   close without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClose002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testClose002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testClose003
     * @tc.number SUB_BusManager_Serial_JS_close_ErrCode_0200
     * @tc.desc   close twice -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClose003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.close();
        await port!.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testClose003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testWrite001
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0100
     * @tc.desc   write successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 2000);
        console.info(`${TAG} testWrite001 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(11);
      } catch (error) {
        console.error(`${TAG} testWrite001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite002
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0100
     * @tc.desc   write without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, 1000);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testWrite003
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0200
     * @tc.desc   write with empty data -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let emptyData: Uint8Array = new Uint8Array(0);
        await port!.write(emptyData, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite004
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0300
     * @tc.desc   write with data length > 4096 -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let largeData: Uint8Array = new Uint8Array(4097);
        await port!.write(largeData, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite004 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite005
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0400
     * @tc.desc   write with timeout -1 -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, -1);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite006
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0500
     * @tc.desc   write with timeout > 300000 -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite006 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, 300001);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite006 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite007
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0200
     * @tc.desc   write with timeout 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite007 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 0);
        console.info(`${TAG} testWrite007 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} testWrite007 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite008
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0300
     * @tc.desc   write with timeout boundary 300000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite008 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 300000);
        console.info(`${TAG} testWrite008 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} testWrite008 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite009
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0400
     * @tc.desc   write with data length 4096 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite009 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testWrite009 port1 is null, skip`);
        done();
        return;
      }
      const openPromise = port1!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(4096);
        for (let i = 0; i < 4096; i++) {
          writeData[i] = i % 256;
        }
        let writeLength: number = await port1!.write(writeData, 10000);
        console.info(`${TAG} testWrite009 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(4096);
      } catch (error) {
        console.error(`${TAG} testWrite009 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port1);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead001
     * @tc.number SUB_BusManager_Serial_JS_onDataRead_Func_0100
     * @tc.desc   onDataRead register callback successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOnDataRead001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testOnDataRead001 port1 is null, skip`);
        done();
        return;
      }
      const openPromise = port1!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        port1!.onDataRead((data: Uint8Array) => {
          console.info(`${TAG} testOnDataRead001 received data length: ${data.length}`);
        });
        console.info(`${TAG} testOnDataRead001 register success`);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port1!.write(writeData);
        port1!.offDataRead();
      } catch (error) {
        console.error(`${TAG} testOnDataRead001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port1);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead002
     * @tc.number SUB_BusManager_Serial_JS_onDataRead_ErrCode_0100
     * @tc.desc   onDataRead without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDataRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOnDataRead002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        port!.onDataRead((data: Uint8Array) => {
          console.info(`${TAG} testOnDataRead002 received data length: ${data.length}`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOnDataRead002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testOffDataRead001
     * @tc.number SUB_BusManager_Serial_JS_offDataRead_Func_0100
     * @tc.desc   offDataRead unregister all callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDataRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOffDataRead001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        port!.onDataRead((data: Uint8Array) => {
          console.info(`${TAG} testOffDataRead001 received data length: ${data.length}`);
        });
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData);
        await sleep(500);
        port!.offDataRead();
        console.info(`${TAG} testOffDataRead001 unregister success`);
      } catch (error) {
        console.error(`${TAG} testOffDataRead001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOffDataRead002
     * @tc.number SUB_BusManager_Serial_JS_offDataRead_Func_0200
     * @tc.desc   offDataRead unregister specific callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDataRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOffDataRead002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let callback = (data: Uint8Array) => {
          console.info(`${TAG} testOffDataRead002 received data length: ${data.length}`);
        };
        port!.onDataRead(callback);
        port!.offDataRead(callback);
        console.info(`${TAG} testOffDataRead002 unregister specific callback success`);
      } catch (error) {
        console.error(`${TAG} testOffDataRead002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOffDataRead003
     * @tc.number SUB_BusManager_Serial_JS_offDataRead_ErrCode_0100
     * @tc.desc   offDataRead without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDataRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOffDataRead003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        port!.offDataRead();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOffDataRead003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testFlush001
     * @tc.number SUB_BusManager_Serial_JS_flush_Func_0100
     * @tc.desc   flush successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testFlush001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.flush();
        console.info(`${TAG} testFlush001 flush success`);
      } catch (error) {
        console.error(`${TAG} testFlush001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testFlush002
     * @tc.number SUB_BusManager_Serial_JS_flush_ErrCode_0100
     * @tc.desc   flush without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testFlush002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.flush();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testFlush002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testDrain001
     * @tc.number SUB_BusManager_Serial_JS_drain_Func_0100
     * @tc.desc   drain successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testDrain001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, 1000);
        await port!.drain();
        console.info(`${TAG} testDrain001 drain success`);
      } catch (error) {
        console.error(`${TAG} testDrain001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testDrain002
     * @tc.number SUB_BusManager_Serial_JS_drain_ErrCode_0100
     * @tc.desc   drain without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrain002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testDrain002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.drain();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testDrain002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSetRts001
     * @tc.number SUB_BusManager_Serial_JS_setRts_Func_0100
     * @tc.desc   setRts true successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSetRts001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setRts(true);
        console.info(`${TAG} testSetRts001 setRts true success`);
      } catch (error) {
        console.error(`${TAG} testSetRts001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetRts002
     * @tc.number SUB_BusManager_Serial_JS_setRts_Func_0200
     * @tc.desc   setRts false successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSetRts002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setRts(false);
        console.info(`${TAG} testSetRts002 setRts false success`);
      } catch (error) {
        console.error(`${TAG} testSetRts002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetRts003
     * @tc.number SUB_BusManager_Serial_JS_setRts_ErrCode_0100
     * @tc.desc   setRts without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetRts003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.setRts(true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetRts003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSetRts004
     * @tc.number SUB_BusManager_Serial_JS_setRts_ErrCode_0200
     * @tc.desc   setRts with null - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetRts004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setRts(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testSetRts004 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetRts005
     * @tc.number SUB_BusManager_Serial_JS_setRts_ErrCode_0300
     * @tc.desc   setRts with undefined - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRts005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetRts005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setRts(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testSetRts005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testGetCts001
     * @tc.number SUB_BusManager_Serial_JS_getCts_Func_0100
     * @tc.desc   getCts successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`${TAG} testGetCts001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let cts: boolean = await port!.getCts();
        console.info(`${TAG} testGetCts001 getCts: ${cts}`);
        expect(typeof cts).assertEqual('boolean');
      } catch (error) {
        console.error(`${TAG} testGetCts001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testGetCts002
     * @tc.number SUB_BusManager_Serial_JS_getCts_ErrCode_0100
     * @tc.desc   getCts without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetCts002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.getCts();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetCts002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSendBrk001
     * @tc.number SUB_BusManager_Serial_JS_sendBrk_Func_0100
     * @tc.desc   sendBrk successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendBrk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSendBrk001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.sendBrk();
        console.info(`${TAG} testSendBrk001 sendBrk success`);
      } catch (error) {
        console.error(`${TAG} testSendBrk001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSendBrk002
     * @tc.number SUB_BusManager_Serial_JS_sendBrk_ErrCode_0100
     * @tc.desc   sendBrk without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendBrk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSendBrk002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.sendBrk();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSendBrk002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testAddPortAuthorization001
     * @tc.number SUB_BusManager_Serial_JS_addPortAuthorization_ErrCode_0100
     * @tc.desc   addPortAuthorization without system permission -202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testAddPortAuthorization001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenId: string = String(bundleInfo.appInfo.accessTokenId);
        let deviceId: string = portInfo!.portName;
        await serial.addPortAuthorization(tokenId, deviceId);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testAddPortAuthorization001 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testAddPortAuthorization002
     * @tc.number SUB_BusManager_Serial_JS_addPortAuthorization_ErrCode_0200
     * @tc.desc   addPortAuthorization with empty tokenId -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testAddPortAuthorization002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let tokenId: string = '';
        let deviceId: string = portInfo!.portName;
        await serial.addPortAuthorization(tokenId, deviceId);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testAddPortAuthorization002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testAddPortAuthorization003
     * @tc.number SUB_BusManager_Serial_JS_addPortAuthorization_ErrCode_0300
     * @tc.desc   addPortAuthorization with empty deviceId -35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testAddPortAuthorization003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenId: string = String(bundleInfo.appInfo.accessTokenId);
        let deviceId: string = '';
        await serial.addPortAuthorization(tokenId, deviceId);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testAddPortAuthorization003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testConfigCombination001
     * @tc.number SUB_BusManager_Serial_JS_ConfigCombination_Func_0100
     * @tc.desc   open with all config parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCombination001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testConfigCombination001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: serial.DataBits.EIGHT,
        stopBits: serial.StopBits.ONE,
        parity: serial.Parity.NONE,
        rtscts: false,
        xon: false,
        xoff: false,
        xany: false
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testConfigCombination001 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testConfigCombination001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testConfigCombination002
     * @tc.number SUB_BusManager_Serial_JS_ConfigCombination_Func_0200
     * @tc.desc   open with rtscts and xon enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCombination002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testConfigCombination002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        baudRate: 115200,
        rtscts: true,
        xon: true
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testConfigCombination002 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testConfigCombination002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWriteTimeout001
     * @tc.number SUB_BusManager_Serial_JS_WriteTimeout_ErrCode_0100
     * @tc.desc   write with short timeout may trigger 35700006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWriteTimeout001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testWriteTimeout001 port1 is null, skip`);
        done();
        return;
      }
      const openPromise = port1!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let largeData: Uint8Array = new Uint8Array(4096);
        for (let i = 0; i < 4096; i++) {
          largeData[i] = i % 256;
        }
        for (let index = 0; index < 100; index++) {
          await port1!.write(largeData, 1);
        }
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWriteTimeout001 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700006);
      } finally {
        try {
          await safeClose(port1);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDisconnect001
     * @tc.number SUB_BusManager_Serial_JS_onDisconnect_Func_0100
     * @tc.desc   onDisconnect register callback successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDisconnect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOnDisconnect001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let callback: () => void;
        callback = () => {
          console.info(`${TAG} testOnDisconnect001 disconnect callback triggered`);
        };
        port!.onDisconnect(callback);
        console.info(`${TAG} testOnDisconnect001 register success`);
      } catch (error) {
        console.error(`${TAG} testOnDisconnect001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDisconnect002
     * @tc.number SUB_BusManager_Serial_JS_onDisconnect_ErrCode_0100
     * @tc.desc   onDisconnect without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDisconnect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOnDisconnect002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let callback: () => void;
        callback = () => {
          console.info(`${TAG} testOnDisconnect002 disconnect callback`);
        };
        port!.onDisconnect(callback);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOnDisconnect002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testOffDisconnect001
     * @tc.number SUB_BusManager_Serial_JS_offDisconnect_Func_0100
     * @tc.desc   offDisconnect unregister all callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDisconnect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOffDisconnect001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let callback: () => void;
        callback = () => {
          console.info(`${TAG} testOffDisconnect001 disconnect callback`);
        };
        port!.onDisconnect(callback);
        port!.offDisconnect();
        console.info(`${TAG} testOffDisconnect001 unregister all success`);
      } catch (error) {
        console.error(`${TAG} testOffDisconnect001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOffDisconnect002
     * @tc.number SUB_BusManager_Serial_JS_offDisconnect_Func_0200
     * @tc.desc   offDisconnect unregister specific callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDisconnect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOffDisconnect002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let callback: () => void;
        callback = () => {
          console.info(`${TAG} testOffDisconnect002 disconnect callback`);
        };
        port!.onDisconnect(callback);
        port!.offDisconnect(callback);
        console.info(`${TAG} testOffDisconnect002 unregister specific callback success`);
      } catch (error) {
        console.error(`${TAG} testOffDisconnect002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOffDisconnect003
     * @tc.number SUB_BusManager_Serial_JS_offDisconnect_ErrCode_0100
     * @tc.desc   offDisconnect without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDisconnect003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOffDisconnect003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        port!.offDisconnect();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOffDisconnect003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSetDtr001
     * @tc.number SUB_BusManager_Serial_JS_setDtr_Func_0100
     * @tc.desc   setDtr true successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDtr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSetDtr001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setDtr(true);
        console.info(`${TAG} testSetDtr001 setDtr true success`);
      } catch (error) {
        console.error(`${TAG} testSetDtr001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetDtr002
     * @tc.number SUB_BusManager_Serial_JS_setDtr_Func_0200
     * @tc.desc   setDtr false successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDtr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSetDtr002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setDtr(false);
        console.info(`${TAG} testSetDtr002 setDtr false success`);
      } catch (error) {
        console.error(`${TAG} testSetDtr002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetDtr003
     * @tc.number SUB_BusManager_Serial_JS_setDtr_ErrCode_0100
     * @tc.desc   setDtr without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDtr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetDtr003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.setDtr(true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetDtr003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSetDtr004
     * @tc.number SUB_BusManager_Serial_JS_setDtr_ErrCode_0200
     * @tc.desc   setDtr with null - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDtr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetDtr004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setDtr(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testSetDtr004 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetDtr005
     * @tc.number SUB_BusManager_Serial_JS_setDtr_ErrCode_0300
     * @tc.desc   setDtr with undefined - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDtr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetDtr005 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.setDtr(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testSetDtr005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testGetDsr001
     * @tc.number SUB_BusManager_Serial_JS_getDsr_Func_0100
     * @tc.desc   getDsr successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDsr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`${TAG} testGetDsr001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let dsr: boolean = await port!.getDsr();
        console.info(`${TAG} testGetDsr001 getDsr: ${dsr}`);
        expect(typeof dsr).assertEqual('boolean');
      } catch (error) {
        console.error(`${TAG} testGetDsr001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testGetDsr002
     * @tc.number SUB_BusManager_Serial_JS_getDsr_ErrCode_0100
     * @tc.desc   getDsr without open -35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDsr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetDsr002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.getDsr();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDsr002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testSerialPortInfo002
     * @tc.number SUB_BusManager_Serial_JS_SerialPortInfo_Func_0200
     * @tc.desc   SerialPortInfo optional fields vendorId, productId, manufacturer, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerialPortInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testSerialPortInfo002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(`${TAG} testSerialPortInfo002 portName: ${portInfo.portName}`);
          console.info(`${TAG} testSerialPortInfo002 vendorId: ${portInfo.vendorId}`);
          console.info(`${TAG} testSerialPortInfo002 productId: ${portInfo.productId}`);
          console.info(`${TAG} testSerialPortInfo002 manufacturer: ${portInfo.manufacturer}`);
          expect(portInfo.portName).not().assertNull();
          if (portInfo.vendorId !== undefined) {
            expect(typeof portInfo.vendorId).assertEqual('number');
          }
          if (portInfo.productId !== undefined) {
            expect(typeof portInfo.productId).assertEqual('number');
          }
          if (portInfo.manufacturer !== undefined) {
            expect(typeof portInfo.manufacturer).assertEqual('string');
          }
        }
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.EIGHT,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.NONE
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testSerialPortInfo002 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testSerialPortInfo002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testDataBitsEnum001
     * @tc.number SUB_BusManager_Serial_JS_DataBits_Enum_0100
     * @tc.desc   verify DataBits.EIGHT enum value, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataBitsEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testDataBitsEnum001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        expect(serial.DataBits.EIGHT).assertEqual(8);
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.EIGHT,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.NONE
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testDataBitsEnum001 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testDataBitsEnum001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testDataBitsEnum002
     * @tc.number SUB_BusManager_Serial_JS_DataBits_Enum_0200
     * @tc.desc   verify DataBits.SIX enum value, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataBitsEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testDataBitsEnum002 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        expect(serial.DataBits.SIX).assertEqual(6);
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.SIX,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.EVEN
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testDataBitsEnum002 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testDataBitsEnum002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testDataBitsEnum003
     * @tc.number SUB_BusManager_Serial_JS_DataBits_Enum_0300
     * @tc.desc   verify DataBits.SEVEN enum value, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataBitsEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testDataBitsEnum003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        expect(serial.DataBits.SEVEN).assertEqual(7);
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.SEVEN,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.ODD
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testDataBitsEnum003 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testDataBitsEnum003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testDataBitsEnum004
     * @tc.number SUB_BusManager_Serial_JS_DataBits_Enum_0400
     * @tc.desc   verify DataBits.FIVE enum value, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataBitsEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testDataBitsEnum004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        expect(serial.DataBits.FIVE).assertEqual(5);
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.FIVE,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.MARK
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testDataBitsEnum004 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testDataBitsEnum004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testStopBitsEnum001
     * @tc.number SUB_BusManager_Serial_JS_StopBits_Enum_0100
     * @tc.desc   verify StopBits enum values, open with config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopBitsEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testStopBitsEnum001 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        expect(serial.StopBits.ONE).assertEqual(1);
        expect(serial.StopBits.TWO).assertEqual(2);
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.EIGHT,
          stopBits: serial.StopBits.TWO,
          parity: serial.Parity.SPACE
        };
        const openPromise = port!.open(config);
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testStopBitsEnum001 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testStopBitsEnum001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen022
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_2100
     * @tc.desc   open with DataBits.EIGHT standalone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOpen022 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.EIGHT
      };
      const openPromise = port!.open(config);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen022 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen022 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen024
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_2300
     * @tc.desc   open with null config - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOpen024 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        await port!.open(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen024 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testOpen025
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_2400
     * @tc.desc   open with undefined config (same as default).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testOpen025 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open(undefined);
      try {
        await clickAllowButton();
        await openPromise;
        console.info(`${TAG} testOpen025 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen025 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWrite010
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0700
     * @tc.desc   write with no timeout parameter (default).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite010 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData);
        console.info(`${TAG} testWrite010 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} testWrite010 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite011
     * @tc.number SUB_BusManager_Serial_JS_write_RETURN_0100
     * @tc.desc   write return value type is int and greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite011 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 2000);
        console.info(`${TAG} testWrite011 writeLength: ${writeLength}`);
        expect(typeof writeLength).assertEqual('number');
        expect(writeLength).assertEqual(11);
      } catch (error) {
        console.error(`${TAG} testWrite011 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite012
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0900
     * @tc.desc   write with null data - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite012 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.write(null, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite012 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite013
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1000
     * @tc.desc   write with undefined data - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite013 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await port!.write(undefined, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite013 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite014
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1100
     * @tc.desc   write with null timeout - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite014 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, null);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite014 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite015
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1200
     * @tc.desc   write with timeout 1 (min positive integer).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite015 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 1);
        console.info(`${TAG} testWrite015 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} testWrite015 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite016
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0500
     * @tc.desc   write with timeout 299999 (upper bound minus 1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testWrite016 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLength: number = await port!.write(writeData, 299999);
        console.info(`${TAG} testWrite016 writeLength: ${writeLength}`);
        expect(writeLength).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} testWrite016 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite017
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0600
     * @tc.desc   write with float timeout 1.5 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite017 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, 1.5);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite017 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(35700002);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testWrite018
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1500
     * @tc.desc   write with undefined timeout - 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testWrite018 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      const openPromise = port!.open();
      try {
        await clickAllowButton();
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port!.write(writeData, undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testWrite018 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        try {
          await safeClose(port);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead003
     * @tc.number SUB_BusManager_Serial_JS_onDataRead_RETURN_0100
     * @tc.desc   onDataRead callback data is Uint8Array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOnDataRead003 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testOnDataRead003 port1 is null, skip`);
        done();
        return;
      }
      const openPromise = port1!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        port1!.onDataRead((data: Uint8Array): void => {
          let dataStr = buffer.from(data.buffer).toString('utf-8');
          console.info(`${TAG} testOnDataRead003 received dataStr: ${dataStr}`);
          console.info(`${TAG} testOnDataRead003 received data length: ${data.length}`);
          expect(writeData.length).assertEqual(data.length);
          expect(dataStr).assertEqual('Hello');
        });
        console.info(`${TAG} testOnDataRead003 onDataRead register success`);
        await port1!.write(writeData);
        await sleep(500);
        port1!.offDataRead();
      } catch (error) {
        console.error(`${TAG} testOnDataRead003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port1);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead004
     * @tc.number SUB_BusManager_Serial_JS_onDataRead_Func_0200
     * @tc.desc   onDataRead callback triggered after write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testOnDataRead004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      if (port1 === null) {
        console.info(`${TAG} ${SKIP_TAG} testOnDataRead004 port1 is null, skip`);
        done();
        return;
      }
      const openPromise = port1!.open();
      try {
        await clickAllowButton();
        await openPromise;
        await sleep(500);
        let callbackCalled = false;
        port1!.onDataRead((data: Uint8Array): void => {
          callbackCalled = true;
          console.info(`${TAG} testOnDataRead004 callback triggered, data length: ${data.length}`);
          expect(data instanceof Uint8Array).assertTrue();
          expect(data.length).assertEqual(5);
        });
        console.info(`${TAG} testOnDataRead004 onDataRead register success`);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await port1!.write(writeData, 0);
        await sleep(1000);
        expect(callbackCalled).assertTrue();
        port1!.offDataRead();
      } catch (error) {
        console.error(`${TAG} testOnDataRead004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        try {
          await safeClose(port1);
        } catch (error) {
          console.info(`${TAG} safeClose error: ${JSON.stringify(error)}`);
        }
        done();
      }
    })

    /**
     * @tc.name   testGetSerialPortList003
     * @tc.number SUB_BusManager_Serial_JS_getSerialPortList_RETURN_0100
     * @tc.desc   getSerialPortList returns empty array when no device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testGetSerialPortList003 start`);
      try {
        const portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(`${TAG} testGetSerialPortList003 portList length: ${portList.length}`);
        expect(portList instanceof Array).assertTrue();
        expect(typeof portList.length).assertEqual('number');
        expect(portList.length >= 0).assertTrue();
        if (portList.length === 0) {
          expect(portList.length).assertEqual(0);
          console.info(`${TAG} testGetSerialPortList003 empty array coverage success`);
        } else {
          console.info(`${TAG} testGetSerialPortList003 device detected, cannot test empty case`);
        }
        done();
      } catch (error) {
        console.error(`${TAG} testGetSerialPortList003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetSerialPortList004
     * @tc.number SUB_BusManager_Serial_JS_getSerialPortList_RETURN_0200
     * @tc.desc   getSerialPortList returns non-empty array with valid SerialPort structure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testGetSerialPortList004 start`);
      if (await checkDevice() === false) {
        console.info(`${TAG} ${SKIP_TAG} no serial device, skip`);
        done();
        return;
      }
      try {
        const portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(`${TAG} testGetSerialPortList004 portList length: ${portList.length}`);
        expect(portList instanceof Array).assertTrue();
        expect(portList.length > 0).assertTrue();
        for (let i = 0; i < portList.length; i++) {
          let port: serial.SerialPort = portList[i];
          expect(port.portInfo).not().assertNull();
          let portInfo: serial.SerialPortInfo = port.portInfo;
          expect(typeof portInfo.portName).assertEqual('string');
          expect(portInfo.portName.length > 0).assertTrue();
          console.info(`${TAG} testGetSerialPortList004 port[${i}] portName: ${portInfo.portName}`);
        }
        done();
      } catch (error) {
        console.error(`${TAG} testGetSerialPortList004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
  })
}
