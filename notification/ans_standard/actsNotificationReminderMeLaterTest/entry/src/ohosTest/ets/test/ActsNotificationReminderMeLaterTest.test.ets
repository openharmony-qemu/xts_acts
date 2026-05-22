/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import base, { BusinessError } from '@ohos.base';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import common from '@ohos.app.ability.common';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

let ctx = getContext(this) as common.UIAbilityContext;

export default function actsNotificationReminderMeLaterTest() {
  let TAG = 'actsNotificationReminderMeLaterTest ===>'

  describe('actsNotificationReminderMeLaterTest', () => {
    beforeAll(async (done: Function) => {
      notificationManager.requestEnableNotification(ctx).then(() => {
        console.info(`${TAG} requestEnableNotification succeeded`);
      }).catch((err: Error) => {
        console.info(`${TAG} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
        done()
      });
      let driver = Driver.create();
      await sleep(1500)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TAG} button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
        done()
      } else {
        console.info('${TAG} null button');
        expect(button).assertContain('允许')
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_ReminderMe_Later_0100
     * @tc.number SUB_Notification_Ans_ReminderMe_Later_0100
     * @tc.desc   test 三方应用调用接口，报错202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_ReminderMe_Later_0100', Level.LEVEL2, async (done : Function) => {
      let TAG = "SUB_Notification_Ans_ReminderMe_Later_0100"
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test",
            text: "test",
          }
        },
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        hashCode: "hashCode"
      };

      await notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} publish success`);
      }).catch((err: BusinessError):void => {
        console.error(`${TAG} publish failed, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done()
      });
      let delayTime: number = 1;
      await notificationManager.snoozeNotification("hashCode", 1).then(() => {
        console.info(TAG+"snoozeNotification success.")
        expect(false).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        expect(err.code).assertEqual(202)
        done()
        console.error(TAG+`snoozeNotification failed, code is ${err.code}, message is ${err.message}`);
      });
    })
  })
}