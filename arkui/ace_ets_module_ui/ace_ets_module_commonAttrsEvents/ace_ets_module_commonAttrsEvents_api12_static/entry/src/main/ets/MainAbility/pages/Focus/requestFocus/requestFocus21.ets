/*
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

import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
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
  FocusPriority,
  FontWeight,
  Margin,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  Padding,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  ResourceColor,
  Row,
  RowOptions,
  Scroll,
  Text,
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'

@Entry
@Component
struct requestFocus21 {
  @State text2: string = 'TextInput'

  @Builder
  PageMap(name: string) {
    if (name == 'pageOne') {
      pageOne()
    }
  }

  build() {


  }
}

@Component
export struct pageOne {
  @State text1: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('' + this.text1).id('requestFocus21_text1')

        Button('Focus-textInput1').onClick((e: ClickEvent) => {
          try {
            this.getUIContext().getFocusController().requestFocus('requestFocus21_textInput1')
          } catch (error) {
            this.text1 = '' + error.code
          }
        }).id('requestFocus21_btn2')

      }.width('100%').height('100%')
    }.title('pageOne')
  }
}

