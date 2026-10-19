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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { common, WantAgent, wantAgent } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';

let context: common.UIAbilityContext;
let TAG: string = "actsNotificationAnsThreePartyWatchNoSystemNoPermissionTest"
const ctx = getContext(this) as common.UIAbilityContext
let bundle: string = "com.example.actsnotificationansthreepartywatchnosystemnopermissiontest"

export default function ActsNotificationAnsThreePartyWatchNoSystemNoPermissionTest() {
  describe('ActsNotificationAnsThreePartyWatchNoSystemNoPermissionTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext
      notificationManager.setNotificationEnable({
        bundle: 'com.example.actsnotificationansthreepartywatchnosystemnopermissiontest'
      }, true)
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_ThreePartyWatch_0100
     * @tc.number SUB_Notification_Ans_ThreePartyWatch_0100
     * @tc.desc   [openSubscriptionSeetings] When the permission is not added, error 201 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_ThreePartyWatch_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_ThreePartyWatch_0100';
      try {
        notificationExtensionSubscription.openSubscriptionSettings(context).then(() => {
          console.info(`${testNum}openSubscriberSettings success`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let error = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettings ${JSON.stringify(error)}`)
          if (error?.code === 801) {
            expect(error.code).assertEqual(801);
            done();
          } else {
            expect(error.code).assertEqual(201)
            expect(error.message).assertEqual('Permission denied')
            done();
          }
        });
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code == 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_0400
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_0400
     * @tc.desc   Calling the `getUserGrantedBundleIcon` interface without including the `ohos.permission.SUBSCRIBE_NOTIFICATION` permission will result in error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_0400', Level.LEVEL0, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_0400"
      await notificationExtensionSubscription.getUserGrantedBundleIcon(bundle).then((data: image.PixelMap) => {
        console.info(TAG + `getUserGrantedBundleIcon success`);
        expect(false).assertTrue()
        done()
      }).catch((err: BusinessError) => {
        console.error(TAG +
          `getUserGrantedBundleIcon failed, code is ${err.code}, message is ${err.message}`);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done()
        } else if (err.code == 201) {
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done()
        }
      });
    })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_1400
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_1400
     * @tc.desc   Calling the `disableUserGrantedByBundle` interface without including the `ohos.permission.SUBSCRIBE_NOTIFICATION` permission will result in error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_1400', Level.LEVEL0, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_1400"
      let info: notificationExtensionSubscription.GrantedBundleInfo = {
        bundleName: bundle,
        appIndex: 0
      }
      await notificationExtensionSubscription.disableUserGrantedByBundle(info).then(() => {
        console.info(TAG + "disableUserGrantedByBundle success");
        expect(false).assertTrue()
        done()
      }).catch((err: BusinessError) => {
        console.error(TAG +
          `disableUserGrantedByBundle failed, code is ${err.code}, message is ${err.message}`);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done()
        } else if (err.code == 201) {
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done()
        }
      });
    })
  })
}