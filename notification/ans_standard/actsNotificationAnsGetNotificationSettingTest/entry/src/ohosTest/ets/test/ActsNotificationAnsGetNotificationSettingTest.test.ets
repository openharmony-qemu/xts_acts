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
import { describe, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { notificationManager } from '@kit.NotificationKit';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function ActsNotificationAnsGetNotificationSettingTest() {
  describe('ActsNotificationAnsGetNotificationSettingTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_0100
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_0100
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_0100', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_0100'
      try {
        // 1. 打开半模态设置页，仅记录日志，不在打开时断言
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        const openData = notificationManager.openNotificationSettingsWithResult(context);
        hilog.info(0x0000, 'testTag',
          `${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(openData)}`);
    
        // 2. 等待设置页展示，关闭“允许通知”
        await sleep(1000)
        const driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
    
        // 3. 滚动到底部，关闭“桌面角标”
        let scrollBar = await driver.findComponent(ON.text('桌面角标'))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        await scrollBar?.scrollToBottom()
        await sleep(1000)
        let button2 = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          await sleep(1000);
          await button2.click()
          await sleep(500)
        }
    
        // 4. 滚动回顶部，关闭“允许通知”
        let scrollBar1 = await driver.findComponent(ON.text('桌面角标'))
        console.info(testNum + `scrollToTop scrollBar, ${JSON.stringify(scrollBar1)} `);
        await scrollBar1?.scrollToTop()
        await sleep(1500);
        let button3 = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
        if (button3 !== null) {
          console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
          await sleep(1000);
          await button3.click()
          await sleep(500)
        }
    
        // 5. 点击“确定”保存设置
        let button4 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
        if (button4 !== null) {
          await sleep(2000)
          await button4.click()
        }
        await sleep(1500)
    
        // 6. 校验设置结果
        const result = await openData;
        console.info(`${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(result)}`);
        expect(result.bannerEnabled).assertEqual(false)
        expect(result.notificationEnabled).assertEqual(false)

        const afterSetting : notificationManager.NotificationSetting = await notificationManager.getNotificationSetting();
        hilog.info(0x0000, 'testTag',
          `${testNum} getNotificationSetting success, data: ${JSON.stringify(afterSetting)}`);
        expect(afterSetting.bannerEnabled).assertEqual(false)
        expect(afterSetting.notificationEnabled).assertEqual(false)
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} fail, code is ${e.code}, message is ${e.message}`);
        if (e.code === 801) {
          // 设备不支持该能力时用例通过
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_0200
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_0200
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_0200', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_0200'
      try {
        // 传入 null，预期抛出参数错误 401（或设备不支持 801）
        const dataPromsie = notificationManager.openNotificationSettingsWithResult(null);
        hilog.info(0x0000, 'testTag',
          `${testNum} openNotificationSettingsWithResult success, dataPromsie: ${JSON.stringify(dataPromsie)}`);
        const data = await dataPromsie;  
        expect(data.lockScreenEnabled).assertEqual(true)
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openNotificationSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 401) {
          // 参数错误，符合预期
          expect(e.code).assertEqual(401);
        } else if (e.code === 801) {
          // 设备不支持该能力时用例通过
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_0300
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_0300
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_0300', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_0300'
      try {
        // 传入 undefined，预期抛出参数错误 401（或设备不支持 801）
        const dataPromsie = notificationManager.openNotificationSettingsWithResult(undefined);
        hilog.info(0x0000, 'testTag',
          `${testNum} openNotificationSettingsWithResult success, dataPromsie: ${JSON.stringify(dataPromsie)}`);
        const data = await dataPromsie;
        expect(data.lockScreenEnabled).assertEqual(true)
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openNotificationSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 401) {
          // 参数错误，符合预期
          expect(e.code).assertEqual(401);
        } else if (e.code === 801) {
          // 设备不支持该能力时用例通过
          expect(e.code).assertEqual(801);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })
  })
}