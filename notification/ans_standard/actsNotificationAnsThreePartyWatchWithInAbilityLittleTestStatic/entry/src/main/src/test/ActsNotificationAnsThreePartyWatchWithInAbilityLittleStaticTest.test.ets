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
} from '@ohos/hypium-binary/src/main/indexStatic'
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

const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansthreepartywatchstaticwithinabilitylittle.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsNotificationAnsThreePartyWatchWithInAbilityLittleStaticTest():void {
  const TEST_Project_NAME = 'ActsNotificationAnsThreePartyWatchWithInAbilityLittleStaticTest';
  describe('ActsNotificationAnsThreePartyWatchWithInAbilityLittleStaticTest', () => {

    beforeAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansthreepartywatchstaticwithinabilitylittle.static"
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
      await Utils.msSleep(3000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_ThreePartyWatch_Static_0100
     * @tc.number SUB_Notification_Ans_ThreePartyWatch_Static_0100
     * @tc.desc   【isUserGranted】Gets the user's authorization status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_ThreePartyWatch_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_Notification_Ans_ThreePartyWatch_Static_0100';
        let targetBundle: notificationExtensionSubscription.BundleOption =
          {
            bundle: 'com.example.actsnotificationansthreepartywatchstaticwithinabilitylittle.static',
          };
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
        let uid: int = 0;
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          uid = data?.appInfo?.uid as int;
        })
        let driver = Driver.create();
        let testContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        let num: int = 0
        try {
          await notificationExtensionSubscription.isUserGranted().then((isOpen: boolean) => {
            console.info(testNum + 'isUserGranted ' + isOpen);
            expect(isOpen).assertEqual(false)
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}getUserGrantedState fail: ${err.code}, ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
          await Utils.msSleep(1000)
          await notificationExtensionSubscription.openSubscriptionSettings(testContext).then(async () => {
            console.info(testNum + `openSubscriberSettings success`);
            await Utils.msSleep(3000)
            await driver.assertComponentExist(ON.text('应用获取本机通知'));
            let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
            console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
            if (buttonOne !== null) {
              await Utils.msSleep(500)
              await buttonOne.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonOne).assertContain('允许获取本机通知')
            }
            await Utils.msSleep(2000)
            let buttonTwo = await driver.findComponent(ON.text('不允许'));
            console.info(`${testNum} button is ${JSON.stringify(buttonTwo)}`);
            if (buttonTwo !== null) {
              await Utils.msSleep(500)
              await buttonTwo.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonTwo).assertContain('允许获取本机通知')
            }
            await Utils.msSleep(2000)
            let buttonStack = await driver.findComponent(ON.text("确定"));
            console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
            if (buttonStack !== null) {
              console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
              await Utils.msSleep(500)
              await buttonStack?.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonStack).assertContain('确定')
            }
          }).catch((e: Error) => {
            let err = e as BusinessError
            console.error(testNum + `failed to call openSubscriptionSettings ${err.code}, ${err.message}`)
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else if (err?.code === 1600001) {
              expect(err.code).assertEqual(1600001);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
          await Utils.msSleep(2000)
          await notificationExtensionSubscription.isUserGranted().then((isOpen: boolean) => {
            console.info(testNum + 'isUserGranted ' + isOpen);
            expect(isOpen).assertEqual(false)
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}getUserGrantedState fail: ${err.code}, ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else if (err?.code === 1600001) {
              expect(err.code).assertEqual(1600001);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
          await Utils.msSleep(1000)
          await notificationExtensionSubscription.openSubscriptionSettings(testContext).then(async () => {
            console.info(testNum + `openSubscriberSettings success`);
            await Utils.msSleep(3000)
            await driver.assertComponentExist(ON.text('应用获取本机通知'));
            let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
            console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
            if (buttonOne !== null) {
              await Utils.msSleep(500)
              await buttonOne.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonOne).assertContain('允许获取本机通知')
            }
            await Utils.msSleep(2000)
            let buttonTwo = await driver.findComponent(ON.text('允许'));
            console.info(`${testNum} button is ${JSON.stringify(buttonTwo)}`);
            if (buttonTwo !== null) {
              await Utils.msSleep(500)
              await buttonTwo.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonTwo).assertContain('允许获取本机通知')
            }
            await Utils.msSleep(2000)
            let buttonStack = await driver.findComponent(ON.text("确定"));
            console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
            if (buttonStack !== null) {
              console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
              await Utils.msSleep(500)
              await buttonStack?.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(buttonStack).assertContain('确定')
            }
          }).catch((e: Error) => {
            let err = e as BusinessError
            console.error(testNum + `failed to call openSubscriptionSettings ${err.code}, ${err.message}`)
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
          await Utils.msSleep(1000)
          await notificationExtensionSubscription.isUserGranted().then((isOpen: boolean) => {
            console.info(testNum + 'isUserGranted ' + isOpen);
            expect(isOpen).assertEqual(true)
            done()
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}getUserGrantedState fail: ${err.code}, ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else if (err?.code === 1600001) {
              expect(err.code).assertEqual(1600001);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          if (err?.code === 201) {
            expect(err.code).assertEqual(201);
            done();
          } else if (err?.code === 1600001) {
            expect(err.code).assertEqual(1600001);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })
  })
}
