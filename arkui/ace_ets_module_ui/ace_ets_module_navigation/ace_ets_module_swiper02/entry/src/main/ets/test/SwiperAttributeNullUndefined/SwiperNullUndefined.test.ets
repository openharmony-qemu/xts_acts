/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { Driver, } from '@ohos.UiTest';

export default function SwiperNullUndefined() {
  describe('SwiperNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperNullUndefined beforeEach start");
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperAttributeNullUndefined/SwiperNullUndefined',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperNullUndefined state pages:" + JSON.stringify(pages));
        if (!("SwiperNullUndefined" == pages.name)) {
          console.info("get SwiperNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperNullUndefined page error:" + err);
      }
      console.info("SwiperNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAttributeNullUndefined after each called");
    });

    /**
     * @tc.name   swiperIndex_0100
     * @tc.number SUB_ARKUI_SWIPER_INDEX_PARAM_0100
     * @tc.desc   Test Swiper index property with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndex_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndex_0100] START');
      let strJson: string = getInspectorByKey('swiper_index_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndex_0100] index: " + JSON.stringify(obj.$attrs.index));
      expect(obj.$attrs.index).assertEqual('0');
      console.info('[swiperIndex_0100] END');
      done();
    });

    /**
     * @tc.name   swiperIndex_0200
     * @tc.number SUB_ARKUI_SWIPER_INDEX_PARAM_0200
     * @tc.desc   Test Swiper index property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndex_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndex_0200] START');
      let strJsonCompare: string = getInspectorByKey('swiper_index_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_index_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndex_0200] index: " + JSON.stringify(obj.$attrs.index));
      expect(obj.$attrs.index).not().assertUndefined();
      expect(obj.$attrs.index).assertEqual(objCompare.$attrs.index);
      console.info('[swiperIndex_0200] END');
      done();
    });

    /**
     * @tc.name   swiperIndex_0300
     * @tc.number SUB_ARKUI_SWIPER_INDEX_PARAM_0300
     * @tc.desc   Test Swiper index property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndex_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndex_0300] START');
      let strJsonCompare: string = getInspectorByKey('swiper_index_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_index_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndex_0300] index: " + JSON.stringify(obj.$attrs.index));
      expect(obj.$attrs.index).not().assertUndefined();
      expect(obj.$attrs.index).assertEqual(objCompare.$attrs.index);
      console.info('[swiperIndex_0300] END');
      done();
    });

    /**
     * @tc.name   swiperInterval_0100
     * @tc.number SUB_ARKUI_SWIPER_INTERVAL_PARAM_0100
     * @tc.desc   Test Swiper interval property with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperInterval_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperInterval_0100] START');
      let strJson: string = getInspectorByKey('swiper_interval_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperInterval_0100] interval: " + JSON.stringify(obj.$attrs.interval));
      expect(obj.$attrs.interval).assertEqual('3000');
      console.info('[swiperInterval_0100] END');
      done();
    });

    /**
     * @tc.name   swiperInterval_0200
     * @tc.number SUB_ARKUI_SWIPER_INTERVAL_PARAM_0200
     * @tc.desc   Test Swiper interval property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperInterval_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperInterval_0200] START');
      let strJsonCompare: string = getInspectorByKey('swiper_interval_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_interval_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperInterval_0200] interval: " + JSON.stringify(obj.$attrs.interval));
      expect(obj.$attrs.interval).not().assertUndefined();
      expect(obj.$attrs.interval).assertEqual(objCompare.$attrs.interval);
      console.info('[swiperInterval_0200] END');
      done();
    });

    /**
     * @tc.name   swiperInterval_0300
     * @tc.number SUB_ARKUI_SWIPER_INTERVAL_PARAM_0300
     * @tc.desc   Test Swiper interval property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperInterval_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperInterval_0300] START');
      let strJsonCompare: string = getInspectorByKey('swiper_interval_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_interval_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperInterval_0300] interval: " + JSON.stringify(obj.$attrs.interval));
      expect(obj.$attrs.interval).not().assertUndefined();
      expect(obj.$attrs.interval).assertEqual(objCompare.$attrs.interval);
      console.info('[swiperInterval_0300] END');
      done();
    });

    /**
     * @tc.name   swiperDuration_0100
     * @tc.number SUB_ARKUI_SWIPER_DURATION_PARAM_0100
     * @tc.desc   Test Swiper duration property with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperDuration_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperDuration_0100] START');
      let strJson: string = getInspectorByKey('swiper_duration_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperDuration_0100] duration: " + JSON.stringify(obj.$attrs.duration));
      expect(obj.$attrs.duration).assertEqual('400');
      console.info('[swiperDuration_0100] END');
      done();
    });

    /**
     * @tc.name   swiperDuration_0200
     * @tc.number SUB_ARKUI_SWIPER_DURATION_PARAM_0200
     * @tc.desc   Test Swiper duration property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperDuration_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperDuration_0200] START');
      let strJsonCompare: string = getInspectorByKey('swiper_duration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_duration_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperDuration_0200] duration: " + JSON.stringify(obj.$attrs.duration));
      expect(obj.$attrs.duration).not().assertUndefined();
      expect(obj.$attrs.duration).assertEqual(objCompare.$attrs.duration);
      console.info('[swiperDuration_0200] END');
      done();
    });

    /**
     * @tc.name   swiperDuration_0300
     * @tc.number SUB_ARKUI_SWIPER_DURATION_PARAM_0300
     * @tc.desc   Test Swiper duration property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperDuration_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperDuration_0300] START');
      let strJsonCompare: string = getInspectorByKey('swiper_duration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_duration_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperDuration_0300] duration: " + JSON.stringify(obj.$attrs.duration));
      expect(obj.$attrs.duration).not().assertUndefined();
      expect(obj.$attrs.duration).assertEqual(objCompare.$attrs.duration);
      console.info('[swiperDuration_0300] END');
      done();
    });

    /**
     * @tc.name   swiperItemSpace_0100
     * @tc.number SUB_ARKUI_SWIPER_ITEMSPACE_PARAM_0100
     * @tc.desc   Test Swiper itemSpace property with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperItemSpace_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperItemSpace_0100] START');
      let strJson: string = getInspectorByKey('swiper_itemSpace_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperItemSpace_0100] itemSpace: " + JSON.stringify(obj.$attrs.itemSpace));
      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
      console.info('[swiperItemSpace_0100] END');
      done();
    });

    /**
     * @tc.name   swiperItemSpace_0200
     * @tc.number SUB_ARKUI_SWIPER_ITEMSPACE_PARAM_0200
     * @tc.desc   Test Swiper itemSpace property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperItemSpace_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperItemSpace_0200] START');
      let strJsonCompare: string = getInspectorByKey('swiper_itemSpace_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_itemSpace_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperItemSpace_0200] itemSpace: " + JSON.stringify(obj.$attrs.itemSpace));
      expect(obj.$attrs.itemSpace).not().assertUndefined();
      console.info('[swiperItemSpace_0200] END');
      done();
    });

    /**
     * @tc.name   swiperItemSpace_0300
     * @tc.number SUB_ARKUI_SWIPER_ITEMSPACE_PARAM_0300
     * @tc.desc   Test Swiper itemSpace property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperItemSpace_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperItemSpace_0300] START');
      let strJsonCompare: string = getInspectorByKey('swiper_itemSpace_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_itemSpace_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperItemSpace_0300] itemSpace: " + JSON.stringify(obj.$attrs.itemSpace));
      expect(obj.$attrs.itemSpace).not().assertUndefined();
      console.info('[swiperItemSpace_0300] END');
      done();
    });

    /**
     * @tc.name   swiperItemSpace_0400
     * @tc.number SUB_ARKUI_SWIPER_ITEMSPACE_PARAM_0400
     * @tc.desc   Test Swiper itemSpace property with empty string should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperItemSpace_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperItemSpace_0400] START');
      let strJsonCompare: string = getInspectorByKey('swiper_itemSpace_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_itemSpace_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperItemSpace_0400] itemSpace: " + JSON.stringify(obj.$attrs.itemSpace));
      expect(obj.$attrs.itemSpace).not().assertUndefined();
      expect(obj.$attrs.itemSpace).assertEqual(objCompare.$attrs.itemSpace);
      console.info('[swiperItemSpace_0400] END');
      done();
    });

    /**
     * @tc.name   swiperCurve_0100
     * @tc.number SUB_ARKUI_SWIPER_CURVE_PARAM_0100
     * @tc.desc   Test Swiper curve property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperCurve_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperCurve_0100] START');
      let strJsonCompare: string = getInspectorByKey('swiper_curve_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_curve_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperCurve_0100] curve: " + JSON.stringify(obj.$attrs.curve));
      expect(obj.$attrs.curve).not().assertUndefined();
      console.info('[swiperCurve_0100] END');
      done();
    });

    /**
     * @tc.name   swiperCurve_0200
     * @tc.number SUB_ARKUI_SWIPER_CURVE_PARAM_0200
     * @tc.desc   Test Swiper curve property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperCurve_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperCurve_0200] START');
      let strJsonCompare: string = getInspectorByKey('swiper_curve_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_curve_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperCurve_0200] curve: " + JSON.stringify(obj.$attrs.curve));
      expect(obj.$attrs.curve).not().assertUndefined();
      console.info('[swiperCurve_0200] END');
      done();
    });

    /**
     * @tc.name   swiperCurve_0300
     * @tc.number SUB_ARKUI_SWIPER_CURVE_PARAM_0300
     * @tc.desc   Test Swiper curve property with valid string value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperCurve_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperCurve_0300] START');
      let strJson: string = getInspectorByKey('swiper_curve_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperCurve_0300] curve: " + JSON.stringify(obj.$attrs.curve));
      expect(obj.$attrs.curve).assertEqual('Curves.EaseInOut');
      console.info('[swiperCurve_0300] END');
      done();
    });

    /**
     * @tc.name   swiperCurve_0400
     * @tc.number SUB_ARKUI_SWIPER_CURVE_PARAM_0400
     * @tc.desc   Test Swiper curve property with empty string should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperCurve_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperCurve_0400] START');
      let strJsonCompare: string = getInspectorByKey('swiper_curve_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_curve_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperCurve_0400] curve: " + JSON.stringify(obj.$attrs.curve));
      expect(obj.$attrs.curve).not().assertUndefined();
      console.info('[swiperCurve_0400] END');
      done();
    });

    /**
     * @tc.name   swiperIndicatorInteractive_0100
     * @tc.number SUB_ARKUI_SWIPER_INDICATORINTERACTIVE_PARAM_0100
     * @tc.desc   Test Swiper indicatorInteractive property with default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorInteractive_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorInteractive_0100] START');
      let strJson: string = getInspectorByKey('swiper_indicatorInteractive_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndicatorInteractive_0100] indicatorInteractive: " + JSON.stringify(obj.$attrs.indicatorInteractive));
      expect(obj.$attrs.indicatorInteractive).assertEqual('true');
      console.info('[swiperIndicatorInteractive_0100] END');
      done();
    });

    /**
     * @tc.name   swiperIndicatorInteractive_0200
     * @tc.number SUB_ARKUI_SWIPER_INDICATORINTERACTIVE_PARAM_0200
     * @tc.desc   Test Swiper indicatorInteractive property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorInteractive_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorInteractive_0200] START');
      let strJson: string = getInspectorByKey('swiper_indicatorInteractive_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndicatorInteractive_0200] indicatorInteractive: " + JSON.stringify(obj.$attrs.indicatorInteractive));
      expect(obj.$attrs.indicatorInteractive).assertEqual('true');
      console.info('[swiperIndicatorInteractive_0200] END');
      done();
    });
  });
}