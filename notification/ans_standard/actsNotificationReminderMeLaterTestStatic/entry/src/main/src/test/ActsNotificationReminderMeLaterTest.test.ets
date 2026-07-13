'use static';
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from "@ohos/hypium-binary/src/main/indexStatic";
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, RecordData } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe'
import wantAgent from '@ohos.app.ability.wantAgent'
import wantagent from '@ohos.app.ability.wantAgent'
import image from '@ohos.multimedia.image'
import common from '@ohos.app.ability.common';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let testAbilityContext: common.UIAbilityContext;
let bundleName: string = 'com.example.actsnotificationremindermelatertest.static'
let count: int = 0;


export default function actsNotificationReminderMeLaterTest():void{
  describe('actsNotificationReminderMeLaterTest', (): void => {
    let TAG :string = 'actsNotificationReminderMeLaterTest ===>'
    hilog.info(domain, TAG, '%{public}s', ' START')

    beforeAll(async() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      let cmd = `aa start -a EntryAbility -b ${bundleName}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
      await Utils.msSleep(2000)
      notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
        console.info(`${TAG} requestEnableNotification about is ${testAbilityContext}`)
        console.info(`${TAG} come in requestEnableNotification`);
        if (err) {
          console.info(`${TAG} requestEnableNotification err: ${err?.code}`)
        } else {
          console.info(`${TAG} requestEnableNotification success`)
        }
      })
      await Utils.msSleep(1000)
      let driver = Driver.create()
      await Utils.msSleep(1000)
      console.info(`${TAG} driver is ${JSON.stringify(driver)}`)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TAG} button is ${JSON.stringify(button)}`)
      if (button !== null) {
        await button.click()
        console.info(`${TAG} ===>====>button is click`)
        await Utils.msSleep(1000)
      } else {
        console.info(`${TAG} null button`)
      }
    })


    /**
     * @tc.name   SUB_Notification_Ans_ReminderMe_Later_Static_0100
     * @tc.number SUB_Notification_Ans_ReminderMe_Later_Static_0100
     * @tc.desc   test function publishAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_ReminderMe_Later_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'SUB_Notification_Ans_ReminderMe_Later_Static_0100'
        console.info(Tag +`SUB_Notification_Ans_ReminderMe_Later_Static_0100 START`);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          hashCode: "hashCode",
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
              additionalText: 'text_additionalText'
            } as notificationManager.NotificationBasicContent
          } as notificationManager.NotificationContent,
        }
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null): void => {
            if (err) {
              console.info(Tag+`publish failed, code is ${err?.code}, message is ${err?.message}`);
              expect(false).assertTrue()
              console.info(Tag+ ' test case end');
              done()
            } else {
              console.info(Tag+"publish success");
              expect(err?.code).assertEqual(undefined)
            }
          })
          await Utils.msSleep(1000)
          let delayTime: long = 1;
          await notificationManager.snoozeNotification("hashCode", delayTime).then(() => {
            console.info(Tag+"snoozeNotification success.")
            expect(false).assertTrue();
            done()
          }).catch((e: Error):void => {
            let err : BusinessError = e as BusinessError
            console.error(Tag+`snoozeNotification failed, code is ${err.code}, message is ${err.message}`);
            expect(err?.code).assertEqual(202)
            done()
          });
        } catch (err) {
          console.info(Tag+' fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          console.info(Tag+` test case end`);
          done();
        }
        console.info(Tag +`SUB_Notification_Ans_ReminderMe_Later_Static_0100 END`);
      })

  })
}