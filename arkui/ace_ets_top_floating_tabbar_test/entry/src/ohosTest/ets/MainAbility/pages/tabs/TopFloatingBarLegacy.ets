/**
 * TopFloatingBarLegacy Test Page
 * Test legacy styles (BOTTOM/SIDEBAR) no regression and BOTTOM ignores topBarFloatingStyle
 */
@Entry
@Component
struct TopFloatingBarLegacy {
  build() {
    Column({ space: 10 }) {
      // AC-2.2: barStyle(BOTTOM) no regression
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
      }
      .id('tabs_legacy_bottom')
      .barStyle(TabBarStyle.BOTTOM)
      .barMode(BarMode.Scrollable)
      .height('25%')
      .width('100%')

      // AC-2.2: barStyle(SIDEBAR) no regression
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
      }
      .id('tabs_legacy_sidebar')
      .barStyle(TabBarStyle.SIDEBAR)
      .barMode(BarMode.Scrollable)
      .height('25%')
      .width('100%')

      // ER19: BOTTOM + topBarFloatingStyle ignored
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
      }
      .id('tabs_legacy_bottom_ignores_top_floating')
      .barStyle(TabBarStyle.BOTTOM)
      .topBarFloatingStyle({
        barWidth: 400,
        maskColor: '#33000000',
        maskHeight: 200
      })
      .barMode(BarMode.Scrollable)
      .height('25%')
      .width('100%')
    }
    .padding(5)
    .backgroundColor('#F5F5F5')
    .height('100%')
    .width('100%')
  }
}
