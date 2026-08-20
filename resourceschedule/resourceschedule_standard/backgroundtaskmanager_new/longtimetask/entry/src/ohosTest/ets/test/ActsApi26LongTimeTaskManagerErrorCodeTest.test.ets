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

import { BusinessError } from '@kit.BasicServicesKit'
import { WantAgent, wantAgent, UIAbility } from '@kit.AbilityKit'
import ohosWantAgent from '@ohos.wantAgent'
import { backgroundTaskManager } from '@kit.BackgroundTasksKit'
import { abilityDelegatorRegistry } from '@kit.TestKit'
import hilog from '@ohos.hilog';
import { describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium'

const TAG = "testTag";
const DOMAIN: number = 0x0000;

export default function ActsApi26LongTimeTaskManagerErrorCodeTest() {
  describe('ActsApi26LongTimeTaskManagerErrorCodeTest', () => {

    let wantAgentInfo: wantAgent.WantAgentInfo;

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
      wantAgentInfo = {
        wants: [
          {
            bundleName: "com.acts.actslongtimetasktest",
            abilityName: "com.acts.actslongtimetasktest.TestAbility"
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
    })
    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ErrorCodeTest afterAll stopBackgroundRunning success");
            }).catch((error: BusinessError) => {
              console.error(`ErrorCodeTest afterAll stopBackgroundRunning failed. code is ${error.code}`);
            });
          }).catch(() => {});
        }).catch(() => {})
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'afterAll error: %{public}s', JSON.stringify(error));
      }
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100
     * @tc.desc   Test updateDataTransferProgress with invalid continuousTaskId returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                let progress: backgroundTaskManager.ProgressInfo = {
                  title: 'ErrorTest',
                  fileName: 'error.pkg',
                  progressValue: 50,
                };
                let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                  continuousTaskId: 99999,
                  progressInfo: progress,
                };               
                backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(Number(e.code)).assertEqual(9800005);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300
     * @tc.desc   Test updateDataTransferProgress without dataTransfer task returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 startBackgroundRunning AUDIO_PLAYBACK success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'WrongType',
                    fileName: 'wrong.mp3',
                    progressValue: 30,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: 0,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 updateDataTransferProgress unexpected success');
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(Number(e.code)).assertEqual(9800005);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400
     * @tc.desc   Test updateDataTransferProgress with progressValue exceeding 100 boundary returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 startBackgroundRunning success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'OverProgress',
                    fileName: 'over.pkg',
                    progressValue: 101,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 updateDataTransferProgress unexpected success');
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(Number(e.code)).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500
     * @tc.desc   Test updateDataTransferProgress with negative progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 startBackgroundRunning success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'NegProgress',
                    fileName: 'neg.dat',
                    progressValue: -1,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 updateDataTransferProgress unexpected success');
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(Number(e.code)).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400
     * @tc.desc   Test updateDataTransferProgress with very large progressValue Number.MAX_SAFE_INTEGER returns error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 startBackgroundRunning success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'MaxProgress',
                    fileName: 'max.dat',
                    progressValue: Number.MAX_SAFE_INTEGER,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 updateDataTransferProgress unexpected success');
                  expect(false).assertTrue();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(Number(e.code)).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 end---');
      })

  })
}
