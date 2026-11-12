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
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "@ohos/hypium-static/src/main/indexStatic";
import { commonEventManager } from '@kit.BasicServicesKit';
import inputMethod from '@ohos.inputMethod';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function InputMethodRichTextStatic() {
  describe('InputMethodRichTextStatic', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let driver = Driver.create();
    let RichEditor1: Component|null = null;
    let RichEditor2: Component|null = null;
    let RichEditor3: Component|null = null;
    let RichEditor4: Component|null = null;
    let rectInfo: Rect;

    let testTemplate: (testName: string, code: int, done: () => void) => Promise<void> =
      async (testName, code, done) => {
        let subscriber: commonEventManager.CommonEventSubscriber | null | undefined = null;

        let unSubscriberCallback = (err: BusinessError | null) => {
          console.info(`====>${testName} unSubscriberCallback start`);
          if (err) {
            console.info(`====>${testName} unSubscriberCallback failed: ${JSON.stringify(err)}`);
          } else {
            console.info(`====>${testName} unSubscriberCallback finsh`);
          }
        };
        let subscriberCallback = (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined | null) => {
          console.info(`====>${testName} subscriberCallback data:${JSON.stringify(data)}`);
          if (data !== undefined) {
            const currentSubscriber = subscriber as commonEventManager.CommonEventSubscriber;
            commonEventManager.unsubscribe(currentSubscriber, unSubscriberCallback);
            setTimeout(() => {
              try {
                expect(data?.data).assertEqual('SUCCESS');
                console.info(`====>${testName} end`);
                done();
              } catch (err) {
                console.info(`====>${testName} err: ${JSON.stringify(err)}`);
                done();
              }
            }, 500)
          }
        };
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [testName]
        };
        commonEventManager.createSubscriber(commonEventSubscribeInfo, (err: BusinessError | null,
          data: commonEventManager.CommonEventSubscriber | undefined | null): void => {
            try {
              if (!err && data) {
                subscriber = data as commonEventManager.CommonEventSubscriber;
                commonEventManager.subscribe(data, subscriberCallback);
                console.info(`====>${testName} subscribe finish====`);
              }
            } catch (err) {
              console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
            }

            let commonEventPublishData: commonEventManager.CommonEventPublishData = {
              code: code
            }
            commonEventManager.publish('keyboardControllerStatic', commonEventPublishData, (err: BusinessError | null) => {
              console.info(`====>${testName} publishCallback start`);
              if (err) {
                console.info(`====>${testName} publishCallback failed: ${JSON.stringify(err)}`);
              }
            });
        })
      };

    beforeAll(async (done: () => void) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await Utils.msSleep(1000);
        let scroll = await driver.findComponent(ON.id('Column1'));
        console.info('====>beforeAll scrollSearch success');
        let button = await scroll!.scrollSearch(ON.id('Button1'));
        console.info(`====>button is: ${JSON.stringify(button)}`);
        await button!.click();
        await Utils.msSleep(1000);
        let scrollNew = await driver.findComponent(ON.id('Column2'));
        RichEditor1 = await scrollNew!.scrollSearch(ON.id('RichEditor1'));
        console.info(`====>RichEditor1 is: ${JSON.stringify(RichEditor1)}`);
        RichEditor2 = await scrollNew!.scrollSearch(ON.id('RichEditor2'));
        console.info(`====>RichEditor2 is: ${JSON.stringify(RichEditor2)}`);
        RichEditor3 = await scrollNew!.scrollSearch(ON.id('RichEditor3'));
        console.info(`====>RichEditor3 is: ${JSON.stringify(RichEditor3)}`);
        RichEditor4 = await scrollNew!.scrollSearch(ON.id('RichEditor4'));
        console.info(`====>RichEditor4 is: ${JSON.stringify(RichEditor4)}`);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message));
        done();
      }
    })

    afterEach(async (done: () => void): Promise<void> => {
      try {
        await inputMethod.getController().hideSoftKeyboard();
        console.info('====>afterEach hideSoftKeyboard success');
        done();
      } catch (err) {
        console.info(`====>afterEach throw err, err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0100
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0100
     * @tc.desc   验证 getRightRichSyncText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor1!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0100', 200, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0100
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0100
     * @tc.desc   验证 getRightRichText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0100', 201, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0200
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0200
     * @tc.desc   验证 getRightRichSyncText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0200', 202, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0200
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0200
     * @tc.desc   验证 getRightRichText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0200', 203, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0300
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0300
     * @tc.desc   验证 getRightRichSyncText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0300', 204, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0300
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0300
     * @tc.desc   验证 getRightRichText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0300', 205, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0400
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0400
     * @tc.desc   验证 getRightRichSyncText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0400', 206, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0400
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0400
     * @tc.desc   验证 getRightRichText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0400', 207, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0500
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0500
     * @tc.desc   验证 getRightRichSyncText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0500', 208, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0500
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0500
     * @tc.desc   验证 getRightRichText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0500', 209, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0800
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0800
     * @tc.desc   验证 getRightRichSyncText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor2!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0800', 214, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0800
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0800
     * @tc.desc   验证 getRightRichText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0800', 215, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0900
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0900
     * @tc.desc   验证 getRightRichSyncText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor3!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_0900', 216, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_0900
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_0900
     * @tc.desc   验证 getRightRichText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_0900', 217, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0100
     * @tc.desc   验证 getRightRichSyncText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor1!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0100', 218, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0100
     * @tc.desc   验证 getRightRichText(5) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0100', 219, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0200
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0200
     * @tc.desc   验证 getRightRichSyncText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0200', 220, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0200
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0200
     * @tc.desc   验证 getRightRichText(0) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0200', 221, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0300
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0300
     * @tc.desc   验证 getRightRichSyncText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0300', 222, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0300
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0300
     * @tc.desc   验证 getRightRichText(4096) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0300', 223, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0400
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0400
     * @tc.desc   验证 getRightRichSyncText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0400', 224, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0400
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0400
     * @tc.desc   验证 getRightRichText(-1) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0400', 225, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0500
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0500
     * @tc.desc   验证 getRightRichSyncText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0500', 226, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0500
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0500
     * @tc.desc   验证 getRightRichText(4097) 仅text时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0500', 227, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0800
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0800
     * @tc.desc   验证 getRightRichSyncText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor2!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0800', 232, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0800
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0800
     * @tc.desc   验证 getRightRichText(5) 仅image时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0800', 233, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0900
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0900
     * @tc.desc   验证 getRightRichSyncText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await RichEditor3!.click();
      await Utils.msSleep(1000);
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_0900', 234, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0900
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0900
     * @tc.desc   验证 getRightRichText(5) 仅symbol时返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_0900', 235, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_1000
     * @tc.number SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_1000
     * @tc.desc   验证 getRightRichSyncText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await inputMethod.getController().detach();
      testTemplate('SUB_InputMethodEngine_GetRightRichTextSync_RETURN_static_1000', 236, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetRightRichText_RETURN_static_1000
     * @tc.number SUB_InputMethodEngine_GetRightRichText_RETURN_static_1000
     * @tc.desc   验证 getRightRichText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetRightRichText_RETURN_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await inputMethod.getController().detach();
      testTemplate('SUB_InputMethodEngine_GetRightRichText_RETURN_static_1000', 237, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_1000
     * @tc.number SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_1000
     * @tc.desc   验证 getRightRichSyncText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await inputMethod.getController().detach();
      testTemplate('SUB_InputMethodEngine_GetLeftRichTextSync_RETURN_static_1000', 238, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_RETURN_static_1000
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_RETURN_static_1000
     * @tc.desc   验证 getRightRichText(5) 面板隐藏后返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await inputMethod.getController().detach();
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_RETURN_static_1000', 239, done);
    });

    /**
     * @tc.name   SUB_InputMethodEngine_GetLeftRichText_Enum_static_0100
     * @tc.number SUB_InputMethodEngine_GetLeftRichText_Enum_static_0100
     * @tc.desc   验证 SpanType 枚举值完整性：TEXT=0, IMAGE=1, SYMBOL=2, CUSTOM=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethodEngine_GetLeftRichText_Enum_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      testTemplate('SUB_InputMethodEngine_GetLeftRichText_Enum_static_0100', 240, done);
    });

  });
};
