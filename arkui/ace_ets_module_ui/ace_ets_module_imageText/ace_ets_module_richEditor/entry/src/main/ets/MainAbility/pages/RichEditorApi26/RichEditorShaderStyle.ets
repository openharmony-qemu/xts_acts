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
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct RichEditorShaderStyle {
  controllerLinearGradient: RichEditorController = new RichEditorController();
  optionsLinearGradient: RichEditorOptions = { controller: this.controllerLinearGradient };

  controllerRadialGradient: RichEditorController = new RichEditorController();
  optionsRadialGradient: RichEditorOptions = { controller: this.controllerRadialGradient };

  controllerColorShader: RichEditorController = new RichEditorController();
  optionsColorShader: RichEditorOptions = { controller: this.controllerColorShader };

  controllerUndefined: RichEditorController = new RichEditorController();
  optionsUndefined: RichEditorOptions = { controller: this.controllerUndefined };

  controllerDefault: RichEditorController = new RichEditorController();
  optionsDefault: RichEditorOptions = { controller: this.controllerDefault };

  linearGradientOptions: LinearGradientOptions = {
    angle: 45,
    colors: [[Color.Red, 0.0], [Color.Blue, 1.0]]
  };

  radialGradientOptions: RadialGradientOptions = {
    center: [0.5, 0.5],
    radius: 0.5,
    colors: [[Color.Red, 0.0], [Color.Green, 1.0]]
  };

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Button('Get LinearGradientStyle Value')
          .id('btn_shaderStyle_linear_gradient')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerLinearGradient.getSpans();
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).paragraphStyle) {
              let shaderStyle: ShaderStyle | undefined =
                (spans[0] as RichEditorTextSpanResult).paragraphStyle?.shaderStyle;

              if (shaderStyle) {
                let linearGradientOptions1 :LinearGradientStyle = shaderStyle as LinearGradientStyle
                console.log('shaderStyle_linear_gradient'+JSON.stringify(linearGradientOptions1.options))
                AppStorage.setOrCreate('shaderStyle_linear_gradient', linearGradientOptions1.options);
              } else {
                AppStorage.setOrCreate('shaderStyle_linear_gradient', 'undefined');
              }
            }
          })

        RichEditor(this.optionsLinearGradient)
          .id('richEditor_shaderStyle_linear_gradient')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            let linearGradientStyle = new LinearGradientStyle(this.linearGradientOptions);
            this.controllerLinearGradient.addTextSpan('test linear gradient', {
              paragraphStyle: {
                shaderStyle: linearGradientStyle
              }
            });
          })

        Button('Get RadialGradientStyle Value')
          .id('btn_shaderStyle_radial_gradient')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerRadialGradient.getSpans();
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).paragraphStyle) {
              let shaderStyle: ShaderStyle | undefined =
                (spans[0] as RichEditorTextSpanResult).paragraphStyle?.shaderStyle;
              if (shaderStyle) {
                let radialGradientOptions1 :RadialGradientStyle = shaderStyle as RadialGradientStyle
                console.log('shaderStyle_radial_gradient'+JSON.stringify(radialGradientOptions1.options))
                AppStorage.setOrCreate('shaderStyle_radial_gradient', radialGradientOptions1.options);
              } else {
                AppStorage.setOrCreate('shaderStyle_radial_gradient', 'undefined');
              }
            }
          })

        RichEditor(this.optionsRadialGradient)
          .id('richEditor_shaderStyle_radial_gradient')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            let radialGradientStyle = new RadialGradientStyle(this.radialGradientOptions);
            this.controllerRadialGradient.addTextSpan('test radial gradient', {
              paragraphStyle: {
                shaderStyle: radialGradientStyle
              }
            });
          })

        Button('Get ColorShaderStyle Value')
          .id('btn_shaderStyle_color_shader')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerColorShader.getSpans();
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).paragraphStyle) {
              let shaderStyle: ShaderStyle | undefined =
                (spans[0] as RichEditorTextSpanResult).paragraphStyle?.shaderStyle;
              if (shaderStyle) {
                let colorShaderOptions1 :ColorShaderStyle = shaderStyle as ColorShaderStyle
                console.log('shaderStyle_color_shader'+JSON.stringify(colorShaderOptions1.color))
                AppStorage.setOrCreate('shaderStyle_color_shader', colorShaderOptions1.color);
              } else {
                AppStorage.setOrCreate('shaderStyle_color_shader', 'undefined');
              }
            }
          })

        RichEditor(this.optionsColorShader)
          .id('richEditor_shaderStyle_color_shader')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            let colorShaderStyle = new ColorShaderStyle(Color.Pink);
            this.controllerColorShader.addTextSpan('test color shader', {
              paragraphStyle: {
                shaderStyle: colorShaderStyle
              }
            });
          })

        Button('Get UNDEFINED Value')
          .id('btn_shaderStyle_undefined')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerUndefined.getSpans();
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).paragraphStyle) {
              let shaderStyle: ShaderStyle | undefined =
                (spans[0] as RichEditorTextSpanResult).paragraphStyle?.shaderStyle;
              if (shaderStyle) {
                let shaderStyleType = shaderStyle.constructor.name;
                AppStorage.setOrCreate('shaderStyle_undefined', shaderStyleType);
              } else {
                AppStorage.setOrCreate('shaderStyle_undefined', 'undefined');
              }
            }
          })

        RichEditor(this.optionsUndefined)
          .id('richEditor_shaderStyle_undefined')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerUndefined.addTextSpan('test undefined', {
              paragraphStyle: {
                shaderStyle: undefined
              }
            });
          })

        Button('Get DEFAULT Value')
          .id('btn_shaderStyle_default')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerDefault.getSpans();
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).paragraphStyle) {
              let shaderStyle: ShaderStyle | undefined =
                (spans[0] as RichEditorTextSpanResult).paragraphStyle?.shaderStyle;
              if (shaderStyle) {
                let shaderStyleType = shaderStyle.constructor.name;
                AppStorage.setOrCreate('shaderStyle_default', shaderStyleType);
              } else {
                AppStorage.setOrCreate('shaderStyle_default', 'undefined');
              }
            }
          })

        RichEditor(this.optionsDefault)
          .id('richEditor_shaderStyle_default')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerDefault.addTextSpan('test default');
          })
      }
      .width('100%')
      .height('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}