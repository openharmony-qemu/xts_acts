// xxx.ets
@Entry
@Component
struct LayoutGravityNullUndefinedTest {
  @State layoutGravityValue: LocalizedAlignment | null | undefined = LocalizedAlignment.TOP_START;

  build() {
    Column() {
      Row() {
        Button("TOP")
          .onClick(() => {
            this.layoutGravityValue = LocalizedAlignment.TOP;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_valid')

        Button("null")
          .onClick(() => {
            this.layoutGravityValue = null;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_null')

        Button("undefined")
          .onClick(() => {
            this.layoutGravityValue = undefined;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_undefined')
      }

      Stack({
        alignContent: Alignment.TopStart
      }) {
        Text('Child Text')
          .width(150)
          .height(150)
          .backgroundColor(Color.Yellow)
          .fontSize(15)
          .layoutGravity(this.layoutGravityValue)
          .id('LayoutGravityNullUndefinedTest_text')
      }
      .width('100%')
      .height(200)
      .backgroundColor(Color.Grey)
    }
    .height('100%')
  }
}