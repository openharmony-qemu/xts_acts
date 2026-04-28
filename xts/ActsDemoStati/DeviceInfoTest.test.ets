/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import {
    afterAll,
    afterEach,
    beforeAll,
    beforeEach,
    describe,
    expect,
    it,
    Level,
    Size,
    TestType
  } from '../../../../hypium/index';
  import { BusinessError } from '@ohos.base';
  import geoLocationManager from '@ohos.geoLocationManager';

  export default function xmlTest1() {
    describe('xmlTest1', (): void => {
         /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0100
         * @tc.name  Sub_Location_core_getCurrentLocation_0100
         * @tc.desc  onLocationError(callback: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
         it('Sub_Location_core_getCurrentLocation_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
          let requestInfo: geoLocationManager.LocationRequest = {
              'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
              'scenario': geoLocationManager.LocationRequestScenario.UNSET,
              'timeInterval': 1,
              'distanceInterval': 0,
              'maxAccuracy': 0
            };
            let locationChange = (location: geoLocationManager.Location): void => {
              console.info('Sub_Location_core_getCurrentLocation_0100: data: ' + JSON.stringify(location));
              expect(true).assertEqual(location!=null);
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>latitude ', typeof location.latitude)
              expect(typeof location.latitude).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>longitude ', typeof location.longitude)
              expect(typeof location.longitude).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>altitude ', typeof location.altitude)
              expect(typeof location.altitude).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>accuracy ', typeof location.accuracy)
              expect(typeof location.accuracy).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>speed ', typeof location.speed)
              expect(typeof location.speed).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>timeStamp', typeof location.timeStamp)
              expect(typeof location.timeStamp).assertEqual('long');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>direction', typeof location.direction)
              expect(typeof location.direction).assertEqual('number');
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>timeSinceBoot', typeof location.timeSinceBoot)
              expect(typeof location.timeSinceBoot).assertEqual('long');
              if (location.additions) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>additions', typeof location.additions)
              expect(location.additions instanceof Array);
              }
              if (location.additionSize) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>additionSize', typeof location.additionSize)
              expect(typeof location.additionSize).assertEqual('int');
              }
              if (location.additionsMap) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>additionsMap', typeof location.additionsMap)
              expect(location.additionsMap instanceof Map);
              }
              if (location.altitudeAccuracy) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>altitudeAccuracy', typeof location.altitudeAccuracy)
              expect(typeof location.altitudeAccuracy).assertEqual('number');
              }
              if (location.speedAccuracy) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>speedAccuracy', typeof location.speedAccuracy)
              expect(typeof location.speedAccuracy).assertEqual('number');
              }
              
              if (location.directionAccuracy) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>directionAccuracy', typeof location.directionAccuracy)
              expect(typeof location.directionAccuracy).assertEqual('number');
              }
              
              if (location.uncertaintyOfTimeSinceBoot) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>uncertaintyOfTimeSinceBoot', typeof location.uncertaintyOfTimeSinceBoot)
              expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual('long');
              }
              
              if (location.sourceType) {
              console.info('Sub_Location_core_getCurrentLocation_0100 ======>sourceType', typeof location.sourceType)
              expect(typeof location.sourceType).assertEqual('int');
              }

              if (location.poi) {
                expect(location.poi != null).assertTrue();
              }
            };
            try {
              geoLocationManager.onLocationChange(requestInfo, locationChange);
            } catch (err) {
              console.error('Sub_Location_core_getCurrentLocation_0100 errCode:' + err.code + ', message:' + err.message);
              expect(err.code).assertEqual(801);
            }
        done();
      })

      /**
       * @tc.number  Sub_Location_core_getCurrentLocation_0200
       * @tc.name  Sub_Location_core_getCurrentLocation_0200
       * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
       * @tc.level  Level 0
       * @tc.type  Function
       * @tc.size  MEDIUMTEST
       */
      it('Sub_Location_core_getCurrentLocation_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
          try {
            geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                  if (location) {
                    expect(location!=null).assertTrue();
                    console.info('Sub_Location_core_getCurrentLocation_0200: location=' + JSON.stringify(location));
                    expect(true).assertEqual(location!=null);
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>latitude ', typeof location.latitude)
                    expect(typeof location.latitude).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>longitude ', typeof location.longitude)
                    expect(typeof location.longitude).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>altitude ', typeof location.altitude)
                    expect(typeof location.altitude).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>accuracy ', typeof location.accuracy)
                    expect(typeof location.accuracy).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>speed ', typeof location.speed)
                    expect(typeof location.speed).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>timeStamp', typeof location.timeStamp)
                    expect(typeof location.timeStamp).assertEqual('long');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>direction', typeof location.direction)
                    expect(typeof location.direction).assertEqual('number');
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>timeSinceBoot', typeof location.timeSinceBoot)
                    expect(typeof location.timeSinceBoot).assertEqual('long');
                    if (location.additions) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>additions', typeof location.additions)
                    expect(location.additions instanceof Array);
                    }
                    if (location.additionSize) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>additionSize', typeof location.additionSize)
                    expect(typeof location.additionSize).assertEqual('int');
                    }
                    if (location.additionsMap) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>additionsMap', typeof location.additionsMap)
                    expect(location.additionsMap instanceof Map);
                    }
                    if (location.altitudeAccuracy) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>altitudeAccuracy', typeof location.altitudeAccuracy)
                    expect(typeof location.altitudeAccuracy).assertEqual('number');
                    }
                    if (location.speedAccuracy) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>speedAccuracy', typeof location.speedAccuracy)
                    expect(typeof location.speedAccuracy).assertEqual('number');
                    }
                    
                    if (location.directionAccuracy) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>directionAccuracy', typeof location.directionAccuracy)
                    expect(typeof location.directionAccuracy).assertEqual('number');
                    }
                    
                    if (location.uncertaintyOfTimeSinceBoot) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>uncertaintyOfTimeSinceBoot', typeof location.uncertaintyOfTimeSinceBoot)
                    expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual('long');
                    }
                    
                    if (location.sourceType) {
                    console.info('Sub_Location_core_getCurrentLocation_0200 ======>sourceType', typeof location.sourceType)
                    expect(typeof location.sourceType).assertEqual('int');
                    }

                    if (location.poi) {
                      expect(location.poi != null).assertTrue();
                    }
                  }
                  if (err) {
                    console.error('Sub_Location_core_getCurrentLocation_0200: err=' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                  }
            });
          } catch (err) {
            console.error('Sub_Location_core_getCurrentLocation_0200 errCode:' + err.code + ', message:' + err.message);
            expect(err.code).assertEqual(801);
          }
        done();
      });
    })
  }
  
  