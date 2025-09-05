/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function VibratorJsTest_misc_9() {
  describe("VibratorJsTest_misc_9", ():void => {
    hilog.info(domain, tag, '%{public}s', 'discribe start');
    const OPERATION_FAIL_CODE = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;
    const OPERATION_FAIL_MSG = 'Device operation failed.';
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let isAvailable = false;

    let TAG = '';
    let INVALID_EFFECT_ID = "haptic.xxx.yyy";

    beforeAll((done: () => void): Promise<void> =>{
      hilog.info(domain, tag, 'beforeAll called');
      hilog.info(domain, tag, 'VibratorJsTest_misc_9 Device type ' + deviceInfo.deviceType);
      hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
      try {
        if (deviceInfo.deviceType == '2in1') {
          isAvailable = false;
          hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
          done();
        } else {
          isAvailable = true;
          hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
          done();
        }
      } catch (error: BusinessError) {
          hilog.info(domain, tag, 'VibratorJsTest_misc_9 exception: ' + JSON.stringify(error));
          done();
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic001
     * @tc.desc:VibratorEventType CONTINUOUS is 0.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0100
     * @tc.level:Level 0
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic001';
        hilog.info(domain, tag, TAG + ' Device type ' + deviceInfo.deviceType);
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          let eventType = vibrator.VibratorEventType.CONTINUOUS;
          try {
            expect(eventType).assertEqual(0);
            hilog.info(domain, tag, TAG + ' eventType: ' + eventType);
            setTimeout(() => {
              done();
            }, 500);
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(error.code == 401).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic002
     * @tc.desc:VibratorEventType TRANSIENT is 1.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0200
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic002';
        if (isAvailable) {
          let eventType = vibrator.VibratorEventType.TRANSIENT;
          try {
            expect(eventType).assertEqual(1);
            hilog.info(domain, tag, TAG + ' eventType: ' + eventType);
            setTimeout(() => {
              done();
            }, 500);
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(error.code == 401).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic003
     * @tc.desc:VibratorCurvePoint Test.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0300
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic003';
        if (isAvailable) {
          try {
            let data1: vibrator.VibratorCurvePoint = { time: 0, intensity: 0, frequency: -7};
            let data2: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data3: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data4: vibrator.VibratorCurvePoint = { time: 128, intensity: 0.94, frequency: -4};
            let data5: vibrator.VibratorCurvePoint = { time: 217, intensity: 0.63, frequency: -14};
            let data6: vibrator.VibratorCurvePoint = { time: 763, intensity: 0.48, frequency: -14};
            let data7: vibrator.VibratorCurvePoint = { time: 1125, intensity: 0.53, frequency: -10};
            let data8: vibrator.VibratorCurvePoint = { time: 1503, intensity: 0.42, frequency: -14};
            let data9: vibrator.VibratorCurvePoint = { time: 1858, intensity: 0.39, frequency: -14};
            let data10: vibrator.VibratorCurvePoint = { time: 2295, intensity: 0.34, frequency: -17};
            let data11: vibrator.VibratorCurvePoint = { time: 2448, intensity: 0.21, frequency: -14};
            let data12: vibrator.VibratorCurvePoint = { time: 2468, intensity: 0, frequency: -21};
            let pointsMe:  Array<vibrator.VibratorCurvePoint> = [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12];
            hilog.info(domain, tag, TAG + ' pointsMe: ' + pointsMe);
            done();
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })
    
    /*
     * @tc.name:VibratorProgramticHapticTestStatic004
     * @tc.desc:VibratorEvent Test.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0400
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic004';
        if (isAvailable) {
          try {
            let data1: vibrator.VibratorCurvePoint = { time: 0, intensity: 0, frequency: -7};
            let data2: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data3: vibrator.VibratorCurvePoint = { time: 128, intensity: 0.94, frequency: -4};
            let data4: vibrator.VibratorCurvePoint = { time: 217, intensity: 0, frequency: -21};
            let pointsMe:  Array<vibrator.VibratorCurvePoint> = [data1,data2,data3,data4];
            let vibratorEvent: vibrator.VibratorEvent = {
              eventType: vibrator.VibratorEventType.CONTINUOUS,
              time: 20,
              intensity: 97,
              frequency: 34,
              points: pointsMe,
              index: 0,
              duration: 35
            }
            hilog.info(domain, tag, TAG + ' vibratorEvent: ' + vibratorEvent);
            done();
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic048
     * @tc.desc:VibratorCurvePoint Test.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0500
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic048';
        try {
            let effect: vibrator.HapticFileDescriptor = {
              fd: 1,
              offset: 0,
              length: 1000
            }
            let startVibrationData1: vibrator.VibrateFromFile = {
              type: "file",
              hapticFd: effect,
            }
            let startVibrationData2: vibrator.VibrateAttribute = {
              usage: "unknown"
            }
            vibrator.startVibration(startVibrationData1, startVibrationData2, (error: BusinessError<void> | null): void =>{
              hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic048 should not in this method ');
              expect(true).assertTrue();
              done();
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic069
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0600
     * @tc.level:Level 0
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic069';
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          try {
            vibrator.isSupportEffect(INVALID_EFFECT_ID, (error: BusinessError<void> | null, state: boolean | undefined) : void=>{
              if (error != null){
                hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic069 error ');
                expect(false).assertTrue();
                done();
              } else {
                hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic069 success ');
                expect(!state).assertTrue();
                done();
              }
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic100
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0700
     * @tc.level:Level 0
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic100';
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          try {
            let isSupportEffectData: boolean = await vibrator.isSupportEffect(INVALID_EFFECT_ID);
            hilog.info(domain, tag, TAG + ' isSupportEffect success ');
            expect(!isSupportEffectData).assertTrue();
            done();
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic023
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0800
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic023';
        try {
            let effect: vibrator.VibratePreset = {
              type: "preset",
              effectId: "haptic.clock.timer",
              count: 1,
              intensity: 5,
            }
            let attribute: vibrator.VibrateAttribute = {
              id: 0,
              usage: "unknown"
            }
            vibrator.startVibration(effect, attribute, (error: BusinessError<void> | null): void =>{
              if (error) {
                expect(true).assertTrue();
              } else {
                expect(false).assertTrue();
              }
              done();
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(error.code == 401).assertTrue();
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
          }
      })

    /*
     * @tc.name:VibratorProgramticHapticTestStatic032
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0900
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic032';
        try {
            let effect: vibrator.VibratePreset = {
              type: "preset",
              effectId: "haptic.clock.timer",
              count: 1,
            }
            let attribute: vibrator.VibrateAttribute = {
              id: 0,
              usage: "unknown"
            }
            vibrator.startVibration(effect, attribute);
            expect(true).assertTrue();
            done();
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(error.code == 401).assertTrue();
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
          }
      })

      /*
     * @tc.name:VibratorProgramticHapticTestStatic024
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_Vibrator_JSTeststatic_0500
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic024';
        try {
            let effect: vibrator.VibrateTime = {
              type: "time",
              duration: 1000,
            }
            let attribute: vibrator.VibrateAttribute = {
              id: 0,
              usage: "unknown"
            }
            vibrator.startVibration(effect, attribute);
            expect(true).assertTrue();
            done();
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            if (error.code == 801) {
              expect(error.code == 801).assertTrue();
            } else {
              expect(false).assertTrue();
            }
            done();
          }
      })

      /*
     * @tc.name:VibratorProgramticHapticTestStatic025
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_Vibrator_JSTeststatic_0600
     * @tc.level:Level 3
     * @tc.type:FUNCTION
     * @tc.size:MEDIUMTEST
     */
    it("VibratorProgramticHapticTestStatic025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic025';
        try {
           let points: Array<vibrator.VibratorCurvePoint> = [
              {
                time: 0,
                intensity: 0.95,
                frequency: 50,
              }
            ];
            let vibratorEvent1: vibrator.VibratorEvent = {
              eventType: vibrator.VibratorEventType.CONTINUOUS,
              time: 20,
              duration: 50,
              intensity: 60,
              frequency: 75,
              index: 1,
              points: points,
            }
            let vibratorEvent2: vibrator.VibratorEvent = {
              eventType: vibrator.VibratorEventType.CONTINUOUS,
              time: 30,
              duration: 60,
              intensity: 75,
              frequency: 95,
              index: 2,
              points: points,
            }
            let vibratorEvent3: vibrator.VibratorEvent = {
              eventType: vibrator.VibratorEventType.CONTINUOUS,
              time: 10,
              duration: 70,
              intensity: 65,
              frequency: 55,
              index: 3,
              points: points,
            }
            let myevents:  Array<vibrator.VibratorEvent> = [vibratorEvent1,vibratorEvent2,vibratorEvent3];
            let vibratorPattern: vibrator.VibratorPattern = {
              time: 5,
              events: myevents,
            }
            let effect: vibrator.VibrateFromPattern = {
              type: "pattern",
              pattern: vibratorPattern,
            }
            let attribute: vibrator.VibrateAttribute = {
              id: 0,
              usage: "unknown"
            }
            vibrator.startVibration(effect, attribute, (error: BusinessError<void> | null): void =>{
              if (error) {
                expect(true).assertTrue();
              } else {
                expect(false).assertTrue();
              }
              done();
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            if (error.code == 801) {
              expect(error.code == 801).assertTrue();
            } else {
              expect(false).assertTrue();
            }
            done();
          }
      })
  })
}