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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, afterEach} from "../../../hypium/index";
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
                hilog.info(DOMAIN, TAG, '3100 startBackgroundRunning promise success');
                let taskId: number = res.continuousTaskId ?? -1,
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

  })
}
