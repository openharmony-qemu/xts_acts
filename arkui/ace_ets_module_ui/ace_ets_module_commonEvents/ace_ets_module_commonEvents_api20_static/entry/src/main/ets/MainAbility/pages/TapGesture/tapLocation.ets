'use static';
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  DragEvent,
  NodeContainer,
  GestureEvent,
  TapGesture,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { FrameNode, LengthMetrics, NodeController, typeNode } from '@ohos.arkui.node';
@Entry
@Component
struct tapLocationExample {
  @State value1: string = ''
  @State value2: string = ''
  @State value3: string = ''
  @State value4: string = ''
  @State value5: string = ''
  @State value6: string = ''
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('点击显示tapLocation')
        .id('TapGesture')
        .gesture(
          TapGesture({ fingers: 1})
            .onAction((event: GestureEvent) => {
              // this.value1 = event.tapLocation?.x
              // this.value2 = event.tapLocation?.y
              // this.value3 = event.tapLocation?.windowX
              // this.value4 = event.tapLocation?.windowY
              // this.value5 = event.tapLocation?.displayX
              // this.value6 = event.tapLocation?.displayY
            })
        )
        .height('40%')
        .width('90%')
        .padding(20)
        .border({ width: 3 })
        .margin(10)
      Text('' + this.value1).id('x')
      Text('' + this.value2).id('y')
      Text('' + this.value3).id('windowX')
      Text('' + this.value4).id('windowY')
      Text('' + this.value5).id('displayX')
      Text('' + this.value6).id('displayY')
    }
    .height('100%')
    .width('100%')
  }
}