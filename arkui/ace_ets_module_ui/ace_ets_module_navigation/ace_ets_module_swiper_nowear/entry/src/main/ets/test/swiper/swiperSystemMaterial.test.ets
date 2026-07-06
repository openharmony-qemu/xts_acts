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

export default function swiperSystemMaterial() {
  describe('swiperSystemMaterial', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperSystemMaterial",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperSystemMaterial state pages:" + JSON.stringify(pages));
        if (!("swiperSystemMaterial" == pages.name)) {
          console.info("get swiperSystemMaterial pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperSystemMaterial page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperSystemMaterial page error:" + err);
      }
      console.info("swiperSystemMaterial beforeEach end");
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
    it('swiperSystemMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperSystemMaterial_0100] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[1]
      console.info("[swiperSystemMaterial_0100] tree systemMaterial is: " +
        JSON.stringify(tree.$attrs.systemMaterial));
      console.info("[swiperSystemMaterial_0100] material style is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.style));
      console.info("[swiperSystemMaterial_0100] material materialColor is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.materialColor));
      console.info("[swiperSystemMaterial_0100] material colorInvert is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.colorInvert));
      console.info("[swiperSystemMaterial_0100] material applyShadow is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.applyShadow));
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.style).assertEqual("ImmersiveStyle.ULTRA_THIN");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.materialColor).assertEqual("#6000FFFF");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.colorInvert).assertEqual("true");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.applyShadow).assertEqual("true");
      console.info('[swiperSystemMaterial_0100] END');
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_0200
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0200
     * @tc.desc   Test Swiper systemMaterial property with THIN style and materialColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperSystemMaterial_0200] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[1]
      console.info("[swiperSystemMaterial_0200] tree systemMaterial is: " +
        JSON.stringify(tree.$attrs.systemMaterial));
      console.info("[swiperSystemMaterial_0200] material style is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.style));
      console.info("[swiperSystemMaterial_0200] material materialColor is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.materialColor));
      console.info("[swiperSystemMaterial_0200] material colorInvert is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.colorInvert));
      console.info("[swiperSystemMaterial_0200] material applyShadow is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.applyShadow));
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.style).assertEqual("ImmersiveStyle.THIN");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.materialColor).assertEqual("#80FF0000");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.colorInvert).assertEqual("false");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.applyShadow).assertEqual("false");
      console.info('[swiperSystemMaterial_0200] END');
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_0300
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0300
     * @tc.desc   Test Swiper systemMaterial property with REGULAR style and undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperSystemMaterial_0300] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[5]
        .$children[1]
      console.info("[swiperSystemMaterial_0300] tree systemMaterial is: " +
        JSON.stringify(tree.$attrs.systemMaterial));
      console.info("[swiperSystemMaterial_0300] material style is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.style));
      console.info("[swiperSystemMaterial_0300] material materialColor is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.materialColor));
      console.info("[swiperSystemMaterial_0300] material colorInvert is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.colorInvert));
      console.info("[swiperSystemMaterial_0300] material applyShadow is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.applyShadow));
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.style).assertEqual("ImmersiveStyle.REGULAR");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.colorInvert).assertEqual("false");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.applyShadow).assertEqual("true");
      console.info('[swiperSystemMaterial_0300] END');
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_0400
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_PARAM_0400
     * @tc.desc   Test Swiper systemMaterial property with ULTRA_THICK style and null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[swiperSystemMaterial_0400] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[7]
        .$children[1]
      console.info("[swiperSystemMaterial_0400] tree systemMaterial is: " +
        JSON.stringify(tree.$attrs.systemMaterial));
      console.info("[swiperSystemMaterial_0400] material style is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.style));
      console.info("[swiperSystemMaterial_0400] material materialColor is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.materialColor));
      console.info("[swiperSystemMaterial_0400] material colorInvert is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.colorInvert));
      console.info("[swiperSystemMaterial_0400] material applyShadow is: " +
        JSON.stringify(tree.$attrs.systemMaterial.material?.immersiveOptions?.applyShadow));
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.style).assertEqual("ImmersiveStyle.ULTRA_THICK");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.colorInvert).assertEqual("false");
      expect(tree.$attrs.systemMaterial.material.immersiveOptions.applyShadow).assertEqual("true");
      console.info('[swiperSystemMaterial_0400] END');
      done();
    });
  })
}