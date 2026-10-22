@Entry
@Component
struct TopFloatingBarIndex {
  build() {
    Column() {
      Text('Top Floating Tab Bar XTS Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
