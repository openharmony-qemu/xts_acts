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

function sleep(delay : number) : Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay));
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
        console.info("[fusion_js] isRangingSupported error: " + JSON.stringify(err));
        expect().assertFail();
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
          expect(err.code).assertEqual(801);
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
        console.info("[fusion_js] testStartRangingParamString001 success");
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRanging result is: " + JSON.stringify(result));
        });
      }catch(err) {
        console.info("[fusion_js] testStartRanging error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
        let stopCallback = (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingParam002 result is: " + JSON.stringify(result));
        }
        ranging.stopRanging(stopCallback)
        console.info("[fusion_js] testStopRangingParam002 stop success.");
      }catch(err){
        console.info("[fusion_js] testStopRangingParam002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
          expect(err.code).assertEqual(801);
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
        console.info("[fusion_js] testOnRangingStateChangeCallback001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
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
      }catch(err) {
        console.info("[fusion_js] testOffRangingStateChangeParam001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
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
      }catch(err){
        console.info("[fusion_js] testOffRangingStateChangeParam002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name testStartRangingErrcode34900052
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0400
     * @tc.desc 测距服务能力不支持
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingErrcode34900052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:67",
        capabilityType: 0
      };
      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingErrcode34900052 result is: " + JSON.stringify(result));
          expect().assertFail();
        });
        console.info("[fusion_js] testStartRangingErrcode34900052 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingErrcode34900052 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
        done();
      }
    });



    /**
     * @tc.name testStartRangingParamEnum002
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0500
     * @tc.desc 测距服务能力不支持, 能力值设为-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: -1,
      };
      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamEnum002 result is: " + JSON.stringify(result));
        });
        console.info("[fusion_js] testStartRangingParamEnum002 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingParamEnum002 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
      }
      done();
    });



    /**
     * @tc.name testStartPassiveRangingParam001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTPASSIVERANGING_0300
     * @tc.desc 启动被动测距成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStartPassiveRangingParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let handle: number = await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStartPassiveRangingParam001 handle is: " + handle);
        expect(typeof handle).assertEqual('number');
        ranging.stopPassiveRanging(handle,ranging.RangingTypes.NEARLINK_HADM);
        await sleep(500);
        done();
      } catch (err) {
        console.info("[fusion_js] testStartPassiveRangingParam001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
        done();
      }
    });


    /**
     * @tc.name testStopPassiveRangingParam001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0300
     * @tc.desc 停止被动测距成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let handle: number = await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStartPassiveRanging handle is: " + handle);
        ranging.stopPassiveRanging(handle, ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingParam001 success.");
        await sleep(500)
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingParam001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect().assertFail();
        }
        done();
      }
    });

    /**
     * @tc.name testStartRangingParamEnum003
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0600
     * @tc.desc capabilityType为枚举类型之外的值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: 999,
      };

      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamEnum003 result is: " + JSON.stringify(result));
        });
        console.info("[fusion_js] testStartRangingParamEnum003 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingParamEnum003 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
      }
      done();
    });

    /**
     * @tc.name testStopPassiveRangingErrcode34900052
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0400
     * @tc.desc 测距服务能力不支持
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingErrcode34900052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle: number = -1;
      try {
        handle = await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStartPassiveRanging handle is: " + handle);
        console.info("[fusion_js] testStopPassiveRangingErrcode34900052 handle value is: " + handle);
        ranging.stopPassiveRanging(handle, -1);
        console.info("[fusion_js] testStopPassiveRangingErrcode34900052 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info("[fusion_js] testStopPassiveRangingErrcode34900052 error: " + JSON.stringify(error));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(error.code).assertEqual(34900052);
          ranging.stopPassiveRanging(handle, 1);
          console.info("[fusion_js] testStopPassiveRangingErrcode34900052 should success");
          await sleep(500);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingWrongType
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_0200
     * @tc.desc 回调未使用或deviceId为空
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingWrongType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: 999
      };

      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingWrongType result is: " + JSON.stringify(result));
          expect().assertFail();
        }, params);
        console.info("[fusion_js] testStopRangingWrongType callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingWrongType error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingWrongType1
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_0300
     * @tc.desc 回调未使用或deviceId为空
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingWrongType1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: -1
      };
      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingWrongType result is: " + JSON.stringify(result));
          expect().assertFail();
        }, params);
        console.info("[fusion_js] testStopRangingWrongType callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingWrongType error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(34900052);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTATE_0100
     * @tc.number SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTATE_0100
     * @tc.desc   Test RangingState enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        let RANGING_STOPPED: number = ranging.RangingState.RANGING_STOPPED;
        console.info("[fusion_js]RangingState RANGING_STOPPED: " + RANGING_STOPPED);
        expect(RANGING_STOPPED).assertEqual(0);

        let RANGING_STARTED: number = ranging.RangingState.RANGING_STARTED;
        console.info("[fusion_js]RangingState RANGING_STARTED: " + RANGING_STARTED);
        expect(RANGING_STARTED).assertEqual(1);
      } catch (err) {
        console.info("fusion RangingState errCode:" + err.code + ",fusion RangingState errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTOPPEDCAUSE_0100
     * @tc.number SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTOPPEDCAUSE_0100
     * @tc.desc   Test RangingStoppedCause enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_RANGING_RANGINGSTOPPEDCAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        let NO_ERROR: number = ranging.RangingStoppedCause.NO_ERROR;
        console.info("[fusion_js]RangingStoppedCause NO_ERROR: " + NO_ERROR);
        expect(NO_ERROR).assertEqual(0);

        let INTERNAL_ERROR: number = ranging.RangingStoppedCause.INTERNAL_ERROR;
        console.info("[fusion_js]RangingStoppedCause INTERNAL_ERROR: " + INTERNAL_ERROR);
        expect(INTERNAL_ERROR).assertEqual(1);

        let BUSINESS_CONFLICT: number = ranging.RangingStoppedCause.BUSINESS_CONFLICT;
        console.info("[fusion_js]RangingStoppedCause BUSINESS_CONFLICT: " + BUSINESS_CONFLICT);
        expect(BUSINESS_CONFLICT).assertEqual(2);

        let BACKGROUND_PAUSED: number = ranging.RangingStoppedCause.BACKGROUND_PAUSED;
        console.info("[fusion_js]RangingStoppedCause BACKGROUND_PAUSED: " + BACKGROUND_PAUSED);
        expect(BACKGROUND_PAUSED).assertEqual(3);
      } catch (err) {
        console.info("fusion RangingStoppedCause errCode:" + err.code + ",fusion RangingStoppedCause errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_RANGING_RANGINGCONFIDENCE_0100
     * @tc.number SUB_COMMUNICATION_FUSION_RANGING_RANGINGCONFIDENCE_0100
     * @tc.desc   Test RangingConfidence enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_RANGING_RANGINGCONFIDENCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        let HIGH: number = ranging.RangingConfidence.HIGH;
        console.info("[fusion_js]RangingConfidence HIGH: " + HIGH);
        expect(HIGH).assertEqual(0);

        let MEDIUM: number = ranging.RangingConfidence.MEDIUM;
        console.info("[fusion_js]RangingConfidence MEDIUM: " + MEDIUM);
        expect(MEDIUM).assertEqual(1);

        let LOW: number = ranging.RangingConfidence.LOW;
        console.info("[fusion_js]RangingConfidence LOW: " + LOW);
        expect(LOW).assertEqual(2);
      } catch (err) {
        console.info("fusion RangingConfidence errCode:" + err.code + ",fusion RangingConfidence errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name testStartRangingParamNull001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0700
     * @tc.desc startRanging第一个参数params传null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params = null;
      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamNull001 result is: " + JSON.stringify(result));
          expect().assertFail();
        });
        console.info("[fusion_js] testStartRangingParamNull001 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingParamNull001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStartRangingParamUndefined001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_0800
     * @tc.desc startRanging第一个参数params传undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartRangingParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params = undefined;
      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingParamUndefined001 result is: " + JSON.stringify(result));
          expect().assertFail();
        });
        console.info("[fusion_js] testStartRangingParamUndefined001 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingParamUndefined001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingParamNull001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_0400
     * @tc.desc stopRanging第二个参数params传null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params = null;
      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingParamNull001 result is: " + JSON.stringify(result));
          expect().assertFail();
        }, params);
        console.info("[fusion_js] testStopRangingParamNull001 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopRangingParamNull001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStopRangingParamUndefined001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_0500
     * @tc.desc stopRanging第二个参数params传undefined，可选参数不传等价于停止所有测距
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopRangingParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let params = undefined;
      try {
        let stopCallback = (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingParamUndefined001 result is: " + JSON.stringify(result));
        }
        ranging.stopRanging(stopCallback, params);
        console.info("[fusion_js] testStopRangingParamUndefined001 stop success.");
      } catch (err) {
        console.info("[fusion_js] testStopRangingParamUndefined001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name testStartPassiveRangingParamNull001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTPASSIVERANGING_0400
     * @tc.desc startPassiveRanging第一个参数capabilityType传null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartPassiveRangingParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let capabilityType = null;
      try {
        await ranging.startPassiveRanging(capabilityType);
        console.info("[fusion_js] testStartPassiveRangingParamNull001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartPassiveRangingParamNull001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStartPassiveRangingParamUndefined001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTPASSIVERANGING_0500
     * @tc.desc startPassiveRanging第一个参数capabilityType传undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStartPassiveRangingParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let capabilityType = undefined;
      try {
        await ranging.startPassiveRanging(capabilityType);
        console.info("[fusion_js] testStartPassiveRangingParamUndefined001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartPassiveRangingParamUndefined001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStopPassiveRangingHandleNull001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0500
     * @tc.desc stopPassiveRanging第一个参数handle传null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingHandleNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle = null;
      try {
        console.info("[fusion_js] testStopPassiveRangingHandleNull001 handle value is: " + handle);
        ranging.stopPassiveRanging(handle, ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingHandleNull001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingHandleNull001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStopPassiveRangingHandleUndefined001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0600
     * @tc.desc stopPassiveRanging第一个参数handle传undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingHandleUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle = undefined;
      try {
        console.info("[fusion_js] testStopPassiveRangingHandleUndefined001 handle value is: " + handle);
        ranging.stopPassiveRanging(handle, ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingHandleUndefined001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingHandleUndefined001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name testStopPassiveRangingCapabilityNull001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0700
     * @tc.desc stopPassiveRanging第二个参数capabilityType传null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingCapabilityNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle: number = -1;
      try {
        handle= await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingCapabilityNull001 handle is: " + handle);
        let capabilityType = null;
        ranging.stopPassiveRanging(handle, capabilityType);
        console.info("[fusion_js] testStopPassiveRangingCapabilityNull001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingCapabilityNull001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
          ranging.stopPassiveRanging(handle, 1);
          console.info("[fusion_js] testStopPassiveRangingCapabilityNull001 should success.");
          await sleep(500);
        }
        done();
      }
    });

    /**
     * @tc.name testStopPassiveRangingCapabilityUndefined001
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_0800
     * @tc.desc stopPassiveRanging第二个参数capabilityType传undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingCapabilityUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let handle: number = -1;
      try {
        handle = await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingCapabilityUndefined001 handle is: " + handle);
        let capabilityType = undefined;
        ranging.stopPassiveRanging(handle, capabilityType);
        console.info("[fusion_js] testStopPassiveRangingCapabilityUndefined001 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingCapabilityUndefined001 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(err.code).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(401);
          ranging.stopPassiveRanging(handle, 1);
          console.info("[fusion_js] testStopPassiveRangingCapabilityUndefined001 should success.");
          await sleep(500);
        }
        done();
      }
    });
  });
}