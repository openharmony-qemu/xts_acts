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
import { notificationExtensionSubscription } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let tag = 'ActsNotificationAnsOpenWindowWithResultWithinAbilityTest'

export default function ActsNotificationAnsOpenWindowWithResultWithinAbilityTest() {
  describe('ActsNotificationAnsOpenWindowWithResultWithinAbilityTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0800
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0800
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog box and the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0800', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0800'
      let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
      try {
        // 1. 打开订阅设置页并等待结果
        const data = notificationExtensionSubscription.openSubscriptionSettingsWithResult(context);
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
    
        // 2. 等待设置页展示并点击“确定”
        await sleep(1000)
        const driver: Driver = Driver.create();
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }

        //3. 此时接口返回设置结果，做断言
        const result = await data;
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, result: ${JSON.stringify(result)}`);
        expect(data.userGrantEnabled).assertEqual(false)
        if (data.grantedBundleInfos !== undefined) {
          expect(JSON.stringify(data.grantedBundleInfos)).assertEqual('[]')
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 201) {
          // 权限不足，按预期放行
          expect(e.code).assertEqual(201)
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0500
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0500
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the switch for allowing the app to obtain local notifications is turned on, and the obtained local notifications remain unchanged. After the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0500', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0500'
      
      try {
        // 1. 打开订阅设置页并拿到结果
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        const data =  notificationExtensionSubscription.openSubscriptionSettingsWithResult(context);
        
        // 2. UI 操作：打开授权开关 → 允许 → 确定
        await sleep(1000)
        const driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let button1 = await driver.findComponent(ON.text('允许'));
        console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
        if (button1 !== null) {
          await sleep(1000);
          await button1.click()
          await sleep(100)
        }
        await sleep(500)
        let button8 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
        if (button8 !== null) {
          await sleep(1000);
          await button8.click()
          await sleep(100)
        }
        
        //3. 此时接口返回设置结果，做断言
        await sleep(1000)
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
        expect(data.userGrantEnabled).assertEqual(true)
        if (data.grantedBundleInfos !== undefined) {
          for (let index = 0; index < data.grantedBundleInfos.length; index++) {
            expect(data.grantedBundleInfos[index].appIndex).assertEqual(0)
          }
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 201) {
          expect(e.code).assertEqual(201)
        }else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0600
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0600
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the switch for allowing the app to obtain local notifications is turned on, and the obtained local notifications remain unchanged. After the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0600', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0600'
      
      try {
        // 1. 打开订阅设置页并验证默认未授权状态
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        const data = notificationExtensionSubscription.openSubscriptionSettingsWithResult(context);
    
        // 2. 等待设置页展示，直接点“确定”关闭（保持开关默认关闭状态）
        await sleep(1000)
        const driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }

        await sleep(1000);
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
        expect(data.userGrantEnabled).assertEqual(false)
        if (data.grantedBundleInfos !== undefined) {
          expect(JSON.stringify(data.grantedBundleInfos)).assertEqual('[]')
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 201) {
          expect(e.code).assertEqual(201)
        }else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1000
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1000
     * @tc.desc   [openSubscriptionSettingsWithResult] After the call to openSubscriptionSettingsWithResult is used to modify the setting of whether to allow the app to obtain local notifications and the setting is confirmed, the app is closed. Then, the openSubscriptionSettingsWithResult call is used again to directly close the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1000', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1000'
      try {
        // 1. 第一次打开设置页，验证当前授权状态（await，失败进统一 catch）
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        const data1 = notificationExtensionSubscription.openSubscriptionSettingsWithResult(context);
    
        // 2. UI 操作：开启授权开关 → 允许 → 全部 → 确定
        await sleep(1000)
        const driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        await sleep(500)
        let button1 = await driver.findComponent(ON.text('允许'));
        console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
        if (button1 !== null) {
          await sleep(1000);
          await button1.click()
          await sleep(100)
        }
        await sleep(1000)
        let button2 = await driver.findComponent(ON.type('Toggle').isAfter(ON.originalText('全部')));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }
        await sleep(1000)
        let button3 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
        if (button3 !== null) {
          await sleep(1000);
          await button3.click()
          await sleep(100)
        }
        // 3. 第一次打开设置页，验证断言
        await sleep(1000);
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data1)}`);
        expect(data1.userGrantEnabled).assertEqual(true)
        if (data1.grantedBundleInfos !== undefined) {
          expect(JSON.stringify(data.grantedBundleInfos)).assertContain('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest","appName":"AAAopenWindow","appIndex":0}')
        }

        // 4. 第二次打开设置页，验证授权已生效
        await sleep(1000)
        const data2 = notificationExtensionSubscription.openSubscriptionSettingsWithResult(context);
    
        // 4. 点击关闭按钮收尾
        await sleep(1000)
        let button4 = await driver.findComponent(ON.type("SymbolGlyph"));
        console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
        if (button4 !== null) {
          await sleep(1000);
          await button4.click()
          await sleep(100)
        }
        // 5. 第二次打开设置页，验证断言
        await sleep(1000)
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data2)}`);
        expect(data2.userGrantEnabled).assertEqual(true)
        if (data2.grantedBundleInfos !== undefined) {
          expect(JSON.stringify(data.grantedBundleInfos)).assertContain('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest","appName":"AAAopenWindow","appIndex":0}')
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 201) {
          expect(e.code).assertEqual(201)
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1300
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1300
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1300', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1300'
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        for (let index = 0; index < 500; index++) {
          notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
            hilog.info(0x0000, 'testTag',
              `${testNum} ${index} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(index).assertEqual(0)
            done();
          }).catch(async (e: Error) => {
            let err: BusinessError = e as BusinessError
            hilog.error(0x0000, 'testTag',
              `${testNum} ${index} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            }else if (index === 499) {
              expect(err.code).assertEqual(1600018);
              await sleep(1000)
              let driver: Driver = Driver.create();
              let button6 = await driver.findComponent(ON.text('确定'));
              console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
              if (button6 !== null) {
                console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
                sleep(1000);
                (await button6).click()
                sleep(100)
              }
            } else {
              expect(err.code).assertEqual(1600018);
            }
          });
          if (index === 0) {
            await sleep(1000)
          }
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(false).assertTrue();
          done()
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1400
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1400
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1400', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1400'
      try {
        // 传 null，预期抛出参数错误 401（或设备不支持 801）
        const data = notificationExtensionSubscription.openSubscriptionSettingsWithResult(null);
        // 若成功返回，说明参数校验失效，判失败
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 401) {
          // 参数错误，符合预期
          expect(e.code).assertEqual(401);
        } else if (e.code === 201) {
          // 设备不支持该能力，按预期放行
          expect(e.code).assertEqual(201);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })

     /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1500
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1500
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1500', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1500'
      try {
        // 传 undefined，预期抛出参数错误 401（或设备不支持 801）
        const data = await notificationExtensionSubscription.openSubscriptionSettingsWithResult(undefined);
        // 若成功返回，说明参数校验失效，判失败
        hilog.info(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag',
          `${testNum} openSubscriptionSettingsWithResult failed, code is ${e.code}, message is ${e.message}`);
        if (e.code === 401) {
          // 参数错误，符合预期
          expect(e.code).assertEqual(401);
        } else if (e.code === 201) {
          // 设备不支持该能力，按预期放行
          expect(e.code).assertEqual(201);
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    })
  })
}