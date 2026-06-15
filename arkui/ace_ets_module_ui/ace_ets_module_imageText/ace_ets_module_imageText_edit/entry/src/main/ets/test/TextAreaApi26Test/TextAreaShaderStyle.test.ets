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

export default function TextAreaShaderStyleTest() {
  describe('TextAreaShaderStyleTest', () => {

    beforeEach(async (done: Function) => {
      console.info("TextAreaShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi26/TextAreaShaderStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaShaderStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaShaderStyle" == pages.name)) {
          console.info("get TextAreaShaderStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaShaderStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaShaderStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textAreaShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test TextArea shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_linear_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_linear_gradient_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_linear_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_linear_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let linearGradientStyle: LinearGradientOptions = shaderStyle as LinearGradientOptions;
      expect(linearGradientStyle.angle).assertEqual('45.00px');
      expect(JSON.stringify(linearGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
      console.info('[textAreaShaderStyle_linear_gradient_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test TextArea shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_radial_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_radial_gradient_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_radial_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_radial_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let radialGradientStyle: RadialGradientOptions = shaderStyle as RadialGradientOptions;
      expect(JSON.stringify(radialGradientStyle.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(radialGradientStyle.radius).assertEqual('0.50vp');
      expect(JSON.stringify(radialGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
      console.info('[textAreaShaderStyle_radial_gradient_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test TextArea shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_color_shader_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_color_shader_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_color_shader');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_color_shader_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let colorShaderResult: ColorShaderStyle = shaderStyle as ColorShaderStyle;
      expect(colorShaderResult.color).assertEqual('#FF0000FF');
      console.info('[textAreaShaderStyle_color_shader_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_PARAM_0100
     * @tc.desc   Test TextArea shaderStyle property with null value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_null_0100] START');

      let strJsonDefault: string = getInspectorByKey('textarea_shaderStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonNull: string = getInspectorByKey('textarea_shaderStyle_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);

      let shaderStyleNull: ESObject = objNull.$attrs.shaderStyle;
      let shaderStyleDefault: ESObject = objDefault.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_null_0100] shaderStyleNull: ' + JSON.stringify(shaderStyleNull));
      console.info('[textAreaShaderStyle_null_0100] shaderStyleDefault: ' + JSON.stringify(shaderStyleDefault));

      expect(shaderStyleNull).not().assertUndefined();
      expect(shaderStyleDefault).not().assertUndefined();
      expect(JSON.stringify(shaderStyleNull)).assertEqual(JSON.stringify(shaderStyleDefault));
      console.info('[textAreaShaderStyle_null_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test TextArea shaderStyle property with undefined value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_undefined_0100] START');

      let strJsonDefault: string = getInspectorByKey('textarea_shaderStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonUndefined: string = getInspectorByKey('textarea_shaderStyle_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);

      let shaderStyleUndefined: ESObject = objUndefined.$attrs.shaderStyle;
      let shaderStyleDefault: ESObject = objDefault.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_undefined_0100] shaderStyleUndefined: ' + JSON.stringify(shaderStyleUndefined));
      console.info('[textAreaShaderStyle_undefined_0100] shaderStyleDefault: ' + JSON.stringify(shaderStyleDefault));

      expect(shaderStyleUndefined).not().assertUndefined();
      expect(shaderStyleDefault).not().assertUndefined();
      expect(JSON.stringify(shaderStyleUndefined)).assertEqual(JSON.stringify(shaderStyleDefault));
      console.info('[textAreaShaderStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test TextArea shaderStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_default_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_default_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: string = obj.$attrs.shaderStyle as string;
      console.info('[textAreaShaderStyle_default_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      expect(JSON.stringify(shaderStyle)).assertEqual('{}');
      console.info('[textAreaShaderStyle_default_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_modifier_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0100
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_linear_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_modifier_linear_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let linearGradientStyle: LinearGradientOptions = shaderStyle as LinearGradientOptions;
      expect(linearGradientStyle.angle).assertEqual('45.00px');
      expect(JSON.stringify(linearGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
      console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_modifier_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0300
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_radial_gradient_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_modifier_radial_gradient');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let radialGradientStyle: RadialGradientOptions = shaderStyle as RadialGradientOptions;
      expect(JSON.stringify(radialGradientStyle.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(radialGradientStyle.radius).assertEqual('0.50vp');
      expect(JSON.stringify(radialGradientStyle.colors)).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
      console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] END');
    })

    /**
     * @tc.name   textAreaShaderStyle_modifier_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0200
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_color_shader_0100', Level.LEVEL2, async () => {
      console.info('[textAreaShaderStyle_modifier_color_shader_0100] START');

      let strJson: string = getInspectorByKey('textarea_shaderStyle_modifier_color_shader');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let shaderStyle: ESObject = obj.$attrs.shaderStyle;
      console.info('[textAreaShaderStyle_modifier_color_shader_0100] shaderStyle: ' + JSON.stringify(shaderStyle));

      expect(shaderStyle).not().assertUndefined();
      let colorShaderResult: ColorShaderStyle = shaderStyle as ColorShaderStyle;
      expect(colorShaderResult.color).assertEqual('#FF0000FF');
      console.info('[textAreaShaderStyle_modifier_color_shader_0100] END');
    })
  })
}