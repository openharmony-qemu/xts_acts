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
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
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
  HoverEventParam,
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
struct onHoverStatusChangeTest {
  @State text: string = ''

  build() {
    Column() {

      FolderStack({ upperItems: ["upperitemsId"] }) {

        Column() {
          Text("video zone").height('100%').width('100%').textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width('100%').height('100%').id("upperitemsId")


        Column() {
          Text(this.text)
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
            .key('onHoverStatusChangeText')
        }.width('100%').height('100%').justifyContent(FlexAlign.Start)

        Column() {
          Text("video bar ")
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
        }.width('100%').height('100%').justifyContent(FlexAlign.End)
      }
      .backgroundColor(Color.Yellow)

      .enableAnimation(true)

      .autoHalfFold(true)

      .onFolderStateChange((msg: OnFoldStatusChangeInfo): void => {
        if (msg.foldStatus === FoldStatus.FOLD_STATUS_EXPANDED) {
          console.info("The device is currently in the expanded state")
        } else if (msg.foldStatus === FoldStatus.FOLD_STATUS_HALF_FOLDED) {
          console.info("The device is currently in the half folded state")
        } else {

        }
      })

      .onHoverStatusChange((msg: HoverEventParam): void => {
        this.text = JSON.stringify(msg)
      })

      .alignContent(Alignment.Bottom)
      .height('100%')
      .width('100%')
      .borderWidth(1)
      .backgroundColor(Color.Yellow)

    }
    .height('100%')
    .width('100%')
    .borderWidth(1)
    .backgroundColor(Color.Pink)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])

  }
}