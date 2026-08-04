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

class TextInputShaderStyleModifier implements AttributeModifier<TextInputAttribute> {
  public shaderStyleValue: ShaderStyle | undefined;

  constructor(value: ShaderStyle | undefined) {
    this.shaderStyleValue = value;
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.shaderStyle(this.shaderStyleValue);
  }
}

@Entry
@Component
struct TextInputShaderStyle {
  linearGradientOptions: LinearGradientOptions = {
    angle: 45,
    colors: [[Color.Red, 0.0], [Color.Blue, 1.0]]
  };

  radialGradientOptions: RadialGradientOptions = {
    center: [0.5, 0.5],
    radius: 0.5,
    colors: [[Color.Red, 0.0], [Color.Green, 1.0]]
  };

  colorShaderStyle: ColorShaderStyle = {
    color: Color.Blue
  };

  modifierLinearGradient: TextInputShaderStyleModifier =
    new TextInputShaderStyleModifier(new LinearGradientStyle(this.linearGradientOptions));
  modifierRadialGradient: TextInputShaderStyleModifier =
    new TextInputShaderStyleModifier(new RadialGradientStyle(this.radialGradientOptions));
  modifierColorShader: TextInputShaderStyleModifier =
    new TextInputShaderStyleModifier(new ColorShaderStyle(Color.Blue));

  build() {
    Column({ space: 5 }) {
      TextInput({ placeholder: 'TextInput shaderStyle LinearGradient' })
        .id('textinput_shaderStyle_linear_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.linearGradientOptions)

      TextInput({ placeholder: 'TextInput shaderStyle RadialGradient' })
        .id('textinput_shaderStyle_radial_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.radialGradientOptions)

      TextInput({ placeholder: 'TextInput shaderStyle ColorShader' })
        .id('textinput_shaderStyle_color_shader')
        .height('5%')
        .width('100%')
        .shaderStyle(this.colorShaderStyle)

      TextInput({ placeholder: 'TextInput shaderStyle null' })
        .id('textinput_shaderStyle_null')
        .height('5%')
        .width('100%')
        .shaderStyle(null)

      TextInput({ placeholder: 'TextInput shaderStyle undefined' })
        .id('textinput_shaderStyle_undefined')
        .height('5%')
        .width('100%')
        .shaderStyle(undefined)

      TextInput({ placeholder: 'TextInput shaderStyle default' })
        .id('textinput_shaderStyle_default')
        .height('5%')
        .width('100%')

      TextInput({ placeholder: 'TextInput shaderStyle modifier LinearGradient' })
        .id('textinput_shaderStyle_modifier_linear_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierLinearGradient)

      TextInput({ placeholder: 'TextInput shaderStyle modifier RadialGradient' })
        .id('textinput_shaderStyle_modifier_radial_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierRadialGradient)

      TextInput({ placeholder: 'TextInput shaderStyle modifier ColorShader' })
        .id('textinput_shaderStyle_modifier_color_shader')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierColorShader)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}