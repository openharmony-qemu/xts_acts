/**
 * TopFloatingBarInvalid Test Page
 * Test topBarFloatingStyle with invalid parameters (negative, NaN)
 */

@Entry
@Component
struct TopFloatingBarInvalid {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('TopFloatingBarInvalid').id('topFloatingBarInvalidTitle').fontSize(16)

        // AC-1.6: barWidth negative (-100) ignored, fallback to default
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: -100 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-1.6: barWidth NaN ignored, fallback to default
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_nan')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: NaN })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-1.7: barSideMargin negative ignored, fallback to default
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_sideMargin_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barSideMargin: -16 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-1.7: barTopMargin negative ignored, fallback to default
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_topMargin_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barTopMargin: -8 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.4: maxWidth negative ignored, fallback to default
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ maxWidth: -1 })
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
