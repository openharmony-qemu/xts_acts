'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  Row,
  ClickEvent,
  Margin,
  ButtonType,
  Stepper,
  StepperItem,
  ItemState,
  SideBarContainer,
  SideBarContainerType,
  Builder,
  Alignment,
  wrapBuilder,
  TransitionEffect
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { ComponentContent } from '@kit.ArkUI';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
import promptAction from "@ohos.promptAction";

@Component
struct ICustomDialog {
  build() {
    Column() {
      Text('Hello')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 } as Margin)
      Button('close dialog')
        .id('getDialogController001')
        .onClick((e: ClickEvent) => {
            // this.getDialogController().close();
        })
      Button('点我获取状态：通过外部传递的DialogController')
        .onClick((e: ClickEvent) => {
          // if (this.getDialogController()) {
          //   let state: promptAction.CommonState = this.getDialogController().getState();
          //   console.info('state:' + state);
          // }
        })
    }.backgroundColor('#FFF0F0F0')
  }
}

@Builder
function buildText() {
  ICustomDialog()
}

@Entry
@Component
struct Index {
  @State alertDialogFlag1: number = 0;
  @State alertDialogFlag2: number = 0;
  @State alertDialogFlag3: number = 0;
  @State alertDialogFlag4: number = 0;
  private dialogController: promptAction.DialogController = new promptAction.DialogController()

  build() {
    Row() {
      Column() {
        Button('click me')
          .id('dialogController001')
          .onClick((e: ClickEvent) => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText),
            );
            promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              transition: TransitionEffect.OPACITY.animation({
                duration: 3000
              }),
              onDidAppear: () => {
                // this.alertDialogFlag2 = this.dialogController.getState();
              },
              onDidDisappear: () => {
                // this.alertDialogFlag4 = this.dialogController.getState();
              },
              onWillAppear: () => {
                // this.alertDialogFlag1 = this.dialogController.getState();
              },
              onWillDisappear: () => {
                // this.alertDialogFlag3 = this.dialogController.getState();
              }
            })
          })
        Text(this.alertDialogFlag1+'').id('alertDialogFlag1')
        Text(this.alertDialogFlag2+'').id('alertDialogFlag2')
        Text(this.alertDialogFlag3+'').id('alertDialogFlag3')
        Text(this.alertDialogFlag4+'').id('alertDialogFlag4')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}