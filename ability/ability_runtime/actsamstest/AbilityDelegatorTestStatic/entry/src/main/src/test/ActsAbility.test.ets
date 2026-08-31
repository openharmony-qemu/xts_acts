'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle.bundleManager';

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

let targetVersion: number = 12;

let TAG: string = 'AbilityDelegatorStageTest';
export default function abilityDelegatorStage(): void {
  describe('abilityDelegatorStage', () => {
    beforeAll(async (done: () => void) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 beforeAll');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info('getBundleInfoForSelf' + JSON.stringify(data));
        targetVersion = data.targetVersion;
        console.info('getBundleInfoForSelf targetVersion=' + targetVersion);
        done();
      }).catch((err: Error) => {
        console.info('getBundleInfoForSelf fail' + JSON.stringify(err));
        console.info('getBundleInfoForSelf fail targetVersion=' + targetVersion);
        done();
      })
    });

    afterEach(async (done: () => void) => {
      console.info(TAG + " afterEach each called");
      await Utils.msSleep(1500);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800
     * @tc.desc   Unable to start specified PageAbility(Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatortest.static',
          abilityName: 'abilityName'
        };
        abilityDelegator.startAbility(want).then((data: void) => {
          console.info('startAbility promise');
          expect(false).assertTrue();
          resolve(undefined);
        }).catch((err: Error) => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
          if (targetVersion >= 20) {
            expect(err?.code).assertEqual(16000001);
          } else {
            expect(err?.code).assertEqual(2097152);
          }
          resolve(undefined);
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900
     * @tc.desc   Unable to obtain background Ability information (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 begin');

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(true).assertTrue();
      });

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(true).assertTrue();
      });
      Utils.msSleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability!.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.bundleName));
        let name: string = context.abilityInfo.name;
        expect(name).assertEqual('AbilityC');
        resolve(undefined);
      }).catch((err: Error) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        resolve(undefined);
      })
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000
     * @tc.desc   Unable to obtain background Ability information (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 begin');
      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(true).assertTrue();
      });

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(true).assertTrue();
      });

      Utils.msSleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, ability: UIAbility | undefined) => {
        if (err) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 callback failed ' + JSON.stringify(err));
          expect(false).assertTrue();
          resolve(undefined);
        } else {
          let context = ability!.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          let name: string = context.abilityInfo.name;
          expect(name).assertEqual('AbilityC');
          resolve(undefined);
        }
      });
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900
     * @tc.desc   Can start the specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 begin');
      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })
      Utils.msSleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, ability: UIAbility | undefined) => {
        if (err) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 callback failed ' + JSON.stringify(err));
          expect(false).assertEqual(true);
          resolve(undefined);
        } else {
          let context = ability!.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          expect(context.abilityInfo.name).assertEqual('AbilityA');
          resolve(undefined);
        }
      });
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000
     * @tc.desc   Can start the specified PageAbility (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 begin');

      Utils.msSleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest.static',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })
      Utils.msSleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability!.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.name));
        expect(context.abilityInfo.name).assertEqual('AbilityA');
        resolve(undefined);
      }).catch((err: Error) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        resolve(undefined);
      })
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
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
