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
import { describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium-dynamic'

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
                expect(e.code).assertEqual(9800005);
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
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200
     * @tc.desc   Test updateDataTransferProgress with negative continuousTaskId returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                let progress: backgroundTaskManager.ProgressInfo = {
                  title: 'NegId',
                  fileName: 'neg.dat',
                  progressValue: 10,
                };
                let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                  continuousTaskId: -1,
                  progressInfo: progress,
                };
                backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0200 end---');
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
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0300 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800005);
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
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800006);
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
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800006);
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
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600
     * @tc.desc   Test updateDataTransferProgress with context as null returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600 begin---');
        try {
          let progress: backgroundTaskManager.ProgressInfo = {
            title: 'NullContext',
            fileName: 'null.ctx',
            progressValue: 50,
          };
          let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
            continuousTaskId: 0,
            progressInfo: progress,
          };
          backgroundTaskManager.updateDataTransferProgress(null, dataTransferProgress);
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600 updateDataTransferProgress unexpected success');
          expect(false).assertTrue();
          done();
        } catch (err) {
          let e: BusinessError = err as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
          expect(e.code).assertEqual(9800006);
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700
     * @tc.desc   Test updateDataTransferProgress with context as undefined returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700 begin---');
        try {
          let progress: backgroundTaskManager.ProgressInfo = {
            title: 'UndefContext',
            fileName: 'undef.ctx',
            progressValue: 50,
          };
          let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
            continuousTaskId: 0,
            progressInfo: progress,
          };
          backgroundTaskManager.updateDataTransferProgress(undefined, dataTransferProgress);
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700 updateDataTransferProgress unexpected success');
          expect(false).assertTrue();
          done();
        } catch (err) {
          let e: BusinessError = err as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
          expect(e.code).assertEqual(9800006);
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800
     * @tc.desc   Test updateDataTransferProgress with DataTransferProgress as null returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                backgroundTaskManager.updateDataTransferProgress(ability.context, null);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900
     * @tc.desc   Test updateDataTransferProgress with DataTransferProgress as undefined returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                backgroundTaskManager.updateDataTransferProgress(ability.context, undefined);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_0900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000
     * @tc.desc   Test updateDataTransferProgress with ProgressInfo missing title returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                let progress = {
                  fileName: 'notitle.dat',
                  progressValue: 50,
                } as backgroundTaskManager.ProgressInfo;
                let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                  continuousTaskId: 0,
                  progressInfo: progress,
                };
                backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100
     * @tc.desc   Test updateDataTransferProgress with ProgressInfo missing fileName returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              try {
                let progress = {
                  title: 'NoFileName',
                  progressValue: 50,
                } as backgroundTaskManager.ProgressInfo;
                let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                  continuousTaskId: 0,
                  progressInfo: progress,
                };
                backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'ERROR_1500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200
     * @tc.desc   Test updateDataTransferProgress with very large progressValue Number.MAX_SAFE_INTEGER returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 startBackgroundRunning success');
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
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 updateDataTransferProgress unexpected success');
                  expect(false).assertTrue();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300
     * @tc.desc   Test startContinuousTask with context null returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300 begin---');
        try {
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          try {
            let res = await backgroundTaskManager.startContinuousTask(null, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400
     * @tc.desc   Test startContinuousTask with context undefined returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 begin---');
        try {
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          try {
            let res = await backgroundTaskManager.startContinuousTask(undefined, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500
     * @tc.desc   Test startContinuousTask with request null returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, null);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600
     * @tc.desc   Test startContinuousTask with request undefined returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, undefined);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700
     * @tc.desc   Test startContinuousTask with empty backgroundTaskModes returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800
     * @tc.desc   Test startContinuousTask with empty backgroundTaskSubmodes returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [];
          continuousTaskRequest.wantAgent = want;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900
     * @tc.desc   Test startContinuousTask with mode and submode mismatch returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_1900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000
     * @tc.desc   Test startContinuousTask with invalid backgroundTaskModes value returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [999];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100
     * @tc.desc   Test startContinuousTask with invalid backgroundTaskSubmodes value returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [999];
          continuousTaskRequest.wantAgent = want;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200
     * @tc.desc   Test startContinuousTask with wantAgent not set returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200 begin---');
        try {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300
     * @tc.desc   Test startContinuousTask with combinedTaskNotification true and continuousTaskId -1 returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          continuousTaskRequest.combinedTaskNotification = true;
          continuousTaskRequest.continuousTaskId = -1;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400
     * @tc.desc   Test startContinuousTask with combinedTaskNotification true and non-existent continuousTaskId returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          continuousTaskRequest.combinedTaskNotification = true;
          continuousTaskRequest.continuousTaskId = 99999;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500
     * @tc.desc   Test startContinuousTask with ProgressInfo missing title returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          let progress = {
            fileName: 'notitle.dat',
            progressValue: 50,
          } as backgroundTaskManager.ProgressInfo;
          continuousTaskRequest.progressInfo = progress;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600
     * @tc.desc   Test startContinuousTask with ProgressInfo missing fileName returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          let progress = {
            title: 'NoFileName',
            progressValue: 50,
          } as backgroundTaskManager.ProgressInfo;
          continuousTaskRequest.progressInfo = progress;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700
     * @tc.desc   Test startContinuousTask with progressValue exceeding 100 returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          let progress: backgroundTaskManager.ProgressInfo = {
            title: 'OverProgress',
            fileName: 'over.pkg',
            progressValue: 101,
          };
          continuousTaskRequest.progressInfo = progress;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800006);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800
     * @tc.desc   Test startContinuousTask with negative progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          let progress: backgroundTaskManager.ProgressInfo = {
            title: 'NegProgress',
            fileName: 'neg.dat',
            progressValue: -1,
          };
          continuousTaskRequest.progressInfo = progress;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800006);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900
     * @tc.desc   Test startContinuousTask with very large progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          let progress: backgroundTaskManager.ProgressInfo = {
            title: 'MaxProgress',
            fileName: 'max.dat',
            progressValue: Number.MAX_SAFE_INTEGER,
          };
          continuousTaskRequest.progressInfo = progress;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800006);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_2900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000
     * @tc.desc   Test startContinuousTask with both context and request null returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000 begin---');
        try {
          try {
            let res = await backgroundTaskManager.startContinuousTask(null, null);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200
     * @tc.desc   Test startContinuousTask with progressInfo undefined and MODE_DATA_TRANSFER returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
          continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
          continuousTaskRequest.wantAgent = want;
          continuousTaskRequest.progressInfo = undefined;
          try {
            let res = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200 startContinuousTask unexpected success, res: %{public}s', `${res}`);
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200 startContinuousTask error: %{public}s', JSON.stringify(error));
            done();
            expect(e.code).assertEqual(9800005);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300
     * @tc.desc   Test startContinuousTask exceeding 10 task limit with MODE_DATA_TRANSFER returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 begin---');
        try {
          let want: WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let allStartSuccess: boolean = true;
          for (let i = 0; i < 10; i++) {
            let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
            continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
            continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
            continuousTaskRequest.wantAgent = want;
            continuousTaskRequest.combinedTaskNotification = false;
            let progress: backgroundTaskManager.ProgressInfo = {
              title: 'Task' + `${i}`,
              fileName: 'task' + `${i}` + '.dat',
              progressValue: 10 * (i + 1),
              isMute: false,
            };
            continuousTaskRequest.progressInfo = progress;
            try {
              let res: number = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 task %{public}s success, res: %{public}s', `${i}`, `${res}`);
              if (res <= 0) {
                allStartSuccess = false;
              }
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 task %{public}s error: %{public}s', `${i}`, JSON.stringify(error));
              allStartSuccess = false;
              break;
            }
          }
          if (!allStartSuccess) {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 setup failed, not all 10 tasks started');
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            done();
            expect(false).assertTrue();
          } else {
            let request11 = new backgroundTaskManager.ContinuousTaskRequest();
            request11.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
            request11.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
            request11.wantAgent = want;
            request11.combinedTaskNotification = false;
            request11.progressInfo = {
              title: 'Task11',
              fileName: 'task11.dat',
              progressValue: 50,
              isMute: false,
            };
            try {
              let res: number = await backgroundTaskManager.startContinuousTask(ability.context, request11);
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 11th task unexpected success, res: %{public}s', `${res}`);
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
              done();
              expect(false).assertTrue();
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 11th task error: %{public}s', JSON.stringify(error));
              done();
              expect(e.code).assertEqual(9800005);
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            }
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_ERROR_3300 end---');
      })

  })
}
