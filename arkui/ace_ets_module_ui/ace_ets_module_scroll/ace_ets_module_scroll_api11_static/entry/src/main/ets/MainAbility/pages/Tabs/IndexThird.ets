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
  @State barGridAlignSmNumber: int = 0
  @State barGridAlignMdNumber: int = 0
  @State barGridAlignLgNumber: int = 0
  
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
  @State bottomTabBarStyleLabelStyleMaxLines: int = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleMaxFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleMaxFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleHeightAdaptivePolicy: TextHeightAdaptivePolicy =
    TextHeightAdaptivePolicy.MAX_LINES_FIRST
  @State bottomTabBarStyleLabelStyleFontSizeNumber: number = 0
  @State bottomTabBarStyleLabelStyleFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontWeight: FontWeight = FontWeight.Normal
  @State bottomTabBarStyleLabelStyleFontWeightNumber: int = 0
  @State bottomTabBarStyleLabelStyleFontWeightString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontFamilyString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontStyle: FontStyle = FontStyle.Normal
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("tabs page state change called:" + JSON.stringify(eventData));
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        }.tabBar(SubTabBarStyle.of("tab1")
          .padding(this.subTabBarStylePaddingNumber))
        .key('subTabBarNumberTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding(this.bottomTabBarStylePaddingNumber))
        .key('bottomTabBarNumberTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: this.barGridAlignMarginNumber,
        gutter: this.barGridAlignGutterNumber,
        sm: this.barGridAlignSmNumber,
        md: this.barGridAlignMdNumber,
        lg: this.barGridAlignLgNumber
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
              maxLines: this.bottomTabBarStyleLabelStyleMaxLines,
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
              weight: this.bottomTabBarStyleLabelStyleFontWeightNumber,
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

    }
  }
}