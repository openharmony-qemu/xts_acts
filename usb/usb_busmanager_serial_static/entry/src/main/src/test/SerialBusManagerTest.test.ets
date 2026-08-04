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
import serial from "@ohos.busManager.serial";
import bundleManager from '@ohos.bundle.bundleManager';
import buffer from '@ohos.buffer';

const TAG: string = "[SerialBusManagerStaticTest]";

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

async function clickAllowButton(): Promise<void> {
  console.info(`${TAG} clickAllowButton`);
  try {
    let driver: Driver = Driver.create();
    await driver.delayMs(1000);
    let buttons = await driver.findComponents(ON.text('允许', MatchPattern.EQUALS));
    if (buttons && buttons.length > 0) {
      for (let i: int = 0; i < buttons.length; i++) {
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
    if (buttons && buttons.length > 0) {
      await buttons[0].click();
    }
  } catch (error) {
    console.info(`${TAG} clickRejectButton error: ${error}`);
  }
}


async function checkDevice(): Promise<boolean> {
  try {
    let portList: serial.SerialPort[] = await serial.getSerialPortList();
    if (portList && portList.length > 0) {
      console.info(`${TAG} serial device detected`);
      return true;
    } else {
      console.info(`${TAG} no serial device detected`);
      return false;
    }
  } catch (error) {
    console.error(`${TAG} checkDevice error: ${error}`);
    return false;
  }
}

export default function SerialBusManagerTest(): void {
  describe('SerialBusManagerTest', (): void => {
    console.info(`${TAG} describe start`);
    let gPort: serial.SerialPort | null = null;
    let gPortInfo: serial.SerialPortInfo | null = null;
    let gPort1: serial.SerialPort | null = null;
    let gPortInfo1: serial.SerialPortInfo | null = null;

    beforeAll(async (): Promise<void> => {
      console.info(`${TAG} beforeAll start`);
      try {
        let portList: serial.SerialPort[] = await serial.getSerialPortList();
        if (portList && portList.length > 0) {
          gPort = portList[0];
          gPortInfo = portList[0].portInfo;
          if (portList.length > 1) {
            gPort1 = portList[1];
            gPortInfo1 = portList[1].portInfo;
          }
          console.info(`${TAG} beforeAll portInfo: ${JSON.stringify(gPortInfo)}`);
        }
      } catch (error) {
        console.info(`${TAG} beforeAll error: ${error}`);
      }
    })

    afterAll(async (): Promise<void> => {
      console.info(`${TAG} afterAll`);
      if (gPort != null) {
        try {
          await gPort?.close();
        } catch (err) {
          console.error(`${TAG} afterAll close error: ${JSON.stringify(err)}`);
        }
      }
      if (gPort1 != null) {
        try {
          await gPort1?.close();
        } catch (err) {
          console.error(`${TAG} afterAll close error: ${JSON.stringify(err)}`);
        }
      }
    })

    /**
     * @tc.name   testOpen022
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_2100
     * @tc.desc   open rejected by user clicking 不允许 - 35700007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen022 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      Promise.all([gPort!.open(), clickRejectButton()]).then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testOpen022 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700007);
        done();
      })
    })

    /**
     * @tc.name   testGetSerialPortList001
     * @tc.number SUB_BusManager_Serial_Static_getSerialPortList_Func_0100
     * @tc.desc   getSerialPortList successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testGetSerialPortList001 start`);
        try {
          let portList: serial.SerialPort[] = await serial.getSerialPortList();
          console.info(`${TAG} testGetSerialPortList001 portList length: ${portList.length}`);
          if (portList.length > 0) {
            let portInfo: serial.SerialPortInfo = portList[0].portInfo;
            console.info(`${TAG} testGetSerialPortList001 portName: ${portInfo.portName}`);
            expect(portInfo.portName != null && portInfo.portName != undefined).assertTrue();
          }
          done();
        } catch (error) {
          console.error(`${TAG} testGetSerialPortList001 catch err: ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetSerialPortList002
     * @tc.number SUB_BusManager_Serial_Static_getSerialPortList_Func_0200
     * @tc.desc   getSerialPortList returns array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSerialPortList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testGetSerialPortList002 start`);
        try {
          let portList: serial.SerialPort[] = await serial.getSerialPortList();
          console.info(`${TAG} testGetSerialPortList002 portList: ${JSON.stringify(portList)}`);
          expect(portList instanceof Array).assertTrue();
          done();
        } catch (error) {
          console.error(`${TAG} testGetSerialPortList002 catch err: ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSerialPortInfo001
     * @tc.number SUB_BusManager_Serial_Static_SerialPortInfo_Func_0100
     * @tc.desc   SerialPortInfo portName attribute test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerialPortInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testSerialPortInfo001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
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
          console.error(`${TAG} testSerialPortInfo001 catch err: ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOpen001
     * @tc.number SUB_BusManager_Serial_Static_open_Func_0100
     * @tc.desc   open successfully with default config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen001 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen002
     * @tc.number SUB_BusManager_Serial_Static_open_Func_0200
     * @tc.desc   open successfully with custom config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: serial.DataBits.EIGHT,
        stopBits: serial.StopBits.ONE,
        parity: serial.Parity.NONE
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen002 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen002 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen003
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0200
     * @tc.desc   open with invalid baudRate -1 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen003 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        baudRate: -1
      };
      const openPromise = gPort!.open(config);
      try {
        await openPromise;
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen003 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testOpen004
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0300
     * @tc.desc   open with baudRate 0 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen004 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        baudRate: 0
      };
      const openPromise = gPort!.open(config);
      try {
        await openPromise;
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen004 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      }
    })

    /**
     * @tc.name   testOpen005
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0400
     * @tc.desc   open already opened port - 35700004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen005 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.open();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testOpen005 catch err: ${error}`);
        expect(error.code).assertEqual(35700004);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen006
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0500
     * @tc.desc   open with baudRate 9600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen006 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        baudRate: 9600
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen006 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen006 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen007
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0600
     * @tc.desc   open with DataBits.FIVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen007 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.FIVE
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen007 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen007 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen008
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0700
     * @tc.desc   open with DataBits.SIX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen008 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.SIX
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen008 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen008 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen009
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0800
     * @tc.desc   open with DataBits.SEVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen009 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        dataBits: serial.DataBits.SEVEN
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen009 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen009 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen010
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_0900
     * @tc.desc   open with StopBits.ONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen010 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        stopBits: serial.StopBits.ONE
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen010 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen010 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen011
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1000
     * @tc.desc   open with StopBits.TWO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen011 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        stopBits: serial.StopBits.TWO
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen011 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen011 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen012
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1100
     * @tc.desc   open with Parity.NONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen012 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.NONE
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen012 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen012 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen013
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1200
     * @tc.desc   open with Parity.EVEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen013 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.EVEN
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen013 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen013 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen014
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1300
     * @tc.desc   open with Parity.ODD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen014 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.ODD
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen014 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen014 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen015
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1400
     * @tc.desc   open with Parity.MARK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen015 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.MARK
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen015 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen015 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen016
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1500
     * @tc.desc   open with Parity.SPACE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen016 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        parity: serial.Parity.SPACE
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen016 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen016 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen017
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1600
     * @tc.desc   open with rtscts true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen017 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        rtscts: true
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen017 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen017 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen018
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1700
     * @tc.desc   open with rtscts false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen018 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        rtscts: false
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen018 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen018 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen019
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1800
     * @tc.desc   open with xon true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen019 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        xon: true
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen019 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen019 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen020
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_1900
     * @tc.desc   open with xoff true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen020 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        xoff: true
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen020 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen020 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testOpen021
     * @tc.number SUB_BusManager_Serial_Static_open_ErrCode_2000
     * @tc.desc   open with xany true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testOpen021 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let config: serial.SerialConfigs = {
        xany: true
      };
      const openPromise = gPort!.open(config);
      await clickAllowButton();
      try {
        await openPromise;
        console.info(`${TAG} testOpen021 open success`);
        done();
      } catch (error) {
        console.error(`${TAG} testOpen021 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testClose001
     * @tc.number SUB_BusManager_Serial_Static_close_Func_0100
     * @tc.desc   close successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testClose001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.close();
        console.info(`${TAG} testClose001 close success`);
        done();
      } catch (error) {
        console.error(`${TAG} testClose001 catch err: ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testClose002
     * @tc.number SUB_BusManager_Serial_Static_close_ErrCode_0100
     * @tc.desc   close without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testClose002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.close().then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testClose002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testClose003
     * @tc.number SUB_BusManager_Serial_Static_close_ErrCode_0200
     * @tc.desc   close twice - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testClose003 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.close();
        await gPort!.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testClose003 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite001
     * @tc.number SUB_BusManager_Serial_Static_write_Func_0100
     * @tc.desc   write successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let writeLen: int = await gPort!.write(writeData, 2000);
        console.info(`${TAG} testWrite001 writeLen: ${writeLen}`);
        expect(writeLen > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite002
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0100
     * @tc.desc   write without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
      gPort!.write(writeData, 1000).then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testWrite002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testWrite003
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0200
     * @tc.desc   write with empty data - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite003 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let emptyData: Uint8Array = new Uint8Array(0);
        await gPort!.write(emptyData, 1000);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite003 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite004
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0300
     * @tc.desc   write with data length > 4096 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite004 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let largeData: Uint8Array = new Uint8Array(4097);
        await gPort!.write(largeData, 1000);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite004 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite005
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0400
     * @tc.desc   write with timeout -1 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite005 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, -1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite005 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite006
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0500
     * @tc.desc   write with timeout > 300000 - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite006 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, 300001);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite006 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700002);
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite007
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0600
     * @tc.desc   write with timeout 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite007 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLen: int = await gPort!.write(writeData, 0);
        console.info(`${TAG} testWrite007 writeLen: ${writeLen}`);
        expect(writeLen > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite007 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite008
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0700
     * @tc.desc   write with timeout boundary 300000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite008 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await sleep(500);
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        let writeLen: int = await gPort!.write(writeData, 300000);
        console.info(`${TAG} testWrite008 writeLen: ${writeLen}`);
        expect(writeLen > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testWrite008 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testWrite009
     * @tc.number SUB_BusManager_Serial_Static_write_ErrCode_0800
     * @tc.desc   write with data length 4096 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testWrite009 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      if (gPort1 != null) {
        const openPromise = gPort1!.open();
        await clickAllowButton();
        try {
          await openPromise;
          let writeData: Uint8Array = new Uint8Array(4096);
          for (let i: int = 0; i < 4096; i++) {
            writeData[i] = i % 256;
          }
          let writeLen: int = await gPort1!.write(writeData, 5000);
          console.info(`${TAG} testWrite009 writeLen: ${writeLen}`);
          expect(writeLen > 0).assertTrue();
          done();
        } catch (error) {
          console.error(`${TAG} testWrite009 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort1!.close();
        }
      } else {
        done();
      }
    })

    /**
     * @tc.name   testOnDataRead001
     * @tc.number SUB_BusManager_Serial_Static_onDataRead_Func_0100
     * @tc.desc   onDataRead register callback successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOnDataRead001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 === null) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort1!.open();
        await clickAllowButton();
        try {
          await openPromise;
          await sleep(500);
          let callbackReceived = false;
          gPort1!.onDataRead((data: Uint8Array): void => {
            console.info(`${TAG} testOnDataRead001 received data length: ${data.length}`);
            expect(data instanceof Uint8Array).assertTrue();
            callbackReceived = true;
          });
          console.info(`${TAG} testOnDataRead001 register success`);
          await gPort1!.write(new Uint8Array([0xAA]));
          await sleep(500);
          expect(callbackReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${TAG} testOnDataRead001 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort1!.offDataRead();
          gPort1!.close();
        }
      })

    /**
     * @tc.name   testOnDataRead002
     * @tc.number SUB_BusManager_Serial_Static_onDataRead_ErrCode_0100
     * @tc.desc   onDataRead without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDataRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOnDataRead002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.onDataRead((data: Uint8Array): void => {
            console.info(`${TAG} testOnDataRead002 received data length: ${data.length}`);
          });
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG} testOnDataRead002 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700005);
          done();
        }
      })

    /**
     * @tc.name   testOffDataRead001
     * @tc.number SUB_BusManager_Serial_Static_offDataRead_Func_0100
     * @tc.desc   offDataRead unregister all callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDataRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOffDataRead001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort!.open();
        await clickAllowButton();
        try {
          await openPromise;
          await sleep(500);
          let callbackReceived = false;
          gPort!.onDataRead((data: Uint8Array): void => {
            console.info(`${TAG} testOffDataRead001 received data length: ${data.length}`);
            callbackReceived = true;
          });
          await gPort!.write(new Uint8Array([0xAA]));
          await sleep(500);
          gPort!.offDataRead();
          expect(callbackReceived).assertTrue();
          console.info(`${TAG} testOffDataRead001 unregister success`);
          done();
        } catch (error) {
          console.error(`${TAG} testOffDataRead001 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testOffDataRead002
     * @tc.number SUB_BusManager_Serial_Static_offDataRead_Func_0200
     * @tc.desc   offDataRead unregister specific callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDataRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOffDataRead002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort!.open();
        await clickAllowButton();
        try {
          await openPromise;
          let callback = (data: Uint8Array): void => {
            console.info(`${TAG} testOffDataRead002 received data length: ${data.length}`);
          };
          gPort!.onDataRead(callback);
          gPort!.offDataRead(callback);
          console.info(`${TAG} testOffDataRead002 unregister specific callback success`);
          done();
        } catch (error) {
          console.error(`${TAG} testOffDataRead002 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testOffDataRead003
     * @tc.number SUB_BusManager_Serial_Static_offDataRead_ErrCode_0100
     * @tc.desc   offDataRead without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDataRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOffDataRead003 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.offDataRead();
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG} testOffDataRead003 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700005);
          done();
        }
      })

    /**
     * @tc.name   testFlush001
     * @tc.number SUB_BusManager_Serial_Static_flush_Func_0100
     * @tc.desc   flush successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testFlush001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.flush();
        console.info(`${TAG} testFlush001 flush success`);
        done();
      } catch (error) {
        console.error(`${TAG} testFlush001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testFlush002
     * @tc.number SUB_BusManager_Serial_Static_flush_ErrCode_0100
     * @tc.desc   flush without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testFlush002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.flush().then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testFlush002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testDrain001
     * @tc.number SUB_BusManager_Serial_Static_drain_Func_0100
     * @tc.desc   drain successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testDrain001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let writeData: Uint8Array = new Uint8Array(buffer.from('Hello', 'utf-8').buffer);
        await gPort!.write(writeData, 1000);
        await gPort!.drain();
        console.info(`${TAG} testDrain001 drain success`);
        done();
      } catch (error) {
        console.error(`${TAG} testDrain001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testDrain002
     * @tc.number SUB_BusManager_Serial_Static_drain_ErrCode_0100
     * @tc.desc   drain without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrain002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testDrain002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.drain().then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testDrain002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testSetRts001
     * @tc.number SUB_BusManager_Serial_Static_setRts_Func_0100
     * @tc.desc   setRts true successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetRts001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.setRts(true);
        console.info(`${TAG} testSetRts001 setRts true success`);
        done();
      } catch (error) {
        console.error(`${TAG} testSetRts001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testSetRts002
     * @tc.number SUB_BusManager_Serial_Static_setRts_Func_0200
     * @tc.desc   setRts false successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetRts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetRts002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.setRts(false);
        console.info(`${TAG} testSetRts002 setRts false success`);
        done();
      } catch (error) {
        console.error(`${TAG} testSetRts002 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testSetRts003
     * @tc.number SUB_BusManager_Serial_Static_setRts_ErrCode_0100
     * @tc.desc   setRts without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetRts003 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.setRts(true).then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testSetRts003 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testGetCts001
     * @tc.number SUB_BusManager_Serial_Static_getCts_Func_0100
     * @tc.desc   getCts successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testGetCts001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let cts: boolean = await gPort!.getCts();
        console.info(`${TAG} testGetCts001 getCts: ${cts}`);
        expect(cts === true || cts === false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testGetCts001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testGetCts002
     * @tc.number SUB_BusManager_Serial_Static_getCts_ErrCode_0100
     * @tc.desc   getCts without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testGetCts002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.getCts().then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testGetCts002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testSendBrk001
     * @tc.number SUB_BusManager_Serial_Static_sendBrk_Func_0100
     * @tc.desc   sendBrk successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendBrk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testSendBrk001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort!.open();
        await clickAllowButton();
        try {
          await openPromise;
          await gPort!.sendBrk();
          console.info(`${TAG} testSendBrk001 sendBrk success`);
          done();
        } catch (error) {
          console.error(`${TAG} testSendBrk001 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testSendBrk002
     * @tc.number SUB_BusManager_Serial_Static_sendBrk_ErrCode_0100
     * @tc.desc   sendBrk without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendBrk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testSendBrk002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        gPort!.sendBrk().then(() => {
          expect().assertFail();
          done();
        }).catch((error) => {
          console.error(`${TAG} testSendBrk002 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700005);
          done();
        });
      })

    /**
     * @tc.name   testOnDisconnect001
     * @tc.number SUB_BusManager_Serial_Static_onDisconnect_Func_0100
     * @tc.desc   onDisconnect register callback successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDisconnect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOnDisconnect001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort!.open();
        await clickAllowButton();
        try {
          await openPromise;
          gPort!.onDisconnect((): void => {
            console.info(`${TAG} testOnDisconnect001 disconnect callback triggered`);
          });
          console.info(`${TAG} testOnDisconnect001 register success`);
          await gPort!.close();
          console.info(`${TAG} testOnDisconnect001 close success`);
          done();
        } catch (error) {
          console.error(`${TAG} testOnDisconnect001 catch err: ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOnDisconnect002
     * @tc.number SUB_BusManager_Serial_Static_onDisconnect_ErrCode_0100
     * @tc.desc   onDisconnect without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDisconnect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOnDisconnect002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.onDisconnect((): void => {
            console.info(`${TAG} testOnDisconnect002 disconnect callback`);
          });
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG} testOnDisconnect002 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700005);
          done();
        }
      })

    /**
     * @tc.name   testOffDisconnect001
     * @tc.number SUB_BusManager_Serial_Static_offDisconnect_Func_0100
     * @tc.desc   offDisconnect unregister all callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffDisconnect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOffDisconnect001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        const openPromise = gPort!.open();
        await clickAllowButton();
        try {
          await openPromise;
          gPort!.onDisconnect((): void => {
            console.info(`${TAG} testOffDisconnect001 disconnect callback`);
          });
          gPort!.offDisconnect();
          console.info(`${TAG} testOffDisconnect001 unregister success`);
          done();
        } catch (error) {
          console.error(`${TAG} testOffDisconnect001 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testOffDisconnect002
     * @tc.number SUB_BusManager_Serial_Static_offDisconnect_ErrCode_0100
     * @tc.desc   offDisconnect without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDisconnect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testOffDisconnect002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        try {
          gPort!.offDisconnect();
          expect().assertFail();
          done();
        } catch (error) {
          console.error(`${TAG} testOffDisconnect002 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700005);
          done();
        };
      })

    /**
     * @tc.name   testSetDtr001
     * @tc.number SUB_BusManager_Serial_Static_setDtr_Func_0100
     * @tc.desc   setDtr true successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDtr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetDtr001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.setDtr(true);
        console.info(`${TAG} testSetDtr001 setDtr true success`);
        done();
      } catch (error) {
        console.error(`${TAG} testSetDtr001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testSetDtr002
     * @tc.number SUB_BusManager_Serial_Static_setDtr_Func_0200
     * @tc.desc   setDtr false successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDtr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetDtr002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        await gPort!.setDtr(false);
        console.info(`${TAG} testSetDtr002 setDtr false success`);
        done();
      } catch (error) {
        console.error(`${TAG} testSetDtr002 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testSetDtr003
     * @tc.number SUB_BusManager_Serial_Static_setDtr_ErrCode_0100
     * @tc.desc   setDtr without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDtr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testSetDtr003 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.setDtr(true).then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testSetDtr003 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testGetDsr001
     * @tc.number SUB_BusManager_Serial_Static_getDsr_Func_0100
     * @tc.desc   getDsr successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDsr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testGetDsr001 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      const openPromise = gPort!.open();
      await clickAllowButton();
      try {
        await openPromise;
        let dsr: boolean = await gPort!.getDsr();
        console.info(`${TAG} testGetDsr001 getDsr: ${dsr}`);
        expect(dsr === true || dsr === false).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDsr001 catch err: ${error}`);
        expect().assertFail();
        done();
      } finally {
        gPort!.close();
      }
    })

    /**
     * @tc.name   testGetDsr002
     * @tc.number SUB_BusManager_Serial_Static_getDsr_ErrCode_0100
     * @tc.desc   getDsr without open - 35700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDsr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(`${TAG} testGetDsr002 start`);
      if (await checkDevice() === false) {
        done();
        return Promise.resolve();
      }
      gPort!.getDsr().then(() => {
        expect().assertFail();
        done();
      }).catch((error) => {
        console.error(`${TAG} testGetDsr002 catch err code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(35700005);
        done();
      });
    })

    /**
     * @tc.name   testAddPortAuthorization001
     * @tc.number SUB_BusManager_Serial_Static_addPortAuthorization_ErrCode_0100
     * @tc.desc   addPortAuthorization without system permission - 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testAddPortAuthorization001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let bundleFlags: int = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenId: string = String(bundleInfo?.appInfo?.accessTokenId);
        let deviceId: string = gPortInfo!.portName;
        serial.addPortAuthorization(tokenId, deviceId).then(() => {
          expect().assertFail();
          done();
        }).catch((error) => {
          console.error(`${TAG} testAddPortAuthorization001 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(202);
          done();
        });
      })

    /**
     * @tc.name   testAddPortAuthorization002
     * @tc.number SUB_BusManager_Serial_Static_addPortAuthorization_ErrCode_0200
     * @tc.desc   addPortAuthorization with empty tokenId - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testAddPortAuthorization002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let tokenId: string = '';
        let deviceId: string = gPortInfo!.portName;
        serial.addPortAuthorization(tokenId, deviceId).then(() => {
          expect().assertFail();
          done();
        }).catch((error) => {
          console.error(`${TAG} testAddPortAuthorization002 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700002);
          done();
        });
      })

    /**
     * @tc.name   testAddPortAuthorization003
     * @tc.number SUB_BusManager_Serial_Static_addPortAuthorization_ErrCode_0300
     * @tc.desc   addPortAuthorization with empty deviceId - 35700002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddPortAuthorization003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testAddPortAuthorization003 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let bundleFlags: int = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenId: string = String(bundleInfo?.appInfo?.accessTokenId);
        let deviceId: string = '';
        serial.addPortAuthorization(tokenId, deviceId).then(() => {
          expect().assertFail();
          done();
        }).catch((error) => {
          console.error(`${TAG} testAddPortAuthorization003 catch err code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(35700002);
          done();
        });
      })

    /**
     * @tc.name   testConfigCombination001
     * @tc.number SUB_BusManager_Serial_Static_ConfigCombination_Func_0100
     * @tc.desc   open with all config parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCombination001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testConfigCombination001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
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
        const openPromise = gPort!.open(config);
        await clickAllowButton();
        try {
          await openPromise;
          console.info(`${TAG} testConfigCombination001 open success`);
          done();
        } catch (error) {
          console.error(`${TAG} testConfigCombination001 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testConfigCombination002
     * @tc.number SUB_BusManager_Serial_Static_ConfigCombination_Func_0200
     * @tc.desc   open with rtscts and xon enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCombination002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testConfigCombination002 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let config: serial.SerialConfigs = {
          baudRate: 115200,
          rtscts: true,
          xon: true
        };
        const openPromise = gPort!.open(config);
        await clickAllowButton();
        try {
          await openPromise;
          console.info(`${TAG} testConfigCombination002 open success`);
          done();
        } catch (error) {
          console.error(`${TAG} testConfigCombination002 catch err: ${error}`);
          expect().assertFail();
          done();
        } finally {
          gPort!.close();
        }
      })

    /**
     * @tc.name   testWriteTimeout001
     * @tc.number SUB_BusManager_Serial_Static_WriteTimeout_ErrCode_0100
     * @tc.desc   write with short timeout may trigger 35700006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(`${TAG} testWriteTimeout001 start`);
        if (await checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        if (gPort1 != null) {
          const openPromise = gPort1!.open();
          await clickAllowButton();
          try {
            await openPromise;
            await sleep(500);
            let largeData: Uint8Array = new Uint8Array(4096);
            for (let i: int = 0; i < 4096; i++) {
              largeData[i] = i % 256;
            }
            for (let index: int = 0; index < 100; index++) {
              await gPort1!.write(largeData, 1);
            }
            expect().assertFail();
            done();
          } catch (error) {
            console.error(`${TAG} testWriteTimeout001 catch err code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(35700006);
            done();
          } finally {
            gPort1!.close();
          }
        } else {
          done();
        }
      })
  })
}