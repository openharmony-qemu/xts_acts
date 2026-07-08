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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function SearchShaderStyleTest() {
  describe('SearchShaderStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SearchShaderStyleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.search.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('SearchShaderStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi26/SearchShaderStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SearchShaderStyleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SearchShaderStyle') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error('SearchShaderStyleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SearchShaderStyleTest afterEach');
    });

    afterAll(async (): Promise<void> => {
      console.info('SearchShaderStyleTest afterAll');
    });

    /**
     * @tc.name   searchShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test Search shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_linear_gradient');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let angleStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('angle'));
        expect(angleStr).assertEqual('"45.00px"');

        let colorsStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');

        console.info('[searchShaderStyle_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_linear_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test Search shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_radial_gradient');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let centerStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('center'));
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');

        let radiusStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('radius'));
        expect(radiusStr).assertEqual('"0.50vp"');

        let colorsStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');

        console.info('[searchShaderStyle_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_radial_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test Search shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_color_shader');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let colorStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('color'));
        expect(colorStr).assertEqual('"#FF0000FF"');

        console.info('[searchShaderStyle_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_color_shader_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test Search shaderStyle property with undefined value, should default to no gradient
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonDefault: string = inspector.getInspectorByKey('search_shaderStyle_default');
        let strJsonUndefined: string = inspector.getInspectorByKey('search_shaderStyle_undefined');

        let shaderStyleDefaultStr = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getElement('shaderStyle')
        );
        let shaderStyleUndefinedStr = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJsonUndefined).getElement('$attrs').getElement('shaderStyle')
        );
        expect(shaderStyleUndefinedStr).assertEqual(shaderStyleDefaultStr);

        console.info('[searchShaderStyle_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_default_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test Search shaderStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_default_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_default');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleStr = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle')
        );
        expect(shaderStyleStr).assertEqual('{}');

        console.info('[searchShaderStyle_default_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_default_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_modifier_linear_gradient_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_MODIFIER_0100
     * @tc.desc   Test Search shaderStyle property set via AttributeModifier with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_modifier_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_modifier_linear_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_modifier_linear_gradient');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let angleStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('angle'));
        expect(angleStr).assertEqual('"45.00px"');

        let colorsStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF0000FF","1.000000"]]');

        console.info('[searchShaderStyle_modifier_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_modifier_linear_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_modifier_radial_gradient_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_MODIFIER_0300
     * @tc.desc   Test Search shaderStyle property set via AttributeModifier with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_modifier_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_modifier_radial_gradient_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_modifier_radial_gradient');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let centerStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('center'));
        expect(centerStr).assertEqual('["0.50vp","0.50vp"]');

        let radiusStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('radius'));
        expect(radiusStr).assertEqual('"0.50vp"');

        let colorsStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('colors'));
        expect(colorsStr).assertEqual('[["#FFFF0000","0.000000"],["#FF008000","1.000000"]]');

        console.info('[searchShaderStyle_modifier_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_modifier_radial_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   searchShaderStyle_modifier_color_shader_0100
     * @tc.number SUB_ARKUI_SEARCH_SHADERSTYLE_MODIFIER_0200
     * @tc.desc   Test Search shaderStyle property set via AttributeModifier with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchShaderStyle_modifier_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchShaderStyle_modifier_color_shader_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson: string = inspector.getInspectorByKey('search_shaderStyle_modifier_color_shader');
        expect(strJson.length > 0).assertTrue();

        let shaderStyleElement = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shaderStyle');
        expect(shaderStyleElement != null).assertTrue();

        let colorStr = JSON.stringifyJsonElement(shaderStyleElement.getElement('color'));
        expect(colorStr).assertEqual('"#FF0000FF"');

        console.info('[searchShaderStyle_modifier_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[searchShaderStyle_modifier_color_shader_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}