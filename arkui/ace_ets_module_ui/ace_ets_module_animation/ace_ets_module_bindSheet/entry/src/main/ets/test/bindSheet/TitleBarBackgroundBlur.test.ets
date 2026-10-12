/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function titleBarBackgroundBlur() {
  describe('titleBarBackgroundBlur', () => {
    beforeAll(() => {
      console.info("titleBarBackgroundBlur beforeAll start")
    })

    beforeEach(async (done: Function) => {
      console.info("titleBarBackgroundBlur beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/titleBarBackgroundBlur",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get titleBarBackgroundBlur state pages: " + JSON.stringify(pages));
        if (!("titleBarBackgroundBlur" == pages.name)) {
          console.info("get titleBarBackgroundBlur state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push titleBarBackgroundBlur success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push titleBarBackgroundBlur page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0100
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0100
     * @tc.desc   set titleBarBackgroundBlur blurStyle: NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_NONE'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0100] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0100] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0100] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(SheetTitleBarBackgroundBlur.NONE).assertEqual(0);

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0100 END');
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0200
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0200
     * @tc.desc   set titleBarBackgroundBlur blurStyle: GRADIENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_GRADIENT'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0200] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0200] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0200] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(SheetTitleBarBackgroundBlur.GRADIENT).assertEqual(1);

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0200 END');
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0300
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0300
     * @tc.desc   set titleBarBackgroundBlur with maskExtraHeight: 100vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_maskExtraHeight'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0300] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0300] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0300] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0300 END');
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0400
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0400
     * @tc.desc   set titleBarBackgroundBlur with maskColor: Color.Gray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_maskColor'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0400] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0400] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0400] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0400 END');
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0500
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0500
     * @tc.desc   set titleBarBackgroundBlur with effectiveDistance: 100vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_effectiveDistance'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0500] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0500] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0500] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0500 END');
      done();
    });

    /**
     * @tc.name   titleBarBackgroundBlur_0600
     * @tc.number SUB_ACE_BindSheet_titleBarBackgroundBlur_0600
     * @tc.desc   set titleBarBackgroundBlur: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('titleBarBackgroundBlur_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('titleBarBackgroundBlur_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_titleBarBackgroundBlur_undefined'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[titleBarBackgroundBlur_0600] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[titleBarBackgroundBlur_0600] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[titleBarBackgroundBlur_0600] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_titleBarBackgroundBlur'));
      await btn2.click();
      console.info('titleBarBackgroundBlur_0600 END');
      done();
    });
  })
}
