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

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Scroll,
  RichEditor,
  RichEditorController,
  RichEditorOptions,
  RichEditorTextSpanResult,
  RichEditorImageSpanResult,
  LinearGradientStyle,
  RadialGradientStyle,
  ColorShaderStyle,
  LinearGradientOptions,
  RadialGradientOptions,
  Color,
  ShaderStyle
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

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

  @State linearGradientAngle: string = '';
  @State linearGradientDirection: string = '';
  @State linearGradientColors: string = '';
  @State radialGradientCenter: string = '';
  @State radialGradientRadius: string = '';
  @State radialGradientColors: string = '';
  @State colorShaderColor: string = '';
  @State undefinedShaderStyleResult: string = '';
  @State defaultShaderStyleResult: string = '';

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
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.paragraphStyle) {
                let shaderStyle: ShaderStyle | undefined = spanResult.paragraphStyle?.shaderStyle;
                if (shaderStyle) {
                  let lgStyle: LinearGradientStyle = shaderStyle as LinearGradientStyle;
                  this.linearGradientAngle = String(lgStyle.options.angle);
                  this.linearGradientDirection = String(lgStyle.options.direction ?? '');
                  this.linearGradientColors = String(lgStyle.options.colors);
                } else {
                  this.linearGradientAngle = 'undefined';
                  this.linearGradientDirection = 'undefined';
                  this.linearGradientColors = 'undefined';
                }
              }
            }
          })

        Text(`linearGradientAngle=${this.linearGradientAngle}`)
          .id('text_shaderStyle_linear_gradient_angle')
          .height('5%')
          .width('100%')

        Text(`linearGradientDirection=${this.linearGradientDirection}`)
          .id('text_shaderStyle_linear_gradient_direction')
          .height('5%')
          .width('100%')

        Text(`linearGradientColors=${this.linearGradientColors}`)
          .id('text_shaderStyle_linear_gradient_colors')
          .height('5%')
          .width('100%')

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
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.paragraphStyle) {
                let shaderStyle: ShaderStyle | undefined = spanResult.paragraphStyle?.shaderStyle;
                if (shaderStyle) {
                  let rgStyle: RadialGradientStyle = shaderStyle as RadialGradientStyle;
                  this.radialGradientCenter = String(rgStyle.options.center);
                  this.radialGradientRadius = String(rgStyle.options.radius);
                  this.radialGradientColors = String(rgStyle.options.colors);
                } else {
                  this.radialGradientCenter = 'undefined';
                  this.radialGradientRadius = 'undefined';
                  this.radialGradientColors = 'undefined';
                }
              }
            }
          })

        Text(`radialGradientCenter=${this.radialGradientCenter}`)
          .id('text_shaderStyle_radial_gradient_center')
          .height('5%')
          .width('100%')

        Text(`radialGradientRadius=${this.radialGradientRadius}`)
          .id('text_shaderStyle_radial_gradient_radius')
          .height('5%')
          .width('100%')

        Text(`radialGradientColors=${this.radialGradientColors}`)
          .id('text_shaderStyle_radial_gradient_colors')
          .height('5%')
          .width('100%')

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
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.paragraphStyle) {
                let shaderStyle: ShaderStyle | undefined = spanResult.paragraphStyle?.shaderStyle;
                if (shaderStyle) {
                  let csStyle: ColorShaderStyle = shaderStyle as ColorShaderStyle;
                  this.colorShaderColor = String(csStyle.color);
                } else {
                  this.colorShaderColor = 'undefined';
                }
              }
            }
          })

        Text(`colorShaderColor=${this.colorShaderColor}`)
          .id('text_shaderStyle_color_shader_color')
          .height('5%')
          .width('100%')

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
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.paragraphStyle) {
                let shaderStyle: ShaderStyle | undefined = spanResult.paragraphStyle?.shaderStyle;
                if (shaderStyle) {
                  this.undefinedShaderStyleResult = String(shaderStyle);
                } else {
                  this.undefinedShaderStyleResult = 'undefined';
                }
              }
            }
          })

        Text(`undefinedShaderStyleResult=${this.undefinedShaderStyleResult}`)
          .id('text_shaderStyle_undefined_result')
          .height('5%')
          .width('100%')

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
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.paragraphStyle) {
                let shaderStyle: ShaderStyle | undefined = spanResult.paragraphStyle?.shaderStyle;
                if (shaderStyle) {
                  this.defaultShaderStyleResult = String(shaderStyle);
                } else {
                  this.defaultShaderStyleResult = 'undefined';
                }
              }
            }
          })

        Text(`defaultShaderStyleResult=${this.defaultShaderStyleResult}`)
          .id('text_shaderStyle_default_result')
          .height('5%')
          .width('100%')

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