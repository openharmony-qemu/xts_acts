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
import { Driver, ON } from '@ohos.UiTest';

export default function RichEditorShaderStyleTest() {
  describe('RichEditorShaderStyleTest', () => {
    let driver: Driver;

    beforeEach(async (done: Function) => {
      console.info("RichEditorShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorShaderStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShaderStyleTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorShaderStyle" == pages.name)) {
          console.info("get RichEditorShaderStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorShaderStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShaderStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterAll(async () => {
      AppStorage.delete('shaderStyle_linear_gradient');
      AppStorage.delete('shaderStyle_radial_gradient');
      AppStorage.delete('shaderStyle_color_shader');
      AppStorage.delete('shaderStyle_default');
      AppStorage.delete('shaderStyle_undefined');
    })

    /**
     * @tc.name   richEditorShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test RichEditor shaderStyle property with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_linear_gradient_0100', Level.LEVEL2, async () => {
      console.info('[richEditorShaderStyle_linear_gradient_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_linear_gradient'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let shaderStyle: LinearGradientOptions | undefined = AppStorage.get('shaderStyle_linear_gradient');
      console.info('[richEditorShaderStyle_linear_gradient_0100] shaderStyle: ' + shaderStyle);

      expect(shaderStyle?.angle).assertEqual(45);
      expect(shaderStyle?.direction).assertEqual(8);
      expect(JSON.stringify(shaderStyle?.colors)).assertEqual('[["#FFFF0000",0],["#FF0000FF",1]]');
      console.info('[richEditorShaderStyle_linear_gradient_0100] END');
    })

    /**
     * @tc.name   richEditorShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test RichEditor shaderStyle property with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_radial_gradient_0100', Level.LEVEL2, async () => {
      console.info('[richEditorShaderStyle_radial_gradient_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_radial_gradient'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let shaderStyle: RadialGradientOptions | undefined = AppStorage.get('shaderStyle_radial_gradient');
      console.info('[richEditorShaderStyle_radial_gradient_0100] shaderStyle: ' + shaderStyle);

      expect(JSON.stringify(shaderStyle?.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(shaderStyle?.radius).assertEqual('0.50vp');
      expect(JSON.stringify(shaderStyle?.colors)).assertEqual('[["#FFFF0000",0],["#FF008000",1]]');
      console.info('[richEditorShaderStyle_radial_gradient_0100] END');
    })

    /**
     * @tc.name   richEditorShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test RichEditor shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_color_shader_0100', Level.LEVEL2, async () => {
      console.info('[richEditorShaderStyle_color_shader_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_color_shader'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let shaderStyle: ResourceColor | undefined = AppStorage.get('shaderStyle_color_shader');
      console.info('[richEditorShaderStyle_color_shader_0100] shaderStyle: ' + shaderStyle);

      expect(shaderStyle).assertEqual('#FFFFC0CB');
      console.info('[richEditorShaderStyle_color_shader_0100] END');
    })

    /**
     * @tc.name   richEditorShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor shaderStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[richEditorShaderStyle_undefined_0100] START');
      driver = Driver.create();
      let btnUndefined = await driver.findComponent(ON.id('btn_shaderStyle_undefined'));
      expect(btnUndefined).not().assertUndefined();
      await btnUndefined.click();
      await CommonFunc.sleep(500);

      let btnDefault = await driver.findComponent(ON.id('btn_shaderStyle_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);

      let shaderStyleUndefined: string | undefined = AppStorage.get('shaderStyle_undefined');
      let shaderStyleDefault: string | undefined = AppStorage.get('shaderStyle_default');

      console.info('[richEditorShaderStyle_undefined_0100] shaderStyleUndefined: ' + shaderStyleUndefined);
      console.info('[richEditorShaderStyle_undefined_0100] shaderStyleDefault: ' + shaderStyleDefault);

      expect(shaderStyleUndefined).assertEqual(shaderStyleDefault);
      console.info('[richEditorShaderStyle_undefined_0100] END');
    })

    /**
     * @tc.name   richEditorShaderStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor shaderStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_default_0100', Level.LEVEL2, async () => {
      console.info('[richEditorShaderStyle_default_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_default'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let shaderStyle: string | undefined = AppStorage.get('shaderStyle_default');
      console.info('[richEditorShaderStyle_default_0100] shaderStyle: ' + shaderStyle);

      expect(shaderStyle).assertEqual('undefined');
      console.info('[richEditorShaderStyle_default_0100] END');
    })
  })
}