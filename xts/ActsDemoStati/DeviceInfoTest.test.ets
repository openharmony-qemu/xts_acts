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
  import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import AbilityStage from "@ohos.app.ability.AbilityStage"
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let addMonitor = false;
let removeMonitor = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityStageContext: common.AbilityStageContext

  export default function xmlTest1() {
    describe('xmlTest1', (): void => {
         /**
         * @tc.number  Sub_Loca_core_getCurrentLocation_0100
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
              expect(typeof location.altitudeAccuracy).assertEqual('number1');
              expect(typeof location.altitudeAccuracy).assertEqual('number2');
              expect(typeof location.altitudeAccuracy).assertEqual('number3');
              expect(typeof location.altitudeAccuracy).assertEqual('number4');
              expect(typeof location.altitudeAccuracy).assertEqual('number6');
              expect(typeof location.altitudeAccuracy).assertEqual('number5');
              expect(typeof location.altitudeAccuracy).assertEqual('number7');
              expect(typeof location.altitudeAccuracy).assertEqual('number8');
              expect(typeof location.altitudeAccuracy).assertEqual('number9');
              expect(typeof location.altitudeAccuracy).assertEqual('number11');
              expect(typeof location.altitudeAccuracy).assertEqual('number12');
              expect(typeof location.altitudeAccuracy).assertEqual('number13');
              expect(typeof location.altitudeAccuracy).assertEqual('number14');
              expect(typeof location.altitudeAccuracy).assertEqual('number15');
              expect(typeof location.altitudeAccuracy).assertEqual('number16');
              expect(typeof location.altitudeAccuracy).assertEqual('number17');
              expect(typeof location.altitudeAccuracy).assertEqual('number18');
              expect(typeof location.altitudeAccuracy).assertEqual('number19');
              expect(typeof location.altitudeAccuracy).assertEqual('number21');
              expect(typeof location.altitudeAccuracy).assertEqual('number22');
              expect(typeof location.altitudeAccuracy).assertEqual('number23');
              expect(typeof location.altitudeAccuracy).assertEqual('number24');
              expect(typeof location.altitudeAccuracy).assertEqual('number25');
              expect(typeof location.altitudeAccuracy).assertEqual('number26');
              expect(typeof location.altitudeAccuracy).assertEqual('number27');
              expect(typeof location.altitudeAccuracy).assertEqual('number28');
              expect(typeof location.altitudeAccuracy).assertEqual('number29');
              expect(typeof location.altitudeAccuracy).assertEqual('number31');
              expect(typeof location.altitudeAccuracy).assertEqual('number32');
              expect(typeof location.altitudeAccuracy).assertEqual('number33');
              expect(typeof location.altitudeAccuracy).assertEqual('number34');
              expect(typeof location.altitudeAccuracy).assertEqual('number35');
              expect(typeof location.altitudeAccuracy).assertEqual('number36');
              expect(typeof location.altitudeAccuracy).assertEqual('number37');
              expect(typeof location.altitudeAccuracy).assertEqual('number38');
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
       * @tc.number  Sub_Loca_core_getCurrentLocation_0200
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

          hilog.info(domain, tag, 'beforeAll start');
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
          console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stagecontexttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
      
          abilityStageContext = AppStorage.get<common.AbilityStageContext>("abilityStageContext") as common.AbilityStageContext
      hilog.info(domain, tag, 'abilityStageContextStatic001 info ' + JSON.stringify(abilityStageContext));
      try {
        hilog.info(domain, tag, 'abilityStageContextStatic001 info ' + JSON.stringify(abilityStageContext));
        if (abilityStageContext) {
          expect(abilityStageContext != null).assertTrue();
          let abilityInfo = abilityStageContext.currentHapModuleInfo;
          hilog.info(domain, tag, 'abilityStageContextStatic001 info ' + JSON.stringify(abilityInfo));
          expect(abilityInfo != null).assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.name: ` + abilityInfo.name);
          expect(abilityInfo.name == "entry").assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.icon: ` + abilityInfo.icon);
          expect(abilityInfo.icon == "$media:layered_image").assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.iconId: ` + abilityInfo.iconId);
          expect(typeof (abilityInfo.iconId) == 'long').assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.label: ` + abilityInfo.label);
          expect(abilityInfo.label == "$string:EntryAbility_label").assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.labelId: ` + abilityInfo.labelId);
          expect(typeof (abilityInfo.labelId) == 'long').assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.description: ` + abilityInfo.description);
          expect(abilityInfo.description == "$string:module_desc").assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.descriptionId: ` + abilityInfo.descriptionId);
          expect(typeof (abilityInfo.descriptionId) == 'long').assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.mainElementName: ` + abilityInfo.mainElementName);
          expect(abilityInfo.mainElementName == "EntryAbility").assertTrue();
          hilog.info(domain, tag, `abilityStageContextStatic001 abilityInfo.metadata: ` + abilityInfo.metadata.length);
          expect(abilityInfo.metadata.length >= 0).assertTrue();

          let config = abilityStageContext.config
          hilog.info(domain, tag, `abilityStageContextStatic001 config.language: ` + config.language);
          expect(abilityStageContext.config.language).not().assertUndefined();
          expect(abilityStageContext.config.language).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.colorMode: ` + config.colorMode);
          expect(abilityStageContext.config.colorMode).not().assertUndefined();
          expect(abilityStageContext.config.colorMode).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.direction: ` + config.direction);
          expect(abilityStageContext.config.direction).not().assertUndefined();
          expect(abilityStageContext.config.direction).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.screenDensity: ` + config.screenDensity);
          expect(abilityStageContext.config.screenDensity).not().assertUndefined();
          expect(abilityStageContext.config.screenDensity).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.displayId: ` + config.displayId);
          expect(abilityStageContext.config.displayId).not().assertUndefined();
          expect(abilityStageContext.config.displayId).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.hasPointerDevice: ` + config.hasPointerDevice);
          expect(abilityStageContext.config.hasPointerDevice).not().assertUndefined();
          expect(abilityStageContext.config.hasPointerDevice).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.fontId: ` + config.fontId);
          expect(abilityStageContext.config.fontId).not().assertUndefined();
          expect(abilityStageContext.config.fontId).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.fontSizeScale: ` + config.fontSizeScale);
          expect(abilityStageContext.config.fontSizeScale).not().assertUndefined();
          expect(abilityStageContext.config.fontSizeScale).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.fontWeightScale: ` + config.fontWeightScale);
          expect(abilityStageContext.config.fontWeightScale).not().assertUndefined();
          expect(abilityStageContext.config.fontWeightScale).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.mcc: ` + config.mcc);
          expect(abilityStageContext.config.mcc).not().assertUndefined();
          expect(abilityStageContext.config.mcc).not().assertNull();
          hilog.info(domain, tag, `abilityStageContextStatic001 config.mnc: ` + config.mnc);
          expect(abilityStageContext.config.mnc).not().assertUndefined();
          expect(abilityStageContext.config.mnc).not().assertNull();
          hilog.info(domain, tag, 'abilityStageContextStatic001 config.locale: ' + config.locale);
          expect(abilityStageContext.config.locale).not().assertUndefined();
          expect(abilityStageContext.config.locale).not().assertNull();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, 'testAbilityInfoStatic001 fail: ' + err);
        expect().assertFail();
        done();
      }

        done();
      });
    })
  }
  
  