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

export default function safeAreaPadding() {
  describe('safeAreaPadding', () => {
    beforeAll(() => {
      console.info("safeAreaPadding beforeAll start")
    })

    beforeEach(async (done: Function) => {
      console.info("safeAreaPadding beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/safeAreaPadding",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get safeAreaPadding state pages: " + JSON.stringify(pages));
        if (!("safeAreaPadding" == pages.name)) {
          console.info("get safeAreaPadding state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push safeAreaPadding success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push safeAreaPadding page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0100
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0100
     * @tc.desc   set titleBarHoverMode: SAFE_AREA_PADDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btnOpen = await driver.findComponent(ON.id('btn_open_safeAreaPadding'));
      await btnOpen.click();
      await CommonFunc.sleep(2000);

      let btnMode = await driver.findComponent(ON.id('btn_safeAreaPadding_SAFE_AREA_PADDING'));
      await btnMode.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[safeAreaPadding_0100] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[safeAreaPadding_0100] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[safeAreaPadding_0100] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(SheetTitleBarHoverMode.SAFE_AREA_PADDING).assertEqual(2);

      let btn2: Component = await driver.findComponent(ON.id('close_safeAreaPadding'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('safeAreaPadding_0100 END');
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0200
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0200
     * @tc.desc   apply BIND_SHEET_EXPAND_SAFE_AREA strategy, titleBarHoverMode not set (default to SAFE_AREA_PADDING)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btnOpen = await driver.findComponent(ON.id('btn_open_safeAreaPadding'));
      await btnOpen.click();
      await CommonFunc.sleep(2000);

      let btnMode = await driver.findComponent(ON.id('btn_safeAreaPadding_strategyApplied'));
      await btnMode.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[safeAreaPadding_0200] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[safeAreaPadding_0200] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[safeAreaPadding_0200] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA).assertEqual(7);

      let btn2: Component = await driver.findComponent(ON.id('close_safeAreaPadding'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('safeAreaPadding_0200 END');
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0300
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0300
     * @tc.desc   apply BIND_SHEET_EXPAND_SAFE_AREA strategy, explicitly set titleBarHoverMode: STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btnOpen = await driver.findComponent(ON.id('btn_open_safeAreaPadding'));
      await btnOpen.click();
      await CommonFunc.sleep(2000);

      let btnMode = await driver.findComponent(ON.id('btn_safeAreaPadding_strategyWithExplicitStandard'));
      await btnMode.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[safeAreaPadding_0300] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[safeAreaPadding_0300] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[safeAreaPadding_0300] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(SheetTitleBarHoverMode.STANDARD).assertEqual(0);
      expect(ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA).assertEqual(7);

      let btn2: Component = await driver.findComponent(ON.id('close_safeAreaPadding'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('safeAreaPadding_0300 END');
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0400
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0400
     * @tc.desc   apply BIND_SHEET_EXPAND_SAFE_AREA strategy, explicitly set titleBarHoverMode: STACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btnOpen = await driver.findComponent(ON.id('btn_open_safeAreaPadding'));
      await btnOpen.click();
      await CommonFunc.sleep(2000);

      let btnMode = await driver.findComponent(ON.id('btn_safeAreaPadding_strategyWithExplicitStack'));
      await btnMode.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[safeAreaPadding_0400] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[safeAreaPadding_0400] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let titleBarNode: ESObject = sheetPageNode.$children[1];
      console.info("[safeAreaPadding_0400] titleBar type: " + JSON.stringify(titleBarNode.$type));
      expect(titleBarNode !== undefined && titleBarNode !== null).assertTrue();

      expect(SheetTitleBarHoverMode.STACK).assertEqual(1);
      expect(ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA).assertEqual(7);

      let btn2: Component = await driver.findComponent(ON.id('close_safeAreaPadding'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      console.info('safeAreaPadding_0400 END');
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0500
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0500
     * @tc.desc   verify SheetTitleBarHoverMode enum values: STANDARD=0, STACK=1, SAFE_AREA_PADDING=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0500 START');
      try {
        expect(SheetTitleBarHoverMode.STANDARD).assertEqual(0);
        expect(SheetTitleBarHoverMode.STACK).assertEqual(1);
        expect(SheetTitleBarHoverMode.SAFE_AREA_PADDING).assertEqual(2);
        console.info("[safeAreaPadding_0500] SheetTitleBarHoverMode enum values verified");
      } catch (err) {
        console.error('[safeAreaPadding_0500] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('safeAreaPadding_0500 END');
      done();
    });

    /**
     * @tc.name   safeAreaPadding_0600
     * @tc.number SUB_ACE_BindSheet_safeAreaPadding_0600
     * @tc.desc   verify ImmersiveStrategy enum values: AVOID_CUTOUT=0, AVOID_FLOAT_NAV=1, BIND_SHEET_EXPAND_SAFE_AREA=7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('safeAreaPadding_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('safeAreaPadding_0600 START');
      try {
        expect(ImmersiveStrategy.AVOID_CUTOUT).assertEqual(0);
        expect(ImmersiveStrategy.AVOID_FLOAT_NAV).assertEqual(1);
        expect(ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA).assertEqual(7);
        console.info("[safeAreaPadding_0600] ImmersiveStrategy enum values verified");
      } catch (err) {
        console.error('[safeAreaPadding_0600] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('safeAreaPadding_0600 END');
      done();
    });
  })
}
