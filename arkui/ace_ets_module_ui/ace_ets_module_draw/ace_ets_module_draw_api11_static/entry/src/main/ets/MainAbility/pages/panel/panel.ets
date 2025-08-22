/*
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

import events_emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import { Entry, Column, Component, Text, Alignment, TextAlign, TextOverflow } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PanelBackgroundMask {
  

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PanelBackgroundMask start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PanelBackgroundMask end`)
  }

  build() {
    Column() {

      Text("panel-OnHeightChange")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onHeightChangeText")
        .onClick((e: ClickEvent) => {
          
        })

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

    }.width("100%").height("100%")
  }
}
