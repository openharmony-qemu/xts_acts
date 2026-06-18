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
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
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
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { RecordData } from '@ohos.base';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansgetapplistsortingthirdtest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsGetAppListSortingThirdStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsGetAppListSortingThirdStaticTest';
  describe('ActsNotificationAnsGetAppListSortingThirdStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansgetapplistsortingthirdtest.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });

    beforeEach(async() => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err:BusinessError=e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetAppList_Sorting_Static_0100
     * @tc.number SUB_Notification_Ans_GetAppList_Sorting_Static_0100
     * @tc.desc   [Foundation] [getNotificationStatisticsByBundle] Error 202 Is Reported When a Third-Party App Calls the API.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetAppList_Sorting_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetAppList_Sorting_Static_0100';
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      notificationManager.requestEnableNotification(context).then(() => {
        console.info(`requestEnableNotification succeeded`);
      }).catch((err) => {
        console.info(`requestEnableNotification err: ` + JSON.stringify(err));
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      });
      await Utils.msSleep(1000)
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await Utils.msSleep(1000)
        await button.click();
        await Utils.msSleep(1000)
      } else {
        console.info(`null button`);
        expect(button).assertContain('允许')
      }
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      };
      let bundles: notificationManager.BundleOption[] = [
        {bundle:"com.example.actsnotificationansgetapplistsortingthirdtest.static"}
      ];
      await notificationManager.publish(notificationRequest).then(() => {
        console.info(testNum +"publish success");
      }).catch((e: Error): void => {
        let err: BusinessError = e as BusinessError
        console.error(`${testNum}publish failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail()
        done()
      });
      await Utils.msSleep(1000)
      try{
        await notificationManager.getNotificationStatisticsByBundle(bundles).then((data: notificationManager.BundleNotificationStatistics[]) => {
          console.info(`${testNum} getNotificationStatisticsByBundle success , data is ${JSON.stringify(data)}`)
          expect().assertFail()
          done()
        })
          .catch((e: Error):void => {
            let err: BusinessError = e as BusinessError
            console.error(`${testNum} getNotificationStatisticsByBundle err: ${JSON.stringify(err)}`)
            if(err.code === 801){
              expect(err?.code).assertEqual(801)
              done()
            }else{
              expect(err?.code).assertEqual(202)
              done()
            }
          });
      }catch(err){
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
