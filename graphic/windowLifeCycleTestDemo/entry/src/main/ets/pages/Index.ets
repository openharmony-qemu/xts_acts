@Entry
@Component
struct Index {
  @State message: string = 'Hello World Index';

  build() {
    Column({space:10}) {
      Text(this.message)
        .id('AssistHelloWorld')
        .fontWeight(FontWeight.Bold)
    }
    .height('100%')
    .width('100%')
  }
}