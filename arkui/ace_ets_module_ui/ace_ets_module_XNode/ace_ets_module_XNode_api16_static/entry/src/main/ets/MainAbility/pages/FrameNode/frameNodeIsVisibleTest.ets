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
import { ColorMetrics, ComponentContent } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { BuilderNode, FrameNode, NodeController, typeNode } from '@ohos.arkui.node'
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FontWeight,
  HorizontalAlign,
  Margin,
  NodeContainer,
  Scroll,
  Scroller,
  Stack,
  Text,
  Visibility,
  wrapBuilder,
  WrappedBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Index {
  @State columnNodeIsVisible: string = '0';
  private stackNode: FrameNode | null = null
  private columnNode: FrameNode | null = null

  build() {
    Column() {
      Stack() {
        if (true) {
          Column()
            .id('column')
            .visibility(Visibility.Visible)
        }
      }
      .id('stack')
      .visibility(Visibility.Hidden)

      Button('print')
        .id('print_id')
        .onClick((e: ClickEvent) => {
          this.stackNode = this.getUIContext().getFrameNodeById('stack')
          this.columnNode = this.getUIContext().getFrameNodeById('column')
          if (this.stackNode) {

            console.log('stackNode.isVisible:', this.stackNode?.isVisible())
          }
          if (this.columnNode) {

            console.log('columnNode.isVisible:', this.columnNode?.isVisible())
            this.columnNodeIsVisible = this.columnNode?.isVisible() + ''
          }
        })
      Text(this.columnNodeIsVisible)
        .id('columnNodeIsVisible')

    }
  }
}