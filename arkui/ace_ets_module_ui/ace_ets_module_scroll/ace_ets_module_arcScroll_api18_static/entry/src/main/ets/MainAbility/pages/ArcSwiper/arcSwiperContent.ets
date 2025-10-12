/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Component,
  Column,
  Row,
  Text,
  Button,
  Stack,
  Color,
  Margin,
  ClickEvent,
  FlexAlign,
  IDataSource,
  DataChangeListener
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct arcSwiperContentTest {
  @State itemSimpleColor: Color | number | string = ''
  @State selectedItemSimpleColor: Color | number | string = ''
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State opacityList: number[] = new Array<Number>()
  @State scaleList: number[] = new Array<Number>()
  @State translateList: number[] = new Array<Number>()
  @State zIndexList: int[] = new Array<int>()
  @State selectedIndex1: number = -1
  @State index1: number = -1
  @State onAnimationStartIndex: number = -1
  private DISPLAY_COUNT: number = 1
  private MIN_SCALE: number = 0.75


  aboutToAppear(): void {
    for (let i = 0; i < this.backgroundColors.length; i++) {
      this.opacityList.push(1.0)
      this.scaleList.push(1.0)
      this.translateList.push(0.0)
      this.zIndexList.push(0)
    }
  }

  build() {
    Column() {
      Text('onAnimationStartIndex: '+ this.onAnimationStartIndex).id('onAnimationStart_arcs_content')
        .margin({top:10} as Margin)
      Text('index: '+ this.index1).id('index1_arcs_content')

    }.height('100%')
  }
}