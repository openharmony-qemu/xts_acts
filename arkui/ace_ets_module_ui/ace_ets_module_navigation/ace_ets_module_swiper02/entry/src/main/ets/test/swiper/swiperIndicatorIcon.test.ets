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
import events_emitter from '@ohos.events.emitter';

export default function swiperIndicatorIcon() {
  describe('swiperIndicatorIcon', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperIndicatorIcon beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperIndicatorIcon",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperIndicatorIcon state pages:" + JSON.stringify(pages));
        if (!("swiperIndicatorIcon" == pages.name)) {
          console.info("get swiperIndicatorIcon pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperIndicatorIcon page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperIndicatorIcon page error:" + err);
      }
      console.info("swiperIndicatorIcon beforeEach end");
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
    it('swiperIndicatorIcon_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorIcon_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_resourceStr');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndicatorIcon_0100] indicator: " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));

      let indicatorJson: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("[swiperIndicatorIcon_0100] indicatorIcon[0] index: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].index));
      console.info("[swiperIndicatorIcon_0100] indicatorIcon[0] sourceType: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].sourceType));
      console.info("[swiperIndicatorIcon_0100] indicatorIcon[0] iconSrc: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].iconSrc));
      console.info("[swiperIndicatorIcon_0100] indicatorIcon[1] index: " +
        JSON.stringify(indicatorJson.indicatorIcon[1].index));

      expect(obj.$attrs.indicator).not().assertUndefined();
      expect(indicatorJson.indicatorIcon[0].index).assertEqual(0);
      expect(indicatorJson.indicatorIcon[0].sourceType).assertEqual("MEDIA");
      expect(indicatorJson.indicatorIcon[1].index).assertEqual(1);
      console.info('[swiperIndicatorIcon_0100] END');
      done();
    })

    /**
     * @tc.name   swiperIndicatorIcon_0200
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0200
     * @tc.desc   Test Swiper indicatorIcon property with SymbolGlyphModifier type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorIcon_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_symbolGlyph');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[swiperIndicatorIcon_0200] indicator: " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));

      let indicatorJson: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("[swiperIndicatorIcon_0200] indicatorIcon[0] index: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].index));
      console.info("[swiperIndicatorIcon_0200] indicatorIcon[0] sourceType: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].sourceType));
      console.info("[swiperIndicatorIcon_0200] indicatorIcon[0] iconSrc: " +
        JSON.stringify(indicatorJson.indicatorIcon[0].iconSrc));
      console.info("[swiperIndicatorIcon_0200] indicatorIcon[1] index: " +
        JSON.stringify(indicatorJson.indicatorIcon[1].index));

      expect(obj.$attrs.indicator).not().assertUndefined();
      expect(indicatorJson.indicatorIcon[0].index).assertEqual(0);
      expect(indicatorJson.indicatorIcon[0].sourceType).assertEqual("SYMBOL");
      expect(indicatorJson.indicatorIcon[1].index).assertEqual(1);
      console.info('[swiperIndicatorIcon_0200] END');
      done();
    })

    /**
     * @tc.name   swiperIndicatorIcon_0300
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0300
     * @tc.desc   Test Swiper indicatorIcon property with null parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorIcon_0300] START');
      await CommonFunc.sleep(500);
      let strJsonCompare: string = getInspectorByKey('swiper_indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0300] default obj is: " + JSON.stringify(objCompare.$attrs.indicator));
      console.info("[swiperIndicatorIcon_0300] null obj is: " + JSON.stringify(obj.$attrs.indicator));

      let indicatorCompare: ESObject = JSON.parse(objCompare.$attrs.indicator);
      let indicatorJson: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("[swiperIndicatorIcon_0300] indicatorIcon[0]: " +
        JSON.stringify(indicatorJson.indicatorIcon[0]));
      expect(indicatorJson.indicatorIcon[0]).assertEqual(indicatorCompare.indicatorIcon[0]);
      console.info('[swiperIndicatorIcon_0300] END');
      done();
    })

    /**
     * @tc.name   swiperIndicatorIcon_0400
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_PARAM_0400
     * @tc.desc   Test Swiper indicatorIcon property with undefined parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperIndicatorIcon_0400] START');
      await CommonFunc.sleep(500);
      let strJsonCompare: string = getInspectorByKey('swiper_indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('swiper_indicator_icon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperIndicatorIcon_0400] default obj is: " + JSON.stringify(objCompare.$attrs.indicator));
      console.info("[swiperIndicatorIcon_0400] undefined obj is: " + JSON.stringify(obj.$attrs.indicator));

      let indicatorCompare: ESObject = JSON.parse(objCompare.$attrs.indicator);
      let indicatorJson: ESObject = JSON.parse(obj.$attrs.indicator);
      console.info("[swiperIndicatorIcon_0400] indicatorIcon[0]: " +
        JSON.stringify(indicatorJson.indicatorIcon[0]));
      expect(indicatorJson.indicatorIcon[0]).assertEqual(indicatorCompare.indicatorIcon[0]);
      console.info('[swiperIndicatorIcon_0400] END');
      done();
    })
  })
}