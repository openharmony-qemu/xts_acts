'use static';
/**
 ** Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import {  describe, beforeAll, it, expect, Level  } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';

const TAG: string = 'ActsAbilityDelegatorTest';
const TEST_SUITE_NAME: string = 'ActsAbilityDelegatorStageTest';
const CODE_ERROR = 0; // 设备非法参数错误码为 0（动态 401）
const WAIT_TIME_500: int = 500;
let deviceSupport  = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: ["AbilityDelegator_Destory"]
};

async function executeShellCmd(cmd: string, abilityDelegator: abilityDelegatorRegistry.AbilityDelegator) {
  abilityDelegator.executeShellCommand(cmd).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
      hilog.info(0x0000, `${TAG}`, 'executeShellCommand : data : %{public}s', JSON.stringify(data) ?? '');
  }).catch((e: Error) => {
      hilog.info(0x0000, `${TAG}`, 'executeShellCommand : err : %{public}s', JSON.stringify(e) ?? '');
  })
}

function isEmpty(info: string): boolean {
  return info == null || info == undefined || info.length == 0 || info == '';
}

let monitor: abilityDelegatorRegistry.AbilityMonitor = { abilityName: '', onAbilityCreate: () => {} };
function sleep(time: int): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, time);
  });
}
let monitor1: abilityDelegatorRegistry.AbilityMonitor = { abilityName: '', onAbilityCreate: () => {} };
export default function AbilityDelegatorStageTest(): void {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500
     * @tc.desc   testing doAbilityBackground by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23500';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        monitor = {
          moduleName: abilityDelegatorRegistry.getArguments().parameters['-m'],
          abilityName: 'AssistantAbilityTwo',
          onAbilityForeground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`);
            setTimeout(()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback time out`);
              abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, data: UIAbility | undefined) => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`);
                expect(ability!.isDestroyed).assertFalse();
                let state = abilityDelegator.getAbilityState(ability!);
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state --in Foregroundcallback: ${state}`);
                expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    })
                  ability!.context.terminateSelf();
                  Utils.msSleep(500);
                  resolve(undefined);
                } else {
                  abilityDelegator.doAbilityBackground(ability!)
                  .then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  })
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback==== time out`);
              let state = abilityDelegator.getAbilityState(ability!);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> -- in background callback state: ${state}`);
              expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                })
              ability!.context.terminateSelf();
              Utils.msSleep(500);
              resolve(undefined);
            }, WAIT_TIME_500)
          }
        }

        abilityDelegator.addAbilityMonitor(monitor)
          .then(async () => {
            await abilityDelegator.startAbility(
              {
                bundleName: abilityDelegatorRegistry.getArguments().bundleName,
                moduleName: 'entry',

                abilityName: 'AssistantAbilityTwo',
              })
              .then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility------}`);
              })
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600
     * @tc.desc   testing doAbilityBackground by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_23600';
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        monitor = {
          moduleName: abilityDelegatorRegistry.getArguments().parameters['-m'],
          abilityName: 'AssistantAbilityTwo',
          onAbilityForeground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`);
            setTimeout(()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback time out`);
              abilityDelegator.getCurrentTopAbility((err: BusinessError<void> | null, data: UIAbility | undefined) => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`);
                let state = abilityDelegator.getAbilityState(ability!);
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state --in Foregroundcallback: ${state}`);
                expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    })
                  ability!.context.terminateSelf();
                  Utils.msSleep(500);
                  resolve(undefined);
                } else {
                  abilityDelegator.doAbilityBackground(ability!)
                  .then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  })
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====time out`);
              let state = abilityDelegator.getAbilityState(ability!);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state: ${state}`);
              expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`);
                })
              ability!.context.terminateSelf();
              Utils.msSleep(500);
              resolve(undefined);
            }, WAIT_TIME_500)
          }
        }

        abilityDelegator.addAbilityMonitor(monitor)
          .then(async () => {
            await abilityDelegator.startAbility(
              {
                bundleName: abilityDelegatorRegistry.getArguments().bundleName,
                moduleName: 'entry',

                abilityName: 'AssistantAbilityTwo',
              })
              .then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility finish====`);
              })
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_14800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_14800
     * @tc.desc   Delete the window stage destruction status listening (Promise) of Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_14800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_14800';
        let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        let user = abilityDelegatorArguments.parameters["-u"];
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let count = 0;
        monitor = {
          moduleName: 'entry',

          abilityName: 'AssistantAbilityOne',
          onWindowStageDestroy: () => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageDestroy ..`);
            count++;
            if (count === 1) {
              abilityDelegator.removeAbilityMonitor(monitor).then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor promise ..`);
              });
              let subscribeCB = (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined): void => {
                if (data?.event === "AbilityDelegator_Destory") {
                  Utils.msSleep(2000);
                  expect(count).assertEqual(1);
                  resolve(undefined);
                }
              };
              commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber: commonEventManager.CommonEventSubscriber) => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success ..`);
                commonEventManager.subscribe(subscriber, subscribeCB);
                executeShellCmd(cmd, abilityDelegator);
              });
            }
          }
        };
        abilityDelegator.addAbilityMonitor(monitor)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} addAbilityMonitor promise ..`);
          })
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        executeShellCmd(cmd, abilityDelegator);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16300
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16300';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(0);
          expect(isEmpty(data?.stdResult ?? '')).assertFalse();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16400
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16400';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(0);
            expect(isEmpty(data?.stdResult ?? '')).assertFalse();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16500
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16500';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(0);
          expect(isEmpty(data?.stdResult ?? '')).assertFalse();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16600
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16600';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(0);
            expect(isEmpty(data?.stdResult ?? '')).assertFalse();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16700
     * @tc.desc   for executing shell command (AsyncCallback)  with un-exist shell parameter  shell命令参数：ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16700';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'ppwd -L';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode === 0).assertFalse();
          expect(isEmpty(data?.stdResult ?? '')).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16800
     * @tc.desc   for executing shell command (Promise)  with un-exist shell parameter ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16800';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'ppwd -L';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode === 0).assertFalse();
            expect(isEmpty(data?.stdResult ?? '')).assertTrue();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16900
     * @tc.desc   for executing shell command (AsyncCallback)  without timeout parameter ,aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16900', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_16900';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode === 0).assertTrue();
          expect(data?.stdResult).assertContain('aa');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17000
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17000
     * @tc.desc   for executing shell command (Promise)  without timeout parameter, aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17000', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17000';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode === 0).assertTrue();
            expect(data?.stdResult).assertContain('aa');
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17100
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17100
     * @tc.desc   for executing exception shell command (AsyncCallback),xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17100';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17200
     * @tc.desc   for executing exception shell command (Promise) ,xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17200';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(-1);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17300
     * @tc.desc   for executing shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17300';
        let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        let user = abilityDelegatorArguments.parameters["-u"];
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(0);
          expect(data?.stdResult).assertContain('start ability successfully');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17400
     * @tc.desc   for executing shell command (Promise) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17400';
        let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        let user = abilityDelegatorArguments.parameters["-u"];
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        let timeout = 3;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(0);
            expect(data?.stdResult).assertContain('start ability successfully');
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17500
     * @tc.desc   for executing exception shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17500'
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx start';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17600
     * @tc.desc   for executing exception shell command (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17600';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17700
     * @tc.desc   for executing exception shell command (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17700';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(-1);
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17800
     * @tc.desc   for executing  shell command (AsyncCallback) with timeout parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_17800';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout: long = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(0);
          resolve(undefined);
        }).catch((e: Error) => {
          expect(JSON.stringify(e) ?? '').assertContain('parameters');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          resolve(undefined);
        }).catch((e: Error) => {
          resolve(undefined);
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err}`);
        expect(err?.message).assertContain('parameters');
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18700
     * @tc.desc   for testing command -b -s -w are valid but adding an invalid parameter -z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18700';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest.static -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700 -s timeout 15000 -z test';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            expect(data?.stdResult).assertContain('error: unknown option');
            resolve(undefined);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18800
     * @tc.desc   for testing command -s -w are valid but -b invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_18800';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa test -b invalid -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800 -s timeout 15000';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);

        await abilityDelegator.executeShellCommand(cmd)
          .then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            let msg: string | null = null;
            await abilityDelegator.print(msg as string)
              .then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------`);
                expect().assertFail();
                resolve(undefined);
              })
          }).catch((err: Error) => {
            expect(!isEmpty(err?.message)).assertTrue();
            resolve(undefined);
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })



    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19300
     * @tc.desc   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19300';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let msg: string | null = null;
        try {
          await abilityDelegator.print(msg as string)
            .then(() => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------19300`);
              expect().assertFail();
              resolve(undefined);
            })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ,err: ${err}`);
          let msg: string = (err as Error)?.message ?? '';
          expect(msg.includes('parameters') || msg.includes('cast')).assertTrue();
          resolve(undefined);
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400
     * @tc.desc   for testing command -b -s -w are valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19400';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let result = -1;
        let msg = '!@#$%^&*()_+QWE{}|?><Fafq3146';
        await abilityDelegator.print(msg as string)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg}`);
            result = 0;
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
        expect(result).assertEqual(0);
        resolve(undefined);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    const length_1000 = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19500';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let result = -1;
        let msg = length_1000;
        await abilityDelegator.print(msg as string)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `);
            result = 0;
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
        expect(result).assertEqual(0);
        resolve(undefined);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19600';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let result = -1;
        let msg = length_1000 + '-----------///bbb';
        await abilityDelegator.print(msg as string)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `);
            result = 0;
            console.log(TAG, msg);
          }).catch((err: Error) => {
            expect().assertFail();
            resolve(undefined);
          })
        expect(result).assertEqual(0);
        resolve(undefined);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19700
     * @tc.desc   for testing getArguments()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_19700';
        let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
      try {
        let bundleName = 'com.ohos.abilitydelegatorstagetest.static';
        let testRunnerClassName = 'OpenHarmonyTestRunner';
        let entryTest = 'entry'; // 静态工程模块名为 entry
        hilog.info(0x000, `${TAG}${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'abilityDelegatorArguments is : %{public}s', `${JSON.stringify(abilityDelegatorArguments)}`);
        expect(abilityDelegatorArguments.bundleName).assertEqual(bundleName);
        expect(abilityDelegatorArguments.testRunnerClassName).assertEqual(testRunnerClassName);
        expect(abilityDelegatorArguments.parameters["-m"]).assertEqual(entryTest);
        resolve(undefined);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20200
     * @tc.desc   for testing shell command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20200';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20200';
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest.static -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200 -s timeout 15000 -w invalid';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let result = -1;
        abilityDelegator.executeShellCommand(cmd)
          .then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            let msg = '11';
            result = 0;
            abilityDelegator.print(msg as string)
              .then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print 20200------------`);
                result = 1;
              })
          })
        expect(result).assertEqual(-1);
        resolve(undefined);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20300
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20300';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let flag = true;
        abilityDelegator.finishTest(null as string, 1, (err: BusinessError<void> | null, data: void | undefined): void => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          flag = false;
          expect().assertFail();
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err?.code}`);
        expect(err?.code).assertEqual(CODE_ERROR);
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20400
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_20400';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        abilityDelegator.finishTest(undefined as string, 1, (err: BusinessError<void> | null, data: void | undefined): void => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          expect().assertFail();
          resolve(undefined);
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err?.code}`);
        expect(err?.code).assertEqual(CODE_ERROR);
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })
  })
}
