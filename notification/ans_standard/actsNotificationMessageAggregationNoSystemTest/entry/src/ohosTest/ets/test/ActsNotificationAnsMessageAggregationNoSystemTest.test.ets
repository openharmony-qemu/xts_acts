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
import deviceInfo from '@ohos.deviceInfo';
import { image } from '@kit.ImageKit';
import { WantAgent, wantAgent } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { installer } from '@kit.AbilityKit';

let TAG: string = "HitsNotificationTest"
let context: common.UIAbilityContext;
let bundleName: string = "com.example.actsnotificationmessageagreegationnosystemtest"

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}


export default function actsNotificationAnsMessageAggregationNoSystemTest() {
  describe('actsNotificationAnsMessageAggregationNoSystemTest', () => {
    beforeAll(async () => {
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(1000)
    })
    afterAll(() => {
    })


    /**
     * @tc.name   SUB_Notification_Ans_Message_Aggregation_1300
     * @tc.number SUB_Notification_Ans_Message_Aggregation_1300
     * @tc.desc   [setNotificationSwitch]三方应用调用请求接口，报错202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Message_Aggregation_1300', Level.LEVEL1, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Message_Aggregation_1300';
      let num = 0
      let switchName: string = 'LOGISTICS';
      let switchState: boolean = true;
      let userId: number = 100;

      try {
        await notificationManager.setNotificationSwitch(switchName, switchState, userId).then(() => {
          console.info(testNum + 'setNotificationSwitch success');
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(testNum + `setNotificationSwitch failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 202) {
            expect(err.code).assertEqual(202)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
      } catch (err) {
        console.error(testNum + ` fail, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Message_Aggregation_2600
     * @tc.number SUB_Notification_Ans_Message_Aggregation_2600
     * @tc.desc   [getNotificationSwitch]三方应用调用请求接口，报错202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Message_Aggregation_2600', Level.LEVEL1, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Message_Aggregation_2600';
      let switchName: string = 'DEAL';
      let userId: number = 100;

      try {
        await notificationManager.getNotificationSwitch(switchName, userId).then(() => {
          console.info(testNum + 'setNotificationSwitch success');
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(testNum + `setNotificationSwitch failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 202) {
            expect(err.code).assertEqual(202)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
      } catch (err) {
        console.error(testNum + ` fail, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })


  })
}