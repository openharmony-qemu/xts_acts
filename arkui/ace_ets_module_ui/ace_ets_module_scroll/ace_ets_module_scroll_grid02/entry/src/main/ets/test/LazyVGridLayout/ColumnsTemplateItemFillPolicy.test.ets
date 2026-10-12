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

export default function ColumnsTemplateItemFillPolicyTest() {
  describe('ColumnsTemplateItemFillPolicyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("columnsTemplateItemFillPolicy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/columnsTemplateItemFillPolicy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnsTemplateItemFillPolicy state pages:" + JSON.stringify(pages));
        if (!("columnsTemplateItemFillPolicy" == pages.name)) {
          console.info("get columnsTemplateItemFillPolicy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push columnsTemplateItemFillPolicy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnsTemplateItemFillPolicy page error:" + err);
      }
      console.info("columnsTemplateItemFillPolicy beforeEach end");
      done();
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0100
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_SM1MD2LG3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0100] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_sm1Md2Lg3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateItemFillPolicy_0100] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateItemFillPolicy_0100] itemFillPolicy: " +
        JSON.stringify(obj.$attrs.itemFillPolicy));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');
      console.info('[columnsTemplateItemFillPolicy_0100] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0400
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_SM1MD2LG3,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 1 column, md: 2 columns, lg or larger: 3 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0400] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
      await CommonFunc.sleep(500);
      let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
      let gridRect = await gridComp.getBounds();
      let type1_0_Comp = await driver.findComponent(ON.id('type1_0'));
      let type1_0_rect = await type1_0_Comp.getBounds();
      console.info("[columnsTemplateItemFillPolicy_0400] type1_0_rect is: " + type1_0_rect);
      let type1_1_Comp = await driver.findComponent(ON.id('type1_1'));
      let type1_1_rect = await type1_1_Comp.getBounds();
      let type1_2_Comp = await driver.findComponent(ON.id('type1_2'));
      let type1_2_rect = await type1_2_Comp.getBounds();
      let type1_3_Comp = await driver.findComponent(ON.id('type1_3'));
      let type1_3_rect = await type1_3_Comp.getBounds();
      let grid_width = gridRect.right - gridRect.left
      console.info("[columnsTemplateItemFillPolicy_0400] grid_width is: " + grid_width);

      if (px2vp(grid_width) < 600) {
        console.info("[columnsTemplateItemFillPolicy_0400] type11: " + type1_1_rect.left);
        expect(type1_1_rect.left).assertEqual(type1_0_rect.left);
      } else if (px2vp(grid_width) < 840) {
        console.info("[columnsTemplateItemFillPolicy_0400] type12: " + type1_2_rect.left);
        expect(type1_2_rect.left).assertEqual(type1_0_rect.left);
      } else {
        console.info("[columnsTemplateItemFillPolicy_0400] type13: " + type1_3_rect.left);
        expect(type1_3_rect.left).assertEqual(type1_0_rect.left);
      }
      console.info('[columnsTemplateItemFillPolicy_0400] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0200
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_SM2MD3LG5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0200] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_sm2Md3Lg5');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateItemFillPolicy_0200] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateItemFillPolicy_0200] itemFillPolicy: " +
        JSON.stringify(obj.$attrs.itemFillPolicy));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM2MD3LG5');
      console.info('[columnsTemplateItemFillPolicy_0200] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0500
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0500
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_SM2MD3LG5,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 2 columns, md: 3 columns, lg or larger: 5 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0500] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
      await CommonFunc.sleep(500);
      let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
      let gridRect = await gridComp.getBounds();
      let type2_0_Comp = await driver.findComponent(ON.id('type2_0'));
      let type2_0_rect = await type2_0_Comp.getBounds();
      console.info("[columnsTemplateItemFillPolicy_0500] type2_0_rect is: " + type2_0_rect);
      let type2_2_Comp = await driver.findComponent(ON.id('type2_2'));
      let type2_2_rect = await type2_2_Comp.getBounds();
      let type2_3_Comp = await driver.findComponent(ON.id('type2_3'));
      let type2_3_rect = await type2_3_Comp.getBounds();
      let type2_5_Comp = await driver.findComponent(ON.id('type2_5'));
      let type2_5_rect = await type2_5_Comp.getBounds();
      let grid_width = gridRect.right - gridRect.left
      console.info("[columnsTemplateItemFillPolicy_0500] grid_width is: " + grid_width);

      if (px2vp(grid_width) < 600) {
        console.info("[columnsTemplateItemFillPolicy_0500] type22: " + type2_2_rect.left);
        expect(type2_2_rect.left).assertEqual(type2_0_rect.left);
      } else if (px2vp(grid_width) < 840) {
        console.info("[columnsTemplateItemFillPolicy_0500] type23: " + type2_3_rect.left);
        expect(type2_3_rect.left).assertEqual(type2_0_rect.left);
      } else {
        console.info("[columnsTemplateItemFillPolicy_0500] type25: " + type2_5_rect.left);
        expect(type2_5_rect.left).assertEqual(type2_0_rect.left);
      }
      console.info('[columnsTemplateItemFillPolicy_0500] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0300
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0300] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_default'));
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[columnsTemplateItemFillPolicy_0300] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateItemFillPolicy_0300] itemFillPolicy: " +
        JSON.stringify(obj.$attrs.itemFillPolicy));
      expect(obj.$type).assertEqual('LazyVGridLayout');
      expect(obj.$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');
      console.info('[columnsTemplateItemFillPolicy_0300] END');
      done();
    })

    /**
     * @tc.name   columnsTemplateItemFillPolicy_0600
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_0600
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_DEFAULT,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 2 columns, md: 3 columns, lg or larger: 5 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[columnsTemplateItemFillPolicy_0600] START');
      let driver: Driver = Driver.create();
      let scrollComp = await driver.findComponent(ON.type('Scroll'));
      await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_default'));
      await CommonFunc.sleep(500);
      let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_default'));
      let gridRect = await gridComp.getBounds();
      let type3_0_Comp = await driver.findComponent(ON.id('type3_0'));
      let type3_0_rect = await type3_0_Comp.getBounds();
      console.info("[columnsTemplateItemFillPolicy_0600] type3_0_rect is: " + type3_0_rect);
      let type3_2_Comp = await driver.findComponent(ON.id('type3_2'));
      let type3_2_rect = await type3_2_Comp.getBounds();
      let type3_3_Comp = await driver.findComponent(ON.id('type3_3'));
      let type3_3_rect = await type3_3_Comp.getBounds();
      let type3_5_Comp = await driver.findComponent(ON.id('type3_5'));
      let type3_5_rect = await type3_5_Comp.getBounds();
      let grid_width = gridRect.right - gridRect.left
      console.info("[columnsTemplateItemFillPolicy_0600] grid_width is: " + grid_width);

      if (px2vp(grid_width) < 600) {
        console.info("[columnsTemplateItemFillPolicy_0600] type32: " + type3_2_rect.left);
        expect(type3_2_rect.left).assertEqual(type3_0_rect.left);
      } else if (px2vp(grid_width) < 840) {
        console.info("[columnsTemplateItemFillPolicy_0600] type33: " + type3_3_rect.left);
        expect(type3_3_rect.left).assertEqual(type3_0_rect.left);
      } else {
        console.info("[columnsTemplateItemFillPolicy_0600] type35: " + type3_5_rect.left);
        expect(type3_5_rect.left).assertEqual(type3_0_rect.left);
      }
      console.info('[columnsTemplateItemFillPolicy_0600] END');
      done();
    })
  })
}
