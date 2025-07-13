/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

export default function monitorInvisibleAreaTest() {
    describe('monitorInvisibleAreaTest', () => {
      beforeAll(() => {
        console.info("monitorInvisibleAreaTest beforeEach start");
        await UtilsTest.loadAndSetUpUiTest();
        await UtilsTest.msSleep(4000)
        await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
        await UtilsTest.msSleep(4000)
      });

      beforeEach(async () :Promise<void> => {
        console.info("monitorInvisibleAreaTest beforeEach start");
        try {
          const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
          router.clear();
          let pages = router.getState();
          console.info("get monitorInvisibleAreaTest state pages: " + JSON.stringify(pages));
          if (!("monitorInvisibleArea" == pages.name)) {
            console.info("get monitorInvisibleAreaTest state pages.name: " + JSON.stringify(pages.name));
            router.pushUrl({url: 'MainAbility/pages/ImageAnimator/monitorInvisibleArea'});
            // console.info("push monitorInvisibleAreaTest page result: " + JSON.stringify(result));
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push monitorInvisibleAreaTest page error: " + err);
          expect().assertFail();
        }
        // done();
      });

    /*
     * @tc.number       monitorInvisibleAreaTest_static_001
     * @tc.name         monitorInvisibleAreaTest_static_001
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):true
     */
    it('monitorInvisibleAreaTest_static_001', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_static_001 START');
      await CommonFunc.sleep(5000);
      let btnTrue = await driver.findComponent(ON.id('trueFlag'));
      await (btnTrue?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await (scroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;

      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);

      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      console.info("[monitorInvisibleAreaTest_static_001] component strJson is: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_static_001] component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[monitorInvisibleAreaTest_static_001] component obj monitorInvisibleArea is: " + JSON.stringify(obj.getElement('$attrs').getElement('monitorInvisibleArea')));
      expect(obj.getElement('$attrs').getElement('monitorInvisibleArea')).assertEqual('true');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await (textStrJson?.getText() as Promise<string>);
      console.info("[monitorInvisibleAreaTest_static_001] text: " + JSON.stringify(text));
      expect(text).assertEqual('Pause');
      console.info("[monitorInvisibleAreaTest_static_001] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_static_002
     * @tc.name         monitorInvisibleAreaTest_static_002
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):false
     */
    it('monitorInvisibleAreaTest_static_002', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_static_002 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await (scroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
     
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnFalse = await driver.findComponent(ON.id('falseFlag'));
      await (btnFalse?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);

      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_static_002] component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('monitorInvisibleArea')).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await (textStrJson?.getText() as Promise<string>);
      console.info("[monitorInvisibleAreaTest_static_002] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_static_002] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_static_003
     * @tc.name         monitorInvisibleAreaTest_static_003
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):undefined
     */
    it('monitorInvisibleAreaTest_static_003', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_static_003 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await (scroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnUndefined = await driver.findComponent(ON.id('undefinedFlag'));
      await (btnUndefined?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_static_003] component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('monitorInvisibleArea')).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await (textStrJson?.getText() as Promise<string>);
      console.info("[monitorInvisibleAreaTest_static_003] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_static_003] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_static_004
     * @tc.name         monitorInvisibleAreaTest_static_004
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):null
     */
    it('monitorInvisibleAreaTest_static_004', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_static_004 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await (scroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnNull = await driver.findComponent(ON.id('nullFlag'));
      await (btnNull?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_static_004] component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('monitorInvisibleArea')).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await (textStrJson?.getText()  as Promise<string>);
      console.info("[monitorInvisibleAreaTest_static_004] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_static_004] end");
      done();
    });
  })
}
