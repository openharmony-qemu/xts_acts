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
import { notificationExtensionSubscription, notificationManager, notificationSubscribe } from '@kit.NotificationKit';
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

export default function ActsNotificationAnsThreePartyWatchWithOutAbilityTest() {
  describe('ActsNotificationAnsThreePartyWatchWithOutAbilityTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      notificationManager.setNotificationEnable({
        bundle: "com.example.actsnotificationansthreepartywatchwithoutabilitytest"
      }, true)
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_ThreePartyWatch_0200
     * @tc.number SUB_Notification_Ans_ThreePartyWatch_0200
     * @tc.desc   [subscribe] The API is called, but the application has not implemented NotificationSubscriberExtensionAbility, resulting in error code 1600023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_ThreePartyWatch_0200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_ThreePartyWatch_0200';
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89',
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      let num = 0
      try {
        await notificationExtensionSubscription.subscribe(infos).then(() => {
          num = 0
          console.info(testNum + "subscribe success");
          num++
          expect(num).assertEqual(1);
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.error(`${testNum}subscribe fail:  ${err.code}, ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else if (err?.code === 201) {
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect(err.code).assertEqual(1600023);
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', testNum +`restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_ThreePartyWatch_0300
     * @tc.number SUB_Notification_Ans_ThreePartyWatch_0300
     * @tc.desc   The `getUserGrantedEnabledBundles-public` API returns an empty string if no authorized application is found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_ThreePartyWatch_0300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_ThreePartyWatch_0300';
      try {
        await notificationExtensionSubscription.getUserGrantedEnabledBundles().then((data: notificationExtensionSubscription.GrantedBundleInfo[]) => {
          console.info(testNum +`getUserGrantedEnabledBundles successfully. Data: ${JSON.stringify(data)}`);
          expect(JSON.stringify(data)).assertEqual('[]');
          done()
        }).catch((err: BusinessError) => {
          console.error(testNum +`getUserGrantedEnabledBundles fail: ${JSON.stringify(err)}`);
          if (err?.code === 201) {
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', testNum +`restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}