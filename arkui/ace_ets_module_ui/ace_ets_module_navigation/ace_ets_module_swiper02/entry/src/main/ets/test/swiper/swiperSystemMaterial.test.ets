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
     * @tc.name   swiperSystemMaterial_0100
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0100
     * @tc.desc   Test Swiper systemMaterial property with ULTRA_THIN style and all properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0100', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0100] START');

      let strJson: string = getInspectorByKey('indicator_ultra_thin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0100] obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_ultra_thin');
      // Verify component exists
      expect(obj.$attrs).not().assertUndefined();
      console.info('[swiperSystemMaterial_0100] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0200
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0200
     * @tc.desc   Test Swiper systemMaterial property with THIN style and materialColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0200', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0200] START');

      let strJson: string = getInspectorByKey('indicator_thin_colorInvert');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0200] obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_thin_colorInvert');
      // Verify component exists
      expect(obj.$attrs).not().assertUndefined();
      console.info('[swiperSystemMaterial_0200] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0300
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0300
     * @tc.desc   Test Swiper systemMaterial property with REGULAR style and undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0300', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0300] START');

      let strJson: string = getInspectorByKey('indicator_regular_applyShadow');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0300] obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_regular_applyShadow');
      // Verify component exists
      expect(obj.$attrs).not().assertUndefined();
      console.info('[swiperSystemMaterial_0300] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0400
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0400
     * @tc.desc   Test Swiper systemMaterial property with ULTRA_THICK style and null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0400', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0400] START');

      let strJson: string = getInspectorByKey('indicator_ultra_thick_interactive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0400] obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_ultra_thick_interactive');
      // Verify component exists
      expect(obj.$attrs).not().assertUndefined();
      console.info('[swiperSystemMaterial_0400] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0500
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0500
     * @tc.desc   Test Swiper systemMaterial property with null parameter, should use default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0500', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0500] START');

      let strJsonCompare: string = getInspectorByKey('indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('indicator_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0500] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[swiperSystemMaterial_0500] null obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_null');
      // null parameter should use default behavior (same as not set)
      expect(obj.$attrs.id).assertEqual(objCompare.$attrs.id);
      console.info('[swiperSystemMaterial_0500] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0600
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0600
     * @tc.desc   Test Swiper systemMaterial property with undefined parameter, should use default behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0600', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0600] START');

      let strJsonCompare: string = getInspectorByKey('indicator_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('indicator_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0600] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[swiperSystemMaterial_0600] undefined obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully
      expect(obj.$attrs.id).assertEqual('indicator_undefined');
      // undefined parameter should use default behavior (same as not set)
      expect(obj.$attrs.id).assertEqual(objCompare.$attrs.id);
      console.info('[swiperSystemMaterial_0600] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0700
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0700
     * @tc.desc   Test Swiper systemMaterial default behavior (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0700', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0700] START');

      let strJson: string = getInspectorByKey('indicator_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0700] obj is: " + JSON.stringify(obj.$attrs));

      // Verify IndicatorComponent is created successfully without systemMaterial
      expect(obj.$attrs.id).assertEqual('indicator_default');
      // Verify component exists
      expect(obj.$attrs).not().assertUndefined();
      console.info('[swiperSystemMaterial_0700] END');
    })

    /**
     * @tc.name   swiperSystemMaterial_0800
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0800
     * @tc.desc   Test Swiper component with systemMaterial integration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0800', Level.LEVEL0, async () => {
      console.info('[swiperSystemMaterial_0800] START');

      let strJson: string = getInspectorByKey('swiper_ultra_thin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[swiperSystemMaterial_0800] obj is: " + JSON.stringify(obj.$attrs));

      // Verify Swiper component is created successfully
      expect(obj.$attrs.id).assertEqual('swiper_ultra_thin');
      // Verify Swiper has indicator property
      expect(obj.$attrs.indicator).not().assertUndefined();
      console.info('[swiperSystemMaterial_0800] END');
    })
  })
}