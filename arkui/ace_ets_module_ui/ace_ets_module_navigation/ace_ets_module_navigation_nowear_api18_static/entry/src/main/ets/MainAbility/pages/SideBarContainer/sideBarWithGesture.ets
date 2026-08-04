'use static';
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
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  FlexAlign,
  Row,
  List,
  ListItem,
  ForEach,
  Navigation,
  SideBarContainer,
  SideBarContainerType,
  Builder,
  Image,
  $r,
  ToolbarItem,
  BarStyle,
  ScrollEffectType
} from '@ohos.arkui.component'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct SideBarContainerShowSideBarWithGesture {
  build() {
    Column() {
      Text('SideBarContainer showSideBarWithGesture')

      // 1. showSideBarWithGesture
      Text('1. showSideBarWithGesture noSet').fontSize(10)
      SideBarContainer(SideBarContainerType.DISPLACE) {
        Column() {
          Text('SideBar1')
            .fontSize(12)
            .fontColor(Color.Black)
        }
        .width('100%')
        .backgroundColor('#FFE0B2')

        Column() {
          Text('noSet')
          Row() {
            Image($r('sys.symbol.ohos_folder_badge_plus')).width(32)
            Text('AAA1')
          }
        }
        .width('100%')
        .backgroundColor('#C8E6C9')
        .justifyContent(FlexAlign.Center)
      }
      .id('sideBarContainer_showSideBarWithGesture_default')
      .showSideBar(false)
      .sideBarWidth(100)
      .height('15%')

      Text('2. showSideBarWithGesture = true').fontSize(10)
      SideBarContainer(SideBarContainerType.DISPLACE) {
        Column() {
          Text('SideBar2')
            .id('sideBar2_true_text')
            .fontSize(12)
            .fontColor(Color.Black)
        }
        .width('100%')
        .backgroundColor('#BBDEFB')

        Column() {
          Text('true')
          Row() {
            Image($r('sys.symbol.ohos_folder_badge_plus')).width(32)
            Text('BBB2')
          }.margin({ left: 15, top: 10 })
        }
        .width('100%')
        .backgroundColor('#F8BBD0')
        .justifyContent(FlexAlign.Center)
      }
      .id('sideBarContainer_showSideBarWithGesture_true')
      .showSideBar(false)
      .sideBarWidth(100)
      .showSideBarWithGesture(true)
      .height('15%')

      Text('3. showSideBarWithGesture = false').fontSize(10)
      SideBarContainer(SideBarContainerType.DISPLACE) {
        Column() {
          Text('SideBar3')
            .id('sideBar3_false_text')
            .fontSize(12)
            .fontColor(Color.Black)
        }
        .width('100%')
        .backgroundColor('#D1C4E9')

        Column() {
          Text('false')
          Row() {
            Image($r('sys.symbol.ohos_folder_badge_plus')).width(32)
            Text('CCC3')
          }.margin({ left: 15, top: 10 })
        }
        .width('100%')
        .backgroundColor('#FFF9C4')
        .justifyContent(FlexAlign.Center)
      }
      .id('sideBarContainer_showSideBarWithGesture_false')
      .showSideBar(false)
      .sideBarWidth(100)
      .showSideBarWithGesture(false)
      .height('15%')

      Text('4. showSideBarWithGesture = undefined').fontSize(10)
      SideBarContainer(SideBarContainerType.DISPLACE) {
        Column() {
          Text('SideBar5')
            .fontSize(12)
            .fontColor(Color.Black)
        }
        .width('100%')
        .backgroundColor('#C5CAE9')

        Column() {
          Text('undefined')
          Row() {
            Image($r('sys.symbol.ohos_folder_badge_plus')).width(32)
            Text('EEE5')
          }.margin({ left: 15, top: 10 })
        }
        .width('100%')
        .backgroundColor('#B2DFDB')
        .justifyContent(FlexAlign.Center)
      }
      .id('sideBarContainer_showSideBarWithGesture_undefined')
      .showSideBar(false)
      .sideBarWidth(100)
      .showSideBarWithGesture(undefined)
      .height('15%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#C0C0C0')
  }
}