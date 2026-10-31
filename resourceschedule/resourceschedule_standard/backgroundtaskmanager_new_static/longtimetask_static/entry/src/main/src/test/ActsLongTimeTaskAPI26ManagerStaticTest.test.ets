'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, afterEach} from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { WantAgent as _WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"
import Utils from './Util.test';
let DOMAIN: int = 0x0000;
let TAG: string = 'testTag';

export default function ActsLongTimeTaskAPI26ManagerStaticTest() {
  describe('ActsLongTimeTaskAPI26ManagerStaticTest', () => {

    let wantAgentFlags: Array<wantAgent.WantAgentFlags> = new Array<wantAgent.WantAgentFlags>();

    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actslongtimetasktest.static",
          abilityName: "EntryAbility"
        }
      ],
      requestCode: 0,
      actionFlags: wantAgentFlags,
      actionType: wantAgent.OperationType.START_ABILITY
    };

    let key: int = backgroundTaskManager.BackgroundSubMode.CAR_KEY;

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_NEARLINK value is 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100 begin---');

        try {
          let type: int = backgroundTaskManager.BackgroundTaskMode.MODE_NEARLINK;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100 backgroundTaskManager BackgroundTaskMode MODE_NEARLINK: ' + type);
          expect(type).assertEqual(14);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0100 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200
     * @tc.desc   Test that the startBackgroundRunning function and stopBackgroundRunning and updateBackgroundRunning function normal call with MODE_NEARLINK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_NEARLINK];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              let callbackFlag = 1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((updateRes: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 updateBackgroundRunning promise res: %{public}s', JSON.stringify(updateRes));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 Operation updateBackgroundRunning succeeded");
                  expect(updateRes.continuousTaskId).assertLarger(-1);
                  expect(updateRes.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 stopBackgroundRunning promise run success.');
                    expect(callbackFlag).assertEqual(1);
                    done();
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0200 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of USER_CANCEL_REMOVE_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.USER_CANCEL_REMOVE_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0300 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0400 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(7);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_NOT_USE_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_NOT_USE_LOCATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0800 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_NOT_USE_BLUETOOTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_NOT_USE_BLUETOOTH;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_0900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000 begin---');
        await Utils.msSleep(1500);

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(10);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_USE_ILLEGALLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_USE_ILLEGALLY;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(11);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_DATA_TRANSFER_NOT_UPDATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_DATA_TRANSFER_NOT_UPDATE;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(12);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_VOIP_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_VOIP_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(13);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_USER_UNAUTHORIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400 begin---');

        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_USER_UNAUTHORIZED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(14);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_VOIP_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_VOIP_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(13);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_BLUETOOTH_DATA_NOT_EXIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_BLUETOOTH_DATA_NOT_EXIST;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(14);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1600 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_POSITION_NOT_MOVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_POSITION_NOT_MOVED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(15);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1700 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_PLAYBACK_MUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_PLAYBACK_MUTE;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(16);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1800 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_NEARLINK_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_NEARLINK_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(17);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_1900 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_NEARLINK_DATA_NOT_EXIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_NEARLINK_DATA_NOT_EXIST;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(18);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2000 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_USER_UNAUTHORIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_USER_UNAUTHORIZED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(19);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2100 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning bgModes dataTransfer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadTask',
                    fileName: 'data.pkg',
                    progressValue: 30,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    wantAgent: want,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 updateDataTransferProgress success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300
     * @tc.desc   Test updateDataTransferProgress with startBackgroundRunning ContinuousTaskRequest dataTransfer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'SyncData',
                    fileName: 'sync.dat',
                    progressValue: 60,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 updateDataTransferProgress success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400
     * @tc.desc   Test updateDataTransferProgress with ProgressInfo without progressValue (no progress ring)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadNoRing',
                    fileName: 'file.bin',
                    isMute: true,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 updateDataTransferProgress without progressValue success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500
     * @tc.desc   Test updateDataTransferProgress with progressValue 0 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadStart',
                    fileName: 'start.dat',
                    progressValue: 0,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 updateDataTransferProgress progressValue=0 success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600
     * @tc.desc   Test updateDataTransferProgress with progressValue 100 boundary isMute false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'DownloadComplete',
                    fileName: 'complete.pkg',
                    progressValue: 100,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 updateDataTransferProgress progressValue=100 isMute=false success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700
     * @tc.desc   Test updateDataTransferProgress with progressValue 100 isMute true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'UploadDone',
                    fileName: 'done.rar',
                    progressValue: 100,
                    isMute: true,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 updateDataTransferProgress progressValue=100 isMute=true success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800
     * @tc.desc   Test updateDataTransferProgress with wantAgent parameter in DataTransferProgress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'TransferWithAgent',
                    fileName: 'agent.iso',
                    progressValue: 75,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    wantAgent: want,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 updateDataTransferProgress with wantAgent success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900
     * @tc.desc   Test ProgressInfo structure title and fileName only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'TitleOnly',
                    fileName: 'name.txt',
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 updateDataTransferProgress title+fileName only success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_2900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000
     * @tc.desc   Test updateDataTransferProgress called multiple times with different progress values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 startBackgroundRunning promise success');
                let taskId: int = res.continuousTaskId ?? -1;
                let progressValues: int[] = [0, 25, 50, 75, 100];
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
                    hilog.info(DOMAIN, TAG, `SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 updateDataTransferProgress progressValue=${progressValues[i]} success`);
                  } catch (err) {
                    allSuccess = false;
                    hilog.info(DOMAIN, TAG, `SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 updateDataTransferProgress progressValue=${progressValues[i]} error: %{public}s`, JSON.stringify(err));
                  }
                }
                expect(allSuccess).assertTrue();
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 stopBackgroundRunning success");
                }).catch((err: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 stopBackgroundRunning failed. code is ${err.code}`);
                });
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100
     * @tc.desc   Test ContinuousTaskRequest with ProgressInfo when starting dataTransfer task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let flag = 1;
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
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 startBackgroundRunning with progressInfo success');
                expect(flag).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 stopBackgroundRunning success");
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3100 end---');
      })

      /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200
     * @tc.desc   Test updateDataTransferProgress with fileName & title is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 startBackgroundRunning promise success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: '',
                    fileName: '',
                    progressValue: 75,
                    isMute: false,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    wantAgent: want,
                    progressInfo: progress,
                  };
                  let flag = 1;
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 updateDataTransferProgress with wantAgent success');
                  expect(flag).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 catch stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3200 end---');
      })

      /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100
     * @tc.desc   Test updateDataTransferProgress with invalid continuousTaskId returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
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
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800005);
                done();
              }
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200
     * @tc.desc   Test updateDataTransferProgress with negative continuousTaskId returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
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
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 updateDataTransferProgress unexpected success');
                expect(false).assertTrue();
                done();
              } catch (err) {
                let e: BusinessError = err as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                expect(e.code).assertEqual(9800006);
                done();
              }
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300
     * @tc.desc   Test updateDataTransferProgress without dataTransfer task returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 startBackgroundRunning AUDIO_PLAYBACK success');
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
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 updateDataTransferProgress unexpected success');
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800005);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400
     * @tc.desc   Test updateDataTransferProgress with progressValue exceeding 100 boundary returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 startBackgroundRunning success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'OverProgress',
                    fileName: 'over.pkg',
                    progressValue: 101,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 updateDataTransferProgress unexpected success');
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500
     * @tc.desc   Test updateDataTransferProgress with negative progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModes: Array<string> = ['dataTransfer'];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 startBackgroundRunning success');
                try {
                  let progress: backgroundTaskManager.ProgressInfo = {
                    title: 'NegProgress',
                    fileName: 'neg.dat',
                    progressValue: -1,
                  };
                  let dataTransferProgress: backgroundTaskManager.DataTransferProgress = {
                    continuousTaskId: res.continuousTaskId ?? -1,
                    progressInfo: progress,
                  };
                  backgroundTaskManager.updateDataTransferProgress(ability.context, dataTransferProgress);
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 updateDataTransferProgress unexpected success');
                  expect(false).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 stopBackgroundRunning success");
                  done();
                } catch (err) {
                  let e: BusinessError = err as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 updateDataTransferProgress error: %{public}s', JSON.stringify(err));
                  expect(e.code).assertEqual(9800006);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 stopBackgroundRunning success");
                  done();
                }
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_0500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_NOT_USE_USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_NOT_USE_USB;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(16);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3300 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_USB_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_USB_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(20);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3400 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_NOT_USE_NEARLINK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_NOT_USE_NEARLINK;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(15);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3500 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_USB_CONNECTION value is 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600 begin---');
        try {
          let type: int = backgroundTaskManager.BackgroundTaskMode.MODE_USB_CONNECTION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600 backgroundTaskManager BackgroundTaskMode MODE_USB_CONNECTION: ' + type);
          expect(type).assertEqual(16);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3600 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and full progressInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'DataTransfer',
                fileName: 'transfer.dat',
                progressValue: 50,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and progressValue 0 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'StartBound',
                fileName: 'start.dat',
                progressValue: 0,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and progressValue 100 isMute false boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'EndRing',
                fileName: 'endring.pkg',
                progressValue: 100,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_3900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and progressValue 100 isMute true boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'EndMute',
                fileName: 'endmute.rar',
                progressValue: 100,
                isMute: true,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and progressInfo without progressValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'NoProgressValue',
                fileName: 'noring.dat',
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200
     * @tc.desc   Test startContinuousTask with MODE_DATA_TRANSFER and progressInfo without isMute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'NoIsMute',
                fileName: 'nomute.dat',
                progressValue: 60,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300
     * @tc.desc   Test startContinuousTask with MODE_AUDIO_PLAYBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_PLAYBACK];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400
     * @tc.desc   Test startContinuousTask with MODE_AUDIO_RECORDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_RECORDING];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500
     * @tc.desc   Test startContinuousTask with MODE_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600
     * @tc.desc   Test startContinuousTask with MODE_BLUETOOTH_INTERACTION and SUBMODE_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700
     * @tc.desc   Test startContinuousTask with MODE_BLUETOOTH_INTERACTION and SUBMODE_CAR_KEY_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_CAR_KEY_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800
     * @tc.desc   Test startContinuousTask with MODE_MULTI_DEVICE_CONNECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_MULTI_DEVICE_CONNECTION];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900
     * @tc.desc   Test startContinuousTask with MODE_VOIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_VOIP];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_4900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000
     * @tc.desc   Test startContinuousTask with MODE_AV_PLAYBACK_AND_RECORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100
     * @tc.desc   Test startContinuousTask with MODE_NEARLINK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_NEARLINK];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200
     * @tc.desc   Test startContinuousTask return continuousTaskId and stop with specific id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'StopWithId',
                fileName: 'stopid.dat',
                progressValue: 80,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context, res).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 stopBackgroundRunning with continuousTaskId success');
                  done();
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 stopBackgroundRunning with continuousTaskId error: %{public}s', JSON.stringify(error));
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  expect(false).assertTrue();
                  done();
                });
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300
     * @tc.desc   Test startContinuousTask with combinedTaskNotification true to merge notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let requestA = new backgroundTaskManager.ContinuousTaskRequest();
              requestA.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
              requestA.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              requestA.wantAgent = want;
              requestA.combinedTaskNotification = true;
              backgroundTaskManager.startContinuousTask(ability.context, requestA).then((resA: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 taskA success, resA: %{public}s', `${resA}`);
                expect(resA).assertLarger(0);
                let requestB = new backgroundTaskManager.ContinuousTaskRequest();
                requestB.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
                requestB.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
                requestB.wantAgent = want;
                requestB.combinedTaskNotification = true;
                requestB.continuousTaskId = resA;
                backgroundTaskManager.startContinuousTask(ability.context, requestB).then((resB: int) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 taskB success, resB: %{public}s', `${resB}`);
                  expect(resB).assertLarger(0);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  done();
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 taskB error: %{public}s', JSON.stringify(error));
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                  expect(false).assertTrue();
                  done();
                });
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 taskA error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400
     * @tc.desc   Test startContinuousTask with empty backgroundTaskModes returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500
     * @tc.desc   Test startContinuousTask with empty backgroundTaskSubmodes returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [];
              continuousTaskRequest.wantAgent = want;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600
     * @tc.desc   Test startContinuousTask with mode and submode mismatch returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700
     * @tc.desc   Test startContinuousTask with combinedTaskNotification true and continuousTaskId -1 returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = true;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5700 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800
     * @tc.desc   Test startContinuousTask with combinedTaskNotification true and non-existent continuousTaskId returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = true;
              continuousTaskRequest.continuousTaskId = 99999;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900
     * @tc.desc   Test startContinuousTask with progressValue exceeding 100 returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'OverProgress',
                fileName: 'over.pkg',
                progressValue: 101,
              };
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800006);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_5900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000
     * @tc.desc   Test startContinuousTask with negative progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'NegProgress',
                fileName: 'neg.dat',
                progressValue: -1,
              };
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800006);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100
     * @tc.desc   Test startContinuousTask with very large progressValue returns error 9800006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'MaxProgress',
                fileName: 'max.dat',
                progressValue: 2147483647,
              };
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800006);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200
     * @tc.desc   Test startContinuousTask exceeding 10 task limit with MODE_DATA_TRANSFER returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 begin---');
        try {
          let want: _WantAgent = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability: UIAbility = await delegator.getCurrentTopAbility();
          let allStartSuccess: boolean = true;
          for (let i: int = 0; i < 10; i++) {
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
              let res: int = await backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest);
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 task %{public}s success, res: %{public}s', `${i}`, `${res}`);
              if (res <= 0) {
                allStartSuccess = false;
              }
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 task %{public}s error: %{public}s', `${i}`, JSON.stringify(error));
              allStartSuccess = false;
              break;
            }
          }
          if (!allStartSuccess) {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 setup failed');
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
            expect(false).assertTrue();
            done();
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
            backgroundTaskManager.startContinuousTask(ability.context, request11).then((res: int) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 11th task unexpected success, res: %{public}s', `${res}`);
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
              expect(false).assertTrue();
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 11th task error: %{public}s', JSON.stringify(error));
              expect(error.code).assertEqual(9800005);
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
              done();
            });
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300
     * @tc.desc   Test startContinuousTask with invalid backgroundTaskModes value returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              let invalidMode = 999 as backgroundTaskManager.BackgroundTaskMode;
              continuousTaskRequest.backgroundTaskModes = [invalidMode];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
                expect(false).assertTrue();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              done();
              expect(false).assertTrue();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 getWantAgent error: %{public}s', JSON.stringify(error));
            done();
            expect(false).assertTrue();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6300 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400
     * @tc.desc   Test startContinuousTask with invalid backgroundTaskSubmodes value returns error 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let invalidSubmode = 999 as backgroundTaskManager.BackgroundTaskSubmode;
              continuousTaskRequest.backgroundTaskSubmodes = [invalidSubmode];
              continuousTaskRequest.wantAgent = want;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 startContinuousTask unexpected success');
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
                expect(false).assertTrue();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              done();
              expect(false).assertTrue();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 getWantAgent error: %{public}s', JSON.stringify(error));
            done();
            expect(false).assertTrue();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 error: %{public}s', JSON.stringify(error));
          done();
          expect(false).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6400 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500
     * @tc.desc   Test startContinuousTask with ProgressInfo title empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: '',
                fileName: 'emptytitle.dat',
                progressValue: 50,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6500 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600
     * @tc.desc   Test startContinuousTask with ProgressInfo fileName empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let progress: backgroundTaskManager.ProgressInfo = {
                title: 'EmptyFileName',
                fileName: '',
                progressValue: 50,
                isMute: false,
              };
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.progressInfo = progress;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6600 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800
     * @tc.desc   Test startContinuousTask with MODE_AV_PLAYBACK_AND_RECORD and SUBMODE_AVSESSION_AUDIO_PLAYBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AVSESSION_AUDIO_PLAYBACK];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6800 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900
     * @tc.desc   Test startContinuousTask with MODE_AV_PLAYBACK_AND_RECORD and SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 begin---');
        await Utils.msSleep(1500);
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_6900 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000
     * @tc.desc   Test startContinuousTask with MODE_AV_PLAYBACK_AND_RECORD and SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7000 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100
     * @tc.desc   Test startContinuousTask with MODE_AV_PLAYBACK_AND_RECORD and SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 begin---');
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = [backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD];
              continuousTaskRequest.backgroundTaskSubmodes = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION];
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              backgroundTaskManager.startContinuousTask(ability.context, continuousTaskRequest).then((res: int) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 startContinuousTask success, res: %{public}s', `${res}`);
                expect(res).assertLarger(0);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {}).catch(() => {});
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 startContinuousTask error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7100 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskDetailedCancelReason of SYSTEM_CANCEL_USB_ALREADY_OCCUPIED value is 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskDetailedCancelReason.SYSTEM_CANCEL_USB_ALREADY_OCCUPIED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200 ContinuousTaskDetailedCancelReason: ' + type);
          expect(type).assertEqual(17);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7200 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_USB_ALREADY_OCCUPIED value is 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300 begin---');
        try {
          let type: int = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_USB_ALREADY_OCCUPIED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300 ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(21);
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300 error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API26_TASK_STATIC_XTS_7300 end---');
      })

  })
}
