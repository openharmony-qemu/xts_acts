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

export default function LazyColumnLayoutProperties() {
  describe('LazyColumnLayoutProperties', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyColumnLayoutProperties beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyColumnLayout/LazyColumnLayoutProperties',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyColumnLayoutProperties state pages:" + JSON.stringify(pages));
        if (!("LazyColumnLayoutProperties" == pages.name)) {
          console.info("get LazyColumnLayoutProperties pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyColumnLayoutProperties page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyColumnLayoutProperties page error:" + err);
      }
      console.info("LazyColumnLayoutProperties beforeEach end");
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0100
     * @tc.desc   Test LazyColumnLayout space property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0100] START');
      let strJson: string = getInspectorByKey('lazyColumn_space_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0100] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).assertEqual('0.00vp');

      let result: string | undefined = AppStorage.get("LazyColumnLayout_onVisible");
      console.info('[lazyColumnSpace_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);
      AppStorage.delete('LazyColumnLayout_onVisible')
      console.info('[lazyColumnSpace_0100] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0200
     * @tc.desc   Test LazyColumnLayout space property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0200] START');
      let strJson: string = getInspectorByKey('lazyColumn_space_vp');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0200] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).assertEqual('10.00vp');
      console.info('[lazyColumnSpace_0200] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0300
     * @tc.desc   Test LazyColumnLayout space property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0300] START');
      let strJson: string = getInspectorByKey('lazyColumn_space_px');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0300] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).assertEqual('20.00px');
      console.info('[lazyColumnSpace_0300] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0400
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0400
     * @tc.desc   Test LazyColumnLayout space property with negative value should use 0vp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0400] START');
      let strJsonCompare: string = getInspectorByKey('lazyColumn_space_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyColumn_space_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0400] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).not().assertUndefined();
      expect(obj.$attrs.space).assertEqual(objCompare.$attrs.space);
      console.info('[lazyColumnSpace_0400] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0500
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0500
     * @tc.desc   Test LazyColumnLayout space property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0500] START');
      let strJsonCompare: string = getInspectorByKey('lazyColumn_space_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyColumn_space_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0500] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).not().assertUndefined();
      expect(obj.$attrs.space).assertEqual(objCompare.$attrs.space);
      console.info('[lazyColumnSpace_0500] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_0600
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_PARAM_0600
     * @tc.desc   Test LazyColumnLayout space property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnSpace_0600] START');
      let strJsonCompare: string = getInspectorByKey('lazyColumn_space_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyColumn_space_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnSpace_0600] space: " + JSON.stringify(obj.$attrs.space));
      expect(obj.$attrs.space).not().assertUndefined();
      expect(obj.$attrs.space).assertEqual(objCompare.$attrs.space);
      console.info('[lazyColumnSpace_0600] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0100
     * @tc.desc   Test LazyColumnLayout alignItems property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0100] START');
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0100] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('[lazyColumnAlignItems_0100] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0200
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0200] START');
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0200] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Start');
      console.info('[lazyColumnAlignItems_0200] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0300
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.Center
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0300] START');
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_center');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0300] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('[lazyColumnAlignItems_0300] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0400
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0400
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.End
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0400] START');
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_END');
      done();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0400] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.END');
      done();
      console.info('[lazyColumnAlignItems_0400] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0500
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0500
     * @tc.desc   Test LazyColumnLayout alignItems property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0500] START');
      let strJsonCompare: string = getInspectorByKey('lazyColumn_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0500] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).not().assertUndefined();
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      console.info('[lazyColumnAlignItems_0500] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_0600
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_PARAM_0600
     * @tc.desc   Test LazyColumnLayout alignItems property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyColumnAlignItems_0600] START');
      let strJsonCompare: string = getInspectorByKey('lazyColumn_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyColumn_alignItems_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyColumnAlignItems_0600] alignItems: " + JSON.stringify(obj.$attrs.alignItems));
      expect(obj.$attrs.alignItems).not().assertUndefined();
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      console.info('[lazyColumnAlignItems_0600] END');
      done();
    });
  });
}