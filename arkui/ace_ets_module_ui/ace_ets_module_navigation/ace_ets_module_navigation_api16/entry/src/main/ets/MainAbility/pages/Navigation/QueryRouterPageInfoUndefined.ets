@Component
struct test {
  build() {
    Button('queryRouterPageInfo')
      .onClick(() => {
        let undefinedValue = this.queryRouterPageInfo();
        console.log('test queryRouterPageInfo: ', JSON.stringify(undefinedValue))
        AppStorage.setOrCreate('undefinedValue', undefinedValue)
      })
  }
}

@Entry
@Component
struct QueryRouterPageInfoUndefined {
  @State isShow: boolean = false;
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      test()
      Button('change height')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500;
        })

      Button('Set Illegal height')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = -1;
        })

      Button('close modal 1')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('transitionModal')
        .onClick(() => {
          this.isShow = true;
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: this.sheetHeight,
          backgroundColor: Color.Green,
          preferType: SheetType.CENTER,
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.');
          },
          onAppear: () => {
            console.log('BindSheet onAppear.');
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.');
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.');
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}