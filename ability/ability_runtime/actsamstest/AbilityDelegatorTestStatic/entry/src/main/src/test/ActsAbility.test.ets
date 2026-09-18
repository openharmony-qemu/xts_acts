'use static';
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

import hilog from '@ohos.hilog';
import {  afterEach, beforeAll, describe, expect, it, Level  } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let eventData: emitter.EventData = {
  data: {
    "content": "close",
  }
};

let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: emitter.EventPriority.HIGH
};

let TAG: string = 'AbilityDelegatorStageTest';
export default function abilityDelegatorStage(): void {
  describe('abilityDelegatorStage', () => {
    beforeAll(async (done: () => void) => {
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }

      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1270 beforeAll');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      done();
    });

    afterEach(async (done: () => void) => {
      console.info(TAG + " afterEach each called");
      await Utils.msSleep(1500);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1270
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1270
     * @tc.desc   Unable to start specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1270', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1270 begin');
      try {
        abilityDelegator.startAbility({
          bundleName: 'com.acts.abilitydelegatortest.static',
          abilityName: 'abilityName'
        }, (err: BusinessError<void> | null, data: void | undefined): void => {
          console.info('startAbility callback err ' + JSON.stringify(err?.code));
          if (err?.code) {
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1270 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1280
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1280
     * @tc.desc   Unable to start the specified ability with an invalid abilityName (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1280 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatortest.static',
          abilityName: 'abilityName'
        };
        abilityDelegator.startAbility(want).then((data: void) => {
          console.info('startAbility promise');
          try { expect(false).assertTrue(); } catch (e) { }
          done();
        }).catch((err: Error) => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1280 failed');
          expect(err?.code).assertEqual(16000001);
          done();
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1280 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1290
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1290
     * @tc.desc   Unable to obtain background Ability information (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1290', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1290 begin');

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); });

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); });
      await sleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability!.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1290 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.bundleName));
        let name: string = context.abilityInfo.name;
        expect(name).assertEqual('AbilityC');
        done();
      }).catch((err: Error) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1290 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      })
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.desc   Unable to obtain background Ability information (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1300 begin');
      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); });

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); });

      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, ability: UIAbility | undefined) => {
        if (err && err.code) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1300 callback failed ' + JSON.stringify(err));
          try { expect(false).assertTrue(); } catch (e) { }
          done();
        } else {
          let context = ability!.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_1300 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          let name: string = context.abilityInfo.name;
          try { expect(name).assertEqual('AbilityC'); } catch (e) { }
          done();
        }
      });
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2190
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2190
     * @tc.desc   Can start the specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2190 begin');
      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, ability: UIAbility | undefined) => {
        if (err && err.code) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2190 callback failed ' + JSON.stringify(err));
          try { expect(false).assertEqual(true); } catch (e) { }
          done();
        } else {
          let context = ability!.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2190 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          try { expect(context.abilityInfo.name).assertEqual('AbilityA'); } catch (e) { }
          done();
        }
      });
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2200
     * @tc.desc   Can start the specified PageAbility (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2200 begin');

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(data).assertUndefined();
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      await sleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability!.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2200 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.name));
        expect(context.abilityInfo.name).assertEqual('AbilityA');
        done();
      }).catch((err: Error) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_2200 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      })
        })

    // ===== 静态特有：同步前官方 12701~12803，跨包/空 want 错误码测试点（动态无对应）=====

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1271
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1271
     * @tc.desc   startAbility rely EntryAbility fails with 16000004 (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1271', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1271';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        try {
          abilityDelegator.startAbility({
            bundleName: 'com.acts.abilitydelegatorrely.static',
            abilityName: 'EntryAbility'
          }, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, 'abilityDelegatorStageTag',
              `${name} err ` + JSON.stringify(err?.code));
            if (err?.code) {
              expect(err?.code).assertEqual(16000004);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1281
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1281
     * @tc.desc   startAbility rely EntryAbility fails with 16000004 (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1281', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1281';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        try {
          let want: Want = {
            bundleName: 'com.acts.abilitydelegatorrely.static',
            abilityName: 'EntryAbility'
          };
          abilityDelegator.startAbility(want).then((data: void) => {
            console.info(`${name} promise success unexpected`);
            expect(false).assertTrue();
            done();
          }).catch((err: Error) => {
            hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} catch`);
            expect(err?.code).assertEqual(16000004);
            done();
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1272
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1272
     * @tc.desc   startAbility rely EntryAbility2 fails with 16000005 (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1272', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1272';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        try {
          abilityDelegator.startAbility({
            bundleName: 'com.acts.abilitydelegatorrely.static',
            abilityName: 'EntryAbility2'
          }, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, 'abilityDelegatorStageTag',
              `${name} err ` + JSON.stringify(err?.code));
            if (err?.code) {
              expect(err?.code).assertEqual(16000005);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1282
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1282
     * @tc.desc   startAbility rely EntryAbility2 fails with 16000005 (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1282', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1282';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        try {
          let want: Want = {
            bundleName: 'com.acts.abilitydelegatorrely.static',
            abilityName: 'EntryAbility2'
          };
          abilityDelegator.startAbility(want).then((data: void) => {
            console.info(`${name} promise success unexpected`);
            expect(false).assertTrue();
            done();
          }).catch((err: Error) => {
            hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} catch`);
            expect(err?.code).assertEqual(16000005);
            done();
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1273
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1273
     * @tc.desc   startAbility with empty want fails with 16000019 (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1273', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1273';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        let cmd = 'aa start -a EntryAbility1 -b com.acts.abilitydelegatortest.static';
        let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
        if (user !== undefined) {
          cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd);
        await Utils.msSleep(2000);
        try {
          abilityDelegator.startAbility({}, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, 'abilityDelegatorStageTag',
              `${name} err ` + JSON.stringify(err?.code));
            if (err?.code) {
              expect(err?.code).assertEqual(16000019);
              let cmd2 = 'aa start -a EntryAbility -b com.acts.abilitydelegatortest.static';
              let user2 = abilityDelegatorRegistry.getArguments().parameters['-u'];
              if (user2 !== undefined) {
                cmd2 += ' -u ' + user2;
              }
              abilityDelegator.executeShellCommand(cmd2);
              Utils.msSleep(2000);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1283
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1283
     * @tc.desc   startAbility with empty want fails with 16000019 (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1283', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const name = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1283';
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} begin`);
        try {
          let want: Want = {};
          abilityDelegator.startAbility(want).then((data: void) => {
            console.info(`${name} promise success unexpected`);
            expect(false).assertTrue();
            done();
          }).catch((err: Error) => {
            hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', `${name} catch`);
            expect(err?.code).assertEqual(16000019);
            done();
          });
        } catch (error) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            `${name} failed ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      })
  });
}

let sleep = (ms: int): Promise<void> => {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, ms);
  });
}
