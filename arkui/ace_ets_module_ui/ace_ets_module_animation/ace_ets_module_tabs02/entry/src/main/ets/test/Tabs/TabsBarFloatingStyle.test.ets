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
import CommonFunc from '../../MainAbility/common/Common';

export default function TabsBarFloatingStyle() {
  describe('TabsBarFloatingStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsBarFloatingStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsBarFloatingStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsBarFloatingStyle state pages:" + JSON.stringify(pages));
        if (!("TabsBarFloatingStyle" == pages.name)) {
          console.info("get TabsBarFloatingStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsBarFloatingStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsBarFloatingStyle page error:" + err);
      }
      console.info("TabsBarFloatingStyle beforeEach end");
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_0100
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0100
     * @tc.desc   Test Tabs barFloatingStyle with basic floating style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_basic_floating');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0100] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.barFloatingStyle).not().assertEqual(undefined);
      console.info('[tabsBarFloatingStyle_0100] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0200
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0200
     * @tc.desc   Test Tabs barFloatingStyle with full parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_full_params');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0200] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.barSideMargin).assertEqual("20.00vp");
      expect(barFloatingStyle.barBottomMargin).assertEqual("30.00vp");
      expect(barFloatingStyle.maskColor).assertEqual('#80FFFFFF');
      expect(barFloatingStyle.maskHeight).assertEqual("50.00vp");
      expect(barFloatingStyle.adaptToHandedness).assertEqual(false);
      console.info('[tabsBarFloatingStyle_0200] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0300
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0300
     * @tc.desc   Test Tabs barFloatingStyle with only barSideMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0300] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_only_barSideMargin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0300] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.barSideMargin).assertEqual("40.00vp");
      console.info('[tabsBarFloatingStyle_0300] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0400
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0400
     * @tc.desc   Test Tabs barFloatingStyle with only barBottomMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0400] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_only_barBottomMargin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0400] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.barBottomMargin).assertEqual("50.00vp");
      console.info('[tabsBarFloatingStyle_0400] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0500
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0500
     * @tc.desc   Test Tabs barFloatingStyle with only maskColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0500] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_only_maskColor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0500] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.maskColor).assertEqual('#FF000000');
      console.info('[tabsBarFloatingStyle_0500] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0600
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0600
     * @tc.desc   Test Tabs barFloatingStyle with only maskHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0600] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_only_maskHeight');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0600] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.maskHeight).assertEqual("80.00vp");
      console.info('[tabsBarFloatingStyle_0600] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0700
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0700
     * @tc.desc   Test Tabs barFloatingStyle with adaptToHandedness true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0700] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_adaptToHandedness_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0700] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.adaptToHandedness).assertEqual(true);
      console.info('[tabsBarFloatingStyle_0700] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0800
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_0800
     * @tc.desc   Test Tabs barFloatingStyle with adaptToHandedness false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0800] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_adaptToHandedness_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0800] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.adaptToHandedness).assertEqual(false);
      console.info('[tabsBarFloatingStyle_0800] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_0900
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_NULL_0900
     * @tc.desc   Test Tabs barFloatingStyle with null, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_0900', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_0900] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_0900] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.barFloatingStyle).assertEqual(undefined);
      console.info('[tabsBarFloatingStyle_0900] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1000
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_UNDEFINED_1000
     * @tc.desc   Test Tabs barFloatingStyle with undefined, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1000', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1000] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1000] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.barFloatingStyle).assertEqual(undefined);
      console.info('[tabsBarFloatingStyle_1000] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1100
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1100
     * @tc.desc   Test Tabs barFloatingStyle with barWidth smallBarWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1100', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_barWidth_small');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1100] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      let barWidth: Record<string, ESObject> = barFloatingStyle.barWidth as Record<string, ESObject>;
      expect(barWidth.smallBarWidth).assertEqual("150.00vp");
      console.info('[tabsBarFloatingStyle_1100] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1200
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1200
     * @tc.desc   Test Tabs barFloatingStyle with barWidth mediumBarWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1200', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_barWidth_medium');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1200] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      let barWidth: Record<string, ESObject> = barFloatingStyle.barWidth as Record<string, ESObject>;
      expect(barWidth.mediumBarWidth).assertEqual("200.00vp");
      console.info('[tabsBarFloatingStyle_1200] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1300
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1300
     * @tc.desc   Test Tabs barFloatingStyle with barWidth largeBarWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1300', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1300] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_barWidth_large');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1300] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      let barWidth: Record<string, ESObject> = barFloatingStyle.barWidth as Record<string, ESObject>;
      expect(barWidth.largeBarWidth).assertEqual("300.00vp");
      console.info('[tabsBarFloatingStyle_1300] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1400
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1400
     * @tc.desc   Test Tabs barFloatingStyle with barWidth all parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1400', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1400] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_barWidth_all');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1400] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      let barWidth: Record<string, ESObject> = barFloatingStyle.barWidth as Record<string, ESObject>;
      expect(barWidth.smallBarWidth).assertEqual("100.00vp");
      expect(barWidth.mediumBarWidth).assertEqual("200.00vp");
      expect(barWidth.largeBarWidth).assertEqual("300.00vp");
      console.info('[tabsBarFloatingStyle_1400] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1500
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1500
     * @tc.desc   Test Tabs barFloatingStyle without barOverlap, should not apply floating style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('tabsBarFloatingStyle_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1500] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_no_barOverlap');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1500] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.barOverlap).assertEqual("false");
      console.info('[tabsBarFloatingStyle_1500] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1600
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1600
     * @tc.desc   Test Tabs barFloatingStyle with wrong barPosition Start, should not apply floating style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('tabsBarFloatingStyle_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1600] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_wrong_barPosition');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1600] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.barPosition).assertEqual('BarPosition.Start');
      console.info('[tabsBarFloatingStyle_1600] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1700
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1700
     * @tc.desc   Test Tabs barFloatingStyle with vertical true, should not apply floating style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('tabsBarFloatingStyle_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1700] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_vertical_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1700] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      expect(obj.$attrs.vertical).assertEqual("true");
      console.info('[tabsBarFloatingStyle_1700] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1800
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1800
     * @tc.desc   Test Tabs barFloatingStyle with zero values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_1800', Level.LEVEL0, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1800] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_zero_values');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1800] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.barSideMargin).assertEqual("0.00vp");
      expect(barFloatingStyle.barBottomMargin).assertEqual("0.00vp");
      expect(barFloatingStyle.maskHeight).assertEqual("0.00vp");
      console.info('[tabsBarFloatingStyle_1800] END');
      done();
    })

    /**
     * @tc.name   tabsBarFloatingStyle_1900
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_PARAM_1900
     * @tc.desc   Test Tabs barFloatingStyle with large values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('tabsBarFloatingStyle_1900', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsBarFloatingStyle_1900] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_large_values');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[tabsBarFloatingStyle_1900] barFloatingStyle: " + JSON.stringify(obj.$attrs.barFloatingStyle));

      let barFloatingStyle: Record<string, ESObject> = obj.$attrs.barFloatingStyle as Record<string, ESObject>;
      expect(barFloatingStyle.barSideMargin).assertEqual("100.00vp");
      expect(barFloatingStyle.barBottomMargin).assertEqual("100.00vp");
      expect(barFloatingStyle.maskHeight).assertEqual("200.00vp");
      console.info('[tabsBarFloatingStyle_1900] END');
      done();
    })
  })
}