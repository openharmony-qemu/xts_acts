@Entry
@Component
struct SplitNoClearPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageANoClear()
    } else if (name === 'pageB') {
      PageBNoClear()
    } else if (name === 'pageC') {
      PageCNoClear()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Button('splitnoclear_push_pageA')
          .id('splitnoclear_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('splitnoclear_push_pageB')
          .id('splitnoclear_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('splitnoclear_push_pageC')
          .id('splitnoclear_push_pageC')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageC' });
          })
          .margin(5)

        Button('splitnoclear_pop')
          .id('splitnoclear_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('splitnoclear_clear')
          .id('splitnoclear_clear')
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
    .title('SplitNoClear')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Split)
    .configuration({
      clearContentStackOnPrimaryNavigation: false
    })
  }
}

@Component
struct PageANoClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageA NoClear')
          .id('pageANoClearText')
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
struct PageBNoClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageB NoClear')
          .id('pageBNoClearText')
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
struct PageCNoClear {
  build() {
    NavDestination() {
      Column() {
        Text('PageC NoClear')
          .id('pageCNoClearText')
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
