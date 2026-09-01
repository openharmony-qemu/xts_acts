@Entry
@Component
struct SplitClearPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageAClear()
    } else if (name === 'pageB') {
      PageBClear()
    } else if (name === 'pageC') {
      PageCClear()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Button('split_push_pageA')
          .id('split_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('split_push_pageB')
          .id('split_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('split_push_pageC')
          .id('split_push_pageC')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageC' });
          })
          .margin(5)

        Button('split_pop')
          .id('split_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('split_clear')
          .id('split_clear')
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
    .title('SplitClear')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Split)
    .configuration({
      clearContentStackOnPrimaryNavigation: true
    })
  }
}

@Component
struct PageAClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageA SplitClear')
          .id('pageAClearText')
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
struct PageBClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageB SplitClear')
          .id('pageBClearText')
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

@Component
struct PageCClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageC SplitClear')
          .id('pageCClearText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageC')
  }
}
