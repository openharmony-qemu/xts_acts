'use static';
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
import {
  Entry, Component, Column, Text, Scroll, Tabs, TabContent,
  TabBarStyle, BarPosition, Color, BlurStyle, wrapBuilder
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@ohos.arkui.node';

@Builder
function footerBuilder() {
  Text('FooterContent').id('sidebar_footer_text').fontSize(12)
}

@Builder
function bottomBarBuilder() {
  Text('BottomBarContent').id('sidebar_bottombar_text').fontSize(12)
}

@Entry
@Component
struct TabsSidebarStyle {
  footerContent: ComponentContent<undefined> =
    new ComponentContent<undefined>(this.getUIContext(), wrapBuilder(footerBuilder));
  bottomBarContent: ComponentContent<undefined> =
    new ComponentContent<undefined>(this.getUIContext(), wrapBuilder(bottomBarBuilder));
  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsSidebarStyle] router error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
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
        this.sidebarFooterBlocks()
        this.sidebarBottomBarBlocks()
      }
      .width('100%')
      .padding(8)
    }
    .padding(10)
    .margin(10)
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
  }

  @Builder
  sidebarFooterBlocks() {
        Text('sidebarFooter normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarFooter_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarFooter(this.footerContent)

        Text('sidebarFooter undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarFooter_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarFooter(undefined)
  }

  @Builder
  sidebarBottomBarBlocks() {
        Text('sidebarBottomBar normal').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBottomBar_normal')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBottomBar(this.bottomBarContent)

        Text('sidebarBottomBar undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }.tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_sidebarBottomBar_undefined')
        .width('100%')
        .height(120)
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarBottomBar(undefined)
  }

}
