/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
export enum TokenType {
  PRIMARY,
  ON_PRIMARY,
  CONTAINER,
  NONE
}

@Entry
@Component
struct TextTokenTypePage {
  @State @Watch('onColorChange') primaryColor: ResourceColor | undefined = undefined;
  @State @Watch('onColorChange') onPrimaryColor: ResourceColor | undefined = undefined;
  @State @Watch('onColorChange') containerColor: ResourceColor | undefined = undefined;
  @State tokenType: TokenType = TokenType.NONE;
  @State testType: string = 'none';
  @State appTheme: Theme | undefined = undefined;

  onWillApplyTheme(theme: Theme): void {
    this.appTheme = theme;
    console.log('onWillApplyTheme colors: ' + theme.colors)
  }


  onColorChange() {
    ThemeControl.setDefaultTheme({
      colors: {
        primary: this.primaryColor,
        onPrimary: this.onPrimaryColor,
        container: this.containerColor
      }
    })
  }

  setColor(value: ResourceColor | undefined) {
    switch (this.tokenType) {
      case TokenType.PRIMARY:
        this.primaryColor = value;
        break;
      case TokenType.ON_PRIMARY:
        this.onPrimaryColor = value;
        break;
      case TokenType.CONTAINER:
        this.containerColor = value;
        break;
    }
  }

  aboutToAppear(): void {
    switch (this.tokenType) {
      case TokenType.PRIMARY:
        this.testType = 'primary';
        break;
      case TokenType.ON_PRIMARY:
        this.testType = 'onPrimary';
        break;
      case TokenType.CONTAINER:
        this.testType = 'container';
        break;
    }
    this.onColorChange()
  }

  aboutToDisappear(): void {
    ThemeControl.setDefaultTheme(undefined)
  }

  build() {
    Scroll() {
      Column({ space: 2 }) {
        Text('primary: ' + this.appTheme?.colors.primary?.toString(16))
          .id('theme_primary_text')
          .width('100%')
          .fontColor($r('sys.color.font_primary'))
        Text('onPrimary: ' + this.appTheme?.colors.onPrimary?.toString(16))
          .id('theme_onPrimary_text')
          .width('100%')
          .fontColor($r('sys.color.font_primary'))
        Text('container: ' + this.appTheme?.colors.container?.toString(16))
          .id('theme_container_text')
          .width('100%')
          .fontColor($r('sys.color.font_primary'))

        Text('TokenType: ' + this.tokenType)
          .id('theme_tokenType_text')
          .fontWeight(FontWeight.Bold)
          .fontSize(14)
        Row(){
          Button('PRIMARY').id('theme_primary_btn')
            .onClick((event: ClickEvent) => {
              this.tokenType = TokenType.PRIMARY
            })
          Button('ON_PRIMARY').id('theme_onPrimary_btn')
            .onClick((event: ClickEvent) => {
              this.tokenType = TokenType.ON_PRIMARY
            })
          Button('CONTAINER').id('theme_container_btn')
            .onClick((event: ClickEvent) => {
              this.tokenType = TokenType.CONTAINER
            })
        }.width('100%')

        Row(){
          Button('string: #ffff0000').id('theme_string_btn')
            .onClick((event: ClickEvent) => {
              this.setColor('#ffff0000')
            })
          Button('number: 0x0000ff00').id('theme_number_btn')
            .onClick((event: ClickEvent) => {
              this.setColor(0x0000ff00)
            })
        }.width('100%')

        Row(){
          Button('color: Color.Orange').id('theme_color_btn')
            .onClick((event: ClickEvent) => {
              this.setColor(Color.Orange)
            })
          Button('resource: blue').id('theme_resource_btn')
            .onClick((event: ClickEvent) => {
              this.setColor($r('sys.color.font_secondary'))
            })
        }.width('100%')
      }
      .width('100%')
    }
    .width('100%')
    .layoutWeight(1)
  }
}