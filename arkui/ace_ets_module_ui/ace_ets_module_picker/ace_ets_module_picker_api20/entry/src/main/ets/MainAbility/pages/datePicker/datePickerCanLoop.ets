@Entry
@Component
struct DatePickerCanLoop {
  @State isLoop: boolean | null | undefined = true;

  build() {
    Column() {
      DatePicker({
        start: new Date("2024-1-1"),
        end: new Date("2025-12-31"),
        selected: new Date("2024-1-1"),
      })
        .id('datePicker')
        .height('50%')
        .canLoop(this.isLoop)
        .onDateChange((value: Date) => {
          console.info("DatePicker:onDateChange()" + value.toString());
            let strJson = getInspectorByKey('datePicker');
            let obj: ESObject = JSON.parse(strJson);
            console.info('DatePickerDialogCanLoopTest_0100 component obj is: ' + obj.$attrs.canLoop);
        })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('true')
          .onClick(() => {
            this.isLoop = true
          })
          .id('trueID')

        Button('false')
          .onClick(() => {
            this.isLoop = false
          })
          .id('falseID')

        Button('null')
          .onClick(() => {
            this.isLoop = null
          })
          .id('nullID')

        Button('undefined')
          .onClick(() => {
            this.isLoop = undefined
          })
          .id('undefinedID')

      }.width('100%').margin({ top: 30 })
    }.width('100%')
  }
}