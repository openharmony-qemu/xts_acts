/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commoneventmanager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation, Rect } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { util } from '@kit.ArkTS';

export default function InputMethodRichText() {
  describe('InputMethodRichText', () => {
    let driver = Driver.create();
    let RichEditor1: Component;
    let RichEditor2: Component;
    let RichEditor3: Component;
    let RichEditor4: Component;
    let rectInfo: Rect;
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.id('Column1'));
        console.info('====>beforeAll scrollSearch success');
        let button = await scroll.scrollSearch(ON.id('Button1'));
        console.info(`====>button is: ${JSON.stringify(button)}`);
        await button.click();
        await driver.delayMs(1000);
        let scrollNew = await driver.findComponent(ON.id('Column2'));
        RichEditor1 = await scrollNew.scrollSearch(ON.id('RichEditor1'));
        console.info(`====>RichEditor1 is: ${JSON.stringify(RichEditor1)}`);
        RichEditor2 = await scrollNew.scrollSearch(ON.id('RichEditor2'));
        console.info(`====>RichEditor2 is: ${JSON.stringify(RichEditor2)}`);
        RichEditor3 = await scrollNew.scrollSearch(ON.id('RichEditor3'));
        console.info(`====>RichEditor3 is: ${JSON.stringify(RichEditor3)}`);
        RichEditor4 = await scrollNew.scrollSearch(ON.id('RichEditor4'));
        console.info(`====>RichEditor4 is: ${JSON.stringify(RichEditor4)}`);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message));
        done();
      }
    })

    let testTemplate: (testName: string, code: number, done: Function) => void =
      async (testName, code, done) => {
        let unSubscriberCallback = (err: BusinessError) => {
          console.info(`====>${testName} unSubscriberCallback start`);
          if (err) {
            console.info(`====>${testName} unSubscriberCallback failed: ${JSON.stringify(err)}`);
          } else {
            console.info(`====>${testName} unSubscriberCallback finish`);
          }
        }
        let subscriberCallback = (err: BusinessError, data: ESObject) => {
          console.info(`====>${testName} subscriberCallback data: ${JSON.stringify(data)}`);
          commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
          let t = setTimeout(() => {
            try {
              expect(data.data).assertEqual("SUCCESS");
              console.info(`====>${testName} end`);
              clearTimeout(t);
              done();
            } catch (err) {
              console.info(`====>${testName} err: ${JSON.stringify(err)}`);
              clearTimeout(t);
              done();
            }
          }, 500)
        }
        let publishCallback = (err: BusinessError) => {
          console.info(`====>${testName} publishCallback start`);
          if (err) {
            console.info(`====>${testName} publishCallback failed: ${JSON.stringify(err)}`);
          }
        }
        let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
          events: [testName]
        }
        let subscriber: ESObject;
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
          try {
            subscriber = data;
            console.info(`====>${testName} subscriber data: ${JSON.stringify(data)}`);
            commoneventmanager.subscribe(subscriber, subscriberCallback);
            console.info(`====>${testName} subscriber finish`);
          } catch (err) {
            console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`);
          }
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: code
          }
          let t = setTimeout(async () => {
            clearTimeout(t);
            commoneventmanager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
          }, 500)
        }).catch((err: BusinessError) => {
          console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
          done();
        })
      };

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0100
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0100
     * @tc.desc   验证 getRightRichSyncText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0100', Level.LEVEL0, async (done: Function) => {
      await RichEditor1.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0100', 200, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0100
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0100
     * @tc.desc   验证 getRightRichText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0100', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0100', 201, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0200
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0200
     * @tc.desc   验证 getRightRichSyncText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0200', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0200', 202, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0200
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0200
     * @tc.desc   验证 getRightRichText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0200', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0200', 203, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0300
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0300
     * @tc.desc   验证 getRightRichSyncText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0300', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0300', 204, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0300
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0300
     * @tc.desc   验证 getRightRichText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0300', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0300', 205, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0400
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0400
     * @tc.desc   验证 getRightRichSyncText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0400', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0400', 206, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0400
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0400
     * @tc.desc   验证 getRightRichText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0400', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0400', 207, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0500
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0500
     * @tc.desc   验证 getRightRichSyncText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0500', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0500', 208, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0500
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0500
     * @tc.desc   验证 getRightRichText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0500', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0500', 209, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0600
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0600
     * @tc.desc   验证 getRightRichSyncText(null) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0600', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0600', 210, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0600
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0600
     * @tc.desc   验证 getRightRichText(null) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0600', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0600', 211, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0700
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0700
     * @tc.desc   验证 getRightRichSyncText(undefined) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0700', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0700', 212, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0700
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0700
     * @tc.desc   验证 getRightRichText(undefined) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0700', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0700', 213, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0800
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0800
     * @tc.desc   验证 getRightRichSyncText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0800', Level.LEVEL0, async (done: Function) => {
      await RichEditor2.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0800', 214, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0800
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0800
     * @tc.desc   验证 getRightRichText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0800', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0800', 215, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0900
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0900
     * @tc.desc   验证 getRightRichSyncText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0900', Level.LEVEL0, async (done: Function) => {
      await RichEditor3.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_0900', 216, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_0900
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_0900
     * @tc.desc   验证 getRightRichText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_0900', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_0900', 217, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0100
     * @tc.desc   验证 getRightRichSyncText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0100', Level.LEVEL0, async (done: Function) => {
      await RichEditor1.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0100', 218, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0100
     * @tc.desc   验证 getRightRichText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0100', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0100', 219, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0200
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0200
     * @tc.desc   验证 getRightRichSyncText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0200', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0200', 220, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0200
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0200
     * @tc.desc   验证 getRightRichText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0200', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0200', 221, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0300
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0300
     * @tc.desc   验证 getRightRichSyncText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0300', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0300', 222, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0300
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0300
     * @tc.desc   验证 getRightRichText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0300', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0300', 223, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0400
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0400
     * @tc.desc   验证 getRightRichSyncText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0400', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0400', 224, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0400
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0400
     * @tc.desc   验证 getRightRichText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0400', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0400', 225, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0500
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0500
     * @tc.desc   验证 getRightRichSyncText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0500', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0500', 226, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0500
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0500
     * @tc.desc   验证 getRightRichText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0500', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0500', 227, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0600
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0600
     * @tc.desc   验证 getRightRichSyncText(null) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0600', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0600', 228, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0600
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0600
     * @tc.desc   验证 getRightRichText(null) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0600', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0600', 229, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0700
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0700
     * @tc.desc   验证 getRightRichSyncText(undefined) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0700', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0700', 230, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0700
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0700
     * @tc.desc   验证 getRightRichText(undefined) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0700', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0700', 231, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0800
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0800
     * @tc.desc   验证 getRightRichSyncText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0800', Level.LEVEL0, async (done: Function) => {
      await RichEditor2.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0800', 232, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0800
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0800
     * @tc.desc   验证 getRightRichText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0800', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0800', 233, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0900
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0900
     * @tc.desc   验证 getRightRichSyncText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0900', Level.LEVEL0, async (done: Function) => {
      await RichEditor3.click();
      await driver.delayMs(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_0900', 234, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_0900
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_0900
     * @tc.desc   验证 getRightRichText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_0900', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_0900', 235, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_1000
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_1000
     * @tc.desc   验证 getRightRichSyncText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_1000', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_1000', 236, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_1000
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_1000
     * @tc.desc   验证 getRightRichText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_1000', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_1000', 237, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_1000
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_1000
     * @tc.desc   验证 getRightRichSyncText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_1000', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_1000', 238, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_1000
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_1000
     * @tc.desc   验证 getRightRichText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_1000', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_1000', 239, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_Enum_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_Enum_0100
     * @tc.desc   验证 SpanType 枚举值完整性：TEXT=0, IMAGE=1, SYMBOL=2, CUSTOM=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_Enum_0100', Level.LEVEL1, async (done: Function) => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_Enum_0100', 240, done);
    });

  });
};
