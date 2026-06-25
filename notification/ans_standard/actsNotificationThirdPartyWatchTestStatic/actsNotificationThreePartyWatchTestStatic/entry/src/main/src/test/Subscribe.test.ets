'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityAccessCtrl, {
  Context, PermissionRequestResult, Permissions
} from '@ohos.abilityAccessCtrl';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let commonTag: string = "Subscribe"
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext

export default function actsNotificationAnsThreePartySubscribeTest() :void {

  describe('actsNotificationAnsThreePartySubscribeTest', () => {

    /**
      * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Static_1011_884
      * @tc.number Sub_Notification_Ans_ThreePartyWatch_Static_1011_884
      * @tc.desc   verify the promise function
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1011_884', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // 定义当前测试用例的日志标签
      let TAG = "Sub_Notification_Ans_ThreePartyWatch_Static_1011_884 ";
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [];
      // 1、调用subscribe(info: NotificationExtensionSubscriptionInfo[]): Promise<void>接口订阅成功，其中addr按照备注方法获取，type填写BLUETOOTH
      await notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success222");
        expect().assertFail();
        done()
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`subscribe fail: ${JSON.stringify(err.code)}`);
        expect(err.code).assertEqual(401);
        done();
      });
    })
  })
}