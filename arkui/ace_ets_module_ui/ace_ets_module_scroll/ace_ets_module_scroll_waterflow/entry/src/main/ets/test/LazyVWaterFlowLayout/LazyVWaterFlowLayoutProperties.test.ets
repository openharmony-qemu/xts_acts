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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LazyVWaterFlowLayoutProperties() {
  describe('LazyVWaterFlowLayoutProperties', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyVWaterFlowLayoutProperties beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyVWaterFlowLayout/LazyVWaterFlowLayoutProperties',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyVWaterFlowLayoutProperties state pages:" + JSON.stringify(pages));
        if (!("LazyVWaterFlowLayoutProperties" == pages.name)) {
          console.info("get LazyVWaterFlowLayoutProperties pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyVWaterFlowLayoutProperties page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyVWaterFlowLayoutProperties page error:" + err);
      }
      console.info("LazyVWaterFlowLayoutProperties beforeEach end");
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0100
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0100] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0100] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.columnsTemplate).assertEqual("");

      let result: string | undefined = AppStorage.get("LazyVWaterFlowLayout_onVisible");
      console.info('[lazyVWaterFlowColumnsTemplate_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);
      AppStorage.delete('LazyVWaterFlowLayout_onVisible')
      console.info('[lazyVWaterFlowColumnsTemplate_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0200
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with string value '1fr 1fr'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0200] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0200] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.columnsTemplate).assertEqual('1fr 1fr');
      console.info('[lazyVWaterFlowColumnsTemplate_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0300
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with ItemFillPolicy.BREAKPOINT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0300] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_itemFillPolicy');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0300] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");
      console.info('[lazyVWaterFlowColumnsTemplate_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0400
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with string value 'repeat(auto-fill, 100vp)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0400] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_string2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0400] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.columnsTemplate).assertEqual('repeat(auto-fill, 100vp)');
      console.info('[lazyVWaterFlowColumnsTemplate_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0500
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0500
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0500] START');
      let strJsonCompare: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_null');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0500] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.columnsTemplate).not().assertUndefined();
      expect(obj.$attrs.columnsTemplate).assertEqual(objCompare.$attrs.columnsTemplate);
      console.info('[lazyVWaterFlowColumnsTemplate_0500] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsTemplate_0600
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSTEMPLATE_PARAM_0600
     * @tc.desc   Test LazyVWaterFlowLayout columnsTemplate property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsTemplate_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsTemplate_0600] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsTemplate_0600] columnsTemplate: " + JSON.stringify(obj.$attrs.columnsTemplate));
      expect(obj.$attrs.columnsTemplate).assertEqual("1fr");
      console.info('[lazyVWaterFlowColumnsTemplate_0600] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_PARAM_0100
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsGap_0100] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsGap_0100] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      expect(obj.$attrs.columnsGap).assertEqual('0.00vp');
      console.info('[lazyVWaterFlowColumnsGap_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_PARAM_0200
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsGap_0200] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsGap_vp');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsGap_0200] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      expect(obj.$attrs.columnsGap).assertEqual('10.00vp');
      console.info('[lazyVWaterFlowColumnsGap_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_PARAM_0300
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsGap_0300] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsGap_px');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsGap_0300] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      expect(obj.$attrs.columnsGap).assertEqual('20.00px');
      console.info('[lazyVWaterFlowColumnsGap_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_PARAM_0400
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsGap_0400] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsGap_0400] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      expect(obj.$attrs.columnsGap).assertEqual('0.00fp');
      console.info('[lazyVWaterFlowColumnsGap_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowColumnsGap_0500
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_COLUMNSGAP_PARAM_0500
     * @tc.desc   Test LazyVWaterFlowLayout columnsGap property with null parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowColumnsGap_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowColumnsGap_0500] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_columnsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowColumnsGap_0500] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      expect(obj.$attrs.columnsGap).assertEqual('0.00fp');
      console.info('[lazyVWaterFlowColumnsGap_0500] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_PARAM_0100
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowRowsGap_0100] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_rowsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowRowsGap_0100] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      expect(obj.$attrs.rowsGap).assertEqual('0.00vp');
      console.info('[lazyVWaterFlowRowsGap_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_PARAM_0200
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowRowsGap_0200] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_rowsGap_vp');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowRowsGap_0200] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      expect(obj.$attrs.rowsGap).assertEqual('10.00vp');
      console.info('[lazyVWaterFlowRowsGap_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_PARAM_0300
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowRowsGap_0300] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_rowsGap_px');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowRowsGap_0300] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      expect(obj.$attrs.rowsGap).assertEqual('20.00px');
      console.info('[lazyVWaterFlowRowsGap_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_PARAM_0400
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with undefined parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowRowsGap_0400] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_rowsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowRowsGap_0400] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      expect(obj.$attrs.rowsGap).assertEqual('0.00fp');
      console.info('[lazyVWaterFlowRowsGap_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowRowsGap_0500
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_ROWSGAP_PARAM_0500
     * @tc.desc   Test LazyVWaterFlowLayout rowsGap property with null parameter should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowRowsGap_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVWaterFlowRowsGap_0500] START');
      let strJson: string = getInspectorByKey('lazyVWaterFlow_rowsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVWaterFlowRowsGap_0500] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      expect(obj.$attrs.rowsGap).assertEqual('0.00fp');
      console.info('[lazyVWaterFlowRowsGap_0500] END');
      done();
    });
  });
}