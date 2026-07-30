'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Grid,
  Alignment,
  WaterFlow,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  ScrollState,
  GridItemStyle,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  GridItem,
  EdgeEffect,
  Color,
  GridItemOptions,
  ClickEvent,
  PanGesture,
  FlexAlign,
  HorizontalAlign,
  ColumnOptions,
  Resource,
  $r,
  $$,
  EditModeOptions,
  WaterFlowAttribute,
  AttributeModifier,
  WaterFlowOptions,
  WaterFlowLayoutMode,
  FlowItem
} from '@ohos.arkui.component'
import { State, AppStorage, Local, Watch } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct GridItemExample {
  @State arr: string[] = ['0', '1', '2', '3', '4', '5'];
  @State  enableEditMode: boolean = false

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('enableEditMode')
        .id('grid_enableEditMode_change')
        .onClick(()=>{
          this.enableEditMode = !this.enableEditMode
        })

      // onEditModeChange 设置为 true / false
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('grid_enableEditMode_true')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)
      .enableEditMode(this.enableEditMode!!)
      .editModeOptions({useDefaultMultiSelectStyle: true, enableTwoFingerMultiSelect: undefined})
      .onEditModeChange((data: boolean) => {
        console.info('grid onEditModeChange: ' + data)
        AppStorage.setOrCreate<boolean>('grid_onEditModeChange', data)
      })

      // onEditModeChange 设置为 undefined
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .width('90%')
      .height('20%')
      .backgroundColor(0xFAEEE0)
      .enableEditMode(true)
      .editModeOptions({useDefaultMultiSelectStyle: true, enableTwoFingerMultiSelect: undefined})
      .onEditModeChange(undefined)
      .id('grid_onEditModeChange_undefined')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}