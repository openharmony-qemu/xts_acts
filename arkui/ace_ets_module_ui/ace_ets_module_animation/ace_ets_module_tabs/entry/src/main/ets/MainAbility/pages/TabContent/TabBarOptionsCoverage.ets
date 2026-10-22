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
struct TabBarOptionsCoverage {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('TabBarOptionsCoverage').id('tabBarOptionsCovTitle').fontSize(16)

        Text('TabBarOptions text normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_text_normal')
          .tabBar({ text: 'Home' } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_text_normal')
        .width('100%').height(120)

        Text('TabBarOptions text undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_text_undefined')
          .tabBar({ text: undefined } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_text_undefined')
        .width('100%').height(120)

        Text('TabBarOptions text null').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_text_null')
          .tabBar({ text: null as ESObject } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_text_null')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_normal')
          .tabBar({ text: 'Home', badge: { value: 8, maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_normal')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_undefined')
          .tabBar({
            text: 'Home',
            badge: { value: undefined, maxCount: 99 }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_undefined')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value null').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_null')
          .tabBar({
            text: 'Home',
            badge: { value: null as ESObject, maxCount: 99 }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_null')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_normal')
          .tabBar({ text: 'Home', badge: { value: 8, maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_normal')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_undefined')
          .tabBar({
            text: 'Home',
            badge: { value: 8, maxCount: undefined }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_undefined')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount null').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_null')
          .tabBar({
            text: 'Home',
            badge: { value: 8, maxCount: null as ESObject }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_null')
        .width('100%').height(120)

        Text('tabBar undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_tabBar_undefined')
          .tabBar(undefined)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBar_undefined')
        .width('100%').height(120)

        Text('tabBar null').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_tabBar_null')
          .tabBar(null)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBar_null')
        .width('100%').height(120)

        Text('tabBar default').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_default')
          .tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBar_default')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value ResourceStr').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_resourceStr')
          .tabBar({ text: 'Home', badge: { value: $r('app.string.tab_bar_badge_value'), maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_resourceStr')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount zero').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_zero')
          .tabBar({ text: 'Home', badge: { value: 8, maxCount: 0 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_zero')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value greater than maxCount').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_gt_maxCount')
          .tabBar({ text: 'Home', badge: { value: 200, maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_gt_maxCount')
        .width('100%').height(120)

        Text('BottomTabBarStyle badge normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_bottomTabBar_badge')
          .tabBar(new BottomTabBarStyle($r('app.media.icon'), 'Home').badge({ value: 8, maxCount: 99 } as TabBarBadgeStyle))
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_bottomTabBar_badge')
        .width('100%').height(120)

        Text('BottomTabBarStyle badge undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_bottomTabBar_badge_undefined')
          .tabBar(new BottomTabBarStyle($r('app.media.icon'), 'Home').badge({} as TabBarBadgeStyle))
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_bottomTabBar_badge_undefined')
        .width('100%').height(120)
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}