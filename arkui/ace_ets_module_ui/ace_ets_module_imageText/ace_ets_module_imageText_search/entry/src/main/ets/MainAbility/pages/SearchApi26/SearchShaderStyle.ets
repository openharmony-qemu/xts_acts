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

class SearchShaderStyleModifier implements AttributeModifier<SearchAttribute> {
  public shaderStyleValue: ShaderStyle | undefined;

  constructor(value: ShaderStyle | undefined) {
    this.shaderStyleValue = value;
  }

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.shaderStyle(this.shaderStyleValue);
  }
}

@Entry
@Component
struct SearchShaderStyle {
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

  modifierLinearGradient: SearchShaderStyleModifier =
    new SearchShaderStyleModifier(new LinearGradientStyle(this.linearGradientOptions));
  modifierRadialGradient: SearchShaderStyleModifier =
    new SearchShaderStyleModifier(new RadialGradientStyle(this.radialGradientOptions));
  modifierColorShader: SearchShaderStyleModifier =
    new SearchShaderStyleModifier(new ColorShaderStyle(Color.Blue));

  build() {
    Column({ space: 5 }) {
      Search({ value: 'Search shaderStyle LinearGradient' })
        .id('search_shaderStyle_linear_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.linearGradientOptions)

      Search({ value: 'Search shaderStyle RadialGradient' })
        .id('search_shaderStyle_radial_gradient')
        .height('5%')
        .width('100%')
        .shaderStyle(this.radialGradientOptions)

      Search({ value: 'Search shaderStyle ColorShader' })
        .id('search_shaderStyle_color_shader')
        .height('5%')
        .width('100%')
        .shaderStyle(this.colorShaderStyle)

      Search({ value: 'Search shaderStyle null' })
        .id('search_shaderStyle_null')
        .height('5%')
        .width('100%')
        .shaderStyle(null)

      Search({ value: 'Search shaderStyle undefined' })
        .id('search_shaderStyle_undefined')
        .height('5%')
        .width('100%')
        .shaderStyle(undefined)

      Search({ value: 'Search shaderStyle default' })
        .id('search_shaderStyle_default')
        .height('5%')
        .width('100%')

      Search({ value: 'Search shaderStyle modifier LinearGradient' })
        .id('search_shaderStyle_modifier_linear_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierLinearGradient)

      Search({ value: 'Search shaderStyle modifier RadialGradient' })
        .id('search_shaderStyle_modifier_radial_gradient')
        .height('5%')
        .width('100%')
        .attributeModifier(this.modifierRadialGradient)

      Search({ value: 'Search shaderStyle modifier ColorShader' })
        .id('search_shaderStyle_modifier_color_shader')
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