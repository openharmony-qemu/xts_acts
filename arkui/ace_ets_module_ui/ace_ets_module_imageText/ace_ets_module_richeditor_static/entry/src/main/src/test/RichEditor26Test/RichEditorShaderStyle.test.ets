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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  LinearGradientOptions,
  RadialGradientOptions,
} from '@ohos.arkui.component';

const SLEEP_TIME: number = 1000;

export default function RichEditorShaderStyleTest() {
  describe('RichEditorShaderStyleTest', () => {
    let driver: Driver;
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
    afterAll(() => {
      AppStorage.delete('shaderStyle_linear_gradient');
      AppStorage.delete('shaderStyle_radial_gradient');
      AppStorage.delete('shaderStyle_color_shader');
      AppStorage.delete('shaderStyle_default');
      AppStorage.delete('shaderStyle_undefined');
      console.info('RichEditorShaderStyleTest afterAll');
    });

    /**
     * @tc.name   richEditorShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test RichEditor shaderStyle property with LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_linear_gradient_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_linear_gradient'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);

      let shaderStyle: LinearGradientOptions | undefined = AppStorage.get<LinearGradientOptions>('shaderStyle_linear_gradient');
      console.info('[richEditorShaderStyle_linear_gradient_0100] shaderStyle: ' + shaderStyle);

      expect(shaderStyle?.angle).assertEqual('45.000000');
      expect(JSON.stringify(shaderStyle?.colors)).assertEqual('[["#FFFF0000",0],["#FF0000FF",1]]');
      console.info('[richEditorShaderStyle_linear_gradient_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test RichEditor shaderStyle property with RadialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_radial_gradient_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_radial_gradient'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);

      let shaderStyle: RadialGradientOptions | undefined = AppStorage.get<RadialGradientOptions>('shaderStyle_radial_gradient');
      console.info('[richEditorShaderStyle_radial_gradient_0100] shaderStyle: ' + shaderStyle);

      expect(JSON.stringify(shaderStyle?.center)).assertEqual('["0.50vp","0.50vp"]');
      expect(shaderStyle?.radius).assertEqual('0.50vp');
      expect(JSON.stringify(shaderStyle?.colors)).assertEqual('[["#FFFF0000",0],["#FF008000",1]]');
      console.info('[richEditorShaderStyle_radial_gradient_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test RichEditor shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_color_shader_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_color_shader'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('shaderStyle_color_shader')).assertEqual('#FFFFC0CB');
      console.info('[richEditorShaderStyle_color_shader_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor shaderStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_undefined_0100] START');
      driver = Driver.create();
      let btnUndefined = await driver.findComponent(ON.id('btn_shaderStyle_undefined'));
      expect(btnUndefined).not().assertUndefined();
      await (btnUndefined?.click()as Promise<void>);
      await CommonFunc.sleep(500);

      let btnDefault = await driver.findComponent(ON.id('btn_shaderStyle_default'));
      expect(btnDefault).not().assertUndefined();
      await (btnDefault?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('shaderStyle_undefined')).assertEqual(AppStorage.get<string>('shaderStyle_default'));
      console.info('[richEditorShaderStyle_undefined_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorShaderStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor shaderStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorShaderStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorShaderStyle_default_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_shaderStyle_default'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('shaderStyle_default')).assertEqual('undefined');
      console.info('[richEditorShaderStyle_default_0100] END');
      done();
    });
  });
}