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
import deviceInfo from '@ohos.deviceInfo';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansgetnotificationsettingtest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsGetNotificationSettingStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsGetNotificationSettingStaticTest';
  describe('ActsNotificationAnsGetNotificationSettingStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansgetnotificationsettingtest.static"
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
      console.info(`${TAG} beforeEach START`)
      notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err:BusinessError=e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      console.info(`${TAG} beforeEach END`)
    })

    afterEach(async()=>{
      await Utils.msSleep(8000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_Static_0100
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_Static_0100
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationSetting_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationSetting_Static_0100';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        // 1. 打开通知设置页。注意：Promise 要等用户/driver 设置完返回后才 resolve，
        //    所以这里【不能 await】，否则后续 driver 操作永远执行不到。
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
    
        // 2. 等待设置页加载
        let driver = Driver.create();
        await Utils.msSleep(1000);
    
        // 3. 打开“允许通知”（主开关，若当前为开）
        let allowToggle = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} allowToggle: ${JSON.stringify(allowToggle)}`);
        if (allowToggle !== null) {
          await allowToggle.click();
          await Utils.msSleep(1000);
        }
        // 4. 滚动到底部，关闭“桌面角标”（若为开）
        let badgeBottom = await driver.findComponent(ON.text('横幅通知'));
        console.info(testNum + `scrollToBottom badgeBottom, ${JSON.stringify(badgeBottom)} `);
        await badgeBottom?.scrollToBottom()
        await Utils.msSleep(1000);
        let badgeToggle = await driver.findComponent(ON.text('桌面角标'));
        if (badgeToggle !== null) {
          await badgeToggle.click();
          await Utils.msSleep(1000);
        }
        let badgeTop = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `scrollToTop badgeTop, ${JSON.stringify(badgeTop)} `);
        await badgeTop?.scrollToTop();
        await Utils.msSleep(1000);
    
        // 5. 关闭“允许通知”（主开关，若当前为开）
        let anallowToggle = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} anallowToggle: ${JSON.stringify(anallowToggle)}`);
        if (anallowToggle !== null) {
          await anallowToggle.click();
          await Utils.msSleep(1000);
        }

        // 6. 返回应用：优先点“确定”，否则按返回键 → 触发 Promise resolve
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 6. 此时接口返回设置结果，做断言
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        // 7. 再次查询确认已生效
        const afterSetting: notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        console.info(`${testNum} getNotificationSetting success, data: ${JSON.stringify(afterSetting)}`);
        expect(afterSetting.notificationEnabled).assertEqual(false);
        expect(afterSetting.badgeNumberEnabled).assertEqual(false);
        expect(afterSetting.bannerEnabled).assertEqual(false);
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        let e : BusinessError=err as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done(); // 保证只调用一次
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_Static_0400
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_Static_0400
     * @tc.desc   getNotificationSetting test of true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_Static_0400'
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        // 1. 打开通知设置页。注意：Promise 要等用户/driver 设置完返回后才 resolve，
        //    所以这里【不能 await】，否则后续 driver 操作永远执行不到。
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
        await Utils.msSleep(1000);
        // 2. 等待设置页加载
        let driver = Driver.create();
        await Utils.msSleep(1000);
    
        // 3. 打开“允许通知”（主开关，若当前为开）
        let allowToggle = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} allowToggle: ${JSON.stringify(allowToggle)}`);
        if (allowToggle !== null) {
          await allowToggle.click();
          await Utils.msSleep(1000);
        }
        // 4. 滚动到底部，关闭“桌面角标”（若为开）
        let badgeBottom = await driver.findComponent(ON.text('横幅通知'));
        console.info(testNum + `scrollToBottom badgeBottom, ${JSON.stringify(badgeBottom)} `);
        await badgeBottom?.scrollToBottom()
        await Utils.msSleep(1000);
        let badgeToggle = await driver.findComponent(ON.text('桌面角标'));
        if (badgeToggle !== null) {
          await badgeToggle.click();
          await Utils.msSleep(1000);
        }

        let bannerbutton = await driver.findComponent(ON.text('横幅通知'));
        console.info(`${testNum} bannerbutton is ${JSON.stringify(bannerbutton)}`);
        if (bannerbutton !== null) {
          await bannerbutton.click();
          await Utils.msSleep(1000)
        }

        let badgeTop = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `scrollToTop badgeTop, ${JSON.stringify(badgeTop)} `);
        await badgeTop?.scrollToTop();
        await Utils.msSleep(1000);

        // 6. 返回应用：优先点“确定”，否则按返回键 → 触发 Promise resolve
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 6. 此时接口返回设置结果，做断言
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        // 7. 再次查询确认已生效
        const afterSetting: notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        console.info(`${testNum} getNotificationSetting success, data: ${JSON.stringify(afterSetting)}`);
        expect(afterSetting.notificationEnabled).assertEqual(true);
        expect(afterSetting.badgeNumberEnabled).assertEqual(true);
        expect(afterSetting.bannerEnabled).assertEqual(true);
        done();
      } catch (err) {
        let e : BusinessError=err as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done(); // 保证只调用一次
      }
    })
  })
}
