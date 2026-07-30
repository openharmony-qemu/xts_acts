/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager, notificationSubscribe } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';
import bundleManager from '@ohos.bundle.bundleManager'
let context: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function ActsNotificationAnsNoDisplayedIconNoSystemTest() {
  describe('ActsNotificationAnsNoDisplayedIconNoSystemTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      notificationManager.setNotificationEnable({
        bundle: "com.example.actsnotificationansnodisplayediconnosystemtest"
      }, true)
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_NoDisplayedIcon_0100
     * @tc.number SUB_Notification_Ans_NoDisplayedIcon_0100
     * @tc.desc   [202] A non-system application calls an interface to subscribe to the onEnabledSilentReminderChanged event, resulting in error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_NoDisplayedIcon_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_NoDisplayedIcon_0100';
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      let uid: number = 0;
      bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
        uid = data?.appInfo?.uid as number;
      })
      let bundle: notificationManager.BundleOption = {
        bundle: "com.example.actsnotificationansnodisplayediconnosystemtest",
      };

      let num: number = 0
      let onEnabledSilentReminderChangedCallback: notificationSubscribe.EnabledSilentReminderChangedCallback =
        (callbackData: notificationSubscribe.EnabledSilentReminderCallbackData) => {
          console.info(testNum + "bundle: ", callbackData.bundle);
          console.info(testNum + "uid: ", callbackData.uid);
          console.info(testNum + "enable: ", callbackData.enableStatus);
          expect(false).assertTrue();
          done();
        };

      let subscriber: notificationSubscribe.NotificationSubscriber = {
        onEnabledSilentReminderChanged: onEnabledSilentReminderChangedCallback
      };
      try {
        await notificationSubscribe.subscribeNotification(subscriber).then(() => {
          num = 0
          console.info(testNum + "subscribeNotification success");
          num++
          expect(num).assertEqual(1);
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          let err: BusinessError = error as BusinessError
          console.error(testNum + `subscribeNotification failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202);
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}