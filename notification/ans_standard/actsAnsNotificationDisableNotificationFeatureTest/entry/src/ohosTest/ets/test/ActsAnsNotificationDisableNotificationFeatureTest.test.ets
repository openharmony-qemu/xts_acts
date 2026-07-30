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
import { describe, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager } from '@kit.NotificationKit';


function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function ActsAnsNotificationDisableNotificationFeatureTest() {
  describe('ActsAnsNotificationDisableNotificationFeatureTest', () => {

    /**
     * @tc.name   SUB_Ans_Notification_DisableNotificationFeature_0300
     * @tc.number SUB_Ans_Notification_DisableNotificationFeature_0300
     * @tc.desc   Verify that the disableNotificationFeature API is called when the permission is canceled and error code 201 is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Ans_Notification_DisableNotificationFeature_0300', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Ans_Notification_DisableNotificationFeature_0300'
      let disabled: boolean = true;
      let bundleList: Array<string> = ["com.example.actsansnotificationdisablenotificationfeaturetest"];
      try {
        notificationManager.disableNotificationFeature(disabled, bundleList).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} disableNotificationFeature success, data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} disableNotificationFeature failed, code is ${err.code}, message is ${err.message}`);
            if(err.code===801){
              expect(err.code).assertEqual(801)
              done()
            }else{
              expect(err.code).assertEqual(202)
              done()
            }
        })
      } catch (err) {
        console.error(testNum + `disableNotificationFeature fail: ${JSON.stringify(err)}${err.message}`);
        if(err.code===801){
          expect(err.code).assertEqual(801)
          done()
        }else{
          expect(err.code).assertEqual(202)
          done()
        }
      }
    })
  })
}