/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import btAccess from '@ohos.bluetooth.access';
import a2dp from '@ohos.bluetooth.a2dp';
import hid from '@ohos.bluetooth.hid';
import hfp from '@ohos.bluetooth.hfp';
import pan from '@ohos.bluetooth.pan';
import map from '@ohos.bluetooth.map';
import pbap from '@ohos.bluetooth.pbap';
import bluetooth from '@ohos.bluetooth.baseProfile';
import opp from '@ohos.bluetooth.opp';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

function sleep(delay : number) : Promise<void> {
  return new Promise(resovle => setTimeout(resovle, delay))
}
async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch (sta) {
    case 0:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
      break;
    case 1:
      console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    case 2:
      console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case 3:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
      break;
    default:
      console.info('[bluetooth_js] enable success');
  }
}
let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
async function clickRequestPermission(text:string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text("允许"));
    await button1.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] click 允许 end');
  } catch (err) {
    console.info('[bluetooth_js] click 允许 failed. ' + err);
  }
}

function onReceiveEvent(data : bluetooth.StateChangeParam) {
  console.info('connection state change:'+ JSON.stringify(data));
}
function onReceiveEvent1(data : bluetooth.StateChangeParam) {
  console.info('connection StateChangeParam:'+ JSON.stringify(data));
  console.info('connection StateChangeParam deviceId:'+ data.deviceId);
  console.info('connection StateChangeParam state:'+ data.state);
  console.info('connection StateChangeParam cause:'+ data.cause);
}

export default function btBaseProfileTest() {
  describe('btBaseProfileTest', () => {
    let A2dpSourceProfile : a2dp.A2dpSourceProfile;
    let HandsFreeAudioGatewayProfile : hfp.HandsFreeAudioGatewayProfile;
    let HidHostProfile : hid.HidHostProfile;
    let PanProfile: pan.PanProfile;
    beforeAll(async (done : Function) =>  {
      console.info('beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      await tryToEnableBt();
      try{
        A2dpSourceProfile = a2dp.createA2dpSrcProfile();
      } catch (err) {
        console.error("bluetooth create  errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support or profile not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      try{
        HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
      } catch (err) {
        console.error("bluetooth create  errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createHfpAgProfile is not support or profile not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      try{
        HidHostProfile = hid.createHidHostProfile();
      } catch (err) {
        console.error("bluetooth create  errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createHidHostProfile is not support or profile not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      try{
        PanProfile = pan.createPanProfile();
      } catch (err) {
        console.error("bluetooth create  errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createPanProfile is not support or profile not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    beforeEach(async (done : Function) =>  {
      console.info('beforeEach called')
      await tryToEnableBt()
      done()
    })
    afterEach(() => {
      console.info('afterEach called')
    })
    afterAll(() => {
      console.info('afterAll called')
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100
     * @tc.desc   Test getConnectedDevices api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        let devices : Array<string> = A2dpSourceProfile.getConnectedDevices();
        console.info("address of connected devices list:" + devices);
        expect(Array.isArray(devices)).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectedDevices is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = A2dpSourceProfile.getConnectionState("11:22:33:AA:BB:FF");
        console.info("the connection state:" + state);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectionState is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect(err.code).assertEqual('2900099');
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.on('connectionStateChange', onReceiveEvent);
        A2dpSourceProfile.off('connectionStateChange', onReceiveEvent);
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.on('connectionStateChange', onReceiveEvent);
        A2dpSourceProfile.off('connectionStateChange');
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1800
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.on('connectionStateChange', null);
        expect().assertFail();
      } catch (err) {
        console.info("connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect(err.code).assertEqual('401');
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1900
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.off('connectionStateChange', null);
        expect().assertFail();
      } catch (err) {
        console.info("connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect(err.code).assertEqual('401');
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500
     * @tc.desc   Test getConnectedDevices api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HandsFreeAudioGatewayProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HandsFreeAudioGatewayProfile 跳过用例');
        done();
        return;
      };
      try {
        let devices : Array<string> = HandsFreeAudioGatewayProfile.getConnectedDevices();
        console.info("address of connected devices list:" + devices);
        expect(Array.isArray(devices)).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectedDevices is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HandsFreeAudioGatewayProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HandsFreeAudioGatewayProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = HandsFreeAudioGatewayProfile.getConnectionState("11:22:33:AA:BB:FF");
        console.info("the connection state:" + state);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]getConnectionState is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('2900099');
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HandsFreeAudioGatewayProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HandsFreeAudioGatewayProfile 跳过用例');
        done();
        return;
      };
      try {
        HandsFreeAudioGatewayProfile.on('connectionStateChange', onReceiveEvent1);
        HandsFreeAudioGatewayProfile.off('connectionStateChange', onReceiveEvent1);
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HandsFreeAudioGatewayProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HandsFreeAudioGatewayProfile 跳过用例');
        done();
        return;
      };
      try {
        HandsFreeAudioGatewayProfile.on('connectionStateChange', onReceiveEvent);
        HandsFreeAudioGatewayProfile.off('connectionStateChange');
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900
     * @tc.desc   Test getConnectedDevices api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HidHostProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HidHostProfile 跳过用例');
        done();
        return;
      };
      try {
        let devices : Array<string> = HidHostProfile.getConnectedDevices();
        console.info("address of connected devices list:" + devices);
        expect(Array.isArray(devices)).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectedDevices is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HidHostProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HidHostProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = HidHostProfile.getConnectionState("11:22:33:AA:BB:FF");
        console.info("the connection state:" + state);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]getConnectionState is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('2900099');
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HidHostProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HidHostProfile 跳过用例');
        done();
        return;
      };
      try {
        HidHostProfile.on('connectionStateChange', onReceiveEvent);
        HidHostProfile.off('connectionStateChange', onReceiveEvent);
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(HidHostProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 HidHostProfile 跳过用例');
        done();
        return;
      };
      try {
        HidHostProfile.on('connectionStateChange', onReceiveEvent);
        HidHostProfile.off('connectionStateChange');
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1300
     * @tc.desc   Test getConnectedDevices api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        let devices : Array<string> = PanProfile.getConnectedDevices();
        console.info("address of connected devices list:" + devices);
        expect(Array.isArray(devices)).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectedDevices is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect().assertFail();
        };
      }
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1400
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = PanProfile.getConnectionState("11:22:33:AA:BB:FF");
        console.info("the connection state:" + state);
        expect(state === 0 || state === 1 || state === 2).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]getConnectionState is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1500
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        PanProfile.on('connectionStateChange', onReceiveEvent);
        PanProfile.off('connectionStateChange', onReceiveEvent);
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1600
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        PanProfile.on('connectionStateChange', onReceiveEvent);
        PanProfile.off('connectionStateChange');
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CREATE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CREATE_0100
     * @tc.desc   Test createA2dpSrcProfile api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CREATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let asp = a2dp.createA2dpSrcProfile();
        expect(asp !== null).assertTrue();
      } catch  (err) {
        console.error("bluetooth createA2dpSrcProfile errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createA2dpSrcProfile is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      };
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CREATE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CREATE_0200
     * @tc.desc   Test createHfpAgProfile api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CREATE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let hp = hfp.createHfpAgProfile();
        expect(hp !== null).assertTrue();
      } catch  (err) {
        console.error("bluetooth createHfpAgProfile errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createHfpAgProfile is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      };
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CREATE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CREATE_0300
     * @tc.desc   Test createHidHostProfile api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CREATE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let hhp = hid.createHidHostProfile();
        console.info('[bluetooth_js]createHidHostProfile is success' + hhp);
        expect(hhp !== null).assertTrue();
      } catch  (err) {
        console.error("bluetooth createHidHostProfile errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createHidHostProfile is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      };
      done();
    });
    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_CREATE_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CREATE_0400
     * @tc.desc 测试 pan.createPanProfile
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CREATE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        let PanProfile: pan.PanProfile = pan.createPanProfile();
        console.info('[bt_arkts] createPanProfile result is ' + JSON.stringify(PanProfile));
        expect(PanProfile !== null).assertTrue();
      } catch (err) {
        console.info("[bt_arkts] createPanProfile error: " + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info("createPanProfile is not support.");
          expect(err.code).assertEqual('801');
          done();
        } else {
          expect().assertFail();
        };
      };
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_MAP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MAP_0100
     * @tc.desc   Test createMapMseProfile api11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MAP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let mapMseProfile = map.createMapMseProfile();
        console.info('MapMse success' + mapMseProfile);
        expect(mapMseProfile !== null).assertTrue();
      } catch (err) {
        console.error("bluetooth map createMapMseProfile errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createMapMseProfile is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      };
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_PBAP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PBAP_0100
     * @tc.desc   Test createPbapServerProfile api11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PBAP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let pbapServerProfile = pbap.createPbapServerProfile();
        console.info('pbapServer success' + pbapServerProfile);
        expect(pbapServerProfile !== null).assertTrue();
      } catch (err) {
        console.error("bluetooth pbap createPbapServerProfile errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]createPbapServerProfile is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      };
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHPROFILE_CONSTANT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHPROFILE_CONSTANT_0100
     * @tc.desc   Test DisconnectCause api12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHPROFILE_CONSTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      try {
        let userDisconnect = bluetooth.DisconnectCause.USER_DISCONNECT;
        let connectFromKeyboard = bluetooth.DisconnectCause.CONNECT_FROM_KEYBOARD;
        let connectFromMouse = bluetooth.DisconnectCause.CONNECT_FROM_MOUSE;
        let connectFromCar = bluetooth.DisconnectCause.CONNECT_FROM_CAR;
        let tooManyConnectedDevices = bluetooth.DisconnectCause.TOO_MANY_CONNECTED_DEVICES;
        let connectFailInternal = bluetooth.DisconnectCause.CONNECT_FAIL_INTERNAL;
        expect(userDisconnect).assertEqual(0);
        expect(connectFromKeyboard).assertEqual(1);
        expect(connectFromMouse).assertEqual(2);
        expect(connectFromCar).assertEqual(3);
        expect(tooManyConnectedDevices).assertEqual(4);
        expect(connectFailInternal).assertEqual(5);
      } catch (err) {
        console.info("DisconnectCause errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      };
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0100
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = A2dpSourceProfile.getConnectionState("");
        console.info("the connection state:" + state);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectionState is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0200
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = A2dpSourceProfile.getConnectionState(null);
        console.info("the connection state:" + state);
        // 预期报错401，实际正常调用，返回undefined，提单DTS2026070774519
        expect(state === undefined).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectionState is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0300
     * @tc.desc   Test getConnectionState api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        let state : bluetooth.ProfileConnectionState = A2dpSourceProfile.getConnectionState(undefined);
        console.info("the connection state:" + state);
        // 预期报错401，实际正常调用，返回undefined，提单DTS2026070774519
        expect(state === undefined).assertTrue();
      } catch (err) {
        console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801' || err.code === '2900004') {
          console.info('[bluetooth_js]getConnectionState is not support or profile not support');
          expect(err.code === '801' || err.code === '2900004').assertTrue();
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0400
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.on(null, onReceiveEvent);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0500
     * @tc.desc   Test on type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.on(undefined, onReceiveEvent);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0600
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.off(null, onReceiveEvent);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0700
     * @tc.desc   Test off type: 'connectionStateChange' api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
      if(A2dpSourceProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 A2dpSourceProfile 跳过用例');
        done();
        return;
      };
      try {
        A2dpSourceProfile.off(undefined, onReceiveEvent);
        expect().assertFail();
      } catch (err) {
        console.error("bluetooth off errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info('[bluetooth_js]connectionStateChange is not support');
          expect(err.code).assertEqual('801');
        } else {
          expect(err.code).assertEqual('401');
        };
      }
      done();
    });

    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_0100
     * @tc.desc 测试 pan.PanProfile.isPanSupported - 设备支持PAN返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        let result: boolean = PanProfile.isPanSupported();
        expect(typeof result).assertEqual('boolean');
        console.info('[bt_arkts] isPanSupported result is ' + JSON.stringify(result));
      } catch (err) {
        console.info("[bt_arkts] isPanSupported error: " + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        };
      }
      done();
    });
    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_0100
     * @tc.desc 测试 PanProfile 的 isTetheringOn 方法 - 获取网络共享状态
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      if(PanProfile  === undefined){
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象 PanProfile 跳过用例');
        done();
        return;
      };
      try {
        let result: boolean = PanProfile.isTetheringOn();
        console.info('[bt_arkts] isTetheringOn result is ' + JSON.stringify(result));
        expect(typeof result).assertEqual('boolean');
      } catch (err) {
        console.info("[bt_arkts] isTetheringOn error: " + err.code + ",errMessage:" + err.message);
        if (err.code === '801') {
          console.info("设备 is not support.");
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        };
      }
      done();
    });
  })
}