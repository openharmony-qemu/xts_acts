@Entry
@Component
struct getRectsForRange {
  controller: RichEditorController = new RichEditorController();
  @State str: string = ''
  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan("1234567890", {
            style: {
              fontColor: Color.Pink,
              fontSize: "30vp",
              fontWeight: FontWeight.Normal,
              letterSpacing: '20vp'
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 20
            }
          })
        })
        .width("100%")
        .height("20%")
        .border({ width: 1, radius: 5 })
        .draggable(false)

      Row(){
        Button(this.str)
          .key("getRectsForRange_Key")
          .onClick(() => {
            let layoutManager: LayoutManager = this.controller.getLayoutManager()
            if(layoutManager){
              let boxes = layoutManager.getRectsForRange({start:0,end:4}, 0, 0)
              AppStorage.setOrCreate('rectsForRangeList1',boxes)
              if (boxes) {
                this.str = "getRectsForRange successful"
              }
            }
          })
        Button('getRectsForRangeList2')
          .key("getRectsForRange_Key2")
          .onClick(() => {
            let layoutManager: LayoutManager = this.controller.getLayoutManager()
            if(layoutManager){
              let boxes = layoutManager.getRectsForRange({start:0,end:0}, 0, 0)
              AppStorage.setOrCreate('rectsForRangeList2',boxes)
            }
          })
      }
    }
  }
}