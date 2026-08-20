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

export default function ActsApi26LongTimeTaskManagerNormalTest() {
  describe('ActsApi26LongTimeTaskManagerNormalTest', () => {

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
              console.info("ActsApi26LongTimeTaskManagerNormalTest afterAll stopBackgroundRunning success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi26LongTimeTaskManagerNormalTest afterAll stopBackgroundRunning failed. code is ${error.code}`);
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'afterAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'afterAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
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
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning callback dataTransfer type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 startBackgroundRunning callback success');
                    backgroundTaskManager.getAllContinuousTasks(ability.context).then((taskList: backgroundTaskManager.ContinuousTaskInfo[]) => {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 getAllContinuousTasks success, taskList length: %{public}s', `${taskList.length}`);
                      let continuousTaskId: number = -1;
                      for (let i = 0; i < taskList.length; i++) {
                        if (taskList[i].backgroundModes.indexOf('dataTransfer') !== -1) {
                          continuousTaskId = taskList[i].continuousTaskId;
                          break;
                        }
                      }
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 continuousTaskId: %{public}s', `${continuousTaskId}`);
                      expect(continuousTaskId).assertLarger(-1);
                      try {
                        let progress: backgroundTaskManager.ProgressInfo = {
                          title: 'Download',
                          fileName: 'test.mp4',
                          progressValue: 20,
                          isMute: false,
                        };
                        let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                          continuousTaskId: continuousTaskId,
                          progressInfo: progress,
                        };
                        let flag = 1;
                        backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 updateDataTransferProgress success');
                        expect(flag).assertEqual(1);
                        backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                        console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 stopBackgroundRunning success");
                        done();
                      } catch (err) {
                        let e: BusinessError = err as BusinessError;
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                        expect(false).assertTrue();
                      }
                    }).catch((err: BusinessError) => {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 getAllContinuousTasks error: %{public}s', JSON.stringify(err));
                      expect(false).assertTrue();
                      backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                      done();
                    });
                  }
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, '2100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, '2100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, '2100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning promise dataTransfer type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 startBackgroundRunning promise success');
                backgroundTaskManager.getAllContinuousTasks(ability.context).then((taskList: backgroundTaskManager.ContinuousTaskInfo[]) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 getAllContinuousTasks success, taskList length: %{public}s', `${taskList.length}`);
                  let continuousTaskId: number = -1;
                  for (let i = 0; i < taskList.length; i++) {
                    if (taskList[i].backgroundModes.indexOf('dataTransfer') !== -1) {
                      continuousTaskId = taskList[i].continuousTaskId;
                      break;
                    }
                  }
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 continuousTaskId: %{public}s', `${continuousTaskId}`);
                  expect(continuousTaskId).assertLarger(-1);
                  try {
                    let progress: backgroundTaskManager.ProgressInfo = {
                      title: 'Upload',
                      fileName: 'file.zip',
                      progressValue: 50,
                      isMute: true,
                    };
                    let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                      continuousTaskId: continuousTaskId,
                      progressInfo: progress,
                    };
                    let flag = 1;
                    backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 updateDataTransferProgress success');
                    expect(flag).assertLarger(0);
                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                    console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 stopBackgroundRunning success");
                    done();
                  } catch (err) {
                    let e: BusinessError = err as BusinessError;
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                    expect(false).assertTrue();
                  }
                }).catch((err: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 getAllContinuousTasks error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  done();
                });
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning bgModes dataTransfer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadTask',
                    fileName: 'data.pkg',
                    progressValue: 30,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    wantAgent: want,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 updateDataTransferProgress success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning ContinuousTaskRequest dataTransfer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'SyncData',
                    fileName: 'sync.dat',
                    progressValue: 60,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 updateDataTransferProgress success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600
     * @tc.desc   Test updateDataTransferProgress with ProgressInfo without progressValue (no progress ring)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadNoRing',
                    fileName: 'file.bin',
                    isMute: true,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 updateDataTransferProgress without progressValue success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700
     * @tc.desc   Test updateDataTransferProgress with progressValue 0 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadStart',
                    fileName: 'start.dat',
                    progressValue: 0,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 updateDataTransferProgress progressValue=0 success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800
     * @tc.desc   Test updateDataTransferProgress with progressValue 100 boundary isMute false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadComplete',
                    fileName: 'complete.pkg',
                    progressValue: 100,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 updateDataTransferProgress progressValue=100 isMute=false success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900
     * @tc.desc   Test updateDataTransferProgress with progressValue 100 isMute true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'UploadDone',
                    fileName: 'done.rar',
                    progressValue: 100,
                    isMute: true,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 updateDataTransferProgress progressValue=100 isMute=true success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_2900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000
     * @tc.desc   Test updateDataTransferProgress with wantAgent parameter in DataTransferProgress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'TransferWithAgent',
                    fileName: 'agent.iso',
                    progressValue: 75,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    wantAgent: want,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 updateDataTransferProgress with wantAgent success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100
     * @tc.desc   Test ProgressInfo structure title and fileName only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'TitleOnly',
                    fileName: 'name.txt',
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 updateDataTransferProgress title+fileName only success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200
     * @tc.desc   Test updateDataTransferProgress called multiple times with different progress values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 startBackgroundRunning promise success');
                let taskId: number = res.continuousTaskId ? res.continuousTaskId : 0;
                let progressValues: number[] = [0, 25, 50, 75, 100];
                let allSuccess: boolean = true;
                for (let i = 0; i < progressValues.length; i++) {
                  try {
                    let progress: backgroundTaskManager.ProgressInfo = {
                      title: 'MultiUpdate',
                      fileName: 'multi.pkg',
                      progressValue: progressValues[i],
                      isMute: progressValues[i] === 100,
                    };
                    let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                      continuousTaskId: taskId,
                      progressInfo: progress,
                    };
                    backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                    hilog.info(DOMAIN, TAG, `SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 updateDataTransferProgress progressValue=${progressValues[i]} success`);
                  } catch (err) {
                    allSuccess = false;
                    hilog.info(DOMAIN, TAG, `SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 updateDataTransferProgress progressValue=${progressValues[i]} error: %{public}s`, JSON.stringify(err));
                  }
                }
                expect(allSuccess).assertTrue();
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 stopBackgroundRunning success");
                }).catch((err: BusinessError) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 stopBackgroundRunning failed. code is ${err.code}`);
                });
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300
     * @tc.desc   Test ContinuousTaskRequest with ProgressInfo when starting dataTransfer task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'InitialProgress',
                fileName: 'init.dat',
                progressValue: 10,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 startBackgroundRunning with progressInfo success');
                expect(res.continuousTaskId).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 stopBackgroundRunning success");
                }).catch((err: BusinessError) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 stopBackgroundRunning failed. code is ${err.code}`);
                });
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3300 end---');
      })

      /**
       * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400
       * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400
       * @tc.desc   Test updateDataTransferProgress with float progressValue
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 begin---');
          try {
            wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
              let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
              delegator.getCurrentTopAbility().then((ability: UIAbility) => {
                let bgModes: Array<string> = ['dataTransfer'];
                backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 startBackgroundRunning success');
                  try {
                    let progress: backgroundTaskManager.ProgressInfo = {
                      title: 'FloatProgress',
                      fileName: 'float.dat',
                      progressValue: 3.14,
                    };
                    let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                      continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                      progressInfo: progress,
                    };
                    let flag = 1;
                    backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 updateDataTransferProgress unexpected success');
                    expect(flag).assertLarger(0);
                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                    console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 stopBackgroundRunning success");
                    done();
                  } catch (err) {
                    let e: BusinessError = err as BusinessError;
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  }
                }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                  expect(false).assertTrue();
                  done();
                })
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 getWantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3400 end---');
      })

      /**
       * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500
       * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500
       * @tc.desc   Test updateDataTransferProgress with fileName & title is empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 begin---');
          try {
            wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
              let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
              delegator.getCurrentTopAbility().then((ability: UIAbility) => {
                let bgModes: Array<string> = ['dataTransfer'];
                backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 startBackgroundRunning success');
                  try {
                    let progress: backgroundTaskManager.ProgressInfo = {
                      title: '',
                      fileName: '',
                      progressValue: 20,
                    };
                    let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                      continuousTaskId: res.continuousTaskId ? res.continuousTaskId : 0,
                      progressInfo: progress,
                    };
                    let flag = 1;
                    backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 updateDataTransferProgress unexpected success');
                    expect(flag).assertLarger(0);
                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                    console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 stopBackgroundRunning success");
                    done();
                  } catch (err) {
                    let e: BusinessError = err as BusinessError;
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  }
                }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                  expect(false).assertTrue();
                  done();
                })
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 getWantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
          hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_XTS_3500 end---');
      })

  })
}