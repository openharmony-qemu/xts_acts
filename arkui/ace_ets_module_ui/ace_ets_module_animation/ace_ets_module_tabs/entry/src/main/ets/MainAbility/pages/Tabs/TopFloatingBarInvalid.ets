/**
 * TopFloatingBarInvalid Test Page (CI Phone safe stub)
 * Same as TopFloatingBarStyle: omit topBarFloatingStyle / TabBarStyle.TOP on CI Phone.
 */

@Entry
@Component
struct TopFloatingBarInvalid {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('TopFloatingBarInvalid').id('topFloatingBarInvalidTitle').fontSize(16)

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_negative')
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
        .id('tabs_top_barWidth_nan')
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
        .id('tabs_top_sideMargin_negative')
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
        .id('tabs_top_topMargin_negative')
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
        .id('tabs_top_maxWidth_negative')
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
