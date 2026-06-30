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
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Row,
  RowOptions,
  Color,
  ColumnOptions,
  Dimension,
  WithTheme,
  ThemeColorMode,
  FontWeight,
  ForEach,
  $r,
  ResourceColor,
  ScrollEffectType,
  BarStyle
} from '@ohos.arkui.component'
import { State, Watch } from '@ohos.arkui.stateManagement'
import { CustomColors, CustomTheme, Theme, ThemeControl, CustomDarkColors } from '@ohos.arkui.theme'
export enum TokenType {
  PRIMARY,
  ON_PRIMARY,
  CONTAINER,
  NONE
}

export class PageCustomTheme implements CustomTheme {
  public colors?: CustomColors;
  public darkColors?: CustomDarkColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

@Entry
@Component
struct TextTokenTypePage {
  @State tokenType: TokenType = TokenType.NONE;
  localTheme: PageCustomTheme = new PageCustomTheme({
    brand: Color.Blue,
    primary: Color.Blue,
    onPrimary: Color.Blue,
    container: Color.Blue
  } as CustomColors);
  @State localColorMode: ThemeColorMode = ThemeColorMode.LIGHT
  @State currentTheme: PageCustomTheme = this.localTheme

  build() {
    Column() {
      WithTheme({ theme: this.currentTheme, colorMode: this.localColorMode }) {
        Column() {
          Text('Test WithTheme')
        }
      }
    }
  }
}
