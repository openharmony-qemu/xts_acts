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
} from '@ohos/hypium-static/src/main/indexStatic'
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { RecordData } from '@ohos.base';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
import deviceInfo from '@ohos.deviceInfo';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansopenwindowwithresultstatictest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest';
  describe('ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansopenwindowwithresultstatictest.static"
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
      await Utils.msSleep(3000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0700
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0700
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult API is called to display a semi-modal dialog and the user clicks OK, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0700';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;

      try {
        // 1. 先发起接口，不 await（Promise 要等从设置页返回才 resolve）
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
    
        // 2. 等待设置页出现并返回
        await Utils.msSleep(1000);
        let driver = Driver.create();
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 3. 等接口返回设置结果
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
    
        // 4. 断言：打开设置页后应返回一个 NotificationSetting，字段应存在
        expect(result.notificationEnabled).assertEqual(false);
        expect(result.bannerEnabled).assertEqual(false);
        expect(result.badgeNumberEnabled).assertEqual(true)
        done();
      } catch (err) {
        let e : BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0100
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable or disable the ringing and vibration switch and then the user confirms the operation, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0100';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;

      try {
        // 1. 打开设置页。不 await——Promise 要等从设置页返回后才 resolve
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
    
        // 2. 确定性关闭「允许通知」：当前为开才点击
        await Utils.msSleep(1000);
        let driver = Driver.create();
        let allowToggle = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        if (allowToggle !== null) {
          await allowToggle.click();
          await Utils.msSleep(500);
        }
    
        // 3. 滚动到「桌面角标」，进入其设置
        let badgeItem = await driver.findComponent(ON.text('桌面角标'));
        await badgeItem?.scrollToBottom();
        if (badgeItem !== null) {
          await Utils.msSleep(1000);
          await badgeItem.click();
          await Utils.msSleep(1000);
        }
    
        // 4. 返回应用：优先「确定」，否则按返回键，确保 Promise 能 resolve
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 5. 等接口返回设置结果并断言（与操作一致：允许通知已关闭）
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        expect(result.notificationEnabled).assertEqual(true);
        expect(result.bannerEnabled).assertEqual(false);
        expect(result.badgeNumberEnabled).assertEqual(false);
        done();
      } catch (err) {
        let e : BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0200
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable or disable the ringing and vibration switch and then the user confirms the operation, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0200';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      
    
      try {
        // 1. 记录初始状态（便于调试与后续恢复）
        let initSetting: notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        console.info(`${testNum} init setting: ${JSON.stringify(initSetting)}`);
    
        // 2. 打开设置页。不 await——Promise 要等从设置页返回后才 resolve
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
    
        // 3. 等待设置页出现
        await Utils.msSleep(1000);
        let driver = Driver.create();

        // 4. 滚动到「横幅通知」并确定性开启
        let bannerItem = await driver.findComponent(ON.text('横幅通知'));
        await bannerItem?.scrollToBottom();
        await Utils.msSleep(500);
        let bannerToggle = await driver.findComponent(ON.text('横幅通知'));
        if (bannerToggle !== null) {
          await bannerToggle.click();
          await Utils.msSleep(500);
        }
    
        // 5. 「桌面角标」确定性开启
        let badgeToggle = await driver.findComponent(ON.text('桌面角标'));
        if (badgeToggle !== null) {
          await badgeToggle.click();
          await Utils.msSleep(500);
        }
    
        // 7. 返回应用：优先「确定」，否则按返回键，确保 Promise resolve
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 8. 等接口返回并断言全部为「开」
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        expect(result.notificationEnabled).assertEqual(true);
        expect(result.bannerEnabled).assertEqual(true);
        expect(result.badgeNumberEnabled).assertEqual(true);
    
        done();
      } catch (err) {
        let e = err as BusinessError;
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0900
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0900
     * @tc.desc   [openNotificationSettingsWithResult] Invoke openNotificationSettingsWithResult, modify the lock screen notification, banner notification, desktop icon, ringing, vibration, and notification enable status, and then disable it. Invoke openNotificationSettingsWithResult again to close the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0900';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        // 0. 记录初始状态（作为预期基准）
        let initSetting: notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        console.info(`${testNum} init setting: ${JSON.stringify(initSetting)}`);
    
        // ============ 第一次打开设置页并返回 ============
        let promise1 = notificationManager.openNotificationSettingsWithResult(testContext);
        await Utils.msSleep(500);
        let driver = Driver.create();
        let confirm1 = await driver.findComponent(ON.text('确定'));
        if (confirm1 !== null) {
          await confirm1.click();
        }
        await Utils.msSleep(1000);
        let result1 = await promise1;
        console.info(`${testNum} 1st open success, data: ${JSON.stringify(result1)}`);
        expect(result1.notificationEnabled).assertEqual(initSetting.notificationEnabled);
        expect(result1.bannerEnabled).assertEqual(initSetting.bannerEnabled);
        expect(result1.badgeNumberEnabled).assertEqual(initSetting.badgeNumberEnabled);
    
        // ============ 第二次打开设置页，用返回图标退出 ============
        let promise2 = notificationManager.openNotificationSettingsWithResult(testContext);
        await Utils.msSleep(500);
        let backIcon = await driver.findComponent(ON.type('SymbolGlyph'));
        console.info(`${testNum} backIcon: ${JSON.stringify(backIcon)}`);
        if (backIcon !== null) {
          await backIcon.click();
        }
        await Utils.msSleep(1000);
        let result2 = await promise2;
        console.info(`${testNum} 2nd open success, data: ${JSON.stringify(result2)}`);
    
        // 核心断言：两次调用返回的结果一致（连续调用稳定性）
        expect(result2.notificationEnabled).assertEqual(result1.notificationEnabled);
        expect(result2.bannerEnabled).assertEqual(result1.bannerEnabled);
        expect(result2.badgeNumberEnabled).assertEqual(result1.badgeNumberEnabled);
    
        done();
      } catch (err) {
        let e = err as BusinessError;
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1100
     * @tc.desc   [openNotificationSettingsWithResult] The openNotificationSettingsWithResult method is called, and the lock screen notification, banner notification, app icon badge, ringing, vibration, and notification enabling switches are turned on. Then, a notification is sent to remind the user of the new notification mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1100';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        },
      }
    
      try {
        // 0. 记录初始状态
        let initSetting: notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        console.info(`${testNum} init setting: ${JSON.stringify(initSetting)}`);
    
        // 1. 打开设置页，不 await（Promise 要等从设置页返回才 resolve）
        const settingPromise = notificationManager.openNotificationSettingsWithResult(testContext);
    
        // 2. 等待设置页出现
        await Utils.msSleep(500);
        let driver = Driver.create();
    
        // 3. 返回应用：优先「确定」，否则按返回键
        let confirmBtn = await driver.findComponent(ON.text('确定'));
        if (confirmBtn !== null) {
          await confirmBtn.click();
        }
        await Utils.msSleep(1000);
    
        // 4. 等接口返回，断言通知已开启
        const result = await settingPromise;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        expect(result.notificationEnabled).assertEqual(true);
        expect(result.bannerEnabled).assertEqual(true);
          expect(result.badgeNumberEnabled).assertEqual(true);
        // 5. 发布通知，验证通知开启状态下 publish 成功
        try {
          await notificationManager.publish(notificationRequest);
          console.info(`${testNum} publish success`);
        } catch (err) {
          let e : BusinessError = err as BusinessError;
          console.error(`${testNum} publish failed, code: ${e.code}, message: ${e.message}`);
          if (e?.code === 801) {
            expect(e.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
    
        // 6. 清理：取消已发布通知，避免影响后续用例
        try {
          await notificationManager.cancel(1);
        } catch (e) {
          console.info(`${testNum} cancel ignored`);
        }
        done();
      } catch (err) {
        let e :BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `${testNum} failed, code: ${e.code}, message: ${e.message}`);
        if (e?.code === 801) {
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0400
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0400
     * @tc.desc   [openSubscriptionSettingsWithResult] The NotificationSubscriberExtensionAbility of an app does not implement the openSubscriptionSettingsWithResult API, and error 1600023 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0400';
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
    
      try {
        // 预期：应用无订阅权限，调用应失败并返回 201（PERMISSION_DENIED）
        await notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext);
        // 如果走到这里 = 意外成功 → 断言失败暴露问题
        console.error(`${testNum} unexpectedly succeeded`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let e : BusinessError = err as BusinessError;
        console.error(`${testNum} failed, code: ${e.code}, message: ${e.message}`);
        // 只接受预期错误码 201；其他一律视为失败
        if (e?.code === 201) {
          expect(e.code).assertEqual(201);
          done();
        } else if (e?.code === 1600023) {
          expect(e?.code).assertEqual(1600023);
          done();
        } else {
          console.error(`${testNum} unexpected error code: ${e.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1200
     * @tc.desc   Call the openNotificationSettingsWithResult API 500 times, and no crash, freeze, or black screen occurs on the device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1200';
      let num:int=0
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        await Utils.msSleep(1000)
        for (let index = 0; index < 500; index++) {
          notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
            hilog.info(0x0000, 'testTag', `${testNum}${index+1}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(index).assertEqual(0);
          }).catch(async(e:Error) => {
            let err:BusinessError=e as BusinessError
            hilog.error(0x0000, 'testTag', `${testNum}${index+1}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err?.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(1600018);
              if (index === 499) {
                await Utils.msSleep(2000)
                let driver = Driver.create();
                let buttonStack = await driver.findComponent(ON.type("SymbolGlyph"));
                console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
                if (buttonStack !== null) {
                  console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
                  await Utils.msSleep(500)
                  await buttonStack?.click();
                  await Utils.msSleep(500)
                } else {
                  console.info(`${testNum} null button`);
                  expect(buttonStack === null).assertEqual(true)
                  done()
                }
                await Utils.msSleep(500)
              }
              done()
            }
          });
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

  })
}
