'use static';
/*
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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import hilog from '@ohos.hilog';
import {
  Entry,
  Component,
  Margin,
  TabsController,
  FP,
  BarMode,
  LayoutStyle,
  VerticalAlign,
  LayoutMode,
  TextOverflow,
  TextHeightAdaptivePolicy,
  FontWeight,
  FontStyle,
  Column,
  Tabs,
  Button,
  BarPosition,
  TabContent,
  $r,
  Text,
  Padding,
  Color,
  SubTabBarStyle,
  BottomTabBarStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TabsExampleThird {
  private controller: TabsController = new TabsController()
  @State barGridAlignMarginNumber: number = 0
  @State barGridAlignMarginString: FP = '0.00fp'
  @State barGridAlignGutterNumber: number = 0
  @State barGridAlignGutterString: FP = '0.00fp'
  @State barGridAlignSmNumber: number = 0
  @State barGridAlignMdNumber: number = 0
  @State barGridAlignLgNumber: number = 0
  @State barHeightString: string = '0.00vp'
  @State barModeMode: BarMode = BarMode.Fixed
  @State barModeMarginString: FP = '0.00fp'
  @State barModeMarginNumber: number = 0
  @State barModeNonScrollableLayoutStyle: LayoutStyle = LayoutStyle.ALWAYS_CENTER
  @State subTabBarStylePaddingNumber: number = 0
  @State subTabBarStylePaddingString: FP = '0.00fp'
  @State bottomTabBarStylePaddingNumber: number = 0
  @State bottomTabBarStylePaddingString: FP = '0.00fp'
  @State subTabBarStylePaddingTopNumber: number = 0
  @State subTabBarStylePaddingBottomNumber: number = 0
  @State subTabBarStylePaddingLeftNumber: number = 0
  @State subTabBarStylePaddingRightNumber: number = 0
  @State subTabBarStylePaddingTopString: string = '0.00vp'
  @State subTabBarStylePaddingBottomString: string = '0.00vp'
  @State subTabBarStylePaddingLeftString: string = '0.00vp'
  @State subTabBarStylePaddingRightString: string = '0.00vp'
  @State bottomTabBarStylePaddingTopNumber: number = 0
  @State bottomTabBarStylePaddingBottomNumber: number = 0
  @State bottomTabBarStylePaddingLeftNumber: number = 0
  @State bottomTabBarStylePaddingRightNumber: number = 0
  @State bottomTabBarStylePaddingTopString: string = '0.00vp'
  @State bottomTabBarStylePaddingBottomString: string = '0.00vp'
  @State bottomTabBarStylePaddingLeftString: string = '0.00vp'
  @State bottomTabBarStylePaddingRightString: string = '0.00vp'
  @State bottomTabBarStyleVerticalAlign: VerticalAlign = VerticalAlign.Center
  @State bottomTabBarStyleLayoutMode: LayoutMode = LayoutMode.VERTICAL
  @State bottomTabBarStyleSymmetricExtensible: boolean = false
  @State bottomTabBarStyleLabelStyleOverflow: TextOverflow = TextOverflow.Ellipsis
  @State bottomTabBarStyleLabelStyleMaxLines: number = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleMaxFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleMaxFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleHeightAdaptivePolicy: TextHeightAdaptivePolicy =
    TextHeightAdaptivePolicy.MAX_LINES_FIRST
  @State bottomTabBarStyleLabelStyleFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontWeight: FontWeight = FontWeight.Normal
  @State bottomTabBarStyleLabelStyleFontWeightNumber: number = 0
  @State bottomTabBarStyleLabelStyleFontWeightString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontFamilyString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontStyle: FontStyle = FontStyle.Normal
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("tabs page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,undefined|null|Object>;
      if (data['barGridAlignMarginNumber'] != null && data['barGridAlignMarginNumber'] != 'null' &&
        data['barGridAlignMarginNumber'] != 'undefined') {
        this.barGridAlignMarginNumber = data['barGridAlignMarginNumber'] as number;
      }

      if (data['barGridAlignMarginString'] != null && data['barGridAlignMarginString'] != 'null' &&
        data['barGridAlignMarginString'] != 'undefined') {
        this.barGridAlignMarginString = data['barGridAlignMarginString'] as string;
      }

      if (data['barGridAlignGutterNumber'] != null && data['barGridAlignGutterNumber'] != 'null' &&
        data['barGridAlignGutterNumber'] != 'undefined') {
        this.barGridAlignGutterNumber = data['barGridAlignGutterNumber'] as number;
      }

      if (data['barGridAlignGutterString'] != null && data['barGridAlignGutterString'] != 'null' &&
        data['barGridAlignGutterString'] != 'undefined') {
        this.barGridAlignGutterString = data['barGridAlignGutterString'] as string;
      }

      if (data['barGridAlignSmNumber'] != null && data['barGridAlignSmNumber'] != 'null' &&
        data['barGridAlignSmNumber'] != 'undefined') {
        this.barGridAlignSmNumber = data['barGridAlignSmNumber'] as number;
      }

      if (data['barGridAlignMdNumber'] != null && data['barGridAlignMdNumber'] != 'null' &&
        data['barGridAlignMdNumber'] != 'undefined') {
        this.barGridAlignMdNumber = data['barGridAlignMdNumber'] as number;
      }

      if (data['barGridAlignLgNumber'] != null && data['barGridAlignLgNumber'] != 'null' &&
        data['barGridAlignLgNumber'] != 'undefined') {
        this.barGridAlignLgNumber = data['barGridAlignLgNumber'] as number;
      }

      if (data['barHeightString'] != null && data['barHeightString'] != 'null' &&
        data['barHeightString'] != 'undefined') {
        this.barHeightString = data['barHeightString'] as string;
      }

      if (data['barModeMode'] != null && data['barModeMode'] != 'null' && data['barModeMode'] != 'undefined') {
        this.barModeMode = data['barModeMode'] as BarMode;
      }

      if (data['barModeMarginString'] != null && data['barModeMarginString'] != 'null' &&
        data['barModeMarginString'] != 'undefined') {
        this.barModeMarginString = data['barModeMarginString'] as string;
      }

      if (data['barModeMarginNumber'] != null && data['barModeMarginNumber'] != 'null' &&
        data['barModeMarginNumber'] != 'undefined') {
        this.barModeMarginNumber = data['barModeMarginNumber'] as number;
      }

      if (data['barModeNonScrollableLayoutStyle'] != null && data['barModeNonScrollableLayoutStyle'] != 'null' &&
        data['barModeNonScrollableLayoutStyle'] != 'undefined') {
        this.barModeNonScrollableLayoutStyle = data['barModeNonScrollableLayoutStyle'] as LayoutStyle;
      }

      if (data['subTabBarStylePaddingNumber'] != null && data['subTabBarStylePaddingNumber'] != 'null' &&
        data['subTabBarStylePaddingNumber'] != 'undefined') {
        this.subTabBarStylePaddingNumber = data['subTabBarStylePaddingNumber'] as number;
      }

      if (data['subTabBarStylePaddingString'] != null && data['subTabBarStylePaddingString'] != 'null' &&
        data['subTabBarStylePaddingString'] != 'undefined') {
        this.subTabBarStylePaddingString = data['subTabBarStylePaddingString'] as string;
      }

      if (data['bottomTabBarStylePaddingNumber'] != null && data['bottomTabBarStylePaddingNumber'] != 'null' &&
        data['bottomTabBarStylePaddingNumber'] != 'undefined') {
        this.bottomTabBarStylePaddingNumber = data['bottomTabBarStylePaddingNumber'] as number;
      }

      if (data['bottomTabBarStylePaddingString'] != null && data['bottomTabBarStylePaddingString'] != 'null' &&
        data['bottomTabBarStylePaddingString'] != 'undefined') {
        this.bottomTabBarStylePaddingString = data['bottomTabBarStylePaddingString'] as string;
      }

      if (data['subTabBarStylePaddingTopNumber'] != null && data['subTabBarStylePaddingTopNumber'] != 'null' &&
        data['subTabBarStylePaddingTopNumber'] != 'undefined') {
        this.subTabBarStylePaddingTopNumber = data['subTabBarStylePaddingTopNumber'] as number;
      }

      if (data['subTabBarStylePaddingBottomNumber'] != null && data['subTabBarStylePaddingBottomNumber'] != 'null' &&
        data['subTabBarStylePaddingBottomNumber'] != 'undefined') {
        this.subTabBarStylePaddingBottomNumber = data['subTabBarStylePaddingBottomNumber'] as number;
      }

      if (data['subTabBarStylePaddingLeftNumber'] != null && data['subTabBarStylePaddingLeftNumber'] != 'null' &&
        data['subTabBarStylePaddingLeftNumber'] != 'undefined') {
        this.subTabBarStylePaddingLeftNumber = data['subTabBarStylePaddingLeftNumber'] as number;
      }

      if (data['subTabBarStylePaddingRightNumber'] != null && data['subTabBarStylePaddingRightNumber'] != 'null' &&
        data['subTabBarStylePaddingRightNumber'] != 'undefined') {
        this.subTabBarStylePaddingRightNumber = data['subTabBarStylePaddingRightNumber'] as number;
      }

      if (data['subTabBarStylePaddingTopString'] != null && data['subTabBarStylePaddingTopString'] != 'null' &&
        data['subTabBarStylePaddingTopString'] != 'undefined') {
        this.subTabBarStylePaddingTopString = data['subTabBarStylePaddingTopString'] as string;
      }

      if (data['subTabBarStylePaddingBottomString'] != null && data['subTabBarStylePaddingBottomString'] != 'null' &&
        data['subTabBarStylePaddingBottomString'] != 'undefined') {
        this.subTabBarStylePaddingBottomString = data['subTabBarStylePaddingBottomString'] as string;
      }

      if (data['subTabBarStylePaddingLeftString'] != null && data['subTabBarStylePaddingLeftString'] != 'null' &&
        data['subTabBarStylePaddingLeftString'] != 'undefined') {
        this.subTabBarStylePaddingLeftString = data['subTabBarStylePaddingLeftString'] as string;
      }

      if (data['subTabBarStylePaddingRightString'] != null && data['subTabBarStylePaddingRightString'] != 'null' &&
        data['subTabBarStylePaddingRightString'] != 'undefined') {
        this.subTabBarStylePaddingRightString = data['subTabBarStylePaddingRightString'] as string;
      }

      if (data['bottomTabBarStylePaddingTopNumber'] != null && data['bottomTabBarStylePaddingTopNumber'] != 'null' &&
        data['bottomTabBarStylePaddingTopNumber'] != 'undefined') {
        this.bottomTabBarStylePaddingTopNumber = data['bottomTabBarStylePaddingTopNumber'] as number;
      }

      if (data['bottomTabBarStylePaddingBottomNumber'] != null &&
        data['bottomTabBarStylePaddingBottomNumber'] != 'null' &&
        data['bottomTabBarStylePaddingBottomNumber'] != 'undefined') {
        this.bottomTabBarStylePaddingBottomNumber = data['bottomTabBarStylePaddingBottomNumber'] as number;
      }

      if (data['bottomTabBarStylePaddingLeftNumber'] != null && data['bottomTabBarStylePaddingLeftNumber'] != 'null' &&
        data['bottomTabBarStylePaddingLeftNumber'] != 'undefined') {
        this.bottomTabBarStylePaddingLeftNumber = data['bottomTabBarStylePaddingLeftNumber'] as number;
      }

      if (data['bottomTabBarStylePaddingRightNumber'] != null &&
        data['bottomTabBarStylePaddingRightNumber'] != 'null' &&
        data['bottomTabBarStylePaddingRightNumber'] != 'undefined') {
        this.bottomTabBarStylePaddingRightNumber = data['bottomTabBarStylePaddingRightNumber'] as number;
      }

      if (data['bottomTabBarStylePaddingTopString'] != null && data['bottomTabBarStylePaddingTopString'] != 'null' &&
        data['bottomTabBarStylePaddingTopString'] != 'undefined') {
        this.bottomTabBarStylePaddingTopString = data['bottomTabBarStylePaddingTopString'] as string;
      }

      if (data['bottomTabBarStylePaddingBottomString'] != null &&
        data['bottomTabBarStylePaddingBottomString'] != 'null' &&
        data['bottomTabBarStylePaddingBottomString'] != 'undefined') {
        this.bottomTabBarStylePaddingBottomString = data['bottomTabBarStylePaddingBottomString'] as string;
      }

      if (data['bottomTabBarStylePaddingLeftString'] != null && data['bottomTabBarStylePaddingLeftString'] != 'null' &&
        data['bottomTabBarStylePaddingLeftString'] != 'undefined') {
        this.bottomTabBarStylePaddingLeftString = data['bottomTabBarStylePaddingLeftString'] as string;
      }

      if (data['bottomTabBarStylePaddingRightString'] != null &&
        data['bottomTabBarStylePaddingRightString'] != 'null' &&
        data['bottomTabBarStylePaddingRightString'] != 'undefined') {
        this.bottomTabBarStylePaddingRightString = data['bottomTabBarStylePaddingRightString'] as string;
      }

      if (data['bottomTabBarStyleVerticalAlign'] != null && data['bottomTabBarStyleVerticalAlign'] != 'null' &&
        data['bottomTabBarStyleVerticalAlign'] != 'undefined') {
        this.bottomTabBarStyleVerticalAlign = data['bottomTabBarStyleVerticalAlign'] as VerticalAlign;
      }

      if (data['bottomTabBarStyleLayoutMode'] != null && data['bottomTabBarStyleLayoutMode'] != 'null' &&
        data['bottomTabBarStyleLayoutMode'] != 'undefined') {
        this.bottomTabBarStyleLayoutMode = data['bottomTabBarStyleLayoutMode'] as LayoutMode;
      }

      if (data['bottomTabBarStyleSymmetricExtensible'] != null &&
        data['bottomTabBarStyleSymmetricExtensible'] != 'null' &&
        data['bottomTabBarStyleSymmetricExtensible'] != 'undefined') {
        this.bottomTabBarStyleSymmetricExtensible = data['bottomTabBarStyleSymmetricExtensible'] as boolean;
      }

      if (data['bottomTabBarStyleLabelStyleOverflow'] != null &&
        data['bottomTabBarStyleLabelStyleOverflow'] != 'null' &&
        data['bottomTabBarStyleLabelStyleOverflow'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleOverflow = data['bottomTabBarStyleLabelStyleOverflow'] as TextOverflow;
      }

      if (data['bottomTabBarStyleLabelStyleMaxLines'] != null &&
        data['bottomTabBarStyleLabelStyleMaxLines'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMaxLines'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMaxLines = data['bottomTabBarStyleLabelStyleMaxLines'] as number;
      }

      if (data['bottomTabBarStyleLabelStyleMinFontSizeNumber'] != null &&
        data['bottomTabBarStyleLabelStyleMinFontSizeNumber'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMinFontSizeNumber'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMinFontSizeNumber =
          data['bottomTabBarStyleLabelStyleMinFontSizeNumber'] as number;
      }

      if (data['bottomTabBarStyleLabelStyleMinFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleMinFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMinFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMinFontSizeString =
          data['bottomTabBarStyleLabelStyleMinFontSizeString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleMaxFontSizeNumber'] != null &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeNumber'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeNumber'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMaxFontSizeNumber =
          data['bottomTabBarStyleLabelStyleMaxFontSizeNumber'] as number;
      }

      if (data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMaxFontSizeString =
          data['bottomTabBarStyleLabelStyleMaxFontSizeString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != null &&
        data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != 'null' &&
        data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleHeightAdaptivePolicy =
          data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] as TextHeightAdaptivePolicy;
      }

      if (data['bottomTabBarStyleLabelStyleFontSizeNumber'] != null &&
        data['bottomTabBarStyleLabelStyleFontSizeNumber'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontSizeNumber'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontSizeNumber = data['bottomTabBarStyleLabelStyleFontSizeNumber'] as number;
      }

      if (data['bottomTabBarStyleLabelStyleFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontSizeString = data['bottomTabBarStyleLabelStyleFontSizeString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleFontWeight'] != null &&
        data['bottomTabBarStyleLabelStyleFontWeight'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontWeight'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontWeight = data['bottomTabBarStyleLabelStyleFontWeight'] as FontWeight;
      }

      if (data['bottomTabBarStyleLabelStyleFontWeightNumber'] != null &&
        data['bottomTabBarStyleLabelStyleFontWeightNumber'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontWeightNumber'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontWeightNumber =
          data['bottomTabBarStyleLabelStyleFontWeightNumber'] as number;
      }

      if (data['bottomTabBarStyleLabelStyleFontWeightString'] != null &&
        data['bottomTabBarStyleLabelStyleFontWeightString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontWeightString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontWeightString =
          data['bottomTabBarStyleLabelStyleFontWeightString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleFontFamilyString'] != null &&
        data['bottomTabBarStyleLabelStyleFontFamilyString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontFamilyString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontFamilyString =
          data['bottomTabBarStyleLabelStyleFontFamilyString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleFontStyle'] != null &&
        data['bottomTabBarStyleLabelStyleFontStyle'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontStyle'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontStyle = data['bottomTabBarStyleLabelStyleFontStyle'] as FontStyle;
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1"))
        .key('subTabBarDefaultTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab2"))
        .key('bottomTabBarDefaultTest')
      }
      .vertical(false)
      .onTabBarClick((index: int): void => {
      })
      .barMode(BarMode.Fixed)
      .key('tabsDefaultTest')

      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar("tab1")

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab2"))
        .key('bottomTabBarDefaultTestJudge')
      }
      .vertical(false)
      .scrollable(true)
      .barWidth(350)
      .barHeight(70)
      .animationDuration(200)
      .height('90%')
      .width('90%')
      .onTabBarClick((index: int): void => {
      })
      .key('onTabBarClickTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding(this.subTabBarStylePaddingNumber)
        )
        .key('subTabBarNumberTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding(this.bottomTabBarStylePaddingNumber)
        )
        .key('bottomTabBarNumberTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: this.barGridAlignMarginNumber,
        gutter: this.barGridAlignGutterNumber,
        sm: this.barGridAlignSmNumber?.toInt(),
        md: this.barGridAlignMdNumber?.toInt(),
        lg: this.barGridAlignLgNumber?.toInt()
      })
      .barMode(this.barModeMode,
        { margin: this.barModeMarginNumber, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsNumberTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1")
          .padding(this.subTabBarStylePaddingString))
        .key('subTabBarStringTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding(this.bottomTabBarStylePaddingString))
        .key('bottomTabBarStringTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: this.barGridAlignMarginString,
        gutter: this.barGridAlignGutterString,
      })
      .barHeight(this.barHeightString)
      .barMode(this.barModeMode,
        { margin: this.barModeMarginString, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsStringTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1")
          .padding($r('app.float.SubTabBarStylePadding_Test')))
        .key('subTabBarResourceTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding($r('app.float.BottomTabBarStylePadding_Test')))
        .key('bottomTabBarResourceTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: $r('app.float.BarGridAlign_Test'),
        gutter: $r('app.float.BarGridAlign_Test'),
      })
      .barHeight($r('app.float.BarHeight_Test'))
      .barMode(this.barModeMode,
        { margin: $r('app.float.BarMode_Test'), nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsResourceTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .key('marginPadding')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: this.subTabBarStylePaddingTopNumber,
            bottom: this.subTabBarStylePaddingBottomNumber,
            left: this.subTabBarStylePaddingLeftNumber,
            right: this.subTabBarStylePaddingRightNumber
          } as Padding))
        .key('subTabBarStylePaddingNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: this.subTabBarStylePaddingTopString,
            bottom: this.subTabBarStylePaddingBottomString,
            left: this.subTabBarStylePaddingLeftString,
            right: this.subTabBarStylePaddingRightString
          } as Padding))
        .key('subTabBarStylePaddingStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: $r('app.float.SubTabBarStylePadding_Test'),
            bottom: $r('app.float.SubTabBarStylePadding_Test'),
            left: $r('app.float.SubTabBarStylePadding_Test'),
            right: $r('app.float.SubTabBarStylePadding_Test')
          } as Padding))
        .key('subTabBarStylePaddingResourceTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: this.bottomTabBarStylePaddingTopNumber,
            bottom: this.bottomTabBarStylePaddingBottomNumber,
            left: this.bottomTabBarStylePaddingLeftNumber,
            right: this.bottomTabBarStylePaddingRightNumber
          } as Padding))
        .key('bottomTabBarStylePaddingNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: this.bottomTabBarStylePaddingTopString,
            bottom: this.bottomTabBarStylePaddingBottomString,
            left: this.bottomTabBarStylePaddingLeftString,
            right: this.bottomTabBarStylePaddingRightString
          } as Padding))
        .key('bottomTabBarStylePaddingStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: $r('app.float.BottomTabBarStylePadding_Test'),
            bottom: $r('app.float.BottomTabBarStylePadding_Test'),
            left: $r('app.float.BottomTabBarStylePadding_Test'),
            right: $r('app.float.BottomTabBarStylePadding_Test')
          } as Padding))
        .key('bottomTabBarStylePaddingResourceTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .verticalAlign(this.bottomTabBarStyleVerticalAlign))
        .key('bottomTabBarStyleVerticalAlignTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .layoutMode(this.bottomTabBarStyleLayoutMode))
        .key('bottomTabBarStyleLayoutModeTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .symmetricExtensible(this.bottomTabBarStyleSymmetricExtensible))
        .key('bottomTabBarStyleSymmetricExtensibleTest')
      }
      .barMode(BarMode.Fixed)

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle(
            {
              overflow: this.bottomTabBarStyleLabelStyleOverflow,
              maxLines: this.bottomTabBarStyleLabelStyleMaxLines?.toInt(),
              heightAdaptivePolicy: this.bottomTabBarStyleLabelStyleHeightAdaptivePolicy,
              font: {
                size: $r('sys.float.ohos_id_text_size_caption'),
                weight: this.bottomTabBarStyleLabelStyleFontWeight,
                style: this.bottomTabBarStyleLabelStyleFontStyle
              }
            }))
        .key('bottomTabBarStyleLabelStyleTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: this.bottomTabBarStyleLabelStyleMinFontSizeNumber,
            maxFontSize: this.bottomTabBarStyleLabelStyleMaxFontSizeNumber,
            font: {
              size: this.bottomTabBarStyleLabelStyleFontSizeNumber,
              weight: this.bottomTabBarStyleLabelStyleFontWeightNumber.toInt(),
            }
          }))
        .key('bottomTabBarStyleLabelStyleNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: this.bottomTabBarStyleLabelStyleMinFontSizeString,
            maxFontSize: this.bottomTabBarStyleLabelStyleMaxFontSizeString,
            font: {
              size: this.bottomTabBarStyleLabelStyleFontSizeString,
              weight: this.bottomTabBarStyleLabelStyleFontWeightString,
              family: this.bottomTabBarStyleLabelStyleFontFamilyString,
            }
          }))
        .key('bottomTabBarStyleLabelStyleStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: ($r('app.float.BottomTabBarStyleLabelStyle_minFontSize_Test')),
            maxFontSize: ($r('app.float.BottomTabBarStyleLabelStyle_maxFontSize_Test')),
            font: {
              size: ($r('app.float.BottomTabBarStyleLabelStyle_Font_Size_Test')),
              family: ($r('app.string.BottomTabBarStyleLabelStyle_family_Test'))
            }
          }))
        .key('bottomTabBarStyleLabelStyleResourceTest')
      }

      Button("Top")
        .width($r('sys.float.ohos_id_subtab_top_padding'))
        .key("subTabBarDefaultTestTopJudge")

      Button("Right")
        .width($r('sys.float.ohos_id_subtab_horizontal_padding'))
        .key("subTabBarDefaultTestRightJudge")

      Button("Bottom")
        .width($r('sys.float.ohos_id_subtab_bottom_padding'))
        .key("subTabBarDefaultTestBottomJudge")

      Button("Left")
        .width($r('sys.float.ohos_id_subtab_horizontal_padding'))
        .key("subTabBarDefaultTestLeftJudge")

    }.backgroundColor(Color.Red).width('100%').height('100%')
  }
}