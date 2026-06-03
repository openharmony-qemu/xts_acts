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

import {
  Entry,
  Component,
  Column,
  Scroll,
  TextArea,
  Color,
  AttributeModifier,
  TextAreaAttribute,
  LinearGradientOptions,
  RadialGradientOptions,
  ColorShaderStyle,
  ShaderStyle,
  LinearGradientStyle,
  RadialGradientStyle
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

class TextAreaShaderStyleModifier implements AttributeModifier<TextAreaAttribute> {
  public shaderStyleValue: ShaderStyle | undefined;

  constructor(value: ShaderStyle | undefined) {
    this.shaderStyleValue = value;
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.shaderStyle(this.shaderStyleValue);
  }
}

@Entry
@Component
struct TextAreaShaderStyle {
  private linearGradientOptions: LinearGradientOptions = {
    angle: 45,
    colors: [[Color.Red, 0.0], [Color.Blue, 1.0]]
  };

  private radialGradientOptions: RadialGradientOptions = {
    center: [0.5, 0.5],
    radius: 0.5,
    colors: [[Color.Red, 0.0], [Color.Green, 1.0]]
  };

  linearGradientStyle1:LinearGradientStyle = new LinearGradientStyle(this.linearGradientOptions)

  radialGradientStyle1:RadialGradientStyle = new RadialGradientStyle(this.radialGradientOptions)

  colorShaderStyle:ColorShaderStyle = new ColorShaderStyle(Color.Blue);

  modifierLinearGradient: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new LinearGradientStyle(this.linearGradientOptions));
  modifierRadialGradient: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new RadialGradientStyle(this.radialGradientOptions));
  modifierColorShader: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new ColorShaderStyle(Color.Blue));

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextAreaShaderStyle error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        TextArea({ text: 'TextArea shaderStyle LinearGradient' })
          .key('textarea_shaderStyle_linear_gradient')
          .height('5%')
          .width('100%')
          .shaderStyle(this.linearGradientStyle1)

        TextArea({ text: 'TextArea shaderStyle RadialGradient' })
          .key('textarea_shaderStyle_radial_gradient')
          .height('5%')
          .width('100%')
          .shaderStyle(this.radialGradientStyle1)

        TextArea({ text: 'TextArea shaderStyle ColorShader' })
          .key('textarea_shaderStyle_color_shader')
          .height('5%')
          .width('100%')
          .shaderStyle(this.colorShaderStyle)

        TextArea({ text: 'TextArea shaderStyle undefined' })
          .key('textarea_shaderStyle_undefined')
          .height('5%')
          .width('100%')
          .shaderStyle(undefined)

        TextArea({ text: 'TextArea shaderStyle default' })
          .key('textarea_shaderStyle_default')
          .height('5%')
          .width('100%')

        TextArea({ text: 'TextArea shaderStyle modifier LinearGradient' })
          .key('textarea_shaderStyle_modifier_linear_gradient')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierLinearGradient)

        TextArea({ text: 'TextArea shaderStyle modifier RadialGradient' })
          .key('textarea_shaderStyle_modifier_radial_gradient')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierRadialGradient)

        TextArea({ text: 'TextArea shaderStyle modifier ColorShader' })
          .key('textarea_shaderStyle_modifier_color_shader')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierColorShader)
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}