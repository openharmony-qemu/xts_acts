/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct TabsSidebarStyle {
  @State emptyStrValue: ESObject = '';

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('TabsSidebarStyle').id('tabsSidebarStyleTitle').fontSize(16)
        this.barStyleBlocks()
        this.sidebarPositionBlocks()
        this.sidebarWidthBlocks()
        this.minSidebarWidthBlocks()
        this.maxSidebarWidthBlocks()
        this.minContentWidthBlocks()
        this.sidebarBackgroundColorBlocks()
        this.sidebarBackgroundBlurStyleBlocks()
        this.sidebarDividerBlocks()
        this.sidebarSelectedIconColorBlocks()
        this.sidebarSelectedTextColorBlocks()
        this.sidebarUnselectedIconColorBlocks()
        this.sidebarUnselectedTextColorBlocks()
        this.sidebarSelectedBoardColorBlocks()
        this.showSidebarControlButtonBlocks()
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  barStyleBlocks() {
        Text('barStyle normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_barStyle_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)

        Text('barStyle undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_barStyle_undefined')
        .width('100%')
        .height(120)
        .barStyle(undefined)

        Text('barStyle null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_barStyle_null')
        .width('100%')
        .height(120)
        .barStyle(null)
  }

  @Builder
  sidebarPositionBlocks() {
        Text('sidebarPosition normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarPosition_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarPosition(BarPosition.Start)

        Text('sidebarPosition undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarPosition_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarPosition(undefined)

        Text('sidebarPosition null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarPosition_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarPosition(null)
  }

  @Builder
  sidebarWidthBlocks() {
        Text('sidebarWidth normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarWidth_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarWidth(240)

        Text('sidebarWidth undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarWidth_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarWidth(undefined)

        Text('sidebarWidth null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarWidth_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarWidth(null)
  }

  @Builder
  minSidebarWidthBlocks() {
        Text('minSidebarWidth normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minSidebarWidth_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minSidebarWidth(200)

        Text('minSidebarWidth undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minSidebarWidth_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minSidebarWidth(undefined)

        Text('minSidebarWidth null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minSidebarWidth_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minSidebarWidth(null)
  }

  @Builder
  maxSidebarWidthBlocks() {
        Text('maxSidebarWidth normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_maxSidebarWidth_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .maxSidebarWidth(320)

        Text('maxSidebarWidth undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_maxSidebarWidth_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .maxSidebarWidth(undefined)

        Text('maxSidebarWidth null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_maxSidebarWidth_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .maxSidebarWidth(null)
  }

  @Builder
  minContentWidthBlocks() {
        Text('minContentWidth normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minContentWidth_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minContentWidth(360)

        Text('minContentWidth undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minContentWidth_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minContentWidth(undefined)

        Text('minContentWidth null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_minContentWidth_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .minContentWidth(null)
  }

  @Builder
  sidebarBackgroundColorBlocks() {
        Text('sidebarBackgroundColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundColor(Color.White)

        Text('sidebarBackgroundColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundColor(undefined)

        Text('sidebarBackgroundColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundColor(null)
  }

  @Builder
  sidebarBackgroundBlurStyleBlocks() {
        Text('sidebarBackgroundBlurStyle normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundBlurStyle_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THICK)

        Text('sidebarBackgroundBlurStyle undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundBlurStyle_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundBlurStyle(undefined)

        Text('sidebarBackgroundBlurStyle null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBackgroundBlurStyle_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBackgroundBlurStyle(null)
  }

  @Builder
  sidebarDividerBlocks() {
        Text('sidebarDivider normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarDivider_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDivider({ strokeWidth: 1, color: '#33000000', startMargin: 0, endMargin: 0 })

        Text('sidebarDivider undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarDivider_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDivider(undefined)

        Text('sidebarDivider null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarDivider_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDivider(null)
  }

  @Builder
  sidebarSelectedIconColorBlocks() {
        Text('sidebarSelectedIconColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedIconColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedIconColor('#007DFF')

        Text('sidebarSelectedIconColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedIconColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedIconColor(undefined)

        Text('sidebarSelectedIconColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedIconColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedIconColor(null)
  }

  @Builder
  sidebarSelectedTextColorBlocks() {
        Text('sidebarSelectedTextColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedTextColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedTextColor('#007DFF')

        Text('sidebarSelectedTextColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedTextColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedTextColor(undefined)

        Text('sidebarSelectedTextColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedTextColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedTextColor(null)
  }

  @Builder
  sidebarUnselectedIconColorBlocks() {
        Text('sidebarUnselectedIconColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedIconColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedIconColor('#182431')

        Text('sidebarUnselectedIconColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedIconColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedIconColor(undefined)

        Text('sidebarUnselectedIconColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedIconColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedIconColor(null)
  }

  @Builder
  sidebarUnselectedTextColorBlocks() {
        Text('sidebarUnselectedTextColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedTextColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedTextColor('#182431')

        Text('sidebarUnselectedTextColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedTextColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedTextColor(undefined)

        Text('sidebarUnselectedTextColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedTextColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedTextColor(null)
  }

  @Builder
  sidebarSelectedBoardColorBlocks() {
        Text('sidebarSelectedBoardColor normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedBoardColor_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedBoardColor('#0A007DFF')

        Text('sidebarSelectedBoardColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedBoardColor_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedBoardColor(undefined)

        Text('sidebarSelectedBoardColor null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarSelectedBoardColor_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedBoardColor(null)
  }

  @Builder
  showSidebarControlButtonBlocks() {
        Text('showSidebarControlButton true').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_showSidebarControlButton_true')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .showSidebarControlButton(true)

        Text('showSidebarControlButton false').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_showSidebarControlButton_false')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .showSidebarControlButton(false)

        Text('showSidebarControlButton undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_showSidebarControlButton_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .showSidebarControlButton(undefined)

        Text('showSidebarControlButton null').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_showSidebarControlButton_null')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .showSidebarControlButton(null)

        Text('showSidebarControlButton empty').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_showSidebarControlButton_empty')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .showSidebarControlButton(this.emptyStrValue)
  }

}
