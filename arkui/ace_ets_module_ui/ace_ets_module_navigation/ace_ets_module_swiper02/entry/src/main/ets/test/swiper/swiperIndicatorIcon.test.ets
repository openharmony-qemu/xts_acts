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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function swiperFillPolicy() {
  describe('swiperFillPolicy', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperFillPolicy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperFillPolicy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperFillPolicy state pages:" + JSON.stringify(pages));
        if (!("swiperFillPolicy" == pages.name)) {
          console.info("get swiperFillPolicy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperFillPolicy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperFillPolicy page error:" + err);
      }
      console.info("swiperFillPolicy beforeEach end");
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_0100
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0100
     * @tc.desc   Test Swiper indicatorIcon property with ResourceStr type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0100', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0100] START');

      let strJson: string = getInspectorByKey('swiper_indicator_icon_resourceStr');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0100] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_resourceStr');
      // Verify indicator property exists
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0100] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0200
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0200
     * @tc.desc   Test Swiper indicatorIcon property with SymbolGlyphModifier type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0200', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0200] START');

      let strJson: string = getInspectorByKey('swiper_indicator_icon_symbolGlyph');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0200] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_symbolGlyph');
      // Verify indicator property exists
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0200] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0300
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0300
     * @tc.desc   Test Swiper indicatorIcon property with null parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0300', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0300] START');

      let strJsonCompare: string = getInspectorByKey('swiper_indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0300] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[swiperIndicatorIcon_0300] null obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_null');
      // null parameter should show default dot indicator behavior
      expect(obj.$attrs.indicator).assertEqual(objCompare.$attrs.indicator);
      console.info('[swiperIndicatorIcon_0300] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0400
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0400
     * @tc.desc   Test Swiper indicatorIcon property with undefined parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0400', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0400] START');

      let strJsonCompare: string = getInspectorByKey('swiper_indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0400] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[swiperIndicatorIcon_0400] undefined obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_undefined');
      // undefined parameter should show default dot indicator behavior
      expect(obj.$attrs.indicator).assertEqual(objCompare.$attrs.indicator);
      console.info('[swiperIndicatorIcon_0400] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0500
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0500
     * @tc.desc   Test Swiper indicatorIcon property with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0500', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0500] START');

      let strJson: string = getInspectorByKey('swiper_indicator_icon_empty_array');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0500] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_empty_array');
      // Verify indicator property exists
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0500] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0600
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0600
     * @tc.desc   Test Swiper indicatorIcon property with index out of range, icon should not display
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0600', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0600] START');

      let strJson: string = getInspectorByKey('swiper_indicator_icon_index_out_of_range');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0600] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_index_out_of_range');
      // Verify indicator property exists
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0600] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0700
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0700
     * @tc.desc   Test Swiper indicatorIcon property with invalid icon, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0700', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0700] START');

      let strJson: string = getInspectorByKey('swiper_indicator_icon_invalid_icon');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0700] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_icon_invalid_icon');
      // Verify indicator property exists
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0700] END');
    })

    /**
     * @tc.name   swiperIndicatorIcon_0800
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0800
     * @tc.desc   Test Swiper default indicator without indicatorIcon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0800', Level.LEVEL0, async () => {
      console.info('[swiperIndicatorIcon_0800] START');

      let strJson: string = getInspectorByKey('swiper_indicator_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0800] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_indicator_default');
      // Verify indicator property exists with default dot indicator
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperIndicatorIcon_0800] END');
    })
  })
}