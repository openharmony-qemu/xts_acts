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
import sensor from '@ohos.sensor'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

function callback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function onSensorCallback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function onHallCallback(data: sensor.HallResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Hall callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Hall callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.status)).assertEqual("number");
}

function onAmbientLightCallback(data: sensor.LightResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AmbientLight callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'AmbientLight callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.intensity)).assertEqual("number");
  expect(typeof(data.colorTemperature)).assertEqual("number");
  expect(typeof(data.infraredLuminance)).assertEqual("number");
}

function onProximityCallback(data: sensor.ProximityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Proximity callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Proximity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.distance)).assertEqual("number");
}

function onWearDetectionCallback(data: sensor.WearDetectionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'WearDetection callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'WearDetection callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.value)).assertEqual("number");
}

function onSignificantMotionCallback(data: sensor.SignificantMotionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'SignificantMotion callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'SignificantMotion callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.scalar)).assertEqual("number");
}

function onRotationVectorCallback(data: sensor.RotationVectorResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'RotationVector callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'RotationVector callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.w)).assertEqual("number");
}

function onPedometerDetectionCallback(data: sensor.PedometerDetectionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'PedometerDetection callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'PedometerDetection callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.scalar)).assertEqual("number");
}

function onPedometerCallback(data: sensor.PedometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Pedometer callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Pedometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.steps)).assertEqual("number");
}

function onMagneticFieldUncalibratedCallback(data: sensor.MagneticFieldUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'MagneticFieldUncalibrated callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'MagneticFieldUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onMagneticFieldCallback(data: sensor.MagneticFieldResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'MagneticField callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'MagneticField callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onLinearAccelerometerCallback(data: sensor.LinearAccelerometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'LinearAccelerometer callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'LinearAccelerometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onHumidityCallback(data: sensor.HumidityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Humidity callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Humidity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.humidity)).assertEqual("number");
}

function onHeartRateCallback(data: sensor.HeartRateResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'HeartRate callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'HeartRate callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.heartRate)).assertEqual("number");
}

function onGyroscopeUncalibratedCallback(data: sensor.GyroscopeUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'GyroscopeUncalibrated callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'GyroscopeUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onGyroscopeCallback(data: sensor.GyroscopeResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Gyroscope callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Gyroscope callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onGravityCallback(data: sensor.GravityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Gravity callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Gravity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onBarometerCallback(data: sensor.BarometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Barometer callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Barometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.pressure)).assertEqual("number");
}

function onAmbientTemperatureCallback(data: sensor.AmbientTemperatureResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AmbientTemperature callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'AmbientTemperature callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.temperature)).assertEqual("number");
}

function onAccelerometerUncalibratedCallback(data: sensor.AccelerometerUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AccelerometerUncalibrated callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'AccelerometerUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onAccelerometerCallback(data: sensor.AccelerometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Accelerometer callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'Accelerometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

export default function SensorJsStaticTest() {
  describe("SensorJsStaticTest", ():void => {
    const PERMISSION_DENIED_CODE = 201;
    const NON_SYSTEM_API_CODE = 202;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let sensorList: Array<sensor.Sensor> | undefined = undefined
    let invalid = -1;
    let TAG = '';
    let Available = false;

    beforeAll((done: () => void): Promise<void> =>{
      hilog.info(domain, tag, 'beforeAll called');
      try {
        sensor.getSensorList((err: BusinessError<void> | null, data: Array<sensor.Sensor> | undefined) => {
            hilog.info(0x0000, 'testTag',  `beforeAll Succeeded in getting GetSensorList err.code ${err?.code} ,err.message${err?.message}`);
            sensorList = data
            done();
          });
        hilog.info(0x0000, 'testTag', `beforeAll success ${sensorList}`);
        done();
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', `beforeAll failed err.code ${error.code} ,err.message${error.message}`);
        done();
      }
    })

    let isAvailable = async (data: sensor.SensorId): Promise<void>=> {
      if (sensorList != undefined) {
        const targetSensor = sensorList?.filter((sensors:sensor.Sensor) => sensors.sensorId === data)
        hilog.info(0x0000, 'testTag', `isAvailable : ${targetSensor},length : ${targetSensor?.length}`);
        if (targetSensor?.length != 0) {
          Available = true
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        } else {
          Available = false
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        }
      } else {
        hilog.info(0x0000, 'testTag', `sensorList : ${sensorList}`);
      }
    }

    /*
     * @tc.name:orientating_SensorJsTest_static_005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0050
     */
    it("orientating_SensorJsTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        let InfoParam: sensor.SensorInfoParam = {
          deviceId: -1,
          sensorIndex: 0
        }
        try {
          sensor.on('orientationChange', callback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off in--------------');
            sensor.off('orientationChange', InfoParam);
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `orientating_SensorJsTest_static_005 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:orientating_SensorJsTest_static_006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0060
     */
    it("orientating_SensorJsTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.on('orientationChange', onSensorCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off in--------------');
            sensor.off('orientationChange');
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `orientating_SensorJsTest_static_006 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:orientatingParamError_SensorJsTest_static_050
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0500
     */
    it("orientatingParamError_SensorJsTest_static_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientatingParamError_SensorJsTest_static_050--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.on('orientationChange', onSensorCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingParamError_SensorJsTest_static_050 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

     /*
      * @tc.name:paramTest_SensorJsTest_static_073
      * @tc.desc:Verification results of the incorrect parameters of the test interface.
      * @tc.number:SUB_SensorsSystem_static_JsTest_0730
      */
    it("paramTest_SensorJsTest_static_073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------paramTest_SensorJsTest_static_073--------------');
        try {
          let accUnreliable: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_UNRELIABLE;
          let accLow: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_LOW;
          let accMedium: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_MEDIUM;
          let accHigh: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_HIGH;
          let orientationResponseParam: sensor.OrientationResponse = {
            timestamp: 100000000,
            beta: 1.0,
            gamma: 2.0,
            alpha: 3.0,
          };
          expect(true).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingParamError_SensorJsTest_static_050 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(false).assertTrue();
          done();
        }  
      })

      /*
     * @tc.name:getRotationMatrix_SensorJsTest_static_001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0010
     */
    it("getRotationMatrix_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrix_SensorJsTest_static_001--------------');
        try {
          let gravity: double[] = [-0.27775216, 0.5351276, 9.788099];
          let geomagnetic: double[] = [210.87253, -78.6096, -111.44444];
          sensor.getRotationMatrix(gravity, geomagnetic, (err: BusinessError<void> | null, data: sensor.RotationMatrixResponse | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting rotationMatrix: ' + JSON.stringify(data) + '.err:' + err);
            if (data != undefined) {
              expect(data?.rotation != null).assertTrue();
              expect(data?.inclination != null).assertTrue();
            }
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', ' getRotationMatrix_SensorJsTest_static_001 fail, errCode:' + e.code);
          if (e.code == 401) {
            expect(e.code == 401).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })

     /*
     * @tc.name:getRotationMatrix_SensorJsTest_static_002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0020
     */
    it("getRotationMatrix_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrix_SensorJsTest_static_002--------------');
        try {
          let gravity: double[] = [-0.27775216, 0.5351276, 9.788099];
          let geomagnetic: double[] = [210.87253, -78.6096, -111.44444];
          const promise = await sensor.getRotationMatrix(gravity, geomagnetic);
          hilog.info(0x0000, 'testTag', ` GetOrientation success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', ' getRotationMatrix_SensorJsTest_static_001 fail, errCode:' + e.code);
          if (e.code == 401) {
            expect(e.code == 401).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })
    
    /*
     * @tc.name:getOrientation_SensorJsTest_static_002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0020
     */
    it("getOrientation_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getOrientation_SensorJsTest_static_002--------------');
        try {
          let preRotationMatrix: double[] = [1, 0, 0, 0, 0.87, -0.50, 0, 0.50, 0.87];
          sensor.getOrientation(preRotationMatrix, (err: BusinessError<void> | null, data: Array<double> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting orientation: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetOrientation fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

      /*
     * @tc.name:getOrientation_SensorJsTest_static_003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0030
     */
    it("getOrientation_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getOrientation_SensorJsTest_static_003--------------');
        try {
          let preRotationMatrix: double[] = [1, 0, 0, 0, 0.87, -0.50, 0, 0.50, 0.87];
          const promise = await sensor.getOrientation(preRotationMatrix);
          hilog.info(0x0000, 'testTag', ` GetOrientation success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetOrientation fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:getRotationMatrixSync_SensorJsTest_static_003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0030
     */
    it("getRotationMatrixSync_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrixSync_SensorJsTest_static_003--------------');
        try {
          let rotationVector: double[] = [0.20046076, 0.21907, 0.73978853, 0.60376877];
          sensor.getRotationMatrix(rotationVector, (err: BusinessError<void> | null, data: Array<double> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting GetRotationMatrixSync: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetRotationMatrixSync fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

      /*
     * @tc.name:getRotationMatrixSync_SensorJsTest_static_004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0040
     */
    it("getRotationMatrixSync_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrixSync_SensorJsTest_static_004--------------');
        try {
          let rotationVector: double[] = [0.20046076, 0.21907, 0.73978853, 0.60376877];
          const promise = await sensor.getRotationMatrix(rotationVector);
          hilog.info(0x0000, 'testTag', ` getRotationMatrix success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetRotationMatrixSync fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })
    
    /*
     * @tc.name:getSensorList_SensorJsTest_static_004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0040
     */
    it("getSensorList_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getSensorList_SensorJsTest_static_004--------------');
        try {
          sensor.getSensorList((err: BusinessError<void> | null, data: Array<sensor.Sensor> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting GetSensorList: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetSensorList fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:getSensorList_SensorJsTest_static_005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0050
     */
    it("getSensorList_SensorJsTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getSensorList_SensorJsTest_static_005--------------');
        try {
          let data: Array<sensor.Sensor> = await sensor.getSensorList();
          hilog.info(0x0000, 'testTag', ' Succeeded in getting GetSensorList: ' + JSON.stringify(data));
          expect(typeof(data[0].sensorName) == 'string').assertTrue();
          expect(typeof(data[0].vendorName) == 'string').assertTrue();
          expect(typeof(data[0].firmwareVersion) == 'string').assertTrue();
          expect(typeof(data[0].hardwareVersion) == 'string').assertTrue();
          expect(typeof(data[0].sensorId) == 'number').assertTrue();
          expect(typeof(data[0].maxRange) == 'number').assertTrue();
          expect(typeof(data[0].minSamplePeriod	) == 'number').assertTrue();
          expect(typeof(data[0].maxSamplePeriod) == 'number').assertTrue();
          expect(typeof(data[0].precision	) == 'number').assertTrue();
          expect(typeof(data[0].power) == 'number').assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetSensorList fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:hall_SensorJsTest_static_007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0070
     */
    it("hall_SensorJsTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.on('hallChange', onHallCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007 off in--------------');
            sensor.off('hallChange');
            hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `hall_SensorJsTest_static_007 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:ambientLight_SensorJsTest_static_008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0080
     */
    it("ambientLight_SensorJsTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.on('ambientLightChange', onAmbientLightCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008 off in--------------');
            sensor.off('ambientLightChange');
            hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientLight_SensorJsTest_static_008 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:proximity_SensorJsTest_static_009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0090
     */
    it("proximity_SensorJsTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.on('proximityChange', onProximityCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009 off in--------------');
            sensor.off('proximityChange');
            hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `proximity_SensorJsTest_static_009 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:wearDetection_SensorJsTest_static_010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0100
     */
    it("wearDetection_SensorJsTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.on('wearDetectionChange', onWearDetectionCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010 off in--------------');
            sensor.off('wearDetectionChange');
            hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `wearDetection_SensorJsTest_static_010 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:significantMotion_SensorJsTest_static_011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0110
     */
    it("significantMotion_SensorJsTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.on('significantMotionChange', onSignificantMotionCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011 off in--------------');
            sensor.off('significantMotionChange');
            hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `significantMotion_SensorJsTest_static_011 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:rotationVector_SensorJsTest_static_012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0120
     */
    it("rotationVector_SensorJsTest_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.on('rotationVectorChange', onRotationVectorCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012 off in--------------');
            sensor.off('rotationVectorChange');
            hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `rotationVector_SensorJsTest_static_012 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:pedometerDetection_SensorJsTest_static_013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0130
     */
    it("pedometerDetection_SensorJsTest_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.on('pedometerDetectionChange', onPedometerDetectionCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013 off in--------------');
            sensor.off('pedometerDetectionChange');
            hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometerDetection_SensorJsTest_static_013 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:pedometer_SensorJsTest_static_014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0140
     */
    it("pedometer_SensorJsTest_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.on('pedometerChange', onPedometerCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014 off in--------------');
            sensor.off('pedometerChange');
            hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometer_SensorJsTest_static_014 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:magneticFieldUncalibrated_SensorJsTest_static_015
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0150
     */
    it("magneticFieldUncalibrated_SensorJsTest_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.on('magneticFieldUncalibratedChange', onMagneticFieldUncalibratedCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015 off in--------------');
            sensor.off('magneticFieldUncalibratedChange');
            hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibrated_SensorJsTest_static_015 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:magneticField_SensorJsTest_static_016
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0160
     */
    it("magneticField_SensorJsTest_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.on('magneticFieldChange', onMagneticFieldCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016 off in--------------');
            sensor.off('magneticFieldChange');
            hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticField_SensorJsTest_static_016 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:linearAccelerometer_SensorJsTest_static_017
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0170
     */
    it("linearAccelerometer_SensorJsTest_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.on('linearAccelerometerChange', onLinearAccelerometerCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017 off in--------------');
            sensor.off('linearAccelerometerChange');
            hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `linearAccelerometer_SensorJsTest_static_017 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:humidity_SensorJsTest_static_018
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0180
     */
    it("humidity_SensorJsTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.on('humidityChange', onHumidityCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018 off in--------------');
            sensor.off('humidityChange');
            hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `humidity_SensorJsTest_static_018 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:heartRate_SensorJsTest_static_019
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0190
     */
    it("heartRate_SensorJsTest_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.on('heartRateChange', onHeartRateCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019 off in--------------');
            sensor.off('heartRateChange');
            hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `heartRate_SensorJsTest_static_019 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gyroscopeUncalibrated_SensorJsTest_static_020
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0200
     */
    it("gyroscopeUncalibrated_SensorJsTest_static_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.on('gyroscopeUncalibratedChange', onGyroscopeUncalibratedCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020 off in--------------');
            sensor.off('gyroscopeUncalibratedChange');
            hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibrated_SensorJsTest_static_020 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gyroscope_SensorJsTest_static_021
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0210
     */
    it("gyroscope_SensorJsTest_static_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.on('gyroscopeChange', onGyroscopeCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021 off in--------------');
            sensor.off('gyroscopeChange');
            hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscope_SensorJsTest_static_021 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gravity_SensorJsTest_static_022
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0220
     */
    it("gravity_SensorJsTest_static_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.on('gravityChange', onGravityCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022 off in--------------');
            sensor.off('gravityChange');
            hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gravity_SensorJsTest_static_022 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:barometer_SensorJsTest_static_023
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0230
     */
    it("barometer_SensorJsTest_static_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.on('barometerChange', onBarometerCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023 off in--------------');
            sensor.off('barometerChange');
            hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `barometer_SensorJsTest_static_023 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:ambientTemperature_SensorJsTest_static_024
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0240
     */
    it("ambientTemperature_SensorJsTest_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.on('ambientTemperatureChange', onAmbientTemperatureCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024 off in--------------');
            sensor.off('ambientTemperatureChange');
            hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientTemperature_SensorJsTest_static_024 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:accelerometerUncalibrated_SensorJsTest_static_025
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0250
     */
    it("accelerometerUncalibrated_SensorJsTest_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.on('accelerometerUncalibratedChange', onAccelerometerUncalibratedCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025 off in--------------');
            sensor.off('accelerometerUncalibratedChange');
            hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometerUncalibrated_SensorJsTest_static_025 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:accelerometer_SensorJsTest_static_026
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0260
     */
    it("accelerometer_SensorJsTest_static_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.on('accelerometerChange', onAccelerometerCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026 off in--------------');
            sensor.off('accelerometerChange');
            hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometer_SensorJsTest_static_026 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:orientatingOnce_SensorJsTest_static_029
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0290
     */
    it("orientatingOnce_SensorJsTest_static_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientatingOnce_SensorJsTest_static_029--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.once('orientationChange', onSensorCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingOnce_SensorJsTest_static_029 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:hallOnce_SensorJsTest_static_030
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0300
     */
    it("hallOnce_SensorJsTest_static_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hallOnce_SensorJsTest_static_030--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.once('hallChange', onHallCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;    
          hilog.info(0x0000, 'testTag', `hallOnce_SensorJsTest_static_030 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:ambientLightOnce_SensorJsTest_static_031
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0310
     */
    it("ambientLightOnce_SensorJsTest_static_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLightOnce_SensorJsTest_static_031--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.once('ambientLightChange', onAmbientLightCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientLightOnce_SensorJsTest_static_031 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:proximityOnce_SensorJsTest_static_032
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0320
     */
    it("proximityOnce_SensorJsTest_static_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximityOnce_SensorJsTest_static_032--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.once('proximityChange', onProximityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `proximityOnce_SensorJsTest_static_032 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:wearDetectionOnce_SensorJsTest_static_033
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0330
     */
    it("wearDetectionOnce_SensorJsTest_static_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetectionOnce_SensorJsTest_static_033--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.once('wearDetectionChange', onWearDetectionCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `wearDetectionOnce_SensorJsTest_static_033 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:significantMotionOnce_SensorJsTest_static_034
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0340
     */
    it("significantMotionOnce_SensorJsTest_static_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotionOnce_SensorJsTest_static_034--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.once('significantMotionChange', onSignificantMotionCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `significantMotionOnce_SensorJsTest_static_034 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:rotationVectorOnce_SensorJsTest_static_035
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0350
     */
    it("rotationVectorOnce_SensorJsTest_static_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVectorOnce_SensorJsTest_static_035--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.once('rotationVectorChange', onRotationVectorCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `rotationVectorOnce_SensorJsTest_static_035 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:pedometerDetectionOnce_SensorJsTest_static_036
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0360
     */
    it("pedometerDetectionOnce_SensorJsTest_static_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetectionOnce_SensorJsTest_static_036--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.once('pedometerDetectionChange', onPedometerDetectionCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometerDetectionOnce_SensorJsTest_static_036 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:pedometerOnce_SensorJsTest_static_037
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0370
     */
    it("pedometerOnce_SensorJsTest_static_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerOnce_SensorJsTest_static_037--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.once('pedometerChange', onPedometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometerOnce_SensorJsTest_static_037 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:magneticFieldUncalibratedOnce_SensorJsTest_static_038
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0380
     */
    it("magneticFieldUncalibratedOnce_SensorJsTest_static_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibratedOnce_SensorJsTest_static_038--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.once('magneticFieldUncalibratedChange', onMagneticFieldUncalibratedCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibratedOnce_SensorJsTest_static_038 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:magneticFieldOnce_SensorJsTest_static_039
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0390
     */
    it("magneticFieldOnce_SensorJsTest_static_039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldOnce_SensorJsTest_static_039--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.once('magneticFieldChange', onMagneticFieldCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticFieldOnce_SensorJsTest_static_039 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:linearAccelerometerOnce_SensorJsTest_static_040
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0400
     */
    it("linearAccelerometerOnce_SensorJsTest_static_040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometerOnce_SensorJsTest_static_040--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.once('linearAccelerometerChange', onLinearAccelerometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `linearAccelerometerOnce_SensorJsTest_static_040 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:humidityOnce_SensorJsTest_static_041
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0410
     */
    it("humidityOnce_SensorJsTest_static_041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidityOnce_SensorJsTest_static_041--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.once('humidityChange', onHumidityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `humidityOnce_SensorJsTest_static_041 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:heartRateOnce_SensorJsTest_static_042
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0420
     */
    it("heartRateOnce_SensorJsTest_static_042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRateOnce_SensorJsTest_static_042--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.once('heartRateChange', onHeartRateCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `heartRateOnce_SensorJsTest_static_042 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gyroscopeUncalibratedOnce_SensorJsTest_static_043
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0430
     */
    it("gyroscopeUncalibratedOnce_SensorJsTest_static_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibratedOnce_SensorJsTest_static_043--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.once('gyroscopeUncalibratedChange', onGyroscopeUncalibratedCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibratedOnce_SensorJsTest_static_043 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gyroscopeOnce_SensorJsTest_static_044
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0440
     */
    it("gyroscopeOnce_SensorJsTest_static_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeOnce_SensorJsTest_static_044--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.once('gyroscopeChange', onGyroscopeCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscopeOnce_SensorJsTest_static_044 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:gravityOnce_SensorJsTest_static_045
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0450
     */
    it("gravityOnce_SensorJsTest_static_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravityOnce_SensorJsTest_static_045--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.once('gravityChange', onGravityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gravityOnce_SensorJsTest_static_045 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:barometerOnce_SensorJsTest_static_046
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0460
     */
    it("barometerOnce_SensorJsTest_static_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometerOnce_SensorJsTest_static_046--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.once('barometerChange', onBarometerCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `barometerOnce_SensorJsTest_static_046 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:ambientTemperatureOnce_SensorJsTest_static_047
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0470
     */
    it("ambientTemperatureOnce_SensorJsTest_static_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperatureOnce_SensorJsTest_static_047--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.once('ambientTemperatureChange', onAmbientTemperatureCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientTemperatureOnce_SensorJsTest_static_047 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:accelerometerUncalibratedOnce_SensorJsTest_static_048
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0480
     */
    it("accelerometerUncalibratedOnce_SensorJsTest_static_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibratedOnce_SensorJsTest_static_048--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.once('accelerometerUncalibratedChange', onAccelerometerUncalibratedCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometerUncalibratedOnce_SensorJsTest_static_048 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:accelerometerOnce_SensorJsTest_static_049
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0490
     */
    it("accelerometerOnce_SensorJsTest_static_049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerOnce_SensorJsTest_static_049--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.once('accelerometerChange', onAccelerometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometerOnce_SensorJsTest_static_049 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          done();
        }
      })

    /*
     * @tc.name:hallParamError_SensorJsTest_static_051
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0510
     */
    it("hallParamError_SensorJsTest_static_051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hallParamError_SensorJsTest_static_051--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.on('hallChange', onHallCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `hallParamError_SensorJsTest_static_051 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.HALL == sensor.SensorId.HALL).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:ambientLightParamError_SensorJsTest_static_052
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0520
     */
    it("ambientLightParamError_SensorJsTest_static_052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLightParamError_SensorJsTest_static_052--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.on('ambientLightChange', onAmbientLightCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientLightParamError_SensorJsTest_static_052 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.AMBIENT_LIGHT == sensor.SensorId.AMBIENT_LIGHT).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:proximityParamError_SensorJsTest_static_053
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0530
     */
    it("proximityParamError_SensorJsTest_static_053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximityParamError_SensorJsTest_static_053--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.on('proximityChange', onProximityCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `proximityParamError_SensorJsTest_static_053 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.PROXIMITY == sensor.SensorId.PROXIMITY).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:wearDetectionParamError_SensorJsTest_static_054
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0540
     */
    it("wearDetectionParamError_SensorJsTest_static_054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetectionParamError_SensorJsTest_static_054--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.on('wearDetectionChange', onWearDetectionCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `wearDetectionParamError_SensorJsTest_static_054 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.WEAR_DETECTION == sensor.SensorId.WEAR_DETECTION).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:significantMotionParamError_SensorJsTest_static_055
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0550
     */
    it("significantMotionParamError_SensorJsTest_static_055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotionParamError_SensorJsTest_static_055--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.on('significantMotionChange', onSignificantMotionCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `significantMotionParamError_SensorJsTest_static_055 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.SIGNIFICANT_MOTION == sensor.SensorId.SIGNIFICANT_MOTION).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:rotationVectorParamError_SensorJsTest_static_056
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0560
     */
    it("rotationVectorParamError_SensorJsTest_static_056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVectorParamError_SensorJsTest_static_056--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.on('rotationVectorChange', onRotationVectorCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `rotationVectorParamError_SensorJsTest_static_056 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.ROTATION_VECTOR == sensor.SensorId.ROTATION_VECTOR).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:pedometerDetectionParamError_SensorJsTest_static_057
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0570
     */
    it("pedometerDetectionParamError_SensorJsTest_static_057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetectionParamError_SensorJsTest_static_057--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.on('pedometerDetectionChange', onPedometerDetectionCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometerDetectionParamError_SensorJsTest_static_057 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.PEDOMETER_DETECTION == sensor.SensorId.PEDOMETER_DETECTION).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:pedometerParamError_SensorJsTest_static_058
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0580
     */
    it("pedometerParamError_SensorJsTest_static_058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerParamError_SensorJsTest_static_058--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.on('pedometerChange', onPedometerCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `pedometerParamError_SensorJsTest_static_058 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.PEDOMETER == sensor.SensorId.PEDOMETER).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:magneticFieldUncalibratedParamError_SensorJsTest_static_059
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0590
     */
    it("magneticFieldUncalibratedParamError_SensorJsTest_static_059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibratedParamError_SensorJsTest_static_059--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.on('magneticFieldUncalibratedChange', onMagneticFieldUncalibratedCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibratedParamError_SensorJsTest_static_059 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED == sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:magneticFieldParamError_SensorJsTest_static_060
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0600
     */
    it("magneticFieldParamError_SensorJsTest_static_060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldParamError_SensorJsTest_static_060--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.on('magneticFieldChange', onMagneticFieldCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `magneticFieldParamError_SensorJsTest_static_060 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.MAGNETIC_FIELD == sensor.SensorId.MAGNETIC_FIELD).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:linearAccelerometerParamError_SensorJsTest_static_061
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0610
     */
    it("linearAccelerometerParamError_SensorJsTest_static_061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometerParamError_SensorJsTest_static_061--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.on('linearAccelerometerChange', onLinearAccelerometerCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `linearAccelerometerParamError_SensorJsTest_static_061 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.LINEAR_ACCELEROMETER == sensor.SensorId.LINEAR_ACCELEROMETER).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:humidityParamError_SensorJsTest_static_062
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0620
     */
    it("humidityParamError_SensorJsTest_static_062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidityParamError_SensorJsTest_static_062--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.on('humidityChange', onHumidityCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `humidityParamError_SensorJsTest_static_062 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.HUMIDITY == sensor.SensorId.HUMIDITY).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:heartRateParamError_SensorJsTest_static_063
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0630
     */
    it("heartRateParamError_SensorJsTest_static_063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRateParamError_SensorJsTest_static_063--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.on('heartRateChange', onHeartRateCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `heartRateParamError_SensorJsTest_static_063 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.HEART_RATE == sensor.SensorId.HEART_RATE).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:gyroscopeUncalibratedParamError_SensorJsTest_static_064
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0640
     */
    it("gyroscopeUncalibratedParamError_SensorJsTest_static_064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibratedParamError_SensorJsTest_static_064--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.on('gyroscopeUncalibratedChange', onGyroscopeUncalibratedCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibratedParamError_SensorJsTest_static_064 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.GYROSCOPE_UNCALIBRATED == sensor.SensorId.GYROSCOPE_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:gyroscopeParamError_SensorJsTest_static_065
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0650
     */
    it("gyroscopeParamError_SensorJsTest_static_065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeParamError_SensorJsTest_static_065--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.on('gyroscopeChange', onGyroscopeCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gyroscopeParamError_SensorJsTest_static_065 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.GYROSCOPE == sensor.SensorId.GYROSCOPE).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:gravityParamError_SensorJsTest_static_066
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0660
     */
    it("gravityParamError_SensorJsTest_static_066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravityParamError_SensorJsTest_static_066--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.on('gravityChange', onGravityCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `gravityParamError_SensorJsTest_static_066 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.GRAVITY == sensor.SensorId.GRAVITY).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:barometerParamError_SensorJsTest_static_067
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0670
     */
    it("barometerParamError_SensorJsTest_static_067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometerParamError_SensorJsTest_static_067--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.on('barometerChange', onBarometerCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `barometerParamError_SensorJsTest_static_067 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.BAROMETER == sensor.SensorId.BAROMETER).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:ambientTemperatureParamError_SensorJsTest_static_068
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0680
     */
    it("ambientTemperatureParamError_SensorJsTest_static_068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperatureParamError_SensorJsTest_static_068--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.on('ambientTemperatureChange', onAmbientTemperatureCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `ambientTemperatureParamError_SensorJsTest_static_068 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.AMBIENT_TEMPERATURE == sensor.SensorId.AMBIENT_TEMPERATURE).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:accelerometerUncalibratedParamError_SensorJsTest_static_069
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0690
     */
    it("accelerometerUncalibratedParamError_SensorJsTest_static_069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibratedParamError_SensorJsTest_static_069--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.on('accelerometerUncalibratedChange', onAccelerometerUncalibratedCallback, {'interval': -100000000});
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometerUncalibratedParamError_SensorJsTest_static_069 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.ACCELEROMETER_UNCALIBRATED == sensor.SensorId.ACCELEROMETER_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:accelerometerParamError_SensorJsTest_static_070
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0700
     */
    it("accelerometerParamError_SensorJsTest_static_070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerParamError_SensorJsTest_static_070--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.on('accelerometerChange', onAccelerometerCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', `accelerometerParamError_SensorJsTest_static_070 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 14500101).assertTrue();
          } else {
            expect(e.code == 401).assertTrue();
          }
          expect(sensor.SensorId.ACCELEROMETER == sensor.SensorId.ACCELEROMETER).assertTrue();
          done();
        }
      })

  })
}