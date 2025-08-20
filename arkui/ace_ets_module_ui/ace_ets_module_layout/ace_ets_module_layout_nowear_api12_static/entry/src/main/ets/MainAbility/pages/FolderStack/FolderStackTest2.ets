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
  Text,
  Color,
  ItemAlign,
  FlexAlign,
  Scroll,
  ColumnSplit,
  FontWeight,
  TextAlign,
  FolderStack,
  Alignment,
  SafeAreaType,
  SafeAreaEdge,
  FoldStatus,
  OnFoldStatusChangeInfo,
  HoverEventParam,
  AppRotation
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct FolderStackTest2 {
  @State lenWid: number = 480
  @State text: string = 'AppRotation'

  build() {
    Column() {
      Text(this.text).id('FolderStackTest2_text')
      
      FolderStack({ upperItems: ['upperitemsId'] }) {
        
        Column() {
          Text('video zone').height('100%').width('100%').textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width('100%').height('100%').id('upperitemsId')

        
        Column() {
          Text('video title')
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
        }.width('100%').height('100%').justifyContent(FlexAlign.Start)

        Column() {
          Text('video bar ')
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
          console.info('The device is currently in the expanded state')
        } else if (msg.foldStatus === FoldStatus.FOLD_STATUS_HALF_FOLDED) {
          console.info('The device is currently in the half folded state')
        } else {
          
        }
      })
      
      .onHoverStatusChange((msg: HoverEventParam): void => {
        console.log('this foldStatus:' + msg.foldStatus);
        console.log('this isHoverMode:' + msg.isHoverMode);
        console.log('this appRotation:' + msg.appRotation);
        if (msg.appRotation === AppRotation.ROTATION_90) {
          this.text = 'ROTATION_90'
        } else if (msg.appRotation === AppRotation.ROTATION_180) {
          this.text = 'ROTATION_180'
        } else if (msg.appRotation === AppRotation.ROTATION_270) {
          this.text = 'ROTATION_270'
        }
      })
      
      .alignContent(Alignment.Bottom)
      .height('100%')
      .width('200vp')
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