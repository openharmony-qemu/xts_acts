@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('Top Floating Tab Bar XTS Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
