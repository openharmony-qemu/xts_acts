/**
 * TopFloatingBarStyle Test Page
 * Test topBarFloatingStyle with valid parameters when barStyle(TOP)
 */

@Entry
@Component
struct TopFloatingBarStyle {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('TopFloatingBarStyle').id('topFloatingBarStyleTitle').fontSize(16)

        // AC-1.1: barStyle(TOP) + topBarFloatingStyle({barWidth, maskColor, maskHeight})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_basic')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({
          barWidth: 400,
          maskColor: '#33000000',
          maskHeight: 200
        })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.1: topBarFloatingStyle({barWidth: 400})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: 400 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.2: topBarFloatingStyle({maskColor, maskHeight})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_mask')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({
          maskColor: '#33000000',
          maskHeight: 200
        })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.4: topBarFloatingStyle({maxWidth: 500})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ maxWidth: 500 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.5: topBarFloatingStyle({offset: {x: 20, y: 0}})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_offset')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ offset: { x: 20, y: 0 } })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.7: topBarFloatingStyle({barSideMargin, barTopMargin})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_margin')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({
          barSideMargin: 16,
          barTopMargin: 8
        })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.1 percent: topBarFloatingStyle({barWidth: '50%'})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_percent')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: '50%' })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.2 percent: topBarFloatingStyle({maskHeight: '20%'})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maskHeight_percent')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ maskHeight: '20%' })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.4 percent: topBarFloatingStyle({maxWidth: '80%'})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth_percent')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ maxWidth: '80%' })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-3.7 percent: topBarFloatingStyle({barSideMargin: '5%', barTopMargin: '2%'})
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_margin_percent')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({
          barSideMargin: '5%',
          barTopMargin: '2%'
        })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        // AC-1.3: barPosition(Start) ignored when barStyle(TOP)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barPosition_ignored')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: 400 })
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
