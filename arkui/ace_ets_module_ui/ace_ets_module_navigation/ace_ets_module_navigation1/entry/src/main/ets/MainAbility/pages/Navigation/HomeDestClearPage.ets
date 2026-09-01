@Entry
@Component
struct HomeDestClearPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();
  @State enableClear: boolean = true;

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'home') {
      HomeDest()
    } else if (name === 'pageA') {
      PageAHome()
    } else if (name === 'pageB') {
      PageBHome()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack, { name: 'home' }) {
      Column() {
        Row() {
          Button('home_enableClear_true')
            .id('home_enableClear_true')
            .onClick(() => {
              this.enableClear = true;
            })
            .margin(5)

          Button('home_enableClear_false')
            .id('home_enableClear_false')
            .onClick(() => {
              this.enableClear = false;
            })
            .margin(5)
        }

        Button('home_push_pageA')
          .id('home_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('home_push_pageB')
          .id('home_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('home_pop')
          .id('home_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('home_clear')
          .id('home_clear')
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
    .title('HomeDestClear')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
    .configuration({
      clearContentStackOnPrimaryNavigation: this.enableClear
    })
  }
}

@Component
struct HomeDest {
  build() {
    NavDestination() {
      Column() {
        Text('Home Destination')
          .id('homeDestText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('Home')
  }
}

@Component
struct PageAHome {
  build() {
    NavDestination() {
      Column() {
        Text('PageA Home')
          .id('pageAHomeText')
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
struct PageBHome {
  build() {
    NavDestination() {
      Column() {
        Text('PageB Home')
          .id('pageBHomeText')
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
