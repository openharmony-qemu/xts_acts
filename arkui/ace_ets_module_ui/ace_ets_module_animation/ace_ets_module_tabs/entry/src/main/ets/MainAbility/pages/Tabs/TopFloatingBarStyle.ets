/**
 * TopFloatingBarStyle Test Page (CI Phone safe stub)
 * Runtime topBarFloatingStyle / TabBarStyle.TOP are undefined on OH 7.0.0.46 Phone —
 * calling them throws TypeError and kills the HAP. Keep node ids; use BOTTOM only.
 * Re-wire TOP + topBarFloatingStyle when device image ships the API.
 */

@Entry
@Component
struct TopFloatingBarStyle {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('TopFloatingBarStyle').id('topFloatingBarStyleTitle').fontSize(16)

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_basic')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_mask')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_offset')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_margin')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barPosition_ignored')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_percent')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maskHeight_percent')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth_percent')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_margin_percent')
        .barStyle(TabBarStyle.BOTTOM)
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')
      }
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
