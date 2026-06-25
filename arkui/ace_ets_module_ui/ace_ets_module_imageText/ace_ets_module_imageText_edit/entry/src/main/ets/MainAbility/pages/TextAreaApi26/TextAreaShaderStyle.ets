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

  modifierLinearGradient: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new LinearGradientStyle(this.linearGradientOptions));
  modifierRadialGradient: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new RadialGradientStyle(this.radialGradientOptions));
  modifierColorShader: TextAreaShaderStyleModifier =
    new TextAreaShaderStyleModifier(new ColorShaderStyle(Color.Blue));

  build() {
    Column({ space: 5 }) {
      TextArea({ placeholder: 'TextArea shaderStyle LinearGradient' })
        .id('textarea_shaderStyle_linear_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.linearGradientOptions)

      TextArea({ placeholder: 'TextArea shaderStyle RadialGradient' })
        .id('textarea_shaderStyle_radial_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.radialGradientOptions)

      TextArea({ placeholder: 'TextArea shaderStyle ColorShader' })
        .id('textarea_shaderStyle_color_shader')
        .height('5%')
        .width('100%')
        .shaderStyle(this.colorShaderStyle)

      TextArea({ placeholder: 'TextArea shaderStyle null' })
        .id('textarea_shaderStyle_null')
        .height('5%')
        .width('100%')
        .shaderStyle(null)

      TextArea({ placeholder: 'TextArea shaderStyle undefined' })
        .id('textarea_shaderStyle_undefined')
        .height('5%')
        .width('100%')
        .shaderStyle(undefined)

      TextArea({ placeholder: 'TextArea shaderStyle default' })
        .id('textarea_shaderStyle_default')
        .height('5%')
        .width('100%')

      TextArea({ placeholder: 'TextArea shaderStyle modifier LinearGradient' })
        .id('textarea_shaderStyle_modifier_linear_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierLinearGradient)

      TextArea({ placeholder: 'TextArea shaderStyle modifier RadialGradient' })
        .id('textarea_shaderStyle_modifier_radial_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierRadialGradient)

      TextArea({ placeholder: 'TextArea shaderStyle modifier ColorShader' })
        .id('textarea_shaderStyle_modifier_color_shader')
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