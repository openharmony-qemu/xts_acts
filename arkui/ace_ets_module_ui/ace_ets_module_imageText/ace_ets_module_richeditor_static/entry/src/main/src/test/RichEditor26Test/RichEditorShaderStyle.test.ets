'use static'
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME: number = 1000;

export default function RichEditorShaderStyleTest() {
  describe('RichEditorShaderStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorShaderStyleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('RichEditorShaderStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorShaderStyle',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('RichEditorShaderStyleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorShaderStyle') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorShaderStyleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(() => {
      console.info('RichEditorShaderStyleTest afterEach');
    });

    afterAll(() => {
      console.info('RichEditorShaderStyleTest afterAll');
    });

    /**
     * @tc.name   richEditorShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test RichEditor shaderStyle property with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorShaderStyle_linear_gradient_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_linear_gradient_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_shaderStyle_linear_gradient'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let angleStrJson: string = inspector.getInspectorByKey('text_shaderStyle_linear_gradient_angle');
        expect(angleStrJson.length > 0).assertTrue();
        let angleContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(angleStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_linear_gradient_0100] angleContent: ' + angleContent);
        expect(angleContent.includes('45')).assertTrue();

        let dirStrJson: string = inspector.getInspectorByKey('text_shaderStyle_linear_gradient_direction');
        expect(dirStrJson.length > 0).assertTrue();
        let dirContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(dirStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_linear_gradient_0100] dirContent: ' + dirContent);
        expect(dirContent.includes('8')).assertTrue();

        let colorsStrJson: string = inspector.getInspectorByKey('text_shaderStyle_linear_gradient_colors');
        expect(colorsStrJson.length > 0).assertTrue();
        let colorsContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(colorsStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_linear_gradient_0100] colorsContent: ' + colorsContent);
        expect(colorsContent.includes('#FFFF0000')).assertTrue();
        expect(colorsContent.includes('#FF0000FF')).assertTrue();

        console.info('[richEditorShaderStyle_linear_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorShaderStyle_linear_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test RichEditor shaderStyle property with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorShaderStyle_radial_gradient_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_radial_gradient_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_shaderStyle_radial_gradient'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let centerStrJson: string = inspector.getInspectorByKey('text_shaderStyle_radial_gradient_center');
        expect(centerStrJson.length > 0).assertTrue();
        let centerContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(centerStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_radial_gradient_0100] centerContent: ' + centerContent);
        expect(centerContent.includes('0.5')).assertTrue();

        let radiusStrJson: string = inspector.getInspectorByKey('text_shaderStyle_radial_gradient_radius');
        expect(radiusStrJson.length > 0).assertTrue();
        let radiusContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(radiusStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_radial_gradient_0100] radiusContent: ' + radiusContent);
        expect(radiusContent.includes('0.5')).assertTrue();

        let colorsStrJson: string = inspector.getInspectorByKey('text_shaderStyle_radial_gradient_colors');
        expect(colorsStrJson.length > 0).assertTrue();
        let colorsContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(colorsStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_radial_gradient_0100] colorsContent: ' + colorsContent);
        expect(colorsContent.includes('#FFFF0000')).assertTrue();
        expect(colorsContent.includes('#FF008000')).assertTrue();

        console.info('[richEditorShaderStyle_radial_gradient_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorShaderStyle_radial_gradient_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test RichEditor shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorShaderStyle_color_shader_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_color_shader_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_shaderStyle_color_shader'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let colorStrJson: string = inspector.getInspectorByKey('text_shaderStyle_color_shader_color');
        expect(colorStrJson.length > 0).assertTrue();
        let colorContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(colorStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_color_shader_0100] colorContent: ' + colorContent);
        expect(colorContent.includes('#FFFFC0CB')).assertTrue();

        console.info('[richEditorShaderStyle_color_shader_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorShaderStyle_color_shader_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor shaderStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorShaderStyle_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_undefined_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnUndefined = await driver.findComponent(ON.id('btn_shaderStyle_undefined'));
        expect(btnUndefined).not().assertUndefined();
        await btnUndefined.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnDefault = await driver.findComponent(ON.id('btn_shaderStyle_default'));
        expect(btnDefault).not().assertUndefined();
        await btnDefault.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let undefinedStrJson: string = inspector.getInspectorByKey('text_shaderStyle_undefined_result');
        expect(undefinedStrJson.length > 0).assertTrue();
        let undefinedContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(undefinedStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_undefined_0100] undefinedContent: ' + undefinedContent);

        let defaultStrJson: string = inspector.getInspectorByKey('text_shaderStyle_default_result');
        expect(defaultStrJson.length > 0).assertTrue();
        let defaultContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(defaultStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_undefined_0100] defaultContent: ' + defaultContent);

        expect(undefinedContent).assertEqual(defaultContent);

        console.info('[richEditorShaderStyle_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorShaderStyle_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorShaderStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor shaderStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorShaderStyle_default_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_default_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_shaderStyle_default'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let defaultStrJson: string = inspector.getInspectorByKey('text_shaderStyle_default_result');
        expect(defaultStrJson.length > 0).assertTrue();
        let defaultContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(defaultStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorShaderStyle_default_0100] defaultContent: ' + defaultContent);
        expect(defaultContent.includes('undefined')).assertTrue();

        console.info('[richEditorShaderStyle_default_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorShaderStyle_default_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}