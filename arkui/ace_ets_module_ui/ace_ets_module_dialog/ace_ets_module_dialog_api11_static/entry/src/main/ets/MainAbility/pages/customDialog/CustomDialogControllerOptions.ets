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
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  CustomDialogController,
  CustomDialog,
  FlexAlign,
  DialogAlignment
} from '@ohos.arkui.component';
import { State, AppStorage, Link } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

@CustomDialog
struct CustomDialogExampleOptions {
  @Link textValue: string
  @Link inputValue: string
  @State widthSize: number = 250
  @State heightSize: number = 100
  private flag: boolean = true
  controller?: CustomDialogController
  
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Button('change size')
        .width(this.widthSize)
        .height(this.heightSize)
        .margin(30)
        .onClick((e: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 150
            this.heightSize = 60
            this.flag = false
          } else {
            this.widthSize = 250
            this.heightSize = 100
          }
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick((e: ClickEvent) => {
            this.controller?.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick((e: ClickEvent) => {
            this.inputValue = this.textValue
            this.controller?.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)
    }

    
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State textValue: string = ''
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController | undefined = new CustomDialogController({
    builder: CustomDialogExampleOptions({
      cancel: this.onCancel,
      confirm: this.onAccept,
      
      
    }),
    openAnimation: {
      duration: 2000,
      iterations: 3,
      onFinish: () => {
        console.info('openAnimation play end')
      }
    },
    closeAnimation: {
      duration: 2000,
      iterations: 3,
      onFinish: () => {
        console.info('closeAnimation play end')
      }
    },
    cancel: this.existApp,
    alignment: DialogAlignment.Top,
    offset: { dx: 10, dy: 100 },
    maskRect: {
      x: 0,
      y: 100,
      width: '100%',
      height: '80%'
    },
    cornerRadius: "5vp",
    gridCount: 4,
    customStyle: false
  })

  
  aboutToDisappear() {
    this.dialogController = undefined 
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column() {
      Button(this.inputValue).key('CustomDialog')
        .onClick((e: ClickEvent) => {
          if (this.dialogController != undefined) {
            this.dialogController!.open()
          }
        })
        .backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}