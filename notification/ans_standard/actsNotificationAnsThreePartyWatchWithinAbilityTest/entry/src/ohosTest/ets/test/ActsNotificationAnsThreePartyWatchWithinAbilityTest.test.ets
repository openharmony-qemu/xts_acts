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
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { common } from '@kit.AbilityKit';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let context: common.UIAbilityContext;
let bundleName = 'com.example.actsnotificationansthreepartywatchwithinabilitytest'
let tag = 'ActsNotificationAnsThreePartyWatchWithinAbilityTest'

export default function ActsNotificationAnsThreePartyWatchWithinAbilityTest() {
  describe('ActsNotificationAnsThreePartyWatchWithinAbilityTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      await notificationManager.setNotificationEnable({ bundle: bundleName }, true)
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(1000)
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_ThreePartyWatch_0100
     * @tc.number SUB_Notification_Ans_ThreePartyWatch_0100
     * @tc.desc   Verify that the disableNotificationFeature API is called when the permission is canceled and error code 201 is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_ThreePartyWatch_0100', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_ThreePartyWatch_0100'
      let num = 0
      let infos1: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        },
        {
          addr: '11:22:33:44:55', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        },
        {
          addr: '11:22:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      let infos2: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = []
      for (let index = 0; index < 10; index++) {
        let info: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo = {
          addr: `0${index}:${index}3:${index}5:${index}7:${index}9:AB`, // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
        infos2.push(info)
      }
      console.info(testNum + ` infos2 length is:${infos2.length} infos2 data is:${JSON.stringify(infos2)}`)
      try {
        await notificationExtensionSubscription.subscribe(infos1).then((data) => {
          num = 0
          hilog.info(0x0000, 'testTag',
            `${testNum} subscribe success, data: ${JSON.stringify(data)}`);
          num++
          expect(num).assertEqual(1)
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag',
            `${testNum} subscribe failed, code is ${err.code}, message is ${err.message}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else if (err.code === 201) {
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect().assertFail();
            done()
          }
        })
        await sleep(500)
        await notificationExtensionSubscription.getSubscribeInfo()
          .then((data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
            console.info(testNum + `getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
            expect(data.length).assertEqual(3)
            expect(JSON.stringify(data)).assertContain(JSON.stringify(infos1))
          })
          .catch((err: BusinessError) => {
            console.error(`getSubscribeInfo fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
            } else if (err.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect().assertFail();
              done()
            }
          });
        await sleep(1000)
        await notificationExtensionSubscription.subscribe(infos2).then((data) => {
          num = 0
          hilog.info(0x0000, 'testTag',
            `${testNum} subscribe success, data: ${JSON.stringify(data)}`);
          num++
          expect(num).assertEqual(1)
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag',
            `${testNum} subscribe failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
        await sleep(500)
        await notificationExtensionSubscription.getSubscribeInfo()
          .then((data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
            console.info(testNum + `getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
            expect(data.length).assertEqual(10)
            expect(JSON.stringify(data)).assertContain(JSON.stringify(infos2))
            done()
          })
          .catch((err: BusinessError) => {
            console.error(`getSubscribeInfo fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else if (err.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect().assertFail();
              done()
            }
          });
      } catch (err) {
        console.error(testNum + `getSubscribeInfo fail: ${JSON.stringify(err)}${err.message}`);
        if (err.code === 801) {
          expect(err.code).assertEqual(801)
        } else if (err.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    })
  })
}