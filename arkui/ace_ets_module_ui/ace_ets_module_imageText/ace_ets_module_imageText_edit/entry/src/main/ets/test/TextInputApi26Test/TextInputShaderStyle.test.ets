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

export default function TextInputShaderStyleTest() {
  describe('TextInputShaderStyleTest', () => {

    beforeEach(async (done: Function) => {
      console.info("TextInputShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi26/TextInputShaderStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputShaderStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextInputShaderStyle" == pages.name)) {
          console.info("get TextInputShaderStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputShaderStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputShaderStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textInputShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test TextInput shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_linear_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_linear_gradient_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_linear_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_linear_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let linearGradientStyle: LinearGradientOptions = shaderStyle as LinearGradientOptions;
      expect(linearGradientStyle.angle).assertEqual('45.00px');
      expect(JSON.stringify(linearGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
      console.info('[textInputShaderStyle_linear_gradient_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test TextInput shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_radial_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_radial_gradient_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_radial_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_radial_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let radialGradientStyle: RadialGradientOptions = shaderStyle as RadialGradientOptions;
      expect(JSON.stringify(radialGradientStyle.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(radialGradientStyle.radius).assertEqual('0.50vp');
      expect(JSON.stringify(radialGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
      console.info('[textInputShaderStyle_radial_gradient_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test TextInput shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_color_shader_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_color_shader_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_color_shader');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_color_shader_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let colorShaderResult: ColorShaderStyle = shaderStyle as ColorShaderStyle;
      expect(colorShaderResult.color).assertEqual('#FF0000FF');
      console.info('[textInputShaderStyle_color_shader_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_PARAM_0100
     * @tc.desc   Test TextInput shaderStyle property with null value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_null_0100] START');

      let strJsonDefault: string = getInspectorByKey('textinput_shaderStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonNull: string = getInspectorByKey('textinput_shaderStyle_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);

      let shaderStyleNull: ESObject = objNull.$attrs.shaderStyle;
      let shaderStyleDefault: ESObject = objDefault.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_null_0100] shaderStyleNull: ' + JSON.stringify(shaderStyleNull));
      console.info('[textInputShaderStyle_null_0100] shaderStyleDefault: ' + JSON.stringify(shaderStyleDefault));

      expect(shaderStyleNull).not().assertUndefined();
      expect(shaderStyleDefault).not().assertUndefined();
      expect(JSON.stringify(shaderStyleNull)).assertEqual(JSON.stringify(shaderStyleDefault));
      console.info('[textInputShaderStyle_null_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test TextInput shaderStyle property with undefined value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_undefined_0100] START');

      let strJsonDefault: string = getInspectorByKey('textinput_shaderStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonUndefined: string = getInspectorByKey('textinput_shaderStyle_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);

      let shaderStyleUndefined: ESObject = objUndefined.$attrs.shaderStyle;
      let shaderStyleDefault: ESObject = objDefault.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_undefined_0100] shaderStyleUndefined: ' + JSON.stringify(shaderStyleUndefined));
      console.info('[textInputShaderStyle_undefined_0100] shaderStyleDefault: ' + JSON.stringify(shaderStyleDefault));

      expect(shaderStyleUndefined).not().assertUndefined();
      expect(shaderStyleDefault).not().assertUndefined();
      expect(JSON.stringify(shaderStyleUndefined)).assertEqual(JSON.stringify(shaderStyleDefault));
      console.info('[textInputShaderStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test TextInput shaderStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_default_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_default_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: string = obj.$attrs.shaderStyle as string;
      console.info('[textInputShaderStyle_default_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      expect(JSON.stringify(shaderStyle)).assertEqual('{}');
      console.info('[textInputShaderStyle_default_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_modifier_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0100
     * @tc.desc   Test TextInput shaderStyle property set via AttributeModifier with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_linear_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_modifier_linear_gradient_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_modifier_linear_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_modifier_linear_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let linearGradientStyle: LinearGradientOptions = shaderStyle as LinearGradientOptions;
      expect(linearGradientStyle.angle).assertEqual('45.00px');
      expect(JSON.stringify(linearGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
      console.info('[textInputShaderStyle_modifier_linear_gradient_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_modifier_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0300
     * @tc.desc   Test TextInput shaderStyle property set via AttributeModifier with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_radial_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_modifier_radial_gradient_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_modifier_radial_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_modifier_radial_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let radialGradientStyle: RadialGradientOptions = shaderStyle as RadialGradientOptions;
      expect(JSON.stringify(radialGradientStyle.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(radialGradientStyle.radius).assertEqual('0.50vp');
      expect(JSON.stringify(radialGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
      console.info('[textInputShaderStyle_modifier_radial_gradient_0100] END');
    })

    /**
     * @tc.name   textInputShaderStyle_modifier_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0200
     * @tc.desc   Test TextInput shaderStyle property set via AttributeModifier with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_color_shader_0100', Level.LEVEL2, async () => {
      console.info('[textInputShaderStyle_modifier_color_shader_0100] START');

      let strJson: string = getInspectorByKey('textinput_shaderStyle_modifier_color_shader');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textInputShaderStyle_modifier_color_shader_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let colorShaderResult: ColorShaderStyle = shaderStyle as ColorShaderStyle;
      expect(colorShaderResult.color).assertEqual('#FF0000FF');
      console.info('[textInputShaderStyle_modifier_color_shader_0100] END');
    })
  })
}