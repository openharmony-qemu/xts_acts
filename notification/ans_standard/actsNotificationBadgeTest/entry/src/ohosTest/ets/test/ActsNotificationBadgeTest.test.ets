/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import { BusinessError } from '@ohos.base'
import { common } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
let ctx = getContext(this) as common.UIAbilityContext;

export default function ActsNotificationBadgeTest() {
  describe('SUB_NOTIFICATION_ANS_BADGE_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_BADGE_test START')
    beforeAll(async (done: Function) => {
      let button = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      log(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
        done()
      } else {
        log('null button');
        done()
      }
      notificationManager.requestEnableNotification(ctx).then(() => {
        console.info(`${TAG} requestEnableNotification succeeded`);
        done()
      }).catch((err: Error) => {
        console.info(`${TAG} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
        done()
      });
      await sleep(1500);
      let driver = Driver.create();
      await sleep(1500)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1500);
        await button.click();
        await sleep(500);
        done()
      } else {
        console.info('null button');
        expect(button).assertContain('允许')
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Corner_Query_0004
     * @tc.name    Sub_Notification_Ans_Corner_Query_0004
     * @tc.desc    non-system application invokes the onBadgeNumberQuery and offBadgeNumberQuery interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Corner_Query_0004', Level.LEVEL2, async (done: Function) => {
      TAG = TAG + "Sub_Notification_Ans_Corner_Query_0004 "
      try{
        notificationManager.onBadgeNumberQuery(
          async (bundleOption: notificationManager.BundleOption) => {
            return 1;
          }
        );
      } catch(err) {
        hilog.info(0x0000, TAG, `onBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
      }
      await sleep(500)
      try{
        notificationManager.offBadgeNumberQuery();
      } catch(err) {
        hilog.info(0x0000, TAG, `offBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(202)
        console.info(TAG + "Sub_Notification_Ans_Corner_Query_0004 PASS");
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Corner_Query_0011
     * @tc.name    Sub_Notification_Ans_Corner_Query_0011
     * @tc.desc    If registration is not required, set the corner mark. The value is 0.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('Sub_Notification_Ans_Corner_Query_0011', Level.LEVEL1, async (done: Function) => {
      TAG = TAG + "Sub_Notification_Ans_Corner_Query_0011 "
      try {
        notificationManager.getBadgeNumber().then((badge) => {
          console.info(TAG, '角标=' + badge);
          expect(badge).assertEqual(0)
          console.info(TAG + "Sub_Notification_Ans_Corner_Query_0011 PASS");
          done()
        }).catch((err: BusinessError) => {
          console.info(TAG, "getBadgeNumber error" + JSON.stringify(err));
          expect(err.code).assertNull()
          done()
        })
      } catch (e) {
        console.info(TAG, "getBadgeNumber error" + JSON.stringify(e));
        expect(e).assertNull()
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Corner_Query_0008
     * @tc.name    Sub_Notification_Ans_Corner_Query_0008
     * @tc.desc    Invoke the getBadgeNumber interface to obtain the number of corner marks.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Ans_Corner_Query_0008', Level.LEVEL0, async (done: Function) => {
      TAG = TAG + "Sub_Notification_Ans_Corner_Query_0008 "
      let badgeNumber: number = 10;
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 11,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        },
        badgeNumber: 15
      };
      await notificationManager.setBadgeNumber(badgeNumber).then(() => {
        console.info(`${TAG} Succeeded in setting badge number.`);
      }).catch((err: BusinessError) => {
        console.error(`Failed to set badge number. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(0)
      });
      await sleep(500)
      await notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} Succeeded in publishing notification.`);
      }).catch((err: BusinessError) => {
        console.error(`${TAG} Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(0)
        done()
      });
      await sleep(500)
      try {
        notificationManager.getBadgeNumber().then((badge) => {
          console.info(TAG, '角标=' + badge);
          expect(badge).assertEqual(25)
          console.info(TAG + "Sub_Notification_Ans_Corner_Query_0008 PASS");
          done()
        }).catch((err: BusinessError) => {
          console.info(TAG, "getBadgeNumber error" + JSON.stringify(err));
          expect(err).assertNull()
          done()
        })
      } catch (e) {
        console.info(TAG, "getBadgeNumber error" + JSON.stringify(e));
        expect(e).assertNull()
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_0900
     * @tc.number Sub_Notification_Ans_Corner_SetNum_0900
     * @tc.desc   verify the callback function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_0900', Level.LEVEL0, async (done: Function) => {
      try {
        notificationManager.setBadgeNumber(10, (err) => {
          if (err) {
            console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(true).assertTrue()
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          } else {
            console.log("Sub_Notification_Ans_Corner_SetNum_0900 success")
            expect(true).assertTrue()
            done();
          }
        })
      } catch (err) {
        console.log(`Sub_Notification_Ans_Corner_SetNum_0900 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_SetNum_1000
     * @tc.number Sub_Notification_Ans_Corner_SetNum_1000
     * @tc.desc   verify the promise function of setBadgeNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Corner_SetNum_1000', Level.LEVEL0, async (done: Function) => {
      try {
        await notificationManager.setBadgeNumber(10).then(() => {
          console.log("Sub_Notification_Ans_Corner_SetNum_1000 success")
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError) => {
          console.log(`Sub_Notification_Ans_Corner_SetNum_1000 failed, error code: ${err.code}, message: ${err.message}`)
            if(err.code == 801){
              expect(true).assertTrue()
              done()
            }else{
              expect(false).assertTrue()
              done()
            }

        })
      } catch (err) {
        console.log(`Sub_Notification_Ans_Corner_SetNum_1000 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })
  })
}