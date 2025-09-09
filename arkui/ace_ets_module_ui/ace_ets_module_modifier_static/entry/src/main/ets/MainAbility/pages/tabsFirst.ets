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
  $r,
  $rawfile,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BarPosition,
  BlurStyle,
  Builder,
  Button,
  CalendarAlign,
  CalendarPicker,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Date,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  Margin,
  MenuAlignType,
  PickerTextStyle,
  PlaybackSpeed,
  Resource,
  Row,
  Select,
  Swiper,
  SwiperDisplayMode,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextAreaController,
  TextInputController,
  TextPicker,
  Video,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';


@Component
struct ModifierComponent {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }


        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }


        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }


        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }

      }
      .key('tabsTest')

      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width(200)
      .height(200)
    }
  }
}

@Entry
@Component
struct TestPage {
  @Builder
  modifierBuilder() {
    Column() {


    }
  }

  build() {
    Column() {
      Row() {
        Column() {
          Text("Modifier")
            .fontSize("32fp")
            .margin({ top: 20, bottom: 20 } as Margin)
            .fontWeight(FontWeight.Bold)
          this.modifierBuilder()
        }
      }
      .width("100%")
      .justifyContent(FlexAlign.Center)

    }.width('100%')
    .height("100%")
  }
}