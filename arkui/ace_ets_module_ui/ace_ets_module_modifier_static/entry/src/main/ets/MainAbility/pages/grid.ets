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
  AdaptiveColor,
  Alignment,
  AlphabetIndexer,
  animateTo,
  ArrowPosition,
  Axis,
  BackgroundEffectOptions,
  Blank,
  BlurStyle,
  BorderImageOption,
  BorderOptions,
  BorderStyle,
  Button,
  ButtonType,
  CalendarAlign,
  CalendarPicker,
  Checkbox,
  CheckboxGroup,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Curve,
  DataPanel,
  Date,
  DatePicker,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  FormComponent,
  FormDimension,
  Gauge,
  GradientDirection,
  Grid,
  GridItem,
  Image,
  ItemAlign,
  Margin,
  MarkStyle,
  MenuAlignType,
  Padding,
  PickerTextStyle,
  RepeatMode,
  ResourceColor,
  Row,
  Select,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  TextOverflow,
  Toggle,
  ToggleType,
  Visibility,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct GridMaxCount {
  @State Number: String[] = ['5', '6', '7', '8', '9']

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

        Text("grid-MaxCount")
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
          .key("maxCountText")

        Column({ space: 5 } as ColumnOptions) {
          Grid() {
            GridItem() {
              Text('1')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('2')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('3')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('4')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('5')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('6')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('7')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('8')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('9')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('10')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('11')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('12')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('13')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('14')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('15')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('16')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('17')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('18')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('19')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('20')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('21')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('22')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('23')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('24')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('25')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('26')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }
          .key("GridKey1")

        }
      }
      .width("100%")
      .height("100%")
    }
    .margin({ top: 5 } as Margin)
  }
}

