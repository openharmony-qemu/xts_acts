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
import {
  $r,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  Checkbox,
  CheckboxGroup,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Image,
  List,
  ListItem,
  PreDragStatus,
  RenderingContextSettings,
  Row,
  Scroll,
  Scroller,
  Text,
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_02 {
  build() {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Column() {
          CheckboxGroup({ group: 'checkboxGroup' })
            .key("CheckboxGroup_Size")
            .size({ width: 90, height: 60 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
        }

        Column() {
          Checkbox({ name: 'checkbox' })
            .key("Checkbox_Size")
            .size({ width: 90, height: 60 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
        }
      }.width('100%')
    }.height('100%')
  }
}