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
    const EFFECT_IDSUCCESS = "haptic.notice.success"
    const EFFECT_IDFAIL = "haptic.notice.fail"
    const EFFECT_IDWARNING = "haptic.notice.warning"

    let TAG = '';
    let INVALID_EFFECT_ID = "haptic.xxx.yyy";
    let effectit = vibrator.EffectId.EFFECT_CLOCK_TIMER

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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
                hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
                expect(false).assertTrue();
                done();
              } else {
                hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic069 success ');
                expect(!state).assertTrue();
                done();
              }
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              if (error) {
                expect(false).assertTrue();
              } else {
                expect(true).assertTrue();
              }
              done();
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
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
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              if (error) {
                expect(true).assertTrue();
              } else {
                expect(false).assertTrue();
              }
              done();
            });
          } catch (error: BusinessError) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            if (error.code == 801) {
              expect(error.code == 801).assertTrue();
            } else {
              expect(false).assertTrue();
            }
            done();
          }
      })

      /**
     *
     * @tc.number    : UniversalVibratorJsTest01
     * @tc.name      : UniversalVibratorJsTest01
     * @tc.desc      : test EFFECT_IDSUCCESS vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest01"
      let ret = await vibrator.isSupportEffect(EFFECT_IDSUCCESS);
      hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
      if (ret) {
        let effect1: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDSUCCESS,
          count: 1,
          intensity: 50,
        }
        let attr: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
          }
          vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME, (error: BusinessError<void> | null): void => {
            hilog.info(domain, tag, TAG + `stopVibration , error.code: ${error?.code} , error.message: ${error?.message}`);
          })
          done();
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest02
     * @tc.name      : UniversalVibratorJsTest02
     * @tc.desc      : test EFFECT_IDFAIL vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest02"
      let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1));
      if (ret1) {
        let effect2: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let attr2: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect2, attr2, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
          vibrator.stopVibration((error: BusinessError<void> | null): void => {
            hilog.info(domain, tag, TAG + `stopVibration , error.code: ${error?.code} , error.message: ${error?.message}`);
          })
          done();
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }
      
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest03
     * @tc.name      : UniversalVibratorJsTest03
     * @tc.desc      : test EFFECT_IDWARNING vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest03"
      let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
      hilog.info(0x0000, 'testTag', TAG + "ret2:" + JSON.stringify(ret2));
      if (ret2) {
        let effect3: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr3: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect3, attr3, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_PRESET)
          done();
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }   
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest04
     * @tc.name      : UniversalVibratorJsTest04
     * @tc.desc      : test EFFECT_IDFAIL vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest04"
      let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
      if (ret1 && ret2) {
        let effect4: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let effect41: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr4: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect4, attr4, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
        });
        vibrator.startVibration(effect41, attr4, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest05
     * @tc.name      : UniversalVibratorJsTest05
     * @tc.desc      : test EFFECT_IDSUCCESS vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest05"
      let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret = await vibrator.isSupportEffect(EFFECT_IDSUCCESS);
      hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret) + "ret2:" + JSON.stringify(ret2));
      if (ret && ret2) {
        let effect5: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDSUCCESS,
          count: 1,
          intensity: 50,
        }
        let effect51: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr5: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect5, attr5, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
          }
        });
        vibrator.startVibration(effect51, attr5, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          vibrator.stopVibration()
          done();
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest06
     * @tc.name      : UniversalVibratorJsTest06
     * @tc.desc      : test EFFECT_IDWARNING vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest06"
      let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
      if (ret1 && ret2) {
        let effect6: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let effect61: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let attr6: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect6, attr6, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
        });
        vibrator.startVibration(effect61, attr6, (error: BusinessError<void> | null): void => {
          if (error != null) {
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest07
     * @tc.name      : UniversalVibratorJsTest07
     * @tc.desc      : test VibrateTime vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest07"
      try {
        let ret = vibrator.isHdHapticSupported();
        hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
        expect(typeof(ret) == 'boolean').assertEqual(true);
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }  
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest08
     * @tc.name      : UniversalVibratorJsTest08
     * @tc.desc      : test VibrateTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest08"
      let effect1: vibrator.VibrateTime = {
        type: 'time',
        duration: 10000,
      }
      let attr: vibrator.VibrateAttribute = {
        id: 1,
        usage: 'alarm',
      }
      try {
        vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
          if (error != null) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
          } else {
            expect(true).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
          }
          vibrator.stopVibrationSync();
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest09
     * @tc.name      : UniversalVibratorJsTest09
     * @tc.desc      : test vibratePreset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest09"
      try {
        let vibratePreset: vibrator.VibratePreset = {
          type: "preset",
          effectId: "effectId",
          count: 1,
          intensity: 50
        };
        let attribute: vibrator.VibrateAttribute = {
          id: 0,
          usage: "unknown"
        }
        vibrator.startVibration(vibratePreset, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest10
     * @tc.name      : UniversalVibratorJsTest10
     * @tc.desc      : test vibrateTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest10"
      try {
        let vibrateTime: vibrator.VibrateTime = {
          type: "time",
          duration: 10000,
        };
        let attribute: vibrator.VibrateAttribute = {
          id: 1,
          usage: "unknown",
          systemUsage: true,
        }
        vibrator.startVibration(vibrateTime, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      } 
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest12
     * @tc.name      : UniversalVibratorJsTest12
     * @tc.desc      : test VibratorEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest12"
      try {
        let eventType = vibrator.VibratorEventType.CONTINUOUS;
        let points: Array<vibrator.VibratorCurvePoint> = [
          {
            time: 0,
            intensity: 0.95,
            frequency: 50,
          }
        ];
        let events: Array<vibrator.VibratorEvent> = [
          {
            eventType: eventType,
            time: 1,
            points: points,
          }
        ]
        let patt: vibrator.VibratorPattern = {
          time: 10,
          events: events,
        };
        let pattern: vibrator.VibrateFromPattern = {
          type: "pattern",
          pattern: patt,
        };
        let attribute: vibrator.VibrateAttribute = {
          usage: "unknown"
        }
        vibrator.startVibration(pattern, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      } 
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest13
     * @tc.name      : UniversalVibratorJsTest13
     * @tc.desc      : test vibrateFromFile
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest13"
      try {
        let hapticFileDescriptor: vibrator.HapticFileDescriptor = {
          fd: 0,
          offset: 10,
          length: 100,
        };
        let vibrateFromFile: vibrator.VibrateFromFile = {
          type: "file",
          hapticFd: hapticFileDescriptor,
        };
        let attribute: vibrator.VibrateAttribute = {
          usage: "unknown"
        }
        vibrator.startVibration(vibrateFromFile, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      } 
    })

  })
}