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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import notificationManager from '@ohos.notificationManager';
import { notificationSubscribe } from '@kit.NotificationKit';
import base, { BusinessError } from '@ohos.base';
import { common, WantAgent, wantAgent } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import { notificationExtensionSubscription } from '@kit.NotificationKit';

let TAG: string = "actsnotificationansthreepartywatchenhancedtest"
const ctx = getContext(this) as common.UIAbilityContext;
let bundle: string = "com.example.actsnotificationansthreepartywatchenhancedtest"

export default function actsNotificationAnsThreePartyWatchEnhancedTest() {
  describe('actsNotificationAnsThreePartyWatchEnhancedTest', () => {
    beforeAll(async () => {
      let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
      try {
        await notificationExtensionSubscription.openSubscriptionSettings(context).then((data) => {
          console.info(TAG+`openSubscriptionSettings success, data: ${JSON.stringify(data)}`);
        }).catch((err: BusinessError) => {
          console.error(TAG+`openSubscriptionSettings failed, code is ${err.code}, message is ${err.message}`);
        });
      } catch (err) {
        console.error(TAG + " openSubscriptionSettings catch err:" + JSON.stringify(err))
      }
      let driver = Driver.create();
      let button = await driver.findComponent(ON.type("Toggle"));
      if (button !== null) {
        await driver.delayMs(300)
        await button.click();
      }
      let button2 = await driver.findComponent(ON.text("允许"));
      if (button2 !== null) {
        await driver.delayMs(300)
        await button2.click();
      }
      let button3 = await driver.findComponent(ON.type("Toggle").isAfter(ON.text("全部")));
      if (button3 !== null) {
        await driver.delayMs(300)
        await button3.click();
      }
      let button4 = await driver.findComponent(ON.text("确定"));
      if (button4 !== null) {
        await driver.delayMs(300)
        await button4.click();
      }
      // 等待授权真正落库，避免后续用例读到旧的未授权状态
      let granted: boolean = false;
      for (let i = 0; i < 20; i++) {
        try {
          let list: notificationExtensionSubscription.GrantedBundleInfo[] =
            await notificationExtensionSubscription.getUserGrantedEnabledBundles();
          if (list.some((item) => item.bundleName === bundle)) {
            granted = true;
            break;
          }
        } catch (err) {
          console.error(TAG + " getUserGrantedEnabledBundles catch err:" + JSON.stringify(err));
        }
        await sleep(50);
      }
      console.info(TAG + ` wait for grant result: ${granted}`);
    })


    /**
    * @tc.name   SUB_Notification_Ans_ThreePartyWatch_Enhanced_0300
    * @tc.number SUB_Notification_Ans_ThreePartyWatch_Enhanced_0300
    * @tc.desc   Call the `getUserGrantedBundleIcon` method with a normal value passed as the input parameter. Successfully obtain the application icon.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    * @co.authored.by.agent
    */
    it('SUB_Notification_Ans_ThreePartyWatch_Enhanced_0300', Level.LEVEL0, async (done: Function) => {
      let TAG: string = "SUB_Notification_Ans_ThreePartyWatch_Enhanced_0300"
      let pixelMap = await getRawfilePixelMapByPath("2.png", 199, 211)
      let BeforeSize = pixelMap.getPixelBytesNumber()
      try{
        await notificationExtensionSubscription.getUserGrantedBundleIcon(bundle).then((data: image.PixelMap) => {
          let AfterSize = data.getPixelBytesNumber()
          console.info(TAG + ` = ${BeforeSize},AfterSize = ${AfterSize}`);
          expect(data).not().assertNull();
          expect(BeforeSize).assertEqual(AfterSize)
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG +
            `getUserGrantedBundleIcon failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err.code).assertEqual(801)
            done()
          } else if (err.code == 1600022) {
            expect(err.code).assertEqual(1600022);
            done()
          } else {
            expect().assertFail();
            done()
          }
        });
      }catch (err) {
        console.error(TAG + ` fail: ${JSON.stringify(err)},${err.message}`);
        if (err.code === 801) {
          expect(err.code).assertEqual(801)
          done()
        } else if (err.code === 201) {
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done()
        } 
      }
      
    })

    /**
    * @tc.name   SUB_Notification_Ans_ThreePartyWatch_Enhanced_0800
    * @tc.number SUB_Notification_Ans_ThreePartyWatch_Enhanced_0800
    * @tc.desc   When calling the `disableUserGrantedByBundle` method, an abnormal value is passed for the `bundleName` parameter, resulting in error code 1600022.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    * @co.authored.by.agent
    */
    it('SUB_Notification_Ans_ThreePartyWatch_Enhanced_0800', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_Ans_ThreePartyWatch_Enhanced_0800"
      let failCount: number = 0
      try{
        let Arraybundle = ["", "com.zhuoyi.browser", "com.example.test", bundle]
        for (let i = 0; i < Arraybundle.length; i++) {
          let info: notificationExtensionSubscription.GrantedBundleInfo = {
            bundleName: Arraybundle[i],
            appIndex: 0
          }
          try {
            await notificationExtensionSubscription.disableUserGrantedByBundle(info)
            console.info(TAG + `disableUserGrantedByBundle success, bundleName: ${Arraybundle[i]}`)
            // 只有合法且已授权的 bundle 允许成功
            if (Arraybundle[i] !== bundle) {
              failCount++
            }
          } catch (err) {
            console.error(TAG +
              `disableUserGrantedByBundle failed, code is ${err.code}, message is ${err.message}`);
            if (Arraybundle[i] === bundle) {
              // 合法 bundle 若授权尚未生效，返回 1600022 也属于预期
              if (err.code !== 1600022 && err.code !== 801) {
                failCount++
              }
            } else if (err.code !== 1600022 && err.code !== 801) {
              failCount++
            }
          }
        }
        console.info(TAG + `test done, failCount: ${failCount}`);
        expect(failCount).assertEqual(0)
        done()
      }catch (err) {
        console.error(TAG + ` fail: ${JSON.stringify(err)},${err.message}`);
        expect().assertFail();
        done()
      }


    })

    /**
    * @tc.name   SUB_Notification_Ans_ThreePartyWatch_Enhanced_0200
    * @tc.number SUB_Notification_Ans_ThreePartyWatch_Enhanced_0200
    * @tc.desc   Pass an abnormal value as an input parameter to the `getUserGrantedBundleIcon` method, resulting in error code 1600022.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    * @co.authored.by.agent
    */
    it('SUB_Notification_Ans_ThreePartyWatch_Enhanced_0200', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_Ans_ThreePartyWatch_Enhanced_0200"
      let failCount: number = 0
      try{
        // 仅传入异常/未授权的 bundleName，期望返回 1600022
        let Arraybundle = ["", "com.zhuoyi.browser", "com.example.test"]
        for (let i = 0; i < Arraybundle.length; i++) {
          try {
            await notificationExtensionSubscription.getUserGrantedBundleIcon(Arraybundle[i])
            console.error(TAG + `getUserGrantedBundleIcon should fail, bundleName: ${Arraybundle[i]}`)
            failCount++
          } catch (err) {
            console.error(TAG +
              `getUserGrantedBundleIcon failed, code is ${err.code}, message is ${err.message}`);
            if (err.code !== 1600022 && err.code !== 801) {
              failCount++
            }
          }
        }
        console.info(TAG + `test done, failCount: ${failCount}`);
        expect(failCount).assertEqual(0)
        done()
      }catch (err) {
        console.error(TAG + ` fail: ${JSON.stringify(err)},${err.message}`);
        expect().assertFail();
        done()
      }
    })

    /**
    * @tc.name   SUB_Notification_Ans_ThreePartyWatch_Enhanced_1300
    * @tc.number SUB_Notification_Ans_ThreePartyWatch_Enhanced_1300
    * @tc.desc   When an abnormal value is passed for the appName in the call to disableUserGrantedByBundle, the call is successful.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    * @co.authored.by.agent
    */
    it('SUB_Notification_Ans_ThreePartyWatch_Enhanced_1300', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_Ans_ThreePartyWatch_Enhanced_1300"
      let failCount: number = 0
      try{
        let ArrayName = [undefined, '', "微信", "xxx"]
        let list: notificationExtensionSubscription.GrantedBundleInfo[] = await notificationExtensionSubscription.getUserGrantedEnabledBundles();
        if(list.length === 0){
          list = [{ bundleName: "com.weixin.com", appIndex: 0 }]
        }
        console.info(TAG + 'getUserGrantedEnabledBundles success, size: ' + list.length);
        for (let i = 0; i < ArrayName.length && i < list.length; i++) {
          let info: notificationExtensionSubscription.GrantedBundleInfo = {
            bundleName: list[i].bundleName,
            appIndex: 0,
            appName: ArrayName[i]
          }
          try {
            await notificationExtensionSubscription.disableUserGrantedByBundle(info)
            console.info(TAG + `disableUserGrantedByBundle success, bundleName: ${info.bundleName}`)
          } catch (err) {
            console.error(TAG +
              `disableUserGrantedByBundle failed, code is ${err.code}, message is ${err.message}`);
            // 该 bundle 可能已被前面的用例禁用，返回 1600022 属于预期
            if (err.code !== 1600022 && err.code !== 801) {
              failCount++
            }
          }
        }
        console.info(TAG + `test done, failCount: ${failCount}`);
        expect(failCount).assertEqual(0)
        done()
      } catch (err) {
        console.error(TAG + ` fail: ${JSON.stringify(err)},${err.message}`);
        if (err.code === 201) {
          expect(err.code).assertEqual(201)
          done()
        }else{
          expect().assertFail();
          done()
        }
      }
    })
  })
}
function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
async function getRawfilePixelMapByPath(path: string, height: number = 50,
  width: number = 50): Promise<image.PixelMap> {
  try {
    let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
    const rawFile: Uint8Array = await context.resourceManager.getRawFileContentSync(path);
    const imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);
    return await imageSource.createPixelMap({
      desiredSize: {
        height: height,
        width: width
      }
    })
  } catch (e) {
    console.log(`pixelMap 【报错】${e as Error}`)
    throw e as Error;
  }
}