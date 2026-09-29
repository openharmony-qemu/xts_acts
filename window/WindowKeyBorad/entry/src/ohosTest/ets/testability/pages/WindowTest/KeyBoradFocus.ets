@Entry
@Component
struct KeyBoradFocus {
  @State text: string = '';

  build() {
    Column({ space: 20 }) {
      TextInput({ text: this.text, placeholder: 'input your word...' })
        .id('textInput')
        .placeholderColor(Color.Grey)
        .width('90%')
        .height(40)
        .fontSize(16)
        .onChange((value: string) => {
          this.text = value;
        })
      Button('switch focus')
        .id('focusTarget')
        .width('60%')
        .height(40)
    }
    .width('100%')
    .height('100%')
  }
}