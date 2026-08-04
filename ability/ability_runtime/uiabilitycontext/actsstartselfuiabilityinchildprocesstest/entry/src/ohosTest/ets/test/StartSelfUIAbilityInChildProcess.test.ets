/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.startIcon
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError} from '@kit.BasicServicesKit';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: common.UIAbilityContext;
const DOMAIN = 0x0000;
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let cmd = 'aa start -a TestAbility' + ' -b ' + 'com.example.startselfuiabilityinchildprocesstest';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default function StartSelfUIAbilityInChildProcessTest() {
  describe('StartSelfUIAbilityInChildProcessTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
      let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
    })
    beforeEach(() => {
      abilityDelegator.executeShellCommand(cmd);
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0100
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0100
     * @tc.desc test startSelfUIAbilityInChildProcess errorcode 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0100', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0100';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      try {
        context.startSelfUIAbilityInChildProcess(null, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
          })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect().assertFail();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect(e.code).assertEqual(401);
        done();
     }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0200
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0200
     * @tc.desc test startSelfUIAbilityInChildProcess errorcode 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0200', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0200';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      try {
        context.startSelfUIAbilityInChildProcess(undefined, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
          })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect().assertFail();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect(e.code).assertEqual(401);
        done();
     }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0300
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0300
     * @tc.desc test startSelfUIAbilityInChildProcess errorcode 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0300', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0300';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      try {
        context.startSelfUIAbilityInChildProcess({}, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
          })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            let result: boolean = e.code === 801 || e.code === 16000123;
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0400
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0400
     * @tc.desc test startSelfUIAbilityInChildProcess SingletonAbility failure even if flag is different 16000131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0400', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0400';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'SingletonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
         })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
        await sleep(500);
        context.startSelfUIAbilityInChildProcess(want, '2')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} start2 succeed');
            expect().assertFail();
            done();
          })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0500
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0500
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName empty 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0500', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0500';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: '',
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0600
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0600
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName not set 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0600', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0600';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0700
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0700
     * @tc.desc test startSelfUIAbilityInChildProcess bundleName error 16000130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0700', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0700';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.aaa.bbb',
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0800
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0800
     * @tc.desc test startSelfUIAbilityInChildProcess moduleName error 16000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0800', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0800';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        moduleName: 'errorModuleName',
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0900
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0900
     * @tc.desc test startSelfUIAbilityInChildProcess abilityName error 16000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0900', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_0900';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'errorMultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1000
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1000
     * @tc.desc test startSelfUIAbilityInChildProcess abilityName empty 16000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1000', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1000';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: ''
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '1')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1100
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1100
     * @tc.desc test startSelfUIAbilityInChildProcess flag null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1100', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1100';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, null)
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect().assertFail();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1200
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1200
     * @tc.desc test startSelfUIAbilityInChildProcess flag undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1200', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1200';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'MultitonAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, undefined)
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
        })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect().assertFail();
            done();
          });
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    
    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1300
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1300
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success for first time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1300', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1300';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'SpecifiedAbility';
      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
     try {
        await commonEventManager.createSubscriber({
          events: ['startSpecifiedAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateChildAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            context.startSelfUIAbilityInChildProcess(want, '13')
              .then(() => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: BusinessError) => {
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1400
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1400
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility failure for the same flag 16000131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1400', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1400';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'SpecifiedAbility'
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '14')
          .then(async () => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
         })
          .catch((e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(801);
            done();
          });
        await sleep(500);
        await context.startSelfUIAbilityInChildProcess(want, '14')
          .then(async () => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
          })
          .catch(async (e: BusinessError) => {
            let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
            hilog.error(DOMAIN, 'testTag', msg);
            expect(e.code).assertEqual(16000131);
            try {
              await commonEventManager.publish('terminateChildAbility', (result) => {
                hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
              });
            } catch (e) {
              hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
            }
            await sleep(500);
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1500
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1500
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success when flag is different
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1500', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1500';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'SpecifiedAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      try {
        await commonEventManager.createSubscriber({
          events: ['startSpecifiedAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
              });
            await context.startSelfUIAbilityInChildProcess(want, '15')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            })
            .catch((e: BusinessError) => {
              let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
              hilog.error(DOMAIN, 'testTag', msg);
              expect(e.code).assertEqual(801);
              done();
            });
          })
        await sleep(500);
        await commonEventManager.createSubscriber({
          events: ['startSpecifiedAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateChildAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            await context.startSelfUIAbilityInChildProcess(want, '152')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            })
            .catch((e: BusinessError) => {
              let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
              hilog.error(DOMAIN, 'testTag', msg);
              expect().assertFail();
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1600
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1600
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for first time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1600', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1600';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'MultitonAbility';

      try {
        let want: Want = {
          bundleName: bundleName,
          abilityName: abilityName
        };

        await commonEventManager.createSubscriber({
          events: ['startMultitonAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateMultitonAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            await context.startSelfUIAbilityInChildProcess(want, '16')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            })
            .catch((e: BusinessError) => {
              let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
              hilog.error(DOMAIN, 'testTag', msg);
              expect(e.code).assertEqual(801);
              done();
            });
          })
        await sleep(500);
      } catch (e) {
        let msg: string = `${CASE_NAME} failed, code:${e.code}, message:${e.message}`;
        hilog.error(DOMAIN, 'testTag', msg);
        expect().assertFail();
        done();
     }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1700
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1700
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for the same flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1700', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1700';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'MultitonAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
    };
      try {
        await commonEventManager.createSubscriber({
          events: ['startMultitonAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
              });
            await context.startSelfUIAbilityInChildProcess(want, '17')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            })
            .catch((e: BusinessError) => {
              let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
              hilog.error(DOMAIN, 'testTag', msg);
              expect(e.code).assertEqual(801);
              done();
            });
          })
        await sleep(500);
        await commonEventManager.createSubscriber({
          events: ['startMultitonAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean = data.parameters?.result?.startsWith(bundleName+bundleName+':entry:'+abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateMultitonAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            await context.startSelfUIAbilityInChildProcess(want, '17')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            })
            .catch((e: BusinessError) => {
              let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
              hilog.error(DOMAIN, 'testTag', msg);
              expect().assertFail();
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1800
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1800
     * @tc.desc test startSelfUIAbilityInChildProcess MultitonAbility success for different flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1800', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1800';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'MultitonAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      try {
        await commonEventManager.createSubscriber({
          events: ['startMultitonAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean =
                  data.parameters?.result?.startsWith(bundleName + bundleName + ':entry:' + abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
              });
            await context.startSelfUIAbilityInChildProcess(want, '18')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: BusinessError) => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
          })
        await sleep(500);
        await commonEventManager.createSubscriber({
          events: ['startMultitonAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean =
                  data.parameters?.result?.startsWith(bundleName + bundleName + ':entry:' + abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateMultitonAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            await context.startSelfUIAbilityInChildProcess(want, '182')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: BusinessError) => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect().assertFail();
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
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1900
     * @tc.name SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1900
     * @tc.desc test startSelfUIAbilityInChildProcess SpecifiedAbility success with empty flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1900', Level.LEVEL1, async (done: Function) => {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_1900';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let bundleName: string = 'com.example.startselfuiabilityinchildprocesstest';
      let abilityName: string = 'SpecifiedAbility';

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
      };
      try {
        await commonEventManager.createSubscriber({
          events: ['startSpecifiedAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean =
                  data.parameters?.result?.startsWith(bundleName + bundleName + ':entry:' + abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
              });
            await context.startSelfUIAbilityInChildProcess(want, '')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: BusinessError) => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect(e.code).assertEqual(801);
                done();
              });
          })
        await sleep(500);
        await commonEventManager.createSubscriber({
          events: ['startSpecifiedAbilityResult'],
        } as commonEventManager.CommonEventSubscribeInfo)
          .then(async (data: commonEventManager.CommonEventSubscriber) => {
            hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
            subscriber = data;
            await commonEventManager.subscribe(subscriber,
              async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(data)}.`);
                let res: boolean =
                  data.parameters?.result?.startsWith(bundleName + bundleName + ':entry:' + abilityName);
                expect(res).assertTrue();
                commonEventManager.unsubscribe(subscriber, () => {
                  hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
                });
                try {
                  await commonEventManager.publish('terminateChildAbility', (result) => {
                    hilog.info(DOMAIN, 'testTag', 'commonEventManager.publish succeed');
                  });
                } catch (e) {
                  hilog.error(DOMAIN, 'testTag', `publish terminateChildAbility failed: ${e.code}`);
                }
                await sleep(500);
                done();
              });
            await context.startSelfUIAbilityInChildProcess(want, '')
              .then(async () => {
                hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
              })
              .catch((e: BusinessError) => {
                let msg = `${CASE_NAME} error, code:${e.code}, message:${e.message}`;
                hilog.error(DOMAIN, 'testTag', msg);
                expect().assertFail();
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
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_2000
     * @tc.desc   Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_2000', Level.LEVEL0, async (done: Function)=> {
      const CASE_NAME: string = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityInChildProcess_2000';
      hilog.info(DOMAIN, 'testTag', `${CASE_NAME}  start`);

      let want: Want = {
        bundleName: 'com.example.startselfuiabilityinchildprocesstest',
        abilityName: 'SpecifiedAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        await context.startSelfUIAbilityInChildProcess(want, '20')
          .then(() => {
            hilog.info(DOMAIN, 'testTag', '${CASE_NAME} succeed');
            expect().assertFail();
            done();
         })
          .catch((e: BusinessError) => {
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