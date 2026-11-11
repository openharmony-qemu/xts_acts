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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ColumnsTemplateItemFillPolicyModifier() {
  describe('ColumnsTemplateItemFillPolicyModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("columnsTemplateItemFillPolicyModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/ColumnsTemplateItemFillPolicyModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnsTemplateItemFillPolicyModifier state pages:" + JSON.stringify(pages));
        if (!("ColumnsTemplateItemFillPolicyModifier" == pages.name)) {
          console.info("get columnsTemplateItemFillPolicyModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push columnsTemplateItemFillPolicyModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnsTemplateItemFillPolicyModifier page error:" + err);
      }
      console.info("columnsTemplateItemFillPolicyModifier beforeEach end");
      done();
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicyModifier_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_MODIFIER_0100
     * @tc.desc   Test LazyVGridLayout columnsTemplate set to ItemFillPolicy fillType
     *             PresetFillType.BREAKPOINT_SM1MD2LG3 by attributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicyModifier_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicyModifier_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateItemFillPolicyModifier_0100] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateItemFillPolicyModifier_0100] columnsTemplate: " +
        JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      console.info('[columnsTemplateItemFillPolicyModifier_0100] END');
      done();
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicyModifier_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_MODIFIER_0200
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_SM1MD2LG3 set by
     *             attributeModifier, verify column count matches the breakpoint of content area width
     *             (sm or smaller: 1 column, md: 2 columns, lg or larger: 3 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicyModifier_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicyModifier_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_modifier'));
      let gridRect = await gridComp.getBounds();
      let grid_width = gridRect.right - gridRect.left;
      console.info("[columnsTemplateItemFillPolicyModifier_0200] grid_width is: " + grid_width);
      let modifier0Comp = await driver.findComponent(ON.id('modifier_0'));
      let modifier0Rect = await modifier0Comp.getBounds();
      console.info("[columnsTemplateItemFillPolicyModifier_0200] modifier_0_rect is: " + modifier0Rect);

      if (px2vp(grid_width) < 600) {
        // sm及更小断点显示1列，modifier_1位于modifier_0正下方
        let modifier1Comp = await driver.findComponent(ON.id('modifier_1'));
        let modifier1Rect = await modifier1Comp.getBounds();
        console.info("[columnsTemplateItemFillPolicyModifier_0200] modifier1 left: " + modifier1Rect.left);
        expect(modifier1Rect.left).assertEqual(modifier0Rect.left);
      } else if (px2vp(grid_width) < 840) {
        // md断点显示2列，modifier_2位于modifier_0正下方
        let modifier2Comp = await driver.findComponent(ON.id('modifier_2'));
        let modifier2Rect = await modifier2Comp.getBounds();
        console.info("[columnsTemplateItemFillPolicyModifier_0200] modifier2 left: " + modifier2Rect.left);
        expect(modifier2Rect.left).assertEqual(modifier0Rect.left);
      } else {
        // lg及更大断点显示3列，modifier_3位于modifier_0正下方
        let modifier3Comp = await driver.findComponent(ON.id('modifier_3'));
        let modifier3Rect = await modifier3Comp.getBounds();
        console.info("[columnsTemplateItemFillPolicyModifier_0200] modifier3 left: " + modifier3Rect.left);
        expect(modifier3Rect.left).assertEqual(modifier0Rect.left);
      }
      console.info('[columnsTemplateItemFillPolicyModifier_0200] END');
      done();
    })
  })
}
