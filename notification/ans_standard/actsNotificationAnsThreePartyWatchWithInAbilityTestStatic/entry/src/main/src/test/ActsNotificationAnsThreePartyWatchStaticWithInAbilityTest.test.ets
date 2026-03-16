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
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';

const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansthreepartywatchstaticwithinabilitytest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function actsNotificationAnsThreePartyWatchStaticWithInAbilityTest() {
  const TEST_Project_NAME = 'actsNotificationAnsThreePartyWatchStaticWithInAbilityTest';
  describe('actsNotificationAnsThreePartyWatchStaticWithInAbilityTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansthreepartywatchstaticwithinabilitytest.static"
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
      await notificationManager.removeAllSlots()
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Static_1057
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Static_1057
     * @tc.desc   [getUserGrantedEnabledBundles-public] Unauthorized App. The interface returns a null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'Sub_Notification_Ans_ThreePartyWatch_Static_1057';
      let num:int=0
      try {
        notificationExtensionSubscription.getUserGrantedEnabledBundles().then((data: notificationExtensionSubscription.GrantedBundleInfo[]) => {
          num++
          console.info(testNum+num+`getUserGrantedEnabledBundles successfully. Data: ${JSON.stringify(data)}`);
          expect(JSON.stringify(data?.[3]?.bundleName)).assertEqual('com.ohos.contacts')
          expect(JSON.stringify(data?.[4]?.bundleName)).assertEqual('com.ohos.mms')
          done()
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.error(testNum+`getUserGrantedEnabledBundles fail: ${JSON.stringify(err)}`);
          done()
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err).assertEqual(0)
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Static_1001
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Static_1001
     * @tc.desc   [openSubscriptionSeetings] Error 1600018 is reported when the notification window is started and the interface is requested again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'Sub_Notification_Ans_ThreePartyWatch_Static_1001';
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
          await notificationExtensionSubscription.openSubscriptionSettings(testContext).then(() => {
            console.info(`${testNum}openSubscriberSettings1 success`);
          }).catch((e:Error) => {
            let error = e as BusinessError
            console.error(`${testNum}failed to call openSubscriptionSettings1 ${JSON.stringify(error)}`)
            done()
          });
          await Utils.msSleep(1000)
          await notificationExtensionSubscription.openSubscriptionSettings(testContext).then(() => {
            console.info(`${testNum}openSubscriberSettings2 success`);
            done()
          }).catch((e:Error) => {
            let error = e as BusinessError
            console.error(`${testNum}failed to call openSubscriptionSettings2 ${error.code}, ${error.message}`)
            expect(error.code).assertEqual(1600018)
            expect(error.message).assertEqual('The notification settings window is already displayed')
            done()
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err).assertEqual(0)
        done();
      }
    })
  })
}
