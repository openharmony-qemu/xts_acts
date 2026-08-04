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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { notificationSubscribe, notificationManager } from '@kit.NotificationKit';
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { BusinessError, RecordData } from '@ohos.base';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';

const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansnodisplayediconnoSystem.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsNotificationAnsNoDisplayedIconNoSystemStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsNoDisplayedIconNoSystemStaticTest';
  describe('ActsNotificationAnsNoDisplayedIconNoSystemStaticTest', () => {

    beforeAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansnodisplayediconnoSystem.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });

    beforeEach(async () => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err :BusinessError = e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_NoDisplayedIcon_Static_0100
     * @tc.number SUB_Notification_Ans_NoDisplayedIcon_Static_0100
     * @tc.desc   After subscribing, the `onEnabledSilentReminderChanged` method calls the `setSilentReminderEnabled` API, passing the actual bundle name and uid, with `enabled` set to `true`
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_NoDisplayedIcon_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_Notification_Ans_NoDisplayedIcon_Static_0100';
        let num: int = 0
        let userId: int = 100
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
        let uid: int = 0;
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          uid = data?.appInfo?.uid as int;
        })
        let bundle: notificationManager.BundleOption = {
          bundle: bundleName,
          uid: uid
        };
        let onEnabledSilentReminderChangedCallback: notificationSubscribe.EnabledSilentReminderChangedCallback =
          (callbackData: notificationSubscribe.EnabledSilentReminderCallbackData) => {
            console.info(testNum + "bundle: ", callbackData.bundle);
            console.info(testNum + "uid: ", callbackData.uid);
            console.info(testNum + "enable: ", callbackData.enableStatus);
          };
        let subscriber: notificationSubscribe.NotificationSubscriber = {
          onEnabledSilentReminderChanged: onEnabledSilentReminderChangedCallback
        };
        try {
          await notificationSubscribe.subscribeNotification(subscriber).then(() => {
            num = 0
            console.info(testNum + "subscribeNotification success");
            num++
            expect(num).assertEqual(1)
          }).catch((e: Error): void => {
            let err = e as BusinessError
            console.error(`${testNum}subscribeNotification fail:  ${err.code}, ${err.message}`);
            expect(err?.code).assertEqual(202);
            done();
          });
        } catch (err) {
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
          expect(err?.code).assertEqual(202);
          done();
        }
      })
  })
}
