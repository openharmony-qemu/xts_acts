'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function LazyVWaterFlowLayoutProperties() {
  describe('LazyVWaterFlowLayoutProperties', () => {

    beforeEach(async () => {
      console.info('LazyVWaterFlowLayoutProperties beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyVWaterFlowLayout/LazyVWaterFlowLayoutProperties',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get LazyVWaterFlowLayoutProperties state pages:' + JSON.stringify(pages));
        if (!('LazyVWaterFlowLayoutProperties' == pages.name)) {
          console.info('get LazyVWaterFlowLayoutProperties pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push LazyVWaterFlowLayoutProperties page error:' + err);
      }
      console.info('LazyVWaterFlowLayoutProperties beforeEach end');
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsTemplate_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsTemplate_default');
      console.info("[lazyVWaterFlowColumnsTemplate_static_0100] columnsTemplate: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')).assertEqual("");

      let result = AppStorage.get<string>('LazyVWaterFlowLayout_onVisible');
      console.info('[lazyVWaterFlowColumnsTemplate_static_0100] result: ' + JSON.stringify(result));
      expect(AppStorage.get<string>('LazyVWaterFlowLayout_onVisible')).assertEqual("success");
      await CommonFunc.sleep(500);
      AppStorage.delete('LazyVWaterFlowLayout_onVisible')
      console.info('[lazyVWaterFlowColumnsTemplate_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with string value '1fr 1fr'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsTemplate_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsTemplate_string');
      console.info("[lazyVWaterFlowColumnsTemplate_static_0200] columnsTemplate: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
        .assertEqual("1fr 1fr");
      console.info('[lazyVWaterFlowColumnsTemplate_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with ItemFillPolicy.BREAKPOINT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsTemplate_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsTemplate_itemFillPolicy');
      console.info("[lazyVWaterFlowColumnsTemplate_static_0300] itemFillPolicy: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemFillPolicy')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemFillPolicy'))
        .assertEqual("PresetFillType.BREAKPOINT_DEFAULT");
      console.info('[lazyVWaterFlowColumnsTemplate_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_static_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_STATIC_0400
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with string value 'repeat(auto-fill, 100vp)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsTemplate_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsTemplate_string2');
      console.info("[lazyVWaterFlowColumnsTemplate_static_0400] columnsTemplate: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
        .assertEqual("repeat(auto-fill, 100vp)");
      console.info('[lazyVWaterFlowColumnsTemplate_static_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_static_0500
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_STATIC_0500
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsTemplate_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsTemplate_undefined');
      console.info("[lazyVWaterFlowColumnsTemplate_static_0500] columnsTemplate: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
        .assertEqual("1fr");
      console.info('[lazyVWaterFlowColumnsTemplate_static_0500] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsGap_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsGap_default');
      console.info("[lazyVWaterFlowColumnsGap_static_0100] columnsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap'))
        .assertEqual("0.00vp");
      console.info('[lazyVWaterFlowColumnsGap_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsGap_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsGap_vp');
      console.info("[lazyVWaterFlowColumnsGap_static_0200] columnsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap'))
        .assertEqual("10.00vp");
      console.info('[lazyVWaterFlowColumnsGap_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsGap_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsGap_px');
      console.info("[lazyVWaterFlowColumnsGap_static_0300] columnsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap'))
        .assertEqual("20.00px");
      console.info('[lazyVWaterFlowColumnsGap_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_static_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_STATIC_0400
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowColumnsGap_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_columnsGap_undefined');
      console.info("[lazyVWaterFlowColumnsGap_static_0400] columnsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap'))
        .assertEqual("0.00vp");
      console.info('[lazyVWaterFlowColumnsGap_static_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowRowsGap_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_rowsGap_default');
      console.info("[lazyVWaterFlowRowsGap_static_0100] rowsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap'))
        .assertEqual("0.00vp");
      console.info('[lazyVWaterFlowRowsGap_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowRowsGap_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_rowsGap_vp');
      console.info("[lazyVWaterFlowRowsGap_static_0200] rowsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap'))
        .assertEqual("10.00vp");
      console.info('[lazyVWaterFlowRowsGap_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowRowsGap_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_rowsGap_px');
      console.info("[lazyVWaterFlowRowsGap_static_0300] rowsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap'))
        .assertEqual("20.00px");
      console.info('[lazyVWaterFlowRowsGap_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_static_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_STATIC_0400
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowRowsGap_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_rowsGap_undefined');
      console.info('[lazyVWaterFlowRowsGap_static_0400] rowsGap: ' + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('rowsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap'))
        .assertEqual("0.00vp");
      console.info('[lazyVWaterFlowRowsGap_static_0400] END');
      done();
    });
  });
}