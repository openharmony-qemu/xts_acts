/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, it, beforeAll, expect, Level, TestType, Size} from '@ohos/hypium';
import ranging from '@ohos.FusionConnectivity.ranging';
import { BusinessError } from '@kit.BasicServicesKit';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'


let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";
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
}

export default function RangingTest() {
  describe('RangingTest', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      done();
    })

    /**
     * @tc.name testIsRangingSupportedBoolean001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_ISRANGINGSUPPORTED_0100
     * @tc.desc 判断本机设备支持测距功能
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testIsRangingSupportedBoolean001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try{
        let isSupport: boolean = ranging.isRangingSupported();
        console.info("[fusion_js]isRangingSupported value is: " + JSON.stringify(isSupport));
        expect(typeof isSupport).assertEqual("boolean");
      }catch (err){
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
        }else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testGetRangingCapabilityParam001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_GETRANGINGCAPABILITY_0100
     * @tc.desc 查询本机设备测距能力成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testGetRangingCapabilityParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let capability: ranging.RangingCapabilitySupported = await ranging.getRangingCapability();
        console.info("[fusion_js] testGetRangingCapabilityParam001 capability is: " + JSON.stringify(capability));
        expect(typeof capability.nearlinkHadm).assertEqual('boolean');
        done();
      } catch (err) {
        console.info("[fusion_js] testGetRangingCapabilityParam001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          console.info("[fusion_js] isRangingSupported value is: " + JSON.stringify(isSupport));
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
        done();
      }
    });


    /**
     * @tc.name testStartRangingParamString001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0100
     * @tc.desc deviceId为有效MAC地址格式
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };
      try{
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamString001 result deviceId is: " + result.deviceId);
          expect(result.deviceId).assertEqual("11:22:33:44:55:66");
        })

      }catch(err) {
        console.info("[fusion_js] testStartRanging error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          console.info("[fusion_js] isRangingSupported value is: " + JSON.stringify(isSupport));
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }
      done()
    });

    /**
     * @tc.name testStartRangingParamString002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0200
     * @tc.desc deviceId为无效MAC地址格式
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };
      try{
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamString002 result deviceId is: " + result.deviceId);
          expect(result.deviceId).assertEqual("11:22:33:44:55:66");
        })
      }catch(err) {
        console.info("[fusion_js] testStartRanging error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900054);
        }
      }
      done()

    });

    /**
     * @tc.name testStartRangingParamString003
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0300
     * @tc.desc deviceId为空字符串
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try{
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamString002 result deviceId is: " + result.deviceId);
        });
        console.info("[fusion_js] testStartRangingParamString002 start success")
      }catch(err) {
        console.info("[fusion_js] testStartRanging error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900054);
        }
      }
      done();
    });



    /**
     * @tc.name testStopRangingErrcode34000050
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_ERRCODE_0100
     * @tc.desc 设备未发起测距
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingErrcode34000050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:77",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingErrcode34000050 result is: " + JSON.stringify(result));
        }, params);
        console.info("[fusion_js] testStopRangingErrcode34000050 success");
        expect().assertFail()
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingErrcode34000050 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900050);
        }
        done();
      }
    });



    /**
     * @tc.name testStopRangingErrcode34900054
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_ERRCODE_0200
     * @tc.desc 回调未使用或deviceId无效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingErrcode34900054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingErrcode34900054 result is: " + JSON.stringify(result));
        }, params);
        console.info("[fusion_js] testStopRangingErrcode34900054 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingErrcode34900054 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900054);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingEmptyDeviceId
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_ERRCODE_0300
     * @tc.desc 回调未使用或deviceId为空
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingEmptyDeviceId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingEmptyDeviceId result is: " + JSON.stringify(result));
        }, params);
        console.info("[fusion_js] testStopRangingEmptyDeviceId callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingEmptyDeviceId error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900054);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingParam002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_0100
     * @tc.desc 停止所有测距（不传params）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStopRangingParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingParam002 result is: " + JSON.stringify(result));
        });
        console.info("[fusion_js] testStopRangingParam002 stop success.");
      }catch(err){
        console.info("[fusion_js] testStopRangingParam002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }

      done();
    });


    /**
     * @tc.name testStartPassiveRangingParamEnum002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTPASSIVERANGING_0200
     * @tc.desc capabilityType为枚举类型之外的值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartPassiveRangingParamEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await ranging.startPassiveRanging(999);
        console.info("[fusion_js] testStartPassiveRangingParamEnum002 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartPassiveRangingParamEnum002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
        done();
      }
    });



    /**
     * @tc.name testStopPassiveRangingParamNumber002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0200
     * @tc.desc handle为无效值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingParamNumber002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle: number = -1;

      try {
        console.info("[fusion_js] testStopPassiveRangingParamNumber002 handle value is: " + handle);
        ranging.stopPassiveRanging(handle, ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingParamNumber002 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingParamNumber002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900054);
        }
        done();
      }
    });


    /**
     * @tc.name testOnRangingStateChangeCallback001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_ONRANGINGSTATECHANGE_0100
     * @tc.desc 注册测距状态变化回调成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testOnRangingStateChangeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        ranging.onRangingStateChange((stateInfo: ranging.RangingStateChangeInfo) => {
          console.info("[fusion_js] testOnRangingStateChangeCallback001 stateInfo is: " + JSON.stringify(stateInfo));
        });
        console.info("[fusion_js] testOnRangingStateChangeCallback001 success ");
      }catch (err){
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }
      done();
    });


    /**
     * @tc.name testOffRangingStateChangeParam001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_OFFRANGINGSTATECHANGE_0100
     * @tc.desc 取消订阅指定的状态变化回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testOffRangingStateChangeParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callback = (stateInfo: ranging.RangingStateChangeInfo) => {
        console.info('testOffRangingStateChangeParam001 State changed');
      };
      try{
        ranging.onRangingStateChange(callback);
        ranging.offRangingStateChange(callback);
        console.info("[fusion_js] testOffRangingStateChangeParam001 success.");
        expect(true).assertTrue();
      }catch(err) {
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name testOffRangingStateChangeParam002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_OFFRANGINGSTATECHANGE_0200
     * @tc.desc 取消订阅所有状态变化回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testOffRangingStateChangeParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callback1 = (stateInfo: ranging.RangingStateChangeInfo) => {
        console.info('testOffRangingStateChangeParam002 State changed 1');
      };

      let callback2 = (stateInfo: ranging.RangingStateChangeInfo) => {
        console.info('testOffRangingStateChangeParam002 State changed 2');
      };
      try{
        ranging.onRangingStateChange(callback1);
        ranging.onRangingStateChange(callback2);
        ranging.offRangingStateChange();
        console.info("[fusion_js] testOffRangingStateChangeParam002 success.");
        expect(true).assertTrue();
      }catch(err){
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
  });
}