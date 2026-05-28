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
  Scroll,
  TextInput,
  Color,
  TextInputAttribute
} from '@ohos.arkui.component';
import { AttributeUpdater } from '@ohos.arkui.modifier';
import {
  LinearGradientOptions,
  RadialGradientOptions,
  ColorShaderStyle,
  LinearGradientStyle,
  RadialGradientStyle
} from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

class TextInputShaderStyleUpdater extends AttributeUpdater<TextInputAttribute> {
  public shaderStyleValue:ShaderStyle | undefined;

  constructor(value: ShaderStyle | undefined) {
    this.shaderStyleValue = value;
  }

  initializeModifier(instance: TextInputAttribute): void {
    instance.shaderStyle(this.shaderStyleValue);
  }
}

@Entry
@Component
struct TextInputShaderStyle {
  private linearGradientOptions: LinearGradientOptions = {
    angle: 45,
    colors: [[Color.Red, 0.0], [Color.Blue, 1.0]]
  };

  private radialGradientOptions: RadialGradientOptions = {
    center: [0.5, 0.5],
    radius: 0.5,
    colors: [[Color.Red, 0.0], [Color.Green, 1.0]]
  };

  private modifierLinearGradient: TextInputShaderStyleUpdater =
    new TextInputShaderStyleUpdater(new LinearGradientStyle(this.linearGradientOptions));
  private modifierRadialGradient: TextInputShaderStyleUpdater =
    new TextInputShaderStyleUpdater(new RadialGradientStyle(this.radialGradientOptions));
  private modifierColorShader: TextInputShaderStyleUpdater =
    new TextInputShaderStyleUpdater(new ColorShaderStyle(Color.Blue));

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextInputShaderStyle error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        TextInput({ placeholder: 'TextInput shaderStyle LinearGradient' })
          .key('textinput_shaderStyle_linear_gradient')
          .height('5%')
          .width('100%')
          .shaderStyle(this.linearGradientOptions)

        TextInput({ placeholder: 'TextInput shaderStyle RadialGradient' })
          .key('textinput_shaderStyle_radial_gradient')
          .height('5%')
          .width('100%')
          .shaderStyle(this.radialGradientOptions)

        TextInput({ placeholder: 'TextInput shaderStyle ColorShader' })
          .key('textinput_shaderStyle_color_shader')
          .height('5%')
          .width('100%')
          .shaderStyle(new ColorShaderStyle(Color.Blue))

        TextInput({ placeholder: 'TextInput shaderStyle null' })
          .key('textinput_shaderStyle_null')
          .height('5%')
          .width('100%')
          .shaderStyle(null)

        TextInput({ placeholder: 'TextInput shaderStyle undefined' })
          .key('textinput_shaderStyle_undefined')
          .height('5%')
          .width('100%')
          .shaderStyle(undefined)

        TextInput({ placeholder: 'TextInput shaderStyle default' })
          .key('textinput_shaderStyle_default')
          .height('5%')
          .width('100%')

        TextInput({ placeholder: 'TextInput shaderStyle modifier LinearGradient' })
          .key('textinput_shaderStyle_modifier_linear_gradient')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierLinearGradient)

        TextInput({ placeholder: 'TextInput shaderStyle modifier RadialGradient' })
          .key('textinput_shaderStyle_modifier_radial_gradient')
          .height('5%')
          .width('100%')
          .attributeModifier(this.modifierRadialGradient)

        TextInput({ placeholder: 'TextInput shaderStyle modifier ColorShader' })
          .key('textinput_shaderStyle_modifier_color_shader')
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