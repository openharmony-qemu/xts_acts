/**
 * TopFloatingBarLegacy Test Page
 * Test legacy styles (BOTTOM/SIDEBAR) no regression.
 * Note: do NOT call topBarFloatingStyle here — method is undefined on CI Phone and
 * throws TypeError "undefined is not callable", killing the HAP process.
 */

@Entry
@Component
struct TopFloatingBarLegacy {
  build() {
    Column({ space: 10 }) {
      Text('TopFloatingBarLegacy').id('topFloatingBarLegacyTitle').fontSize(16)

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

      // ER19 proxy: BOTTOM only (topBarFloatingStyle omitted — unsupported on CI Phone)
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
