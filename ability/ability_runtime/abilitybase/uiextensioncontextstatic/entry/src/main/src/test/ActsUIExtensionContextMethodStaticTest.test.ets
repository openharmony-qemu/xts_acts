/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContextMethodStaticTest';
const BUNDLE_NAME: string = 'com.example.uiextensioncontexttest.static';
const ABILITY_NAME: string = 'TestEntryAbility';
const WAIT_TIME2000: int = 2000;
const WAIT_TIME500: int = 500;
const PARAM_FAIL: string = 'fail';
const PARAM_TRUE: string = 'true';
const PARAM_FALSE: string = 'false';
const EVENT_TERMINATE: string = 'terminate';
const ERROR_CODE_401: int = 401;
const ERROR_CODE_801: int = 801;
const ERROR_CODE_16000001: int = 16000001;
const ERROR_CODE_16000019: int = 16000019;
const ERROR_CODE_16000050: int = 16000050;
const TEST_RESULT_KEY: string = 'result';

function msSleep(count: int) {
  waitForCompletion(async ()=> { await Utils.msSleep(count); });
}

let sub: commonEventManager.CommonEventSubscriber;
let testAbilityContext: common.UIAbilityContext|null = null;
let mpEnable: string = PARAM_FAIL;

export default function ActsUIExtensionContextMethodStaticTest() {
  describe('ActsUIExtensionContextMethodStaticTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      msSleep(WAIT_TIME2000);
      
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ActsUIExtensionContextMethodStaticTest Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = PARAM_FAIL;
      }

      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })
    
    afterEach(async () => {
      await Utils.msSleep(WAIT_TIME500);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4200
     * @tc.desc   UIExtensionContext openLink with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4200';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_401);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4300
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4300
     * @tc.desc   Test UIExtensionContext openLink with invalid string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4300';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_16000019);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4400
     * @tc.desc   Test UIExtensionContext openLink with OpenLinkOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4400';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_16000019);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4500
     * @tc.desc   Test UIExtensionContext openLink with OpenLinkOptions with callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4500';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_16000019);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4600
     * @tc.desc   Test UIExtensionContext openAtomicService with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4600';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_16000050);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4700
     * @tc.desc   Test UIExtensionContext openAtomicService with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4700', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_4700';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_16000050);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1400
     * @tc.desc   Test UIExtensionContext startUIServiceExtensionAbility 16000001 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1400', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_1400';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            if (result !== ERROR_CODE_801) {
              expect(result).assertEqual(ERROR_CODE_16000001);
            } else {
              expect(result).assertEqual(ERROR_CODE_801);
            }
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1500
     * @tc.desc   Test UIExtensionContext connectUIServiceExtensionAbility 16000001 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1500', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_1500';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            if (result !== ERROR_CODE_801) {
              expect(result).assertEqual(ERROR_CODE_16000001);
            } else {
              expect(result).assertEqual(ERROR_CODE_801);
            }
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1600
     * @tc.desc   Test UIExtensionContext disconnectUIServiceExtensionAbility 401 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1600', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext_1600';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            if (result !== ERROR_CODE_801) {
              expect(result).assertEqual(ERROR_CODE_401);
            } else {
              expect(result).assertEqual(ERROR_CODE_801);
            }
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });
  })
}