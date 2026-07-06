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
import { bundleManager } from "@kit.AbilityKit";
import { buffer } from '@kit.ArkTS';
import { serial } from "@kit.BasicServicesKit";

const TAG: string = "[SerialBusManagerTest]";

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

async function driveDecFn() {
  console.info('**************driveDecFn**************');
  try {
    let driver: Driver = Driver.create();
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    let button = await driver.findComponent(ON.text('不允许', MatchPattern.EQUALS));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    if (button) {
      await button.click();
    }
  } catch (err) {
    console.info(TAG, `err: ${err}`);
    return;
  }
}

async function driveFnReject(): Promise<void> {
  console.info(TAG, '**************driveFnReject**************');
  try {
    let driver: Driver = Driver.create();
    await driver.delayMs(1000);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    let buttons = await driver.findComponents(ON.text('不允许', MatchPattern.EQUALS));
    console.info(TAG, `buttons is ${JSON.stringify(buttons)}`);
    if (buttons && buttons.length > 0) {
      await buttons[0].click();
    }
  } catch (error) {
    console.info(TAG, 'driveFnReject error: ' + error);
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

export default function SerialBusManagerTest() {
  describe('SerialBusManagerTest', () => {
    let gPort: serial.SerialPort | null = null;
    let gPortInfo: serial.SerialPortInfo | null = null;
    let gPort1: serial.SerialPort | null = null;
    let gPortInfo1: serial.SerialPortInfo | null = null;

    beforeAll(async (done: Function) => {
      console.info(TAG, 'beforeAll start');
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList && portList.length > 0) {
          gPort = portList[0];
          gPortInfo = portList[0].portInfo;
          gPort1 = portList[1];
          gPortInfo1 = portList[1].portInfo;
          console.info(TAG, 'beforeAll portInfo: ', JSON.stringify(gPortInfo));
          console.info(TAG, 'beforeAll portInfo1: ', JSON.stringify(gPortInfo1));
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
    * @tc.name   testOpen023
    * @tc.number SUB_BusManager_Serial_open_ErrCode_2200
    * @tc.desc   open rejected by user clicking 不允许 - 35700007.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('testOpen023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(TAG, 'testOpen023 start');
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.open().then(async () => {
        await driveFnReject();
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(TAG, 'testOpen023 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(35700007);
        done();
      })
      await driveFnReject();
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
      console.info(TAG, 'testGetSerialPortList001 start');
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(TAG, 'testGetSerialPortList001 portList length: ', portList.length);
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(TAG, 'testGetSerialPortList001 portName: ', portInfo.portName);
          expect(portInfo.portName != null && portInfo.portName != undefined).assertTrue();
        }
        expect(portList.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, 'testGetSerialPortList001 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetSerialPortList002
     * @tc.number SUB_BusManager_Serial_JS_getSerialPortList_Func_0200
     * @tc.desc   getSerialPortList returns empty array when no device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetSerialPortList002 start');
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(TAG, 'testGetSerialPortList002 portList: ', JSON.stringify(portList));
        expect(portList instanceof Array).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, 'testGetSerialPortList002 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testSerialPortInfo001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(TAG, 'testSerialPortInfo001 portName: ', portInfo.portName);
          expect(portInfo.portName.length > 0).assertTrue();
        }
        done();
      } catch (err) {
        console.error(TAG, 'testSerialPortInfo001 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testOpen001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await sleep(500);
        await driveFn();
        console.info(TAG, 'testOpen001 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOpen002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          dataBits: serial.DataBits.EIGHT,
          stopBits: serial.StopBits.ONE,
          parity: serial.Parity.NONE
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen002 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen002 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testOpen003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: -1
        };
        gPort!.open(config);
        await driveFn();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOpen003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
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
      console.info(TAG, 'testOpen004 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: 0
        };
        gPort!.open(config);
        await driveFn();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOpen004 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
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
      console.info(TAG, 'testOpen005 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        await gPort!.open();
        await driveFn();
        await sleep(500);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOpen005 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700004);
        await gPort!.close();
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
      console.info(TAG, 'testOpen006 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          baudRate: 9600
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen006 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen006 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen007
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0600
     * @tc.desc   open with DataBits.FIVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen007 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          dataBits: serial.DataBits.FIVE
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen007 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen007 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen008
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0700
     * @tc.desc   open with DataBits.SIX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen008 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          dataBits: serial.DataBits.SIX
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen008 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen008 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen009
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0800
     * @tc.desc   open with DataBits.SEVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen009 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          dataBits: serial.DataBits.SEVEN
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen009 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen009 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen010
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_0900
     * @tc.desc   open with StopBits.ONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen010 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          stopBits: serial.StopBits.ONE
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen010 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen010 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen011
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1000
     * @tc.desc   open with StopBits.TWO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen011 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          stopBits: serial.StopBits.TWO
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen011 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen011 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen012
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1100
     * @tc.desc   open with Parity.NONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen012 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          parity: serial.Parity.NONE
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen012 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen012 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen013
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1200
     * @tc.desc   open with Parity.EVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen013 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          parity: serial.Parity.EVEN
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen013 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen013 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen014
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1300
     * @tc.desc   open with Parity.ODD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen014 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          parity: serial.Parity.ODD
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen014 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen014 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen015
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1400
     * @tc.desc   open with Parity.MARK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen015 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          parity: serial.Parity.MARK
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen015 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen015 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen016
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1500
     * @tc.desc   open with Parity.SPACE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen016 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {

        let config: serial.SerialConfigs = {
          parity: serial.Parity.SPACE
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen016 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen016 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen017
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1600
     * @tc.desc   open with rtscts true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen017 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          rtscts: true
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen017 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen017 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen018
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1700
     * @tc.desc   open with rtscts false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen018 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          rtscts: false
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen018 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen018 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen019
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1800
     * @tc.desc   open with xon true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen019 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          xon: true
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen019 open success');
        expect().assertEqual(undefined);
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen019 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen020
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_1900
     * @tc.desc   open with xoff true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen020 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          xoff: true
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen020 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen020 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testOpen021
     * @tc.number SUB_BusManager_Serial_JS_open_ErrCode_2000
     * @tc.desc   open with xany true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testOpen021 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          xany: true
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen021 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen021 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testClose001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.close();
        console.info(TAG, 'testClose001 close success');
        done();
      } catch (err) {
        console.error(TAG, 'testClose001 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testClose002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.close();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testClose002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testClose003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.close();
        await gPort!.close();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testClose003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testWrite001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let writeLen: number = await gPort!.write(writeData, 2000);
        console.info(TAG, 'testWrite001 writeLen: ', writeLen);
        expect(writeLen >= 0).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testWrite002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, 1000);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testWrite003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let emptyData: Uint8Array = new Uint8Array(0);
        await gPort!.write(emptyData, 1000);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
        await gPort!.close();
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
      console.info(TAG, 'testWrite004 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let largeData: Uint8Array = new Uint8Array(4097);
        await gPort!.write(largeData, 1000);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite004 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
        await gPort!.close();
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
      console.info(TAG, 'testWrite005 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, -1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite005 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
        await gPort!.close();
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
      console.info(TAG, 'testWrite006 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, 300001);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite006 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
        await gPort!.close();
        done();
      }
    })

    /**
     * @tc.name   testWrite007
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0600
     * @tc.desc   write with timeout 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite007 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLen: number = await gPort!.write(writeData, 0);
        console.info(TAG, 'testWrite007 writeLen: ', writeLen);
        expect(writeLen >= 0).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite007 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWrite008
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0700
     * @tc.desc   write with timeout boundary 300000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite008 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLen: number = await gPort!.write(writeData, 300000);
        console.info(TAG, 'testWrite008 writeLen: ', writeLen);
        expect(writeLen >= 0).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite008 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWrite009
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0800
     * @tc.desc   write with data length 4096 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite009 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort1!.open();
        await sleep(500);
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(4096);
        for (let i = 0; i < 4096; i++) {
          writeData[i] = i % 256;
        }
        let writeLen: number = await gPort1!.write(writeData, 5000);
        console.info(TAG, 'testWrite009 writeLen: ', writeLen);
        expect(writeLen >= 0).assertTrue();
        await gPort1!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite009 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOnDataRead001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort1!.open();
        await driveFn();
        await sleep(500);
        gPort1!.onDataRead((data: Uint8Array) => {
          console.info(TAG, 'testOnDataRead001 received data length: ', data.length);
        });
        console.info(TAG, 'testOnDataRead001 register success');
        await gPort1!.write(new Uint8Array([0xAA]));
        gPort1!.offDataRead();
        await gPort1!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOnDataRead001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOnDataRead002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.onDataRead((data: Uint8Array) => {
          console.info(TAG, 'testOnDataRead002 received data length: ', data.length);
        });
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOnDataRead002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testOffDataRead001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        gPort!.onDataRead((data: Uint8Array) => {
          console.info(TAG, 'testOffDataRead001 received data length: ', data.length);
        });
        await gPort!.write(new Uint8Array([0xAA]));
        await sleep(500);
        gPort!.offDataRead();
        console.info(TAG, 'testOffDataRead001 unregister success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOffDataRead001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOffDataRead002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        let callback = (data: Uint8Array) => {
          console.info(TAG, 'testOffDataRead002 received data length: ', data.length);
        };
        gPort!.onDataRead(callback);
        gPort!.offDataRead(callback);
        console.info(TAG, 'testOffDataRead002 unregister specific callback success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOffDataRead002 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOffDataRead003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.offDataRead();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOffDataRead003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testFlush001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.flush();
        console.info(TAG, 'testFlush001 flush success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testFlush001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testFlush002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.flush();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testFlush002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testDrain001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, 1000);
        await gPort!.drain();
        console.info(TAG, 'testDrain001 drain success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testDrain001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testDrain002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.drain();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testDrain002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testSetRts001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.setRts(false);
        console.info(TAG, 'testSetRts001 setRts true success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSetRts001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testSetRts002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.setRts(false);
        console.info(TAG, 'testSetRts002 setRts false success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSetRts002 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testSetRts003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.setRts(true);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testSetRts003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testGetCts001
     * @tc.number SUB_BusManager_Serial_JS_getCts_Func_0100
     * @tc.desc   getCts successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetCts001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await driveFn();
        await gPort!.open();
        let cts: boolean = await gPort!.getCts();
        console.info(TAG, 'testGetCts001 getCts: ', cts);
        expect(cts === true || cts === false).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetCts001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testGetCts002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.getCts();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testGetCts002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testSendBrk001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.sendBrk();
        console.info(TAG, 'testSendBrk001 sendBrk success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSendBrk001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testSendBrk002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.sendBrk();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testSendBrk002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testAddPortAuthorization001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenId: string = String(bundleInfo.appInfo.accessTokenId);
        let deviceId: string = gPortInfo!.portName;
        await serial.addPortAuthorization(tokenId, deviceId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testAddPortAuthorization001 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(202);
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
      console.info(TAG, 'testAddPortAuthorization002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let tokenId: string = '';
        let deviceId: string = gPortInfo!.portName;
        await serial.addPortAuthorization(tokenId, deviceId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testAddPortAuthorization002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
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
      console.info(TAG, 'testAddPortAuthorization003 start');
      if (await checkDevice() === false) {
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
      } catch (err) {
        console.error(TAG, 'testAddPortAuthorization003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700002);
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
      console.info(TAG, 'testConfigCombination001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testConfigCombination001 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testConfigCombination001 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testConfigCombination002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {

        let config: serial.SerialConfigs = {
          baudRate: 115200,
          rtscts: true,
          xon: true
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testConfigCombination002 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testConfigCombination002 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testWriteTimeout001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort1!.open();
        await sleep(500);
        await driveFn();
        let largeData: Uint8Array = new Uint8Array(4096);
        for (let i = 0; i < 4096; i++) {
          largeData[i] = i % 256;
        }
        for (let index = 0; index < 100; index++) {
          await gPort1!.write(largeData, 1);
        }
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWriteTimeout001 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700006);
        await gPort1!.close();
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
      console.info(TAG, 'testOnDisconnect001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        gPort!.onDisconnect(() => {
          console.info(TAG, 'testOnDisconnect001 disconnect callback triggered');
        });
        console.info(TAG, 'testOnDisconnect001 register success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOnDisconnect001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOnDisconnect002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.onDisconnect(() => {
          console.info(TAG, 'testOnDisconnect002 disconnect callback');
        });
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOnDisconnect002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testOffDisconnect001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        gPort!.onDisconnect(() => {
          console.info(TAG, 'testOffDisconnect001 disconnect callback');
        });
        gPort!.offDisconnect();
        console.info(TAG, 'testOffDisconnect001 unregister all success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOffDisconnect001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOffDisconnect002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await sleep(500);
        let callback = () => {
          console.info(TAG, 'testOffDisconnect002 disconnect callback');
        };
        gPort!.onDisconnect(callback);
        gPort!.offDisconnect(callback);
        console.info(TAG, 'testOffDisconnect002 unregister specific callback success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOffDisconnect002 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testOffDisconnect003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.offDisconnect();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOffDisconnect003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testSetDtr001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.setDtr(true);
        console.info(TAG, 'testSetDtr001 setDtr true success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSetDtr001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testSetDtr002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.setDtr(false);
        console.info(TAG, 'testSetDtr002 setDtr false success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSetDtr002 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testSetDtr003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.setDtr(true);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testSetDtr003 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
        done();
      }
    })

    /**
     * @tc.name   testGetDsr001
     * @tc.number SUB_BusManager_Serial_JS_getDsr_Func_0100
     * @tc.desc   getDsr successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetDsr001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let dsr: boolean = await gPort!.getDsr();
        console.info(TAG, 'testGetDsr001 getDsr: ', dsr);
        expect(dsr === true || dsr === false).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetDsr001 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testGetDsr002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        await gPort!.getDsr();
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testGetDsr002 catch err: ', JSON.stringify(err));
        expect(err.code).assertEqual(35700005);
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
      console.info(TAG, 'testSerialPortInfo002 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList.length > 0) {
          let portInfo: serial.SerialPortInfo = portList[0].portInfo;
          console.info(TAG, 'testSerialPortInfo002 portName: ', portInfo.portName);
          console.info(TAG, 'testSerialPortInfo002 vendorId: ', portInfo.vendorId);
          console.info(TAG, 'testSerialPortInfo002 productId: ', portInfo.productId);
          console.info(TAG, 'testSerialPortInfo002 manufacturer: ', portInfo.manufacturer);
          expect(portInfo.portName !== null && portInfo.portName !== undefined).assertTrue();
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testSerialPortInfo002 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testSerialPortInfo002 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testDataBitsEnum001 start');
      if (await checkDevice() === false) {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testDataBitsEnum001 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testDataBitsEnum001 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testDataBitsEnum002 start');
      if (await checkDevice() === false) {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testDataBitsEnum002 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testDataBitsEnum002 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testDataBitsEnum003 start');
      if (await checkDevice() === false) {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testDataBitsEnum003 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testDataBitsEnum003 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testDataBitsEnum004 start');
      if (await checkDevice() === false) {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testDataBitsEnum004 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testDataBitsEnum004 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testStopBitsEnum001 start');
      if (await checkDevice() === false) {
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
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testStopBitsEnum001 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testStopBitsEnum001 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testOpen022 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        let config: serial.SerialConfigs = {
          dataBits: serial.DataBits.EIGHT
        };
        gPort!.open(config);
        await driveFn();
        console.info(TAG, 'testOpen022 open success');
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOpen022 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWrite010
     * @tc.number SUB_BusManager_Serial_JS_write_Func_0200
     * @tc.desc   write with no timeout parameter (default).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite010 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLen: number = await gPort!.write(writeData);
        console.info(TAG, 'testWrite010 writeLen: ', writeLen);
        expect(writeLen >= 0).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite010 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testWrite011 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let writeLen: number = await gPort!.write(writeData, 2000);
        console.info(TAG, 'testWrite011 writeLen: ', writeLen);
        expect(typeof writeLen === 'number').assertTrue();
        expect(writeLen > 0).assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testWrite011 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWrite012
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_0900
     * @tc.desc   write with null data - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWrite012 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.write(null as any, 1000);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite012 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(401);
        await gPort!.close();
        done();
      }
    })

    /**
     * @tc.name   testWrite013
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1000
     * @tc.desc   write with undefined data - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWrite013 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        await gPort!.write(undefined as any, 1000);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite013 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(401);
        await gPort!.close();
        done();
      }
    })

    /**
     * @tc.name   testWrite014
     * @tc.number SUB_BusManager_Serial_JS_write_ErrCode_1100
     * @tc.desc   write with null timeout - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWrite014 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, null as any);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testWrite014 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(401);
        await gPort!.close();
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
      console.info(TAG, 'testOnDataRead003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      if (gPort1 === null) {
        console.info(TAG, 'testOnDataRead003 gPort1 is null, skip');
        done();
        return;
      }
      try {
        gPort1!.open();
        await driveFn();
        await sleep(500);
        gPort1!.onDataRead((data: Uint8Array): void => {
          console.info(TAG, 'testOnDataRead003 received data length: ', data.length);
          expect(data instanceof Uint8Array).assertTrue();
          expect(typeof data === 'object').assertTrue();
        });
        console.info(TAG, 'testOnDataRead003 onDataRead register success');
        await gPort1!.write(new Uint8Array([0xAA]));
        await sleep(500);
        gPort1!.offDataRead();
        await gPort1!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testOnDataRead003 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetCts003
     * @tc.number SUB_BusManager_Serial_JS_getCts_RETURN_0100
     * @tc.desc   getCts return value type is boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetCts003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let cts: boolean = await gPort!.getCts();
        console.info(TAG, 'testGetCts003 getCts: ', cts);
        expect(typeof cts === 'boolean').assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetCts003 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetDsr003
     * @tc.number SUB_BusManager_Serial_JS_getDsr_RETURN_0100
     * @tc.desc   getDsr return value type is boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testGetDsr003 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        gPort!.open();
        await driveFn();
        let dsr: boolean = await gPort!.getDsr();
        console.info(TAG, 'testGetDsr003 getDsr: ', dsr);
        expect(typeof dsr === 'boolean').assertTrue();
        await gPort!.close();
        done();
      } catch (err) {
        console.error(TAG, 'testGetDsr003 catch err: ', JSON.stringify(err));
        expect().assertFail();
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
      console.info(TAG, 'testGetSerialPortList003 start');
      try {
        const portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(TAG, 'testGetSerialPortList003 portList length: ', portList.length);
        expect(portList instanceof Array).assertTrue();
        expect(typeof portList.length === 'number').assertTrue();
        expect(portList.length >= 0).assertTrue();
        if (portList.length === 0) {
          expect(portList.length).assertEqual(0);
          console.info(TAG, 'testGetSerialPortList003 empty array coverage success');
        } else {
          console.info(TAG, 'testGetSerialPortList003 device detected, cannot test empty case');
        }
        done();
      } catch (err) {
        console.error(TAG, 'testGetSerialPortList003 catch err: ', JSON.stringify(err));
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
      console.info(TAG, 'testGetSerialPortList004 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      try {
        const portList: serial.SerialPort[] = await serial.getSerialPortList();
        console.info(TAG, 'testGetSerialPortList004 portList length: ', portList.length);
        expect(portList instanceof Array).assertTrue();
        expect(portList.length > 0).assertTrue();
        for (let i = 0; i < portList.length; i++) {
          let port: serial.SerialPort = portList[i];
          expect(port.portInfo != null).assertTrue();
          expect(port.portInfo != undefined).assertTrue();
          let portInfo: serial.SerialPortInfo = port.portInfo;
          expect(typeof portInfo.portName === 'string').assertTrue();
          expect(portInfo.portName.length > 0).assertTrue();
          console.info(TAG, 'testGetSerialPortList004 port[', i, '] portName: ', portInfo.portName);
        }
        done();
      } catch (err) {
        console.error(TAG, 'testGetSerialPortList004 catch err: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}