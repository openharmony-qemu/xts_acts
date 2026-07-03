'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Row,
  RowOptions,
  Color,
  ForEach,
  LazyForEach,
  List,
  ListItem,
  AttributeModifier,
  ColumnOptions,
  Dimension,
  WithTheme,
  ThemeColorMode,
  FontWeight,
  $r,
  ResourceColor,
  ScrollEffectType,
  BarStyle
} from '@ohos.arkui.component'
import { State, Watch } from '@ohos.arkui.stateManagement'
import { DynamicLayout } from '@ohos.arkui.components.ArkDynamicLayout'
import { CustomLayoutAlgorithm} from '@ohos.arkui.layoutAlgorithm'
import { LazyDynamicLayout, LazyDynamicLayoutAttribute } from '@ohos.arkui.components.ArkLazyDynamicLayout'
import { LazyLayoutAlgorithm, LazyCustomLayoutAlgorithmOptions,
  LazyLayoutDirection, LazyLayoutHelper, LazyCustomLayoutAlgorithm } from '@ohos.arkui.lazyLayoutAlgorithm'
import { LazyListLayout } from '../data/LazyListLayout';

class MyLazyDynamicLayoutModifier implements AttributeModifier<LazyDynamicLayoutAttribute> {

  applyNormalAttribute(instance: LazyDynamicLayoutAttribute): void {
    instance.onVisibleIndexesChange((children: int[])=>{
      console.log(`modifier onVisibleIndexesChange:children:${children}`)
    })
  }
}

@Entry
@Component
struct CustomListLayoutTest {
  private lazyAlgorithm: LazyListLayout = new LazyListLayout();
  private modifier: MyLazyDynamicLayoutModifier = new MyLazyDynamicLayoutModifier()
  @State itemHeight: number = 30

  build() {
    Column(undefined) {
      Button('itemHeight').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          this.itemHeight = 70
        })
      List() {
        LazyDynamicLayout(this.lazyAlgorithm) {
          Text('item01').height(this.itemHeight)
          Text('item02').height(this.itemHeight)
          Text('item03').height(this.itemHeight)
        }
        .id('lazyDynamicLayout_test')
        .onVisibleIndexesChange((child: int[]) => {
          console.info(`onVisibleIndexesChange:start:${child}`);
        })
      }
      .layoutWeight(1)
      .height('40%')

      List() {
        LazyDynamicLayout(this.lazyAlgorithm) {
          Text('item11').height(this.itemHeight)
          Text('item12').height(this.itemHeight)
          Text('item13').height(this.itemHeight)
        }
        .attributeModifier(this.modifier)
      }
      .layoutWeight(1)
      .height('40%')
    }
    .height('100%')
    .width('100%')
  }
}
