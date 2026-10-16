'use static'
/**
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import manager from '@ohos.nearlink.manager';
import advertising from '@ohos.nearlink.advertising';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let g_context: common.UIAbilityContext;

const UUID_UPP_Available = "37bea880-fc70-11ea-b720-000000001234";
const UUID_LOW_Available = "a1b2c3d4-e5f6-7890-abcd-ef1234567890";
const UUID_Invailable = "";
const UUID_Invailable1 = "37BEA880-FC70-11EA-B720-0000000000011";
const UUID_Invailable2 = "37bea880-fc70-11ea-b720000000000001";
const MANUFACTURER_ID = 4567;
const MANUFACTURER_ID_OUT = 65536;
const INTERVAL_MIN = 160;
const INTERVAL_Max = 16777215;
const INTERVAL_Mid = 16777;
const INTERVAL_MIN_ADD = 159;
const INTERVAL_Max_ADD = 16777216;
const TIME_SLEEP = 2000;

let manufacturerDataBufferTemp = new ArrayBuffer(4);
let manufacturerDataBuffer = new DataView(manufacturerDataBufferTemp);
manufacturerDataBuffer.setUint8(0, 4);
manufacturerDataBuffer.setUint8(1, 6);
manufacturerDataBuffer.setUint8(2, 7);
manufacturerDataBuffer.setUint8(3, 8);

let serviceDataBufferTemp = new ArrayBuffer(4);
let serviceDataBuffer = new DataView(serviceDataBufferTemp);
serviceDataBuffer.setUint8(0, 4);
serviceDataBuffer.setUint8(1, 6);
serviceDataBuffer.setUint8(2, 7);
serviceDataBuffer.setUint8(3, 8);


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

  hilog.info(0x0000, 'testTag', '[Nearlink Test]Callback advertising changeInfo = %{public}s', JSON.stringify(changeInfo));
  hilog.info(0x0000, 'testTag', '[Nearlink Test]Callback advertising advertisingId = %{public}s', JSON.stringify(changeInfo.advertisingId));
  hilog.info(0x0000, 'testTag', '[Nearlink Test]Callback advertising state = %{public}s', JSON.stringify(changeInfo.state));

  expect(typeof changeInfo.advertisingId).assertEqual('int');
  startadvertising_start_state = changeInfo.state;
  hilog.info(0x0000, 'testTag', '[Nearlink Test]startadvertising_start_state = %{public}s', JSON.stringify(startadvertising_start_state));
  expect(changeInfo.state === advertising.AdvertisingState.STARTED || changeInfo.state === advertising.AdvertisingState.STOPPED).assertTrue();
}
export default function advertisingTest(): void {
  describe('advertisingTest', () => {
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      let cmd = "aa start -a EntryAbility -b ohos.acts.communication.nearlink.normal.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      hilog.info(domain, tag, 'user:'+ JSON.stringify(user));
      if(user !== undefined){
        cmd += ' -u ' + user;
      }
      try {
        await abilityDelegator.executeShellCommand(cmd);
      } catch (error) {
        let e = error as BusinessError;
        hilog.error(0x0000, 'testTag', 'executeShellCommand failed: %{public}s', e.message);
      }
      await Utils.msSleep(2000);
      g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'get UIAbilityContext end');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.ACCESS_NEARLINK')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err) {
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.clickRequestPermission();
      await Utils.msSleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.openNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll');
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0100
     * @tc.desc TxPowerMode enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let ADV_TX_POWER_LOW: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_LOW;
          hilog.info(0x0000, 'testTag', '%{public}s ADV_TX_POWER_LOW result: %{public}d', caseName, ADV_TX_POWER_LOW);
          expect(ADV_TX_POWER_LOW).assertEqual(1);
          let ADV_TX_POWER_MEDIUM: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_MEDIUM;
          hilog.info(0x0000, 'testTag', '%{public}s ADV_TX_POWER_MEDIUM result: %{public}d', caseName, ADV_TX_POWER_MEDIUM);
          expect(ADV_TX_POWER_MEDIUM).assertEqual(2);
          let ADV_TX_POWER_HIGH: advertising.TxPowerMode = advertising.TxPowerMode.ADV_TX_POWER_HIGH;
          hilog.info(0x0000, 'testTag', '%{public}s ADV_TX_POWER_HIGH result: %{public}d', caseName, ADV_TX_POWER_HIGH);
          expect(ADV_TX_POWER_HIGH).assertEqual(3);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s TxPowerMode error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_Enum_0200
     * @tc.desc AdvertisingState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_Enum_static_0200';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let STARTED: advertising.AdvertisingState = advertising.AdvertisingState.STARTED;
          hilog.info(0x0000, 'testTag', '%{public}s STARTED result: %{public}d', caseName, STARTED);
          expect(STARTED).assertEqual(1);
          let STOPPED: advertising.AdvertisingState = advertising.AdvertisingState.STOPPED;
          hilog.info(0x0000, 'testTag', '%{public}s STOPPED result: %{public}d', caseName, STOPPED);
          expect(STOPPED).assertEqual(2);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s AdvertisingState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0100
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        advertising.offAdvertisingStateChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ON_0200
     * @tc.desc 不触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ON_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        advertising.offAdvertisingStateChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_static_0100
     * @tc.desc 正常场景 监听正常触发
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
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
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('int');
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STOPPED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising stopAdvertising');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange(onReceiveEvent);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0100
     * @tc.desc 正常场景 监听正常触发--参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
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
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('int');
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STOPPED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising stopAdvertising');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0200
     * @tc.desc 正常场景 监听正常触发  advertisingParams入参为空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let advertisingParams: advertising.AdvertisingParams = {
        advertisingSettings: {},
        advertisingData: {}
      }
      try {
        advertising.onAdvertisingStateChange(onReceiveEvent);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('int');
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STOPPED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising stopAdvertising');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0300
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', JSON.stringify(error.code), JSON.stringify(error.message));
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0400
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0500
     * @tc.desc 参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0600
     * @tc.desc  参数覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
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
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] onAdvertisingStateChange success');
        let outAdvHandle = await advertising.startAdvertising(advertisingParams);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect(typeof outAdvHandle).assertEqual('int');
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STARTED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising startAdvertising');
            await advertising.stopAdvertising(outAdvHandle);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] stopAdvertising promise success');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        for (let i = 0;i <= 100;i++) {
          if (startadvertising_start_state === advertising.AdvertisingState.STOPPED) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  startAdvertising stopAdvertising');
            break;
          } else {
            await Utils.msSleep(100);
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] slee 100');
          }
        }
        advertising.offAdvertisingStateChange();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] offAdvertisingStateChange success');
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0700
     * @tc.desc  36100040 - Integer out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
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
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0900
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0900
     * @tc.desc  36100040 - Integer out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0900';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
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
        hilog.info(0x0000, 'testTag', '[Nearlink Test] startAdvertising promise result out:%{public}s', JSON.stringify(outAdvHandle));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] advertising 0100 errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_Advertising_ADD_0800
     * @tc.name SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0800
     * @tc.desc 36100040 - Invalid advertising ID.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLinkPub_Advertising_ADD_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await advertising.stopAdvertising(-1);
        hilog.info(0x0000, 'testTag', '%{public}s', 'nearLink startAdvertising promise result');
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'nearLink advertising errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100040);
        }
      }
      done();
    })
  })
}
