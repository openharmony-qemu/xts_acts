'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME: int = 1000;

export default function TextAreaShaderStyleTest() {
  describe('TextAreaShaderStyleTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TextAreaShaderStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textArea.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi26/TextAreaShaderStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextAreaShaderStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaShaderStyle" == pages.name)) {
          console.info("TextAreaShaderStyleTest push page");
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("TextAreaShaderStyleTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("TextAreaShaderStyleTest afterEach called");
    });

    afterAll(async () => {
      console.info("TextAreaShaderStyleTest afterAll called");
    });

    /**
     * @tc.name   textAreaShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test TextArea shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_linear_gradient');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let angle = shaderStyleEl.getString('angle');
        console.info('[textAreaShaderStyle_linear_gradient_0100] angle: ' + angle);
        expect(angle).assertEqual('45.00px');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('colors'));
        console.info('[textAreaShaderStyle_linear_gradient_0100] colors: ' + colorsStr);
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
        console.info('[textAreaShaderStyle_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_linear_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test TextArea shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_radial_gradient');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let centerStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('center'));
        console.info('[textAreaShaderStyle_radial_gradient_0100] center: ' + centerStr);
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');
        let radius = shaderStyleEl.getString('radius');
        console.info('[textAreaShaderStyle_radial_gradient_0100] radius: ' + radius);
        expect(radius).assertEqual('0.50vp');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('colors'));
        console.info('[textAreaShaderStyle_radial_gradient_0100] colors: ' + colorsStr);
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
        console.info('[textAreaShaderStyle_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_radial_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test TextArea shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_color_shader');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let color = shaderStyleEl.getString('color');
        console.info('[textAreaShaderStyle_color_shader_0100] color: ' + color);
        expect(color).assertEqual('#FF0000FF');
        console.info('[textAreaShaderStyle_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_color_shader_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test TextArea shaderStyle property with undefined value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonDefault: string = inspector.getInspectorByKey('textarea_shaderStyle_default');
        let nodeDefault = JSON.parseJsonElement(strJsonDefault);
        let attrsDefault = nodeDefault.getElement('$attrs');
        let strJsonUndefined: string = inspector.getInspectorByKey('textarea_shaderStyle_undefined');
        let nodeUndefined = JSON.parseJsonElement(strJsonUndefined);
        let attrsUndefined = nodeUndefined.getElement('$attrs');

        let shaderStyleDefaultEl = attrsDefault.getElement('shaderStyle');
        let shaderStyleUndefinedEl = attrsUndefined.getElement('shaderStyle');
        expect(shaderStyleUndefinedEl != null).assertTrue();
        expect(shaderStyleDefaultEl != null).assertTrue();
        let shaderStyleUndefinedStr = JSON.stringifyJsonElement(shaderStyleUndefinedEl);
        let shaderStyleDefaultStr = JSON.stringifyJsonElement(shaderStyleDefaultEl);
        console.info('[textAreaShaderStyle_undefined_0100] shaderStyleUndefined: ' + shaderStyleUndefinedStr);
        console.info('[textAreaShaderStyle_undefined_0100] shaderStyleDefault: ' + shaderStyleDefaultStr);
        expect(shaderStyleUndefinedStr).assertEqual(shaderStyleDefaultStr);
        console.info('[textAreaShaderStyle_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test TextArea shaderStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_default_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_default');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleDefaultEl = attrs.getElement('shaderStyle');
        expect(shaderStyleDefaultEl != null).assertTrue();
        let shaderStyleDefaultStr = JSON.stringifyJsonElement(shaderStyleDefaultEl);
        console.info('[textAreaShaderStyle_default_0100] shaderStyle: ' + shaderStyleDefaultStr);
        expect(shaderStyleDefaultStr).assertEqual('{}');
        console.info('[textAreaShaderStyle_default_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_default_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_modifier_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0100
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_modifier_linear_gradient');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let angle = shaderStyleEl.getString('angle');
        console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] angle: ' + angle);
        expect(angle).assertEqual('45.00px');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('colors'));
        console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] colors: ' + colorsStr);
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
        console.info('[textAreaShaderStyle_modifier_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_modifier_linear_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_modifier_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0300
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_modifier_radial_gradient');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let centerStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('center'));
        console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] center: ' + centerStr);
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');
        let radius = shaderStyleEl.getString('radius');
        console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] radius: ' + radius);
        expect(radius).assertEqual('0.50vp');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleEl.getElement('colors'));
        console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] colors: ' + colorsStr);
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
        console.info('[textAreaShaderStyle_modifier_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_modifier_radial_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textAreaShaderStyle_modifier_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHADERSTYLE_MODIFIER_0200
     * @tc.desc   Test TextArea shaderStyle property set via AttributeModifier with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaShaderStyle_modifier_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaShaderStyle_modifier_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('textarea_shaderStyle_modifier_color_shader');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let shaderStyleEl = attrs.getElement('shaderStyle');
        expect(shaderStyleEl != null).assertTrue();
        let color = shaderStyleEl.getString('color');
        console.info('[textAreaShaderStyle_modifier_color_shader_0100] color: ' + color);
        expect(color).assertEqual('#FF0000FF');
        console.info('[textAreaShaderStyle_modifier_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[textAreaShaderStyle_modifier_color_shader_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}