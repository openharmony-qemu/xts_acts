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
import { describe, it, expect, Level, beforeAll } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager } from '@kit.NotificationKit';
import { common } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

let uid: number = 0;
let bundleName = 'com.example.actsnotificationansgetapplistsortingtest'
let tag = 'ActsNotificationAnsGetAppListSortingTest'
let context: common.UIAbilityContext;

export default function ActsNotificationAnsGetAppListSortingTest() {
  describe('ActsNotificationAnsGetAppListSortingTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext
      notificationManager.requestEnableNotification(context).then(() => {
        console.info(`requestEnableNotification succeeded`);
      }).catch((e: Error) => {
        let err: BusinessError = e as BusinessError
        console.info(`requestEnableNotification err: ` + JSON.stringify(err));
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      });
      await sleep(1000)
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
      } else {
        console.info(`null button`);
        expect(button).assertContain('允许')
      }
    })
    /**
     * @tc.name   SUB_Notification_Ans_GetAppList_Sorting_0100
     * @tc.number SUB_Notification_Ans_GetAppList_Sorting_0100
     * @tc.desc   [getNotificationStatisticsByBundle] Error 202 is reported when a third-party app calls this API.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetAppList_Sorting_0100', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_GetAppList_Sorting_0100'
      let num = 0
      let bundles: notificationManager.BundleOption[] = [
        { bundle: bundleName, uid: uid }
      ];
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 8,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: '普通服务提醒',
            text: '你的普通服务已完成',
          }
        },
      }
      try {
        await notificationManager.publish(notificationRequest).then(() => {
          num++
          hilog.info(0x0000, 'testTag', `${testNum}${num}publish success`);
          expect(num).assertEqual(1)
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}publish failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail()
          done();
        });
        await notificationManager.getNotificationStatisticsByBundle(bundles).then(
          (data: notificationManager.BundleNotificationStatistics[]) => {
            console.info(`${testNum} getNotificationStatisticsByBundle success, data is ${JSON.stringify(data)}`)
            expect().assertFail()
            done();
          }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum}getNotificationStatisticsByBundle failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202);
            done();
          }
        });
      } catch (err) {
        console.error(testNum + `getAllNotificationEnabledBundles fail: ${JSON.stringify(err)}${err.message}`);
        if (err.code === 801) {
          expect(err.code).assertEqual(801)
          done()
        } else {
          expect().assertFail()
          done();
        }
      }
    })
  })
}