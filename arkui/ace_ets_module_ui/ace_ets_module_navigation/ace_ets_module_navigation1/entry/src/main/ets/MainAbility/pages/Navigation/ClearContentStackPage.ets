@Entry
@Component
struct ClearContentStackPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();
  @State enableClear: boolean = true;

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageA()
    } else if (name === 'pageB') {
      PageB()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Row() {
          Button('enableClear_true')
            .id('enableClear_true')
            .onClick(() => {
              this.enableClear = true;
            })
            .margin(5)

          Button('enableClear_false')
            .id('enableClear_false')
            .onClick(() => {
              this.enableClear = false;
            })
            .margin(5)
        }

        Button('push_pageA')
          .id('push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('push_pageB')
          .id('push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('pop_to_navbar')
          .id('pop_to_navbar')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('clear_all')
          .id('clear_all')
          .onClick(() => {
            this.navPathStack.clear();
          })
          .margin(5)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('ClearContentStack')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
    .configuration({
      clearContentStackOnPrimaryNavigation: this.enableClear
    })
  }
}

@Component
struct PageA {
  build() {
    NavDestination() {
      Column() {
        Text('PageA')
          .id('pageAText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageA')
  }
}

@Component
struct PageB {
  build() {
    NavDestination() {
      Column() {
        Text('PageB')
          .id('pageBText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageB')
  }
}
