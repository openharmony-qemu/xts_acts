@Entry
@Component
struct ColumnGesture1 {
  @State monopolize: boolean = true
  @State logMsg1: string = ''
  @State logMsg2: string = ''
  build() {
    Scroll(){
      Column({space:20}) {
        Text("monopolize--" + this.monopolize)
          .fontSize(20)
        Text(this.logMsg1 + ";" + this.logMsg2)
          .id('columnText')
          .fontSize(20)
          .fontColor(Color.Pink)
        Column(){}
        .id('column1')
        .width('11%')
        .height('9%')
        .backgroundColor(Color.Pink)
        .monopolizeEvents(this.monopolize)
        .gesture(
          LongPressGesture()
            .onAction((event: GestureEvent) => {
              if (event) {
                console.info('长按触发')
                this.logMsg1 = 'LongPressGesture onAction success'
              }
            })
        )
        Column(){}
        .id('column2')
        .backgroundColor(Color.Blue)
        .width('11%')
        .height('9%')
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                console.info('tap触发')
                this.logMsg2 = 'TapGesture success'
              }
            })
        )
        Button('change monopolize')
          .id('buttonBoolean')
          .width('22%')
          .height('9%')
          .onClick(()=>{
            console.info('按钮触发')
            this.monopolize = !this.monopolize
          })
        Button('clean')
          .id('button_clean')
          .width('22%')
          .height('9%')
          .onClick(()=>{
            this.logMsg1 = ''
            this.logMsg2 = ''
          })
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
    }.height('90%').width('100%')
  }
}