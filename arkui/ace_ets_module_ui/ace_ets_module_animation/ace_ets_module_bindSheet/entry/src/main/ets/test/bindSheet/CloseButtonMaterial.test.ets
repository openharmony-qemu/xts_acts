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

export default function closeButtonMaterial() {
  describe('closeButtonMaterial', () => {
    beforeAll(() => {
      console.info("closeButtonMaterial beforeAll start")
    })

    beforeEach(async (done: Function) => {
      console.info("closeButtonMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/closeButtonMaterial",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closeButtonMaterial state pages: " + JSON.stringify(pages));
        if (!("closeButtonMaterial" == pages.name)) {
          console.info("get closeButtonMaterial state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push closeButtonMaterial success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push closeButtonMaterial page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   closeButtonMaterial_0100
     * @tc.number SUB_ACE_BindSheet_closeButtonMaterial_0100
     * @tc.desc   set closeButtonMaterial: ImmersiveMaterial ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeButtonMaterial_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('closeButtonMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_closeButtonMaterial_ULTRA_THICK'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[closeButtonMaterial_0100] obj2 is: " + JSON.stringify(obj2));

      let closeBtnAttrs: ESObject = obj2.$children[1].$children[0].$children[3].$attrs;
      console.info("[closeButtonMaterial_0100] closeBtnAttrs is: " + JSON.stringify(closeBtnAttrs));
      let closeButtonMaterialAttr: ESObject = closeBtnAttrs?.systemMaterial;
      console.info("[closeButtonMaterial_0100] systemMaterial is: " + JSON.stringify(closeButtonMaterialAttr));
      expect(closeButtonMaterialAttr !== undefined && closeButtonMaterialAttr !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_closeButtonMaterial'));
      await btn2.click();
      console.info('closeButtonMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   closeButtonMaterial_0200
     * @tc.number SUB_ACE_BindSheet_closeButtonMaterial_0200
     * @tc.desc   set closeButtonMaterial: ImmersiveMaterial ULTRA_THIN with colorInvert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeButtonMaterial_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('closeButtonMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_closeButtonMaterial_ULTRA_THIN'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[closeButtonMaterial_0200] obj2 is: " + JSON.stringify(obj2));

      let closeBtnAttrs: ESObject = obj2.$children[1].$children[0].$children[3].$attrs;
      console.info("[closeButtonMaterial_0200] closeBtnAttrs is: " + JSON.stringify(closeBtnAttrs));
      let closeButtonMaterialAttr: ESObject = closeBtnAttrs?.systemMaterial;
      console.info("[closeButtonMaterial_0200] systemMaterial is: " + JSON.stringify(closeButtonMaterialAttr));
      expect(closeButtonMaterialAttr !== undefined && closeButtonMaterialAttr !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_closeButtonMaterial'));
      await btn2.click();
      console.info('closeButtonMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   closeButtonMaterial_0300
     * @tc.number SUB_ACE_BindSheet_closeButtonMaterial_0300
     * @tc.desc   set closeButtonMaterial: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeButtonMaterial_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('closeButtonMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_closeButtonMaterial_undefined'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[closeButtonMaterial_0300] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[closeButtonMaterial_0300] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let closeBtnNode: ESObject = sheetPageNode.$children[3];
      console.info("[closeButtonMaterial_0300] closeButton type: " + JSON.stringify(closeBtnNode.$type));
      expect(closeBtnNode !== undefined && closeBtnNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_closeButtonMaterial'));
      await btn2.click();
      console.info('closeButtonMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   closeButtonMaterial_0400
     * @tc.number SUB_ACE_BindSheet_closeButtonMaterial_0400
     * @tc.desc   set closeButtonMaterial: Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeButtonMaterial_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('closeButtonMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_closeButtonMaterial_SEMI'));
      await button.click();
      await CommonFunc.sleep(3000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[closeButtonMaterial_0400] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[closeButtonMaterial_0400] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let closeBtnNode: ESObject = sheetPageNode.$children[3];
      console.info("[closeButtonMaterial_0400] closeButton type: " + JSON.stringify(closeBtnNode.$type));
      expect(closeBtnNode !== undefined && closeBtnNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_closeButtonMaterial'));
      await btn2.click();
      console.info('closeButtonMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   closeButtonMaterial_0600
     * @tc.number SUB_ACE_BindSheet_closeButtonMaterial_0600
     * @tc.desc   set closeButtonMaterial: Material.empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeButtonMaterial_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('closeButtonMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_closeButtonMaterial_empty'));
      await button.click();
      await CommonFunc.sleep(2000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[closeButtonMaterial_0600] obj2 is: " + JSON.stringify(obj2));

      let sheetPageNode: ESObject = obj2.$children[1].$children[0];
      console.info("[closeButtonMaterial_0600] sheetPage type: " + JSON.stringify(sheetPageNode.$type));
      expect(sheetPageNode !== undefined && sheetPageNode !== null).assertTrue();
      let closeBtnNode: ESObject = sheetPageNode.$children[3];
      console.info("[closeButtonMaterial_0600] closeButton type: " + JSON.stringify(closeBtnNode.$type));
      expect(closeBtnNode !== undefined && closeBtnNode !== null).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('close_closeButtonMaterial'));
      await btn2.click();
      console.info('closeButtonMaterial_0600 END');
      done();
    });
  })
}
