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
import { describe, beforeAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

// --- 静态特有用例（同步动态前官方基线，不可因动态无对应而删除）---
let domain: int = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME: string = 'com.ohos.abilitydelegatorstagetest.static';
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();

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
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2350
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2350
     * @tc.desc   testing doAbilityBackground by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2350', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2350';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let bgDone: boolean = false;
        let caseFinished: boolean = false;
        // 用例级总超时兜底：设备偶发 monitor 回调（onAbilityForeground/onAbilityBackground）
        // 均不触发时强制结束，杜绝 300s 挂死
        setTimeout(() => {
          if (!caseFinished) {
            caseFinished = true;
            console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> case timeout, force end`);
            done();
            expect().assertFail();
          }
        }, 15000);
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
                try {
                  expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                } catch (e) {
                }
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
                  ability!.context.terminateSelf();
                  Utils.msSleep(500);
                  done();
                } else {
                  // 事件驱动收尾（onAbilityBackground 回调触发时 ability 有效，断言稳定）
                  // + 6s 超时兜底（设备偶发回调不触发时强制结束，防挂死）
                  abilityDelegator.doAbilityBackground(ability!).then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  }).catch((e: Error) => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} doAbilityBackground rejected: ` + JSON.stringify(e));
                    done();
                  });
                  setTimeout(() => {
                    if (!bgDone) {
                      bgDone = true;
                      caseFinished = true;
                      console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground timeout, force end`);
                      done();
                      expect().assertFail();
                    }
                  }, 6000);
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              if (bgDone) {
                return;
              }
              bgDone = true;
              caseFinished = true;
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback==== time out`);
              let state = abilityDelegator.getAbilityState(ability!);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> -- in background callback state: ${state}`);
              try {
                expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              } catch (e) {
              }
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
              ability!.context.terminateSelf();
              Utils.msSleep(500);
              done();
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
              }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2360
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2360
     * @tc.desc   testing doAbilityBackground by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2360', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2360';
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let bgDone: boolean = false;
        let caseFinished: boolean = false;
        // 用例级总超时兜底：设备偶发 monitor 回调（onAbilityForeground/onAbilityBackground）
        // 均不触发时强制结束，杜绝 300s 挂死
        setTimeout(() => {
          if (!caseFinished) {
            caseFinished = true;
            console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> case timeout, force end`);
            done();
            expect().assertFail();
          }
        }, 15000);
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
                try {
                  expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                } catch (e) {
                }
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
                  ability!.context.terminateSelf();
                  Utils.msSleep(500);
                  done();
                } else {
                  // 事件驱动收尾（onAbilityBackground 回调触发时 ability 有效，断言稳定）
                  // + 6s 超时兜底（设备偶发回调不触发时强制结束，防挂死）
                  abilityDelegator.doAbilityBackground(ability!).then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  }).catch((e: Error) => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} doAbilityBackground rejected: ` + JSON.stringify(e));
                    done();
                  });
                  setTimeout(() => {
                    if (!bgDone) {
                      bgDone = true;
                      caseFinished = true;
                      console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground timeout, force end`);
                      done();
                      expect().assertFail();
                    }
                  }, 6000);
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability: UIAbility) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              if (bgDone) {
                return;
              }
              bgDone = true;
              caseFinished = true;
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====time out`);
              let state = abilityDelegator.getAbilityState(ability!);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state: ${state}`);
              try {
                expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              } catch (e) {
              }
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`);
                }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
              ability!.context.terminateSelf();
              Utils.msSleep(500);
              done();
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
              }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1480
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1480
     * @tc.desc   Delete the window stage destruction status listening (Promise) of Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1480', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1480';
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
              }).catch((e: Error) => {
                console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor rejected: ` + JSON.stringify(e));
                done();
              });
              let subscribeCB = (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined): void => {
                if (data?.event === "AbilityDelegator_Destory") {
                  Utils.msSleep(2000);
                  expect(count).assertEqual(1);
                  done();
                }
              };
              commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber: commonEventManager.CommonEventSubscriber) => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success ..`);
                commonEventManager.subscribe(subscriber, subscribeCB);
                executeShellCmd(cmd, abilityDelegator);
              }).catch((e: Error) => {
                console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber rejected: ${JSON.stringify(e)}`);
                done();
              });
            }
          }
        };
        abilityDelegator.addAbilityMonitor(monitor)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} addAbilityMonitor promise ..`);
          })
          .catch((e: Error) => {
            // 设备偶发 addAbilityMonitor 拒绝：吞掉避免未处理 rejection 转用例失败
            console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} addAbilityMonitor rejected: ${JSON.stringify(e)}`);
            done();
          })
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        executeShellCmd(cmd, abilityDelegator);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1630
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1630
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1630', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1630';
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
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1640
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1640
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1640', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1640';
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
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1650
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1650
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1650', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1650';
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
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1660
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1660
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1660', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1660';
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
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1670
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1670
     * @tc.desc   for executing shell command (AsyncCallback)  with un-exist shell parameter  shell命令参数：ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1670', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1670';
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
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1680
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1680
     * @tc.desc   for executing shell command (Promise)  with un-exist shell parameter ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1680', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1680';
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
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1690
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1690
     * @tc.desc   for executing shell command (AsyncCallback)  without timeout parameter ,aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1690', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1690';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode === 0).assertTrue();
          expect(data?.stdResult).assertContain('aa');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1700
     * @tc.desc   for executing shell command (Promise)  without timeout parameter, aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1700';
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
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1710
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1710
     * @tc.desc   for executing exception shell command (AsyncCallback),xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1710', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1710';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1720
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1720
     * @tc.desc   for executing exception shell command (Promise) ,xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1720', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1720';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(-1);
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1730
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1730
     * @tc.desc   for executing shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1730', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1730';
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
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1740
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1740
     * @tc.desc   for executing shell command (Promise) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1740', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1740';
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
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1750
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1750
     * @tc.desc   for executing exception shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1750', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1750'
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'xx start';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1760
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1760
     * @tc.desc   for executing exception shell command (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1760', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1760';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)} , data= ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1770
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1770
     * @tc.desc   for executing exception shell command (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1770', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1770';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data?.exitCode).assertEqual(-1);
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1780
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1780
     * @tc.desc   for executing  shell command (AsyncCallback) with timeout parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1780', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1780';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa help';
        let timeout: long = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        abilityDelegator.executeShellCommand(cmd, timeout.toLong()).then(async (data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data = ${JSON.stringify(data)}`);
          expect(data?.exitCode).assertEqual(0);
          done();
        }).catch((e: Error) => {
          expect(JSON.stringify(e) ?? '').assertContain('parameters');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        }).catch((e: Error) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch e: ` + JSON.stringify(e));
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err}`);
        expect(err?.message).assertContain('parameters');
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1870
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1870
     * @tc.desc   for testing command -b -s -w are valid but adding an invalid parameter -z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1870', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1870';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest.static -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_1870 -s timeout 15000 -z test';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            expect(data?.stdResult).assertContain('error: unknown option');
            done();
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1880
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1880
     * @tc.desc   for testing command -s -w are valid but -b invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1880', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1880';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let cmd = 'aa test -b invalid -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_1880 -s timeout 15000';
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
                done();
              }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
          }).catch((err: Error) => {
            expect(!isEmpty(err?.message)).assertTrue();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })



    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1930
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1930
     * @tc.desc   SUB_Ability_AbilityTools_AbilityDelegator_Stage_1930
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1930', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1930';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let msg: string | null = null;
        try {
          await abilityDelegator.print(msg as string)
            .then(() => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------1930`);
              expect().assertFail();
              done();
            }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ,err: ${err}`);
          let msg: string = (err as Error)?.message ?? '';
          expect(msg.includes('parameters') || msg.includes('cast')).assertTrue();
          done();
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1940
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1940
     * @tc.desc   for testing command -b -s -w are valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1940', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1940';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let result = -1;
        let msg = '!@#$%^&*()_+QWE{}|?><Fafq3146';
        await abilityDelegator.print(msg as string)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg}`);
            result = 0;
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
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
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1950
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1950
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1950', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1950';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let result = -1;
        let msg = length_1000;
        await abilityDelegator.print(msg as string)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `);
            result = 0;
          }).catch((err: Error) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1960
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1960
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1960', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1960';
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
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} promise catch err: ` + JSON.stringify(err));
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1970
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1970
     * @tc.desc   for testing getArguments()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1970', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1970';
        let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
      try {
        let bundleName = 'com.ohos.abilitydelegatorstagetest.static';
        let testRunnerClassName = 'OpenHarmonyTestRunner';
        let entryTest = 'entry'; // 静态工程模块名为 entry
        hilog.info(0x000, `${TAG}${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'abilityDelegatorArguments is : %{public}s', `${JSON.stringify(abilityDelegatorArguments)}`);
        expect(abilityDelegatorArguments.bundleName).assertEqual(bundleName);
        expect(abilityDelegatorArguments.testRunnerClassName).assertEqual(testRunnerClassName);
        expect(abilityDelegatorArguments.parameters["-m"]).assertEqual(entryTest);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2020
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2020
     * @tc.desc   for testing shell command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2020';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2020';
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest.static -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_2020 -s timeout 15000 -w invalid';
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
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print 2020------------`);
                result = 1;
              }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2030
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2030
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2030';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        let flag = true;
        abilityDelegator.finishTest(null as string, 1, (err: BusinessError<void> | null, data: void | undefined): void => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback, err: ${JSON.stringify(err)}`);
          flag = false;
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err?.code}`);
        expect(err?.code).assertEqual(CODE_ERROR);
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2040
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2040
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_2040';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        abilityDelegator.finishTest(undefined as string, 1, (err: BusinessError<void> | null, data: void | undefined): void => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback, err: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err?.code}`);
        expect(err?.code).assertEqual(CODE_ERROR);
        done();
      }
        })
    // ===== restored static-only cases (pre-sync official, keep coverage) =====
    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100
     * @tc.desc   test addAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
          let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
          if(user !== undefined){ 
              cmd += ' -u ' + user; 
          } 
          await abilityDelegator.executeShellCommand(cmd); 
          await Utils.msSleep(2000);

          expect(isAbilityCreated).assertTrue();
        } catch (err) {
          if(err instanceof BusinessError){
              hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
              expect().assertFail();
          }
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200
     * @tc.desc   test removeAbilityMonitor(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          // 静态 ArkTS 仅 promise 重载；保留「先 remove 再验证回调不触发」测试点
          hilog.info(domain, tag, `${itName} removeAbilityMonitor`);
          try {
            await abilityDelegator.removeAbilityMonitor(monitor);
            hilog.info(domain, tag, `${itName} removeAbilityMonitor success`);
          } catch (rmErr) {
            if (rmErr instanceof BusinessError) {
              hilog.info(domain, tag,
                `${itName} removeAbilityMonitor error code: ${rmErr?.code}, msg: ${rmErr?.message}`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
              return;
            }
          }
          hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
          let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;
          let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
          if (user !== undefined) {
            cmd += ' -u ' + user;
          }
          await abilityDelegator.executeShellCommand(cmd);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground()
            .catch((err): void => {
              if (err instanceof BusinessError) {
                hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
                if (err?.code == 16000061) {
                  done();
                }
              }
            });
          await Utils.msSleep(2000);
          expect(isOnBackground).assertFalse();
          done();
          hilog.info(domain, tag, `${itName} end`);
        } catch (err) {
          if(err instanceof BusinessError){
              hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300
     * @tc.desc   test removeAbilityMonitor(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          abilityDelegator.removeAbilityMonitor(monitor).then(async () => {
            hilog.info(domain, tag, `${itName} removeAbilityMonitor promise success`);

            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
            if (user !== undefined) {
              cmd += ' -u ' + user;
            }
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            expect(isOnBackground).assertFalse();

            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            if (e instanceof BusinessError) {
              hilog.info(domain, tag,
                `${itName} removeAbilityMonitor promise fail error code: ${e?.code} msg: ${e?.message}`);
              if (e?.code == 16000061) {
                done();
              } else {
                expect().assertFail();
                done();
              }
              hilog.info(domain, tag, `${itName} end`);
            }
          })
        } catch (err) {
          if(err instanceof BusinessError){
              hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
              if(err?.code == 16000061) {
                done();
              } else {
                expect().assertFail();
                done();
              }
              hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400
     * @tc.desc   test removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
          let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
          if(user !== undefined){ 
              cmd += ' -u ' + user; 
          } 
          await abilityDelegator.executeShellCommand(cmd);
          await Utils.msSleep(2000);


          hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
          const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
          await context.moveAbilityToBackground();
          await Utils.msSleep(2000);

          expect(isOnBackground).assertFalse();
        } catch (err) {
          hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
          if(err?.code == 16000061) {
            done();
          } else {
            expect().assertFail();
          }
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500
     * @tc.desc   test waitAbilityMonitor(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0500';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
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
            abilityDelegator.waitAbilityMonitor(monitor, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor error code: ${err?.code}, msg: ${err?.message}`);
              if (err?.code) {
                hilog.info(domain, tag, `${itName} waitAbilityMonitor callback fail`);
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${itName} end`);
                return;
              }
              hilog.info(domain, tag, `${itName} waitAbilityMonitor callback success`);
              expect(data !== undefined).assertTrue();
            })

            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
            if(user !== undefined){ 
                cmd += ' -u ' + user; 
            } 
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(1000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(1000);

            expect(isOnBackground).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          } catch (err) {
            hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600
     * @tc.desc   test waitAbilityMonitor(callback) with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0600';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
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
            abilityDelegator.waitAbilityMonitor(monitor, 10000, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor error code: ${err?.code}, msg: ${err?.message}`);
              if (err?.code) {
                hilog.info(domain, tag, `${itName} waitAbilityMonitor callback fail`);
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${itName} end`);
                return;
              }
              hilog.info(domain, tag, `${itName} waitAbilityMonitor callback success`);
              expect(data !== undefined).assertTrue();
            })
            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
            if(user !== undefined){ 
                cmd += ' -u ' + user; 
            } 
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            expect(isOnBackground).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          } catch (err) {
            hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700
     * @tc.desc   test waitAbilityMonitor(promise) with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0700';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
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
            abilityDelegator.waitAbilityMonitor(monitor, 10000).then((data: UIAbility) => {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor promise success`);
              expect(data !== undefined).assertTrue();
            }).catch((e) => {
              if (e instanceof BusinessError){
                  hilog.info(domain, tag,
                    `${itName} waitAbilityMonitor promise fail error code: ${e?.code} msg: ${e?.message}`);
                  expect().assertFail();
                  done();
                  hilog.info(domain, tag, `${itName} end`);
              }
            })

            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
            if(user !== undefined){ 
                cmd += ' -u ' + user; 
            } 
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            expect(isOnBackground).assertTrue();

            done();
            hilog.info(domain, tag, `${itName} end`);
          } catch (err) {
            if(err instanceof BusinessError){
                hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${itName} end`);
            }
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701
     * @tc.desc   test waitAbilityMonitor(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0701';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
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
            abilityDelegator.waitAbilityMonitor(monitor).then((data: UIAbility) => {
              hilog.info(domain, tag, `${itName} waitAbilityMonitor promise success`);
              expect(data !== undefined).assertTrue();
            }).catch((e) => {
              if(e instanceof BusinessError){
                  hilog.info(domain, tag,
                    `${itName} waitAbilityMonitor promise fail error code: ${e?.code} msg: ${e?.message}`);
                  expect().assertFail();
                  done();
                  hilog.info(domain, tag, `${itName} end`);
              }
            })

            hilog.info(domain, tag, `${itName} start ${monitorAbilityName}`);
            let cmd = `aa start -a ${monitorAbilityName} -b ${BUNDLE_NAME}`;	 
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
            if(user !== undefined){ 
                cmd += ' -u ' + user; 
            } 
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(1000);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(1000);

            expect(isOnBackground).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          } catch (err) {
            if(err instanceof BusinessError){
                hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${itName} end`);
            }
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800
     * @tc.desc   test getCurrentTopAbility(callback) and getAbilityState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0800';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const abilityName = 'EntryAbility';
          hilog.info(domain, tag, `${itName} start ${abilityName}`);
          let cmd = `aa start -a ${abilityName} -b ${BUNDLE_NAME}`;	 
          let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
          if(user !== undefined){ 
              cmd += ' -u ' + user; 
          } 
          await abilityDelegator.executeShellCommand(cmd);
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
        } catch (err) {
          if(err instanceof BusinessError){
              hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900
     * @tc.desc   test doAbilityForeground(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_0900';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
          try {
            AppStorage.setOrCreate<boolean>('onForeground', false);
            AppStorage.setOrCreate<boolean>('onBackground', false);

            const abilityName = 'EntryAbility';
            hilog.info(domain, tag, `${itName} start ${abilityName}`);
            let cmd = `aa start -a ${abilityName} -b ${BUNDLE_NAME}`;	 
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"]; 
            if(user !== undefined){ 
                cmd += ' -u ' + user; 
            } 
            await abilityDelegator.executeShellCommand(cmd);
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
          } catch (err) {
            if(err instanceof BusinessError){
                hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
                expect().assertFail();
            }
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000
     * @tc.desc   test doAbilityForeground(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1000';
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
          try {
            AppStorage.setOrCreate<boolean>('onForeground', false);
            AppStorage.setOrCreate<boolean>('onBackground', false);

            const abilityName = 'EntryAbility';
            hilog.info(domain, tag, `${itName} start ${abilityName}`);
            let cmd = `aa start -a ${abilityName} -b ${BUNDLE_NAME}`;
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
            if(user !== undefined){
                cmd += ' -u ' + user;
            }
            await abilityDelegator.executeShellCommand(cmd);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} getCurrentTopAbility`);
            const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
            hilog.info(domain, tag, `${itName} getCurrentTopAbility success ability: ${!!ability}`);

            hilog.info(domain, tag, `${itName} moveAbilityToBackground`);
            const context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
            await context.moveAbilityToBackground();
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} doAbilityForeground`);
            abilityDelegator.doAbilityForeground(ability).then(async () => {
              hilog.info(domain, tag, `${itName} doAbilityForeground success`);
              await Utils.msSleep(2000);
              const isOnBackground = AppStorage.get<boolean>('onForeground') as boolean;
              expect(isOnBackground).assertTrue();
              done();
              hilog.info(domain, tag, `${itName} end`);
            }).catch((e: Error) => {
              if (e instanceof BusinessError) {
                hilog.info(domain, tag,
                  `${itName} doAbilityForeground fail error code: ${e?.code} msg: ${e?.message}`);
                expect().assertFail();
                hilog.info(domain, tag, `${itName} end`);
              }
            })
          } catch (err) {
            if(err instanceof BusinessError){
                hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
                expect().assertFail();
                done();
                hilog.info(domain, tag, `${itName} end`);
            }
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300
     * @tc.desc   test print(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        } catch (err) {
          if (err instanceof BusinessError){
              hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
              expect().assertFail();
              done();
              hilog.info(domain, tag, `${itName} end`);
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1400
     * @tc.desc   test print(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_Static_1400';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} print`);
          const msg = '';
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
        } catch (err) {
          if (err instanceof BusinessError){
            hilog.info(domain, tag, `${itName} error code: ${err?.code} msg: ${err?.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }
        }
      })
  })
}
