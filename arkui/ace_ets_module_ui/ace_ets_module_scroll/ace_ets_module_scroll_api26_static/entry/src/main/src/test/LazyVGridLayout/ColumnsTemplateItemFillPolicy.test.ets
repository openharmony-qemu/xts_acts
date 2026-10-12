'use static';
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
import { describe, it, expect, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ColumnsTemplateItemFillPolicy() {
  describe('ColumnsTemplateItemFillPolicy', () => {

    beforeEach(async (): Promise<void> => {
      console.info('ColumnsTemplateItemFillPolicy beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyVGridLayout/columnsTemplateItemFillPolicy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get columnsTemplateItemFillPolicy state pages:' + JSON.stringify(pages));
        if (!('columnsTemplateItemFillPolicy' == pages.name)) {
          console.info('get columnsTemplateItemFillPolicy pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push columnsTemplateItemFillPolicy page error:' + err);
      }
      console.info('ColumnsTemplateItemFillPolicy beforeEach end');
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0100
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_SM1MD2LG3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0100] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
        await CommonFunc.sleep(500);
        let strJson: string = inspector.getInspectorByKey('lazyVGrid_columnsTemplate_sm1Md2Lg3');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[columnsTemplateItemFillPolicy_static_0100] type: ' + obj.getString('$type'));
        expect(obj.getString('$type')).assertEqual('LazyVGridLayout');
        let headerComp = await driver.findComponent(ON.text('ItemFillPolicy: BREAKPOINT_SM1MD2LG3'));
        expect(headerComp !== null).assertTrue();
        console.info('[columnsTemplateItemFillPolicy_static_0100] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0200
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_SM1MD2LG3,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 1 column, md: 2 columns, lg or larger: 3 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0200] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
        await CommonFunc.sleep(500);
        let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_sm1Md2Lg3'));
        let gridRect = await gridComp.getBounds();
        let type1_0_Comp = await driver.findComponent(ON.id('type1_0'));
        let type1_0_rect = await type1_0_Comp.getBounds();
        console.info('[columnsTemplateItemFillPolicy_static_0200] type1_0 left: ' + type1_0_rect.left +
          ', top: ' + type1_0_rect.top);
        let type1_1_Com = await driver.findComponent(ON.id('type1_1'));
        let type1_1_rect = await type1_1_Comp.getBounds();
        let type1_2_Comp = await driver.findComponent(ON.id('type1_2'));
        let type1_2_rect = await type1_2_Comp.getBounds();
        let type1_3_Comp = await driver.findComponent(ON.id('type1_3'));
        let type1_3_rect = await type1_3_Comp.getBounds();
        const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
        let gridWidthVp: number = uiContext.px2vp(gridRect.right - gridRect.left);
        console.info('[columnsTemplateItemFillPolicy_static_0200] grid_width_vp: ' + gridWidthVp);

        if (gridWidthVp < 600) {
          console.info('[columnsTemplateItemFillPolicy_static_0200] sm breakpoint, type1_1 left: ' +
            type1_1_rect.left);
          expect(type1_1_rect.left).assertEqual(type1_0_rect.left);
        } else if (gridWidthVp < 840) {
          console.info('[columnsTemplateItemFillPolicy_static_0200] md breakpoint, type1_2 left: ' +
            type1_2_rect.left);
          expect(type1_2_rect.left).assertEqual(type1_0_rect.left);
        } else {
          console.info('[columnsTemplateItemFillPolicy_static_0200] lg breakpoint, type1_3 left: ' +
            type1_3_rect.left);
          expect(type1_3_rect.left).assertEqual(type1_0_rect.left);
        }
        console.info('[columnsTemplateItemFillPolicy_static_0200] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0300
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_SM2MD3LG5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0300] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
        await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('lazyVGrid_columnsTemplate_sm2Md3Lg5');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[columnsTemplateItemFillPolicy_static_0300] type: ' + obj.getString('$type'));
        expect(obj.getString('$type')).assertEqual('LazyVGridLayout');
        let headerComp = await driver.findComponent(ON.text('ItemFillPolicy: BREAKPOINT_SM2MD3LG5'));
        expect(headerComp !== null).assertTrue();
        console.info('[columnsTemplateItemFillPolicy_static_0300] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0400
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_SM2MD3LG5,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 2 columns, md: 3 columns, lg or larger: 5 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0400] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
        await CommonFunc.sleep(1000);
        let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_sm2Md3Lg5'));
        let gridRect = await gridComp.getBounds();
        let type2_0_Comp = await driver.findComponent(ON.id('type2_0'));
        let type2_0_rect = await type2_0_Comp.getBounds();
        console.info('[columnsTemplateItemFillPolicy_static_0400] type2_0 left: ' + type2_0_rect.left +
          ', top: ' + type2_0_rect.top);
        let type2_2_Comp = await driver.findComponent(ON.id('type2_2'));
        let type2_2_rectit driver.findComponent(ON.id('type2_3'));
        let type2_3_rect = await type2_3_Comp.getBounds();
        let type2_5_Comp = await driver.findComponent(ON.id('type2_5'));
        let type2_5_rect = await type2_5_Comp.getBounds();
        const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
        let gridWidthVp: number = uiContext.px2vp(gridRect.right - gridRect.left);
        console.info('[columnsTemplateItemFillPolicy_static_0400] grid_width_vp: ' + gridWidthVp);

        if (gridWidthVp < 600) {
          console.info('[columnsTemplateItemFillPolicy_static_0400] sm breakpoint, type2_2 left: ' +
            type2_2_rect.left);
          expect(type2_2_rect.left).assertEqual(type2_0_rect.left);
        } else if (gridWidthVp < 840) {
          console.info('[columnsTemplateItemFillPolicy_static_0400] md breakpoint, type2_3 left: ' +
            type2_3_rect.left);
          expect(type2_3_rect.left).assertEqual(type2_0_rect.left);
        } else {
          console.info('[columnsTemplateItemFillPolicy_static_0400] lg breakpoint, type2_5 left: ' +
            type2_5_rect.left);
          expect(type2_5_rect.left).assertEqual(type2_0_rect.left);
        }
        console.info('[columnsTemplateItemFillPolicy_static_0400] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0400] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0500
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0500
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with ItemFillPolicy
     *             fillType PresetFillType.BREAKPOINT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0500] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_default'));
        await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('lazyVGrid_columnsTemplate_default');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[columnsTemplateItemFillPolicy_static_0500] type: ' + obj.getString('$type'));
        expect(obj.getString('$type')).assertEqual('LazyVGridLayout');
        let headerComp = await driver.findComponent(ON.text('ItemFillPolicy: BREAKPOINT_DEFAULT'));
        expect(headerComp !== null).assertTrue();
        console.info('[columnsTemplateItemFillPolicy_static_0500] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0500] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   columnsTemplateItemFillPolicy_static_0600
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_ITEMFILLPOLICY_STATIC_0600
     * @tc.desc   Test LazyVGridLayout columnsTemplate ItemFillPolicy BREAKPOINT_DEFAULT,
     *             verify column count matches the breakpoint of content area width
     *             (sm or smaller: 2 columns, md: 3 columns, lg or larger: 5 columns)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateItemFillPolicy_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[columnsTemplateItemFillPolicy_static_0600] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollComp = await driver.findComponent(ON.type('Scroll'));
        await scrollComp.scrollSearch(ON.id('lazyVGrid_columnsTemplate_default'));
        await CommonFunc.sleep(1000);
        let gridComp = await driver.findComponent(ON.id('lazyVGrid_columnsTemplate_default'));
        let gridRect = await gridComp.getBounds();
        let type3_0_Comp = await driver.findComponent(ON.id('type3_0'));
        let type3_0_rect = await type3_0_Comp.getBounds();
        console.info('[columnsTemplateItemFillPolicy_static_0600] type3_0 left: ' + type3_0_rect.left +
          ', top: ' + type3_0_rect.top);
        let type3_2_Comp = await driver.findComponent(ON.id('type3_2'));
        let type3_2_rect = await type3_2_Comp.getBounds();
        let type3_3_Comp = await driver.findComponent(ON.id('type3_3'));
        let type3_3_rect = await type3_3_Comp.getBounds();
        let type3_5_Comp = await driver.findComponent(ON.id('type3_5'));
        let type3_5_rect = await type3_5_Comp.getBounds();
        const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
        let gridWidthVp: number = uiContext.px2vp(gridRect.right - gridRect.left);
        console.info('[columnsTemplateItemFillPolicy_static_0600] grid_width_vp: ' + gridWidthVp);

        if (gridWidthVp < 600) {
          console.info('[columnsTemplateItemFillPolicy_static_0600] sm breakpoint, type3_2 left: ' +
            type3_2_rect.left);
          expect(type3_2_rect.left).assertEqual(type3_0_rect.left);
        } else if (gridWidthVp < 840) {
          console.info('[columnsTemplateItemFillPolicy_static_0600] md breakpoint, type3_3 left: ' +
            type3_3_rect.left);
          expect(type3_3_rect.left).assertEqual(type3_0_rect.left);
        } else {
          console.info('[columnsTemplateItemFillPolicy_static_0600] lg breakpoint, type3_5 left: ' +
            type3_5_rect.left);
          expect(type3_5_rect.left).assertEqual(type3_0_rect.left);
        }
        console.info('[columnsTemplateItemFillPolicy_static_0600] END');
        done();
      } catch (error) {
        console.error('[columnsTemplateItemFillPolicy_static_0600] error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
