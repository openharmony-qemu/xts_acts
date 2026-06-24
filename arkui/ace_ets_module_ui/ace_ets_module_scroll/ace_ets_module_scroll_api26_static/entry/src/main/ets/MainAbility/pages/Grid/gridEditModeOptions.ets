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
  Entry,
  Component,
  Column,
  ColumnOptions,
  Flex,
  Row,
  Text,
  Button,
  ClickEvent,
  Grid,
  GridItem,
  Scroller,
  ForEach,
  Scroll,
  Color,
  Builder,
  Margin,
  Axis,
  BarState,
  StickyStyle,
  TextAlign,
  EditModeOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridEditModeOptions {
  private arr: int[] = [];
  @State isSelectedGrid: boolean[] = [false];
  @State numberBadge: int = 0;

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i);
      this.isSelectedGrid.push(false);
    }
  }

  build() {
    Column() {
      Text('editModeOptions true')
        .fontSize(14)
      Grid() {
        ForEach(this.arr, (item: int) => {
          GridItem() {
            Text('item' + item)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }, (item: int) => item.toString())
      }
      .id('grid_editModeOptions_true')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(true)
      .editModeOptions({
        useDefaultMultiSelectStyle: true,
        enableGatherSelectedItemsAnimation: true,
        enableTwoFingerMultiSelect: true,
        onGetPreviewBadge: () => {
          return true;
        }
      } as EditModeOptions)
      .width('90%')
      .height('25%')
      .backgroundColor(0xFAEEE0)

      Text('editModeOptions false')
        .fontSize(14)
      Grid() {
        ForEach(this.arr, (item: int) => {
          GridItem() {
            Text('item' + item)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }, (item: int) => item.toString())
      }
      .id('grid_editModeOptions_false')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(true)
      .editModeOptions({
        useDefaultMultiSelectStyle: false,
        enableGatherSelectedItemsAnimation: false,
        enableTwoFingerMultiSelect: false,
        onGetPreviewBadge: () => {
          return false
        }
      } as EditModeOptions)
      .width('90%')
      .height('25%')
      .backgroundColor(0xFAEEE0)

      Text('editModeOptions undefined')
        .fontSize(14)
      Grid() {
        ForEach(this.arr, (idx: int) => {
          GridItem() {
            Text('item' + idx)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selectable(true)
          .selected(this.isSelectedGrid[idx])
          .onClick(() => {
            this.isSelectedGrid[idx] = !this.isSelectedGrid[idx]
            if (this.isSelectedGrid[idx]) {
              this.numberBadge++;
            } else {
              this.numberBadge--;
            }
          })
        }, (idx: int) => idx.toString())
      }
      .id('grid_editModeOptions_parameter_undefined')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(5)
      .rowsGap(5)
      .enableEditMode(true)
      .editModeOptions({
        useDefaultMultiSelectStyle: true,
        enableGatherSelectedItemsAnimation: true,
        enableTwoFingerMultiSelect: true,
        onGetPreviewBadge: () => {
          console.log('numberBadge: '+ this.numberBadge)
          return this.numberBadge;
        }
      } as EditModeOptions)
      .width('90%')
      .height('25%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}