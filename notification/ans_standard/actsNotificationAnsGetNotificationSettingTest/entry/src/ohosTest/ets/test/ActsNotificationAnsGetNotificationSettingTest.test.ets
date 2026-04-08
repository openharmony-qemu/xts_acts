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
import { describe, afterEach, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { notificationManager } from '@kit.NotificationKit';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function ActsNotificationAnsGetNotificationSettingTest() {
  describe('ActsNotificationAnsGetNotificationSettingTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_0100
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_0100
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_0100', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_0100'
      let driver: Driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then(async(data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(data.lockScreenEnabled).assertEqual(false)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          expect(data.notificationEnabled).assertEqual(false)
          await sleep(1000)
          notificationManager.getNotificationSetting().then((data) => {
            hilog.info(0x0000, 'testTag',
              `${testNum} getNotificationSetting success, data: ${JSON.stringify(data)}`);     
              expect(data.lockScreenEnabled).assertEqual(false)
            expect(data.bannerEnabled).assertEqual(false)
            expect(data.badgeNumberEnabled).assertEqual(false)
            expect(data.notificationEnabled).assertEqual(false)
            done()
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag',
              `${testNum} getNotificationSetting failed, code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done()
          });
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag',
            `${testNum} openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(500)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
          let button1 = await driver.findComponent(ON.text('锁屏通知'));
          console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
          if (button1 !== null) {
            console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
            await sleep(1000);
            await button1.click()
            await sleep(500)
          }
          let button2 = await driver.findComponent(ON.text('桌面角标'));
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          if (button2 !== null) {
            console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
            await sleep(1000);
            await button2.click()
            await sleep(500)
          }
        await sleep(500)
        let button3 = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
        if (button3 !== null) {
          console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
          await sleep(1000);
          await button3.click()
          await sleep(500)
        }
        await sleep(500)
        let button4 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
        if (button4 !== null) {
          console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
          await sleep(1000);
          await button4.click()
          await sleep(500)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })
  })
}