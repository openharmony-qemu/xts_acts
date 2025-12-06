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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import wantAgent from '@ohos.app.ability.wantAgent'
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsShortTimeTaskManagerStaticTest() {
  describe('ActsShortTimeTaskManagerStaticTest', () => {

    /**
     * @tc.name   ACTS_StageContext_Static_1600
     * @tc.number ACTS_StageContext_Static_1600
     * @tc.desc   test CreateModuleContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ACTS_StageContext_Static_1600 begin");
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success');
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          done();
        }).catch((error : BusinessError): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error : BusinessError) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start5 ');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/-777");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result); //-777

        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('-777');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start5 successful ');

        done();
      });

    /**
     * @tc.name   ACTS_StageContext_Static_1700
     * @tc.number ACTS_StageContext_Static_1700
     * @tc.desc   test CreateModuleContext with invalid param to verify the errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'ACTS_StageContext_Static_1700 begin');
      let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        application.createModuleContext(context, 'entrytest').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success');
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + `${Context.applicationInfo.name}`);
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          done();
        }).catch((error : BusinessError): void => {
          hilog.info(domain, tag, 'err: createContext fail');
          expect(error.code).assertEqual(401);
          done()
        })
      } catch (paramError: Error) {
        let code: number = (paramError as BusinessError).code;
        hilog.info(domain, tag, 'createContext fail');
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0500
     * @tc.desc   Call UIAbilityContext startAbility succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0500`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbility(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

   /**
     * @tc.name   ACTS_StageContext_Static_0900
     * @tc.number ACTS_StageContext_Static_0900
     * @tc.desc   test EventHub test multiple callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_0900';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      try {
        eventHub.on('event1', callback1);
        eventHub.on('event1', callback2);
        eventHub.on('event1', callback3);
        eventHub.emit('event1');
        expect(`${count1}`).assertEqual('1');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('1')
        eventHub.off('event1', callback2);
        eventHub.emit('event1', '');
        expect(`${count1}`).assertEqual('2');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('2');
        eventHub.off('event1');
        eventHub.emit('event1');
        expect(`${count1}`).assertEqual('2');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('2');
      } catch(err: BusinessError) {
        hilog.info(domain, tag, `${itName} error code: ${err.code}, msg: ${err.message}`);
      }
      done();
      hilog.info(domain, tag, `${itName} end`);
    });


    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start1 ');
        let idint = 1122;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start1 successful ');

        done();
      });

    /**
     * @tc.name   ACTS_StageContext_Static_1000
     * @tc.number ACTS_StageContext_Static_1000
     * @tc.desc   test EventHub test different events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1000';
      const eventHub = context.eventHub;
      hilog.info(domain, tag, `${itName} eventHub: ${!!eventHub}`);
      eventHub.on('event1', callback1);
      eventHub.on('event2', callback2);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('0');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('1');
      eventHub.off('event1');
      eventHub.emit('event1');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('2');
      eventHub.off('event2');
      eventHub.emit('event1');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('2');
      done();
      hilog.info(domain, tag, `${itName} end`);
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0100
     * @tc.desc   Call UIAbilityContext startAbility succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0100`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ACTS_StageContext_Static_1100
     * @tc.number ACTS_StageContext_Static_1100
     * @tc.desc   test EventHub test repeat on/off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1100';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      eventHub.on('event1', callback1);
      eventHub.on('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      eventHub.off('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      eventHub.off('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      done();
      hilog.info(domain, tag, `${itName} end`);
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start2 ');
        let idint = 0;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils/777", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/777/0");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start2 successful ');

        done();
      });

    /**
     * @tc.name   ACTS_StageContext_Static_1200
     * @tc.number ACTS_StageContext_Static_1200
     * @tc.desc   test EventHub test call off() in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1200';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback: () => void;
        callback = () => {
          count++;
          hilog.info(domain, tag, `${itName} callback: ${!!callback}`);
          eventHub.off('event1', callback);
        }
        eventHub.on('event1', callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      done();
      hilog.info(domain, tag, `${itName} end`);
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0600
     * @tc.desc   Call UIAbilityContext startAbility failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0600`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbility(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ACTS_StageContext_Static_1300
     * @tc.number ACTS_StageContext_Static_1300
     * @tc.desc   test EventHub test call off() in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1300';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback = () => {
          count++;
          eventHub.off('event1');
        }
        eventHub.on('event1', callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      done();
      hilog.info(domain, tag, `${itName} end`);
    });


    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start3 ');
        let idint = 456789;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils/123", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123/456789");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start3 successful ');

        done();
      });

   /**
     * @tc.name   ACTS_StageContext_Static_1400
     * @tc.number ACTS_StageContext_Static_1400
     * @tc.desc   test EventHub test call on/off in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1400';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback = () => {
          count++;
          eventHub.off('event1', callback1);
          eventHub.on('event1', callback2);
        }
        eventHub.on('event1', callback);
      }
      func();
      eventHub.on('event1', callback1);
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('1');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('0');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('1');
      done();
      hilog.info(domain, tag, `${itName} end`);
    });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001
     * @tc.desc   Test that the requestSuspendDelay function normal call and cancelSuspendDelay function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 begin---');

        try {
          let myReason = 'test requestSuspendDelay';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 Request suspension delay will time out.---');
            })
            let id: number = delayInfo.requestId;
            let time: number = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);
            backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 cancelSuspendDelay success');
            done();
          } catch (error: BusinessError) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 requestSuspendDelay failed. code is: %{public}s' +
              JSON.stringify(error));
          }
        } catch (error: BusinessError) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 aa error: %{public}s' +
          JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 end---');
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start4 ');
        let idint = 123456789011;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123456789011");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start4 successful ');

        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0700
     * @tc.desc   Call UIAbilityContext startAbility with options succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start5 ');
        let idint = -1;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/-1");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start5 successful ');

        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0200
     * @tc.desc   Call UIAbilityContext startAbility failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start1 ');
          let result = dataUriUtils.deleteId("com.ix.dataUriUtils");
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0800
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start2 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start2 successful ');

        done();
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002
     * @tc.desc   Test that the getRemainingDelayTime callback function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 begin---');

        try {
          let myReason = 'test requestSuspendDelay1';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 Request suspension delay will time out.---');
            })
            let id: number = delayInfo.requestId;
            let time: number = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);

            backgroundTaskManager.getRemainingDelayTime(delayInfo.requestId,
              (err: BusinessError<void> | null, res: int | undefined) => {
                if (err) {
                  hilog.info(DOMAIN, TAG,
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 Operation getRemainingDelayTime failed.%{public}s',
                    JSON.stringify(err));
                } else {
                  hilog.info(DOMAIN, TAG, '%{public}s',
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 res: ' + res);
                  expect(res).assertLarger(0);

                  backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
                  hilog.info(DOMAIN, TAG, '%{public}s',
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 cancelSuspendDelay success');
                  done();
                }
              })
          } catch (error: BusinessError) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 requestSuspendDelay failed: %{public}s',
              JSON.stringify(error));
          }
        } catch (error: BusinessError) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 aa error: %{public}s',
            JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 end---');
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start3 ');
          let result = dataUriUtils.deleteId("com.ix.dataUriUtils1122");
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start1');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/1221");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);

        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('1221');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start1 successful');
        done();
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start4 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/-1");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start4 successful ');

        done();
      });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0300
     * @tc.desc   Call UIAbilityContext startAbility with options succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0300`;
      hilog.info(domain, tag, `it begin`);
      let filePath = "/data/storage/el2/base/haps/entry/files/test.pdf";
      let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      const fd: int = file.fd;
      console.log('testTag: fd : ' + fd);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.startabilitytest.static',
        moduleName: 'entry',
        abilityName: 'EntryAbility1',
        action: 'abc',
        entities: ['abc'],
        uri: 'example://www.example.com',
        type: '',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': fd } as Record<string, Object>
        } as Record<string, RecordData>,
        flags: 1,
      };

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(domain, tag,  '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbility_0100 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
          expect(element.abilityName).assertEqual('EntryAbility');
          expect(message).assertContain('Succeeded');
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(domain, tag,  '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbility_0100 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        }
      }

      let options: StartOptions = {
        windowMode: 0,
        displayId: 0,
        withAnimation: true,
        windowLeft: 100,
        windowTop: 100,
        windowWidth: 100,
        windowHeight: 100,
        processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM,
        startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW,
        startWindowIcon: undefined,
        startWindowBackgroundColor: undefined,
        supportWindowModes:[
          bundleManager.SupportWindowMode.FULL_SCREEN,
        ],
        minWindowWidth: 100,
        minWindowHeight: 100,
        maxWindowWidth: 100,
        maxWindowHeight: 100,
        completionHandler: handler,
        hideStartWindow: true
      };
      let options1: StartOptions = {
        displayId: 0,
      };
      try {
        context.startAbility(want, options1).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start5 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122/2211");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start5 successful ');

        done();
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId start2 ');
          let result = dataUriUtils.getId("com.ix.dataUriUtils1221");
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
      });


    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start1 ');
        try {
          let idint = 1122;
          let result = dataUriUtils.updateId("com.ix.dataUriUtils", idint);
          hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'updateId updateId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      });


    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003
     * @tc.desc   Test that the getRemainingDelayTime promise function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 begin---');

        try {
          let myReason = 'test requestSuspendDelay2';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 Request suspension delay will time out.---');
            })
            let id: int = delayInfo.requestId;
            let time: int = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);

            backgroundTaskManager.getRemainingDelayTime(delayInfo.requestId).then((res: int) => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 res: ' + res);
              expect(res).assertLarger(0);
              backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
              hilog.info(DOMAIN, TAG, '%{public}s',
                'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 cancelSuspendDelay success');
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG,
                'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 requestSuspendDelay failed: %{public}s' +
                JSON.stringify(error));
            })
          } catch (error: BusinessError) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 requestSuspendDelay failed: %{public}s' +
              JSON.stringify(error));
          }
        } catch (error: BusinessError) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 aa error: %{public}s',
            JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 end---');
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start2 ');
        try {
          let idint = 1122;
          let result = dataUriUtils.updateId("com.ix.dataUriUtils/", idint)
          hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'updateId updateId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start3 ');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/11234567890");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('11234567890');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start3 successful ');
        done();
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start3 ');
        let idint = 3344;
        let result = dataUriUtils.updateId("com.ix.dataUriUtils/-1", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/3344");
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId_test start3 successful ');

        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbility_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_startAbility_Static_0400
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0400`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start4 ');
        let idint = 5566;
        let result = dataUriUtils.updateId("com.ix.dataUriUtils/123456789011", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/5566");
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId_test start4 successful ');

        done();
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId start4 ');
          let result = dataUriUtils.getId("com.ix.dataUriUtils");
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
        done();
      });

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start5 ');

        let idint = 0;
        expect(typeof (idint)).assertEqual("number");
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start666 ');

        let result = dataUriUtils.updateId("com.ix.dataUriUtils/1122", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/0");
        done();
      });

    /**
     * @tc.name   ACTS_StageContext_Static_1500
     * @tc.number ACTS_StageContext_Static_1500
     * @tc.desc   test CreateModuleContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'ACTS_StageContext_Static_1500 begin');
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success' + JSON.stringify(Context));
          hilog.info(domain, tag, 'createContext area: ' + JSON.stringify(Context.area));
          expect(Context.area + "").assertEqual("1");
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          hilog.info(domain, tag, 'createContext cacheDir: ' + JSON.stringify(Context.cacheDir));
          expect(Context.cacheDir + "").assertEqual("/data/storage/el2/base/cache");
          hilog.info(domain, tag, 'createContext tempDir: ' + JSON.stringify(Context.tempDir));
          expect(Context.tempDir + "").assertEqual("/data/storage/el2/base/temp");
          hilog.info(domain, tag, 'createContext filesDir: ' + JSON.stringify(Context.filesDir));
          expect(Context.filesDir + "").assertEqual("/data/storage/el2/base/files");
          hilog.info(domain, tag, 'createContext databaseDir: ' + JSON.stringify(Context.databaseDir));
          expect(Context.databaseDir + "").assertEqual("/data/storage/el2/database");
          hilog.info(domain, tag, 'createContext preferencesDir: ' + JSON.stringify(Context.preferencesDir));
          expect(Context.preferencesDir + "").assertEqual("/data/storage/el2/base/preferences");
          hilog.info(domain, tag, 'createContext stageMode: ' + JSON.stringify(Context.stageMode));
          expect(Context.stageMode + "").assertEqual("true");
          done();
        }).catch((error : BusinessError): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error : BusinessError) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });

  })
}