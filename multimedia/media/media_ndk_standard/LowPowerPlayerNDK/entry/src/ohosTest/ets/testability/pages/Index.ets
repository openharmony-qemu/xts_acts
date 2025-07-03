@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {

    Column() {
      Row() {
        XComponent({
          id: 'player',
          type: XComponentType.SURFACE,
          libraryname: 'player'
        })
          .height("100%")
          .width("100%")
          .zIndex(0)
      }
      .width("100%")
      .height(400)
      // .aspectRatio(16/9)
      .backgroundColor('#ffe30b0b')


      Row() {
        XComponent({
          id: 'playerRed',
          type: XComponentType.SURFACE,
          libraryname: 'playerRed'
        })
          .height("100%")
          .width("100%")
          .zIndex(0)
      }
      .width("100%")
      .height(200)
      .margin({ top: 20 })
      // .aspectRatio(16/9)
      .backgroundColor('#ff99de5f')
    }
    .backgroundColor('white')
    .width('100%')
    .height('100%')
    .padding({ top: 40 })
  }
}