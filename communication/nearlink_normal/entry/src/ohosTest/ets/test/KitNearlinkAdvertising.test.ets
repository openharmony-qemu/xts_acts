/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import manager from '@ohos.nearlink.manager';
import advertising from '@ohos.nearlink.advertising';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';

let UUID_UPP_Available = "37bea880-fc70-11ea-b720-000000001234";
let UUID_LOW_Available = "a1b2c3d4-e5f6-7890-abcd-ef1234567890";
let UUID_Invailable = "";
let UUID_Invailable1 = "37BEA880-FC70-11EA-B720-0000000000011";
let UUID_Invailable2 = "37bea880-fc70-11ea-b720000000000001";
let MANUFACTURER_ID = 4567;
let MANUFACTURER_ID_OUT = 65536;
let INTERVAL_MIN = 160;
let INTERVAL_Max = 16777215;
let INTERVAL_Mid = 16777;
let INTERVAL_MIN_ADD = 159;
let INTERVAL_Max_ADD = 16777216;
let TIME_SLEEP = 2000;
let manufacturerDataBuffer = new Uint8Array(4);
manufacturerDataBuffer[0] = 1;
manufacturerDataBuffer[1] = 2;
manufacturerDataBuffer[2] = 3;
manufacturerDataBuffer[3] = 4;
let serviceDataBuffer = new Uint8Array(4);
serviceDataBuffer[0] = 4;
serviceDataBuffer[1] = 6;
serviceDataBuffer[2] = 7;
serviceDataBuffer[3] = 8;

let manufacturerData: advertising.ManufacturerData = {
  manufacturerId:MANUFACTURER_ID,
  manufacturerData:manufacturerDataBuffer.buffer
};
let manufacturerData_out: advertising.ManufacturerData = {
  manufacturerId:MANUFACTURER_ID_OUT,
  manufacturerData:manufacturerDataBuffer.buffer
};
let serviceData: advertising.ServiceData = {
  serviceUuid:UUID_UPP_Available,
  serviceData:serviceDataBuffer.buffer
};
let serviceData_Available: advertising.ServiceData = {
  serviceUuid:UUID_LOW_Available,
  serviceData:serviceDataBuffer.buffer
};
let serviceData_invailable1: advertising.ServiceData = {
  serviceUuid:UUID_Invailable,
  serviceData:serviceDataBuffer.buffer
};
let serviceData_invailable2: advertising.ServiceData = {
  serviceUuid:UUID_Invailable1,
  serviceData:serviceDataBuffer.buffer
};
let serviceData_invailable3: advertising.ServiceData = {
  serviceUuid:UUID_Invailable2,
  serviceData:serviceDataBuffer.buffer
};
let startadvertising_start_state = -1;
let onReceiveEvent =(changeInfo: advertising.AdvertisingStateChangeInfo) => {
  console.info('[Nearlink Test]Callback advertising changeInfo = ' + JSON.stringify(changeInfo));
  console.info('[Nearlink Test]Callback advertising advertisingId = ' + JSON.stringify(changeInfo.advertisingId));
  console.info('[Nearlink Test]Callback advertising state = ' + JSON.stringify(changeInfo.state));
  startadvertising_start_state = changeInfo.state;
  expect(typeof changeInfo.advertisingId).assertEqual('number');
  expect(changeInfo.state === advertising.AdvertisingState.STARTED || changeInfo.state === advertising.AdvertisingState.STOPPED).assertTrue();
}
export default function advertisingTest() {
  describe('advertisingTest', () => {
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await clickRequestPermission();
      await sleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      console.info('beforeAll end');
      done();
    });
    beforeEach(async (done:Function) => {
      console.info('beforeEach start');
      await openNearLink();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0100
     * @tc.desc TxPowerMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let ADV_TX_POWER_LOW: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_LOW;
          console.info(`${caseName} ADV_TX_POWER_LOW result:` + ADV_TX_POWER_LOW);
          expect(ADV_TX_POWER_LOW).assertEqual(1);
          let ADV_TX_POWER_MEDIUM: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_MEDIUM;
          console.info(`${caseName} ADV_TX_POWER_MEDIUM result:` + ADV_TX_POWER_MEDIUM);
          expect(ADV_TX_POWER_MEDIUM).assertEqual(2);
          let ADV_TX_POWER_HIGH: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_HIGH;
          console.info(`${caseName} ADV_TX_POWER_HIGH result:` + ADV_TX_POWER_HIGH);
          expect(ADV_TX_POWER_HIGH).assertEqual(3);
        } catch (error) {
          console.info(`${caseName} TxPowerMode error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0200
     * @tc.desc AdvertisingState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0200';
      console.info(`${caseName} test start`);
      try {
        let STARTED: advertising.AdvertisingState = advertising.AdvertisingState.STARTED;
        console.info(`${caseName} STARTED result:` + STARTED);
        expect(STARTED).assertEqual(1);
        let STOPPED: advertising.AdvertisingState = advertising.AdvertisingState.STOPPED;
        console.info(`${caseName} STOPPED result:` + STOPPED);
        expect(STOPPED).assertEqual(2);
      } catch (error) {
        console.info(`${caseName} AdvertisingState error.code` + error.code + `,errMessage:` + error.message);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0100
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0100';
      console.info(`${caseName} test start`);
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        advertising.offAdvertisingStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0200
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0200';
      console.info(`${caseName} test start`);
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        advertising.offAdvertisingStateChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0300
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0300';
      console.info(`${caseName} test start`);
      try {
        advertising.onAdvertisingStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0400
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0400';
      console.info(`${caseName} test start`);
      try {
        advertising.offAdvertisingStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0500
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0500';
      console.info(`${caseName} test start`);
      try {
        advertising.onAdvertisingStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0600
     * @tc.desc offAdvertisingStateChange input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_0600';
      console.info(`${caseName} test start`);
      try {
        advertising.offAdvertisingStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_0100
     * @tc.desc 正常场景 监听正常触发
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_0100';
      console.info(`${caseName} test start`);
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_MIN,
        power:advertising.TxPowerMode.ADV_TX_POWER_MEDIUM,
        isConnectable:true
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_UPP_Available],
        manufacturerData:[manufacturerData],
        serviceData:[serviceData],
        includeDeviceName:false
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        console.info('[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('number');
        for(let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            console.info('[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            console.info('[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await sleep(100);
            console.info('[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange(onReceiveEvent);
        console.info('[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_0200
     * @tc.desc Check the return value of the interface (by Promise)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await advertising.startAdvertising(undefined);
        console.info('nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        console.info("nearLink advertising errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_0300
     * @tc.desc Check the return value of the interface (by Promise)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await advertising.startAdvertising(null);
        console.info('nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        console.info("nearLink advertising errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_0400
     * @tc.desc Check the return value of the interface (by Promise)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await advertising.stopAdvertising(null);
        console.info('nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        console.info("nearLink advertising errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_0500
     * @tc.desc Check the return value of the interface (by Promise)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await advertising.stopAdvertising(undefined);
        console.info('nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        console.info("nearLink advertising errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0100
     * @tc.desc 正常场景 监听正常触发--参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0100';
      console.info(`${caseName} test start`);
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_Max,
        power:advertising.TxPowerMode.ADV_TX_POWER_LOW,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_LOW_Available],
        manufacturerData:[manufacturerData],
        serviceData:[serviceData_Available],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        console.info('[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('number');
        for(let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            console.info('[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            console.info('[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await sleep(100);
            console.info('[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        console.info('[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0200
     * @tc.desc 正常场景 监听正常触发  advertisingParams入参为空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0200';
      console.info(`${caseName} test start`);
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: {},
        advertisingData: {}
      }
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        console.info('[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('number');
        for(let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            console.info('[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            console.info('[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await sleep(100);
            console.info('[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        console.info('[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0300
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_Mid,
        power:advertising.TxPowerMode.ADV_TX_POWER_HIGH,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_Invailable],
        manufacturerData:[manufacturerData],
        serviceData:[serviceData_invailable1],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0400
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_MIN,
        power:advertising.TxPowerMode.ADV_TX_POWER_HIGH,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_Invailable1],
        manufacturerData:[manufacturerData],
        serviceData:[serviceData_invailable2],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0500
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_MIN,
        power:advertising.TxPowerMode.ADV_TX_POWER_HIGH,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_Invailable2],
        manufacturerData:[manufacturerData],
        serviceData:[serviceData_invailable3],
        includeDeviceName:false
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0600
     * @tc.desc  参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0600';
      console.info(`${caseName} test start`);
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_MIN,
        power:advertising.TxPowerMode.ADV_TX_POWER_LOW,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[],
        manufacturerData:[],
        serviceData:[],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        console.info('[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('number');
        for(let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            console.info('[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            console.info('[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await sleep(100);
            console.info('[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        console.info('[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0700
     * @tc.desc  36100040 - Integer out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0700';
      console.info(`${caseName} test start`);
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_MIN_ADD,
        power:advertising.TxPowerMode.ADV_TX_POWER_LOW,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_UPP_Available,UUID_LOW_Available],
        manufacturerData:[manufacturerData,manufacturerData_out],
        serviceData:[serviceData, serviceData_Available],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0900
     * @tc.desc  36100040 - Integer out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0900';
      console.info(`${caseName} test start`);
      let advertisingSettings: advertising.AdvertisingSettings = {
        interval:INTERVAL_Max_ADD,
        power:advertising.TxPowerMode.ADV_TX_POWER_LOW,
        isConnectable:false
      };
      let advertisingData: advertising.AdvertisingData = {
        serviceUuids:[UUID_UPP_Available,UUID_LOW_Available],
        manufacturerData:[manufacturerData,manufacturerData_out],
        serviceData:[serviceData, serviceData_Available],
        includeDeviceName:true
      };
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: advertisingSettings,
        advertisingData: advertisingData
      };
      try {
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        console.info('[Nearlink Test] startAdvertising promise result out:' + JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        console.info("[Nearlink Test] advertising 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0800
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0800
     * @tc.desc 36100040 - Invalid advertising ID.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try {
        await advertising.stopAdvertising(-1);
        console.info('nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        console.info("nearLink advertising errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    });
  })
}