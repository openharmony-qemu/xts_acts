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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME: int = 1000;

export default function TextInputShaderStyleTest() {
  describe('TextInputShaderStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextInputShaderStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textInput.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi26/TextInputShaderStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputShaderStyle state pages: " + JSON.stringify(pages));
        if (!("TextInputShaderStyle" == pages.name)) {
          console.info("get TextInputShaderStyle state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputShaderStyle success");
        }
      } catch (err) {
        console.error("push TextInputShaderStyle page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(() => {
      console.info("TextInputShaderStyleTest afterEach case");
    });

    afterAll(async () => {
      console.info("TextInputShaderStyleTest afterAll case");
    });

    /**
     * @tc.name   textInputShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test TextInput shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_linear_gradient'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let angle = shaderStyleNode.getString('angle');
        expect(angle).assertEqual('45.00px');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
        console.info('[textInputShaderStyle_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_linear_gradient_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test TextInput shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_radial_gradient'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let centerStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('center'));
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');
        let radius = shaderStyleNode.getString('radius');
        expect(radius).assertEqual('0.50vp');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
        console.info('[textInputShaderStyle_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_radial_gradient_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test TextInput shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_color_shader'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let color = shaderStyleNode.getString('color');
        expect(color).assertEqual('#FF0000FF');
        console.info('[textInputShaderStyle_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_color_shader_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test TextInput shaderStyle property with undefined value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let undefinedNode = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_undefined'));
        let defaultNode = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_default'));
        let undefinedShaderStyleStr = JSON.stringifyJsonElement(undefinedNode.getElement('$attrs').getElement('shaderStyle'));
        let defaultShaderStyleStr = JSON.stringifyJsonElement(defaultNode.getElement('$attrs').getElement('shaderStyle'));
        expect(undefinedShaderStyleStr).assertEqual(defaultShaderStyleStr);
        console.info('[textInputShaderStyle_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_undefined_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test TextInput shaderStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_default_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_default'));
        let shaderStyleStr = JSON.stringifyJsonElement(node.getElement('$attrs').getElement('shaderStyle'));
        expect(shaderStyleStr).assertEqual('{}');
        console.info('[textInputShaderStyle_default_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_default_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_modifier_linear_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0100
     * @tc.desc   Test TextInput shaderStyle property set via AttributeUpdater with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_modifier_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_modifier_linear_gradient'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let angle = shaderStyleNode.getString('angle');
        expect(angle).assertEqual('45.00px');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');
        console.info('[textInputShaderStyle_modifier_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_modifier_linear_gradient_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_modifier_radial_gradient_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0300
     * @tc.desc   Test TextInput shaderStyle property set via AttributeUpdater with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_modifier_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_modifier_radial_gradient'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let centerStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('center'));
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');
        let radius = shaderStyleNode.getString('radius');
        expect(radius).assertEqual('0.50vp');
        let colorsStr = JSON.stringifyJsonElement(shaderStyleNode.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');
        console.info('[textInputShaderStyle_modifier_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_modifier_radial_gradient_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputShaderStyle_modifier_color_shader_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHADERSTYLE_MODIFIER_0200
     * @tc.desc   Test TextInput shaderStyle property set via AttributeUpdater with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShaderStyle_modifier_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputShaderStyle_modifier_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textinput_shaderStyle_modifier_color_shader'));
        let shaderStyleNode = node.getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleNode !== null).assertTrue();
        let color = shaderStyleNode.getString('color');
        expect(color).assertEqual('#FF0000FF');
        console.info('[textInputShaderStyle_modifier_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[textInputShaderStyle_modifier_color_shader_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}