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

import { describe, it, expect, Level, beforeAll, beforeEach  } from '@ohos/hypium-binary/src/main/indexStatic';
import {
  ParagraphStyle,
  StyledStringKey,
  SpanStyle,
  StyledString,
  LinearGradientOptions,
  LinearGradientStyle,
  RadialGradientOptions,
  RadialGradientStyle,
  ColorShaderStyle,
  Color
} from '@kit.ArkUI';

import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';

export default function StyledStringShaderStyleTest() {
  describe('StyledStringShaderStyleTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("StyledStringShaderStyleTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("StyledStringShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("StyledStringShaderStyleTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "StyledStringIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push StyledStringShaderStyleTest page error:" + err);
        expect().assertFail();
      }
      console.info("StyledStringShaderStyleTest beforeEach end");
    });
    /**
     * @tc.name   styledStringShaderStyle_linear_gradient_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SHADERSTYLE_TYPE_0100
     * @tc.desc   Test StyledString shaderStyle property with LinearGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringShaderStyle_linear_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringShaderStyle_linear_gradient_0100] START');
      let linearGradientOptions: LinearGradientOptions = {
        angle: 45,
        colors: [[Color.Red, 0.0], [Color.Blue, 1.0]]
      };
      let linearGradientStyle = new LinearGradientStyle(linearGradientOptions);
      let paragraphStyle = new ParagraphStyle({ shaderStyle: linearGradientStyle });
      let styledString = new StyledString('Test', [{
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringShaderStyle_linear_gradient_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paragraphStyleResult: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      if (paragraphStyleResult.shaderStyle != undefined) {
        let linearGradientStyleResult: LinearGradientStyle = paragraphStyleResult.shaderStyle as LinearGradientStyle;
        console.info('[styledStringShaderStyle_linear_gradient_0100] shaderStyle: ' + JSON.stringify(linearGradientStyleResult.options));
        let options: LinearGradientOptions = linearGradientStyleResult.options;
        if (options != undefined) {
          expect(options.angle).assertEqual('45.000000');
          expect(options.colors.length).assertEqual(2);
          expect(JSON.stringify(options.colors)).assertEqual('[["#FFFF0000",0],["#FF0000FF",1]]');
        } else {
          console.log('[styledStringShaderStyle_linear_gradient_0100] options is undefined');
          expect().assertFail();
        }
      } else {
        console.log('[styledStringShaderStyle_linear_gradient_0100] shaderStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringShaderStyle_linear_gradient_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringShaderStyle_radial_gradient_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SHADERSTYLE_TYPE_0200
     * @tc.desc   Test StyledString shaderStyle property with RadialGradientOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringShaderStyle_radial_gradient_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringShaderStyle_radial_gradient_0100] START');
      let radialGradientOptions: RadialGradientOptions = {
        center: [0.5, 0.5],
        radius: 0.5,
        colors: [[Color.Red, 0.0], [Color.Green, 1.0]]
      };
      let radialGradientStyle = new RadialGradientStyle(radialGradientOptions);
      let paragraphStyle = new ParagraphStyle({ shaderStyle: radialGradientStyle });
      let styledString = new StyledString('Test', [{
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringShaderStyle_radial_gradient_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paragraphStyleResult: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      if (paragraphStyleResult.shaderStyle != undefined) {
        let radialGradientStyleResult: RadialGradientStyle = paragraphStyleResult.shaderStyle as RadialGradientStyle;
        console.info('[styledStringShaderStyle_radial_gradient_0100] shaderStyle: ' + JSON.stringify(radialGradientStyleResult.options));
        let options: RadialGradientOptions = radialGradientStyleResult.options;
        if (options != undefined) {
          expect(JSON.stringify(options.center)).assertEqual('["0.50vp","0.50vp"]');
          expect(options.radius).assertEqual('0.50vp');
          expect(options.colors.length).assertEqual(2);
          expect(JSON.stringify(options.colors)).assertEqual('[["#FFFF0000",0],["#FF008000",1]]');
        } else {
          console.log('[styledStringShaderStyle_radial_gradient_0100] options is undefined');
          expect().assertFail();
        }
      } else {
        console.log('[styledStringShaderStyle_radial_gradient_0100] shaderStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringShaderStyle_radial_gradient_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringShaderStyle_color_shader_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SHADERSTYLE_TYPE_0300
     * @tc.desc   Test StyledString shaderStyle property with ColorShaderStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringShaderStyle_color_shader_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringShaderStyle_color_shader_0100] START');
      let colorShaderStyle = new ColorShaderStyle(Color.Pink);
      let paragraphStyle = new ParagraphStyle({ shaderStyle: colorShaderStyle });
      let styledString = new StyledString('Test', [{
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringShaderStyle_color_shader_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paragraphStyleResult: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      if (paragraphStyleResult.shaderStyle != undefined) {
        let colorShaderResult: ColorShaderStyle = paragraphStyleResult.shaderStyle as ColorShaderStyle;
        console.info('[styledStringShaderStyle_color_shader_0100] shaderStyle: ' + JSON.stringify(colorShaderResult.color));
        if (colorShaderResult.color != undefined) {
          expect(colorShaderResult.color).assertEqual('#FFFFC0CB');
        } else {
          console.log('[styledStringShaderStyle_color_shader_0100] color is undefined');
          expect().assertFail();
        }
      } else {
        console.log('[styledStringShaderStyle_color_shader_0100] shaderStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringShaderStyle_color_shader_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringShaderStyle_undefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SHADERSTYLE_PARAM_0200
     * @tc.desc   Test StyledString shaderStyle property with undefined value, should not be set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringShaderStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringShaderStyle_undefined_0100] START');
      let paragraphStyle = new ParagraphStyle({ shaderStyle: undefined });
      let styledString = new StyledString('Test', [{
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringShaderStyle_undefined_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paragraphStyleResult: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      expect(JSON.stringify(paragraphStyleResult.shaderStyle)).assertEqual('undefined');
      console.info('[styledStringShaderStyle_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringShaderStyle_default_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_SHADERSTYLE_DEFAULT_0100
     * @tc.desc   Test StyledString shaderStyle property without setting, should be undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringShaderStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringShaderStyle_default_0100] START');
      let paragraphStyle = new ParagraphStyle({});
      let styledString = new StyledString('Test', [{
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringShaderStyle_default_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paragraphStyleResult: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      expect(JSON.stringify(paragraphStyleResult.shaderStyle)).assertEqual('undefined');
      console.info('[styledStringShaderStyle_default_0100] END');
      done();
    })
  })
}