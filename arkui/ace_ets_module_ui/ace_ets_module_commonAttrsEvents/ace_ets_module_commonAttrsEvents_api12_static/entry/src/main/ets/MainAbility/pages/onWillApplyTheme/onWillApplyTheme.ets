/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { CustomColors, CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  $r,
  Alignment,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomDialogController,
  CustomPopupOptions,
  DialogAlignment,
  Divider,
  DragEvent,
  Entry,
  FlexAlign,
  FocusPriority,
  FolderStack,
  FoldStatus,
  FontWeight,
  HitTestMode,
  Margin,
  Menu,
  MenuItem,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  OnFoldStatusChangeInfo,
  Padding,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  ResourceColor,
  Row,
  RowOptions,
  SafeAreaEdge,
  SafeAreaType,
  Scroll,
  Text,
  TextAlign,
  TextInput,
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'


@Entry
@Component
struct onWillApplyThemeTest {
  @State textColor: ResourceColor = $r('sys.color.font_primary');
  @State columBgColor: ResourceColor = $r('sys.color.background_primary');
  @State text: string = '';

  onWillApplyTheme(theme: Theme) {
    this.text = 'onWillApplyTheme'
    this.textColor = theme.colors.fontPrimary;
    this.columBgColor = theme.colors.backgroundPrimary;
    console.info('IndexComponent onWillApplyTheme');
  }

  build() {
    Column() {

      Column() {
        Text(this.text)
          .fontColor($r('sys.color.font_primary'))
          .fontSize(30)
          .key('onWillApplyThemeText')
      }
      .width('100%')
      .height('25%')
      .borderRadius('10vp')
      .backgroundColor($r('sys.color.background_primary'))


      Column() {
        Text('onWillApplyTheme')
          .fontColor(this.textColor)
          .fontSize(30)
        Text('Hello World')
          .fontColor(this.textColor)
          .fontSize(30)
      }
      .width('100%')
      .height('25%')
      .borderRadius('10vp')
      .backgroundColor(this.columBgColor)
    }
    .padding('16vp')
    .backgroundColor('#dcdcdc')
    .width('100%')
    .height('100%')
  }
}