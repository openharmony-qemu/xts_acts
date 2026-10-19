'use static'

/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback, RecordData} from '@ohos.base';
import { Component, Driver, ON } from '@ohos.UiTest'
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import notificationSubscribe from '@ohos.notificationSubscribe';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import notificationManager from "@ohos.notificationManager"
import image from '@ohos.multimedia.image'
import { $r } from '@ohos.arkui.component';
import { Driver, ON } from '@ohos.UiTest';
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';

let testAbilityContext:common.UIAbilityContext;
let bundle_name:string = "com.example.actsnotificationansthreepartywatchenhancedtest.static";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = "actsNotificationAnsThreePartyWatchEnhancedTest"

async function getRawfilePixelMapByPath(path: string, height: int = 50,
  width: int = 50): Promise<image.PixelMap|undefined> {
  try {
    let Context:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
    const rawFile: Uint8Array = await Context.resourceManager.getRawFileContentSync(path);
    const imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer) as image.ImageSource;
    return await imageSource.createPixelMap({
      desiredSize: {
        height: height,
        width: width
      }as image.Size
    } as image.DecodingOptions)
  } catch (e) {
    console.log(`pixelMap 【报错】${e as Error}`)
    throw e as Error;
  }
}

export default function actsNotificationAnsThreePartyWatchEnhancedTest(): void {
  describe('actsNotificationAnsThreePartyWatchEnhancedTest', () => {
    beforeAll(async():Promise<void> => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      let cmd = `aa start -a EntryAbility -b ${bundle_name}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
      try {
        await notificationExtensionSubscription.openSubscriptionSettings(testAbilityContext).then((data) => {
          console.info(TAG+`openSubscriptionSettings success, data: ${JSON.stringify(data)}`);
        }).catch((error: Error):void => {
          let err = error as BusinessError;
          console.error(TAG+`openSubscriptionSettings failed, code is ${err.code}, message is ${err.message}`);
        });
      } catch (err) {
        console.error(TAG + " openSubscriptionSettings catch err:" + JSON.stringify(err))
      }
      let driver = Driver.create();
      let button = await driver.findComponent(ON.type("Toggle"));
      await driver.delayMs(300)
      await button?.click();
      let button2 = await driver.findComponent(ON.text("允许"));
      await driver.delayMs(300)
      await button2?.click();
      let button3 = await driver.findComponent(ON.type("Toggle").isAfter(ON.text("全部")));
      await driver.delayMs(300)
      await button3?.click();
      let button4 = await driver.findComponent(ON.text("确定"));
      await driver.delayMs(300)
      await button4?.click();
    })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0300
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0300
     * @tc.desc   Call the `getUserGrantedBundleIcon` method with a normal value passed as the input parameter. Successfully obtain the application icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0300"
        let pixelMap = await getRawfilePixelMapByPath("2.png", 199, 211)
        let BeforeSize = pixelMap?.getPixelBytesNumber()
        await notificationExtensionSubscription.getUserGrantedBundleIcon(bundle_name).then((data: image.PixelMap) => {
          let AfterSize = data.getPixelBytesNumber()
          console.info(TAG + `getUserGrantedBundleIcon success,BeforeSize = ${BeforeSize},AfterSize = ${AfterSize}`);
          expect(data).not().assertNull();
          expect(BeforeSize).assertEqual(AfterSize)
          done()
        }).catch((error: Error): void => {
          let err = error as BusinessError;
          console.error(TAG +
            `getUserGrantedBundleIcon failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err.code).assertEqual(801)
            done()
          } else {
            expect().assertFail();
            done()
          }
        })
      })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0800
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0800
     * @tc.desc   When calling the `disableUserGrantedByBundle` method, an abnormal value is passed for the `bundleName` parameter, resulting in error code 1600022.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0800"
        let Arraybundle = ["", bundle_name, bundle_name, "com.zhuoyi.browser", "com.example.test", bundle_name]
        for (let i = 0; i < 6; i++) {
          let info: notificationExtensionSubscription.GrantedBundleInfo = {
            bundleName: Arraybundle?.[i] as string,
            appIndex: 0
          }
          await notificationExtensionSubscription.disableUserGrantedByBundle(info).then(() => {
            console.info(TAG + "disableUserGrantedByBundle success");
            if (i != 1) {
              expect(false).assertTrue()
              done()
            }
          }).catch((error: Error): void => {
            let err = error as BusinessError;
            console.error(TAG +
              `disableUserGrantedByBundle failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
            } else if (err.code == 1600022) {
              expect(err.code).assertEqual(1600022);
            } else {
              expect().assertFail();
              done()
            }
          });
          if (i == 5) {
            console.info(TAG +
              `test done`);
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0200
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0200
     * @tc.desc   Pass an abnormal value as an input parameter to the `getUserGrantedBundleIcon` method, resulting in error code 1600022.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_0200"
        let Arraybundle = ["", bundle_name, "com.zhuoyi.browser", "com.example.test"]
        for (let i = 0; i < 4; i++) {
          await notificationExtensionSubscription.getUserGrantedBundleIcon(Arraybundle[i]).then((data: image.PixelMap) => {
            console.info(TAG + `getUserGrantedBundleIcon success`);
            expect(false).assertTrue()
            done()
          }).catch((error: Error):void => {
            let err = error as BusinessError;
            console.error(TAG +
              `getUserGrantedBundleIcon failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
            } else if (err.code == 1600022) {
              expect(err.code).assertEqual(1600022);
            } else {
              expect().assertFail();
              done()
            }
          });
          if (i == 3) {
            console.info(TAG +
              `test done`);
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_1300
     * @tc.number Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_1300
     * @tc.desc   When an abnormal value is passed for the appName in the call to disableUserGrantedByBundle, the call is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @co.authored.by.agent
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_ThreePartyWatch_Enhanced_static_1300"
        let num: int = 0
        let ArrayName = [undefined, '', "微信", "xxx"]
        let list: notificationExtensionSubscription.GrantedBundleInfo[] = await notificationExtensionSubscription.getUserGrantedEnabledBundles();
        console.info(TAG + 'getUserGrantedEnabledBundles success, size: ' + list.length);
        for (let i = 0; i < 4; i++) {
          let info: notificationExtensionSubscription.GrantedBundleInfo = {
            bundleName: list[i].bundleName,
            appIndex: 0,
            appName: ArrayName[i]
          }
          await notificationExtensionSubscription.disableUserGrantedByBundle(info).then(() => {
            num++
            console.info(TAG + "disableUserGrantedByBundle success");
            expect(num).assertEqual(i+1)
          }).catch((error: Error): void => {
            let err = error as BusinessError;
            console.error(TAG +
              `disableUserGrantedByBundle failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done()
            } else {
              expect().assertFail();
              done()
            }
          });
          if (i == 3) {
            console.info(TAG +
              `test done`);
            done()
          }
        }
      })
  })
}