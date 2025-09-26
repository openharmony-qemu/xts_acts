/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import UIAbility from '@ohos.app.ability.UIAbility';


let domain = 0x0000;
let tag: string = 'testTag';

export default function AbilityDelegatorStageStaticTest() {
  describe('ActsAbilityStaticTest', () => {
    const BUNDLE_NAME = 'com.ohos.abilitydelegatorstagetest.static';
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100
     * @tc.desc       test addAbilityMonitorSync
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isAbilityCreated: boolean = false;
          const onAbilityCreateCallback = (data: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityCreateCallback trigger`);
            isAbilityCreated = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityCreate: onAbilityCreateCallback
          };
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync`);
          abilityDelegator.addAbilityMonitorSync(monitor);
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync success`);

          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          expect(isAbilityCreated).assertTrue();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200
     * @tc.desc       test removeAbilityMonitor(callback)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync`);
          abilityDelegator.addAbilityMonitorSync(monitor);
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync success`);

          hilog.info(domain, tag, `${itName} removeAbilityMonitor callback`);
          abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} removeAbilityMonitor error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} removeAbilityMonitor callback fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} removeAbilityMonitor callback success`);
            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            expect(isOnBackground).assertFalse();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300
     * @tc.desc       test removeAbilityMonitor(promise)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync`);
          abilityDelegator.addAbilityMonitorSync(monitor);
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync success`);

          hilog.info(domain, tag, `${itName} removeAbilityMonitor promise`);
          abilityDelegator.removeAbilityMonitor(monitor).then(() => {
            hilog.info(domain, tag, `${itName} removeAbilityMonitor promise success`);

            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            expect(isOnBackground).assertFalse();

            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} removeAbilityMonitor promise fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400
     * @tc.desc       test removeAbilityMonitorSync
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync`);
          abilityDelegator.addAbilityMonitorSync(monitor);
          hilog.info(domain, tag, `${itName} addAbilityMonitorSync success`);

          hilog.info(domain, tag, `${itName} removeAbilityMonitorSync`);
          abilityDelegator.removeAbilityMonitorSync(monitor);
          hilog.info(domain, tag, `${itName} removeAbilityMonitorSync success`);

          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);


          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          expect(isOnBackground).assertFalse();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500
     * @tc.desc       test waitAbilityMonitor(callback)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} waitAbilityMonitor`);
          abilityDelegator.waitAbilityMonitor(monitor, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} waitAbilityMonitor error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor callback fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} waitAbilityMonitor callback success`);
          })

          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(1000);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(1000);

          expect(isOnBackground).assertTrue();
          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600
     * @tc.desc       test waitAbilityMonitor(callback) with timeout
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} waitAbilityMonitor`);
          abilityDelegator.waitAbilityMonitor(monitor, 10000, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} waitAbilityMonitor error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor callback fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} waitAbilityMonitor callback success`);
          })
          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          expect(isOnBackground).assertTrue();
          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700
     * @tc.desc       test waitAbilityMonitor(promise) with timeout
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} waitAbilityMonitor`);
          abilityDelegator.waitAbilityMonitor(monitor, 10000).then(() => {
            hilog.info(domain, tag, `${itName} waitAbilityMonitor promise success`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} waitAbilityMonitor promise fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })

          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          expect(isOnBackground).assertTrue();

          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701
     * @tc.desc       test waitAbilityMonitor(promise)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701';
        hilog.info(domain, tag, `${itName} start`);
        try {
          let isOnBackground: boolean = false;
          let onAbilityBackgroundCallback = (ability: UIAbility) => {
            hilog.info(domain, tag, `${itName} onAbilityBackgroundCallback trigger`);
            isOnBackground = true;
          }
          const monitorAbilityName = 'EntryAbility'
          let monitor: abilityDelegatorRegistry.AbilityMonitor = {
            moduleName: 'entry',
            abilityName: `${monitorAbilityName}`,
            onAbilityBackground: onAbilityBackgroundCallback
          };
          hilog.info(domain, tag, `${itName} waitAbilityMonitor`);
          abilityDelegator.waitAbilityMonitor(monitor).then(() => {
            hilog.info(domain, tag, `${itName} waitAbilityMonitor promise success`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} waitAbilityMonitor promise fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })

          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(1000);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(1000);

          expect(isOnBackground).assertTrue();
          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800
     * @tc.desc       test getCurrentTopAbility(callback) and getAbilityState
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${abilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
          abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, ability: UIAbility | undefined) => {
            hilog.info(domain, tag, `${itName} getCurrentTopAbility error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code || !ability) {
              hilog.info(domain, tag, `${itName} getCurrentTopAbility fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }

            const state = abilityDelegator.getAbilityState(ability as UIAbility);
            hilog.info(domain, tag, `${itName} getAbilityState state: ${state}`);
            expect(`${state}`).assertEqual('2');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900
     * @tc.desc       test doAbilityForeground(callback)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900';
        hilog.info(domain, tag, `${itName} start`);
        try {
          AppStorage.setOrCreate<boolean>('onForeground', false);
          AppStorage.setOrCreate<boolean>('onBackground', false);

          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${abilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
          const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
          hilog.info(domain, tag, `${itName} getCurrentTopAbility success ability: ${!!ability}`);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} doAbilityForeground`);
          abilityDelegator.doAbilityForeground(ability, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} doAbilityForeground error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} doAbilityForeground fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} doAbilityForeground success`);
          })
          await Utils.msSleep(2000);

          const isOnBackground = AppStorage.get<boolean>('onForeground') as boolean;
          expect(isOnBackground).assertTrue();
          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000
     * @tc.desc       test doAbilityForeground(promise)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000';
        hilog.info(domain, tag, `${itName} start`);
        try {
          AppStorage.setOrCreate<boolean>('onForeground', false);
          AppStorage.setOrCreate<boolean>('onBackground', false);

          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${abilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
          const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
          hilog.info(domain, tag, `${itName} getCurrentTopAbility success ability: ${!!ability}`);

          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} doAbilityForeground`);
          abilityDelegator.doAbilityForeground(ability).then(() => {
            hilog.info(domain, tag, `${itName} doAbilityForeground success`);

            await Utils.msSleep(2000);
            const isOnBackground = AppStorage.get<boolean>('onForeground') as boolean;
            expect(isOnBackground).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} doAbilityForeground fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500
     * @tc.desc       testing doAbilityBackground by promise
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500';
        hilog.info(domain, tag, `${itName} start`);
        try {
          AppStorage.setOrCreate<boolean>('onForeground', false);
          AppStorage.setOrCreate<boolean>('onBackground', false);

          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${abilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
          const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
          hilog.info(domain, tag, `${itName} getCurrentTopAbility success ability: ${!!ability}`);

          hilog.info(domain, tag, `${itName} doAbilityBackground`);
          abilityDelegator.doAbilityBackground(ability).then(() => {
            hilog.info(domain, tag, `${itName} doAbilityBackground success`);
            await Utils.msSleep(2000);

            const isOnBackground = AppStorage.get<boolean>('onBackground') as boolean;
            expect(isOnBackground).assertTrue();

            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} doAbilityBackground fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600
     * @tc.desc       testing doAbilityBackground by AsyncCallback
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          AppStorage.setOrCreate<boolean>('onForeground', false);
          AppStorage.setOrCreate<boolean>('onBackground', false);

          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          await abilityDelegator.executeShellCommand(`aa start -a ${abilityName} -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
          const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
          hilog.info(domain, tag, `${itName} getCurrentTopAbility success ability: ${!!ability}`);

          hilog.info(domain, tag, `${itName} doAbilityBackground`);
          abilityDelegator.doAbilityBackground(ability, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} doAbilityBackground error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} doAbilityBackground fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} doAbilityBackground success`);
          })
          await Utils.msSleep(2000);

          const isOnBackground = AppStorage.get<boolean>('onBackground') as boolean;
          expect(isOnBackground).assertTrue();
        } catch (e: Error) {
          const err = e as BusinessError;
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400
     * @tc.desc       for testing command -b -s -w are valid and call print by promise
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} print`);
          const msg = '!@#$%^&*()_+QWE{}|?><Fafq3146';
          abilityDelegator.print(msg).then(() => {
            hilog.info(domain, tag, `${itName} print success`);
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} print success fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500
     * @tc.desc       for testing command is valid and call print by promise
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} print`);
          const length_1000 = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
          let msg = length_1000 + '';
          abilityDelegator.print(msg).then(() => {
            hilog.info(domain, tag, `${itName} print success`);
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} print success fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600
     * @tc.desc       for testing command is valid and call print by promise
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} print`);
          const length_1000 = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
          let msg = length_1000 + '-----------///bbb';
          abilityDelegator.print(msg).then(() => {
            hilog.info(domain, tag, `${itName} print success`);
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} print success fail error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
          hilog.info(domain, tag, `${itName} print success`);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.number     SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.name       SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.desc       test print(callback)
     * @tc.size       MediumTest
     * @tc.level      Level 3
     * @tc.type       Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} print`);
          const msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
          abilityDelegator.print(msg, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} print error code: ${err?.code} msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} print fail`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
            hilog.info(domain, tag, `${itName} print success`);
            done();
            hilog.info(domain, tag, `${itName} end`);
          });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })
  })
}