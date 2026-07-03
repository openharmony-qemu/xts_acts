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
  Builder,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Scroll,
  Scroller,
  LazyForEach,
  ForEach,
  AttributeModifier,
  OnVisibleIndexesChangeCallback,
  WaterFlow,
  FlowItem,
  LazyVGridLayout,
  LazyVGridLayoutAttribute,
  Color,
  TextAlign,
  FlexAlign,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State, AppStorage, Local, Param } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

class LazyVGridLayoutModifier implements AttributeModifier<LazyVGridLayoutAttribute> {
  applyNormalAttribute(instance: LazyVGridLayoutAttribute): void {
    instance.columnsTemplate('1fr 1fr')
    instance.columnsGap(LengthMetrics.px(20))
    instance.rowsGap(LengthMetrics.vp(10))
    instance.onVisibleIndexesChange((start: int, end: int) => {
      console.info('LazyVGridLayout modifier onVisibleIndexesChange start: ' + start + ', end: ' + end)
    } as OnVisibleIndexesChangeCallback)
  }
}

@Entry
@Component
struct LazyVGridLayoutModifierTest {
  private modifier: LazyVGridLayoutModifier = new LazyVGridLayoutModifier();
  private arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Column() {
      Text('LazyVGridLayout Modifier')
      WaterFlow() {
        LazyVGridLayout() {
          ForEach(this.arr, (item: int) => {
            Column() {
              Text('item ' + item.toString())
                .fontSize(16)
                .fontColor(Color.Black)
            }
            .height('30%')
            .width('100%')
            .backgroundColor('#C8E6C9')
            .justifyContent(FlexAlign.Center)
          })
        }
        .id('lazyVGridLayout_modifier')
        .attributeModifier(this.modifier as LazyVGridLayoutModifier)
      }
      .width('90%')
      .height('50%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
  }
}
