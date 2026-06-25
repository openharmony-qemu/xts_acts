'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, afterEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError, RecordData } from '@ohos.base';

let DOMAIN: int = 0x0000;
let context: common.UIAbilityContext | undefined;

export default function StartSelfUIAbilityInChildProcessTestStatic() {
  describe('StartSelfUIAbilityInChildProcessTestStatic', (): void => {
    try {
      loadLibrary('entry');
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    beforeAll(async() => {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.startselfuiabilityinchildprocesstest.static');
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0300
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0300
     * @tc.desc test startSelfUIAbilityInChildProcess errorcode 801
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0300', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0300';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      try {
        context?.startSelfUIAbilityInChildProcess({}, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', 'startSelfUIAbilityInChildProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((e: Error): void => {
            let msg = `startSelfUIAbilityInChildProcess error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 801 || e.code === 16000123;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `startSelfUIAbilityInChildProcess failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
     }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0400
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0400
     * @tc.desc test startSelfUIAbilityInChildProcess SingletonAbility failure even if flag is different 16000131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0400', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0400';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: 'SingletonAbility'
      };

      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
         })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
        await Utils.msSleep(300);
        context?.startSelfUIAbilityInChildProcess(want, '2')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} start2 succeed');
            expect().assertFail();
            done();
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} start2 error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(16000131);
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0500
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0500
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName empty 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0500', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0500';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: '',
        abilityName: 'MultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000123 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0600
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0600
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName not set 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0600', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0600';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        abilityName: 'MultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000123 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `startSelfUIAbilityInChildProcess failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0700
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0700
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName error 16000130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0700', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0700';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.aaa.bbb',
        abilityName: 'MultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000130 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0800
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0800
     * @tc.desc test startSelfUIAbilityInChildProcess moduleName error 16000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0800', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0800';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        moduleName: 'errorModuleName',
        abilityName: 'MultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000001 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0900
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0900
     * @tc.desc test startSelfUIAbilityInChildProcess abilityName error 16000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0900', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_0900';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: 'errorMultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000001 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1000
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1000
     * @tc.desc test startSelfUIAbilityInChildProcess abilityName empty 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1000', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1000';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: ''
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '1')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 16000123 || e.code === 801;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1300
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1300
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success for first time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1300', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1300';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest.static';
      let abilityName: string = 'SpecifiedAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startSpecifiedAbilityResult']
      };
      try {
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '13')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })

      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1400
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1400
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility failure for the same flag 16000131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1400', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1400';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: 'SpecifiedAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '2')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
        await Utils.msSleep(300);
        context?.startSelfUIAbilityInChildProcess(want, '2')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} start2 succeed');
            expect().assertFail();
            done();
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} start2 error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(16000131);
            done();
          });

      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1500
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1500
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success when flag is different
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1500', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1500';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest.static';
      let abilityName: string = 'SpecifiedAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startSpecifiedAbilityResult']
      };

      try {
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '15')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })
        await Utils.msSleep(300);
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '152')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1600
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1600
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for first time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1600', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1600';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest.static';
      let abilityName: string = 'MultitonAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startMultitonAbilityResult']
      };

      try {
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '16')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1700
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1700
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for the same flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1700', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1700';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest.static';
      let abilityName: string = 'MultitonAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startMultitonAbilityResult']
      };
      try {
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '17')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })
        await Utils.msSleep(300);
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            commonEventManager.subscribe(subscriber,
              (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
                let result: string = '';
                if (eventData?.parameters?.['result']) {
                  result = eventData?.parameters?.['result'] as string;
                }

                let res: boolean = result.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                done();
              });
            context?.startSelfUIAbilityInChildProcess(want, '17')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
        })
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1800
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1800
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for different flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1800', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1800';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: 'MultitonAbility'
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '3')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            context?.startSelfUIAbilityInChildProcess(want, '4')
              .then((): void => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} start2 succeed');
                done();
              })
              .catch((e: Error): void => {
                let msg = `${CASE_NAME} start2 error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect().assertFail();
                done();
              });
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1900
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1900
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success with empty flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1900', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_1900';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest.static',
        abilityName: 'SpecifiedAbility'
      };
      let first: boolean = false;
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            first = true;
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
      await Utils.msSleep(300);
      try {
        context?.startSelfUIAbilityInChildProcess(want, '')
          .then((): void => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} start2 succeed');
            expect(first).assertTrue();
            done();
          })
          .catch((e: Error): void => {
            let msg = `${CASE_NAME} start2 error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect().assertFail();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} start2 failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_2000
     * @tc.desc   Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_2000', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_static_2000';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'SpecifiedAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        await context?.startSelfUIAbilityInChildProcess(want, '20')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
         })
          .catch((e: Error) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 801 || e.code === 16000050;
            expect(result).assertTrue();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

  })
}