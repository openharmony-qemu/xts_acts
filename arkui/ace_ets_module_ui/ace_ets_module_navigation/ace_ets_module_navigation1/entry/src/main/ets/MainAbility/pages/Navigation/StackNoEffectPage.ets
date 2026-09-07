@Entry
@Component
struct StackNoEffectPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageAStack()
    } else if (name === 'pageB') {
      PageBStack()
    } else if (name === 'pageC') {
      PageCStack()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Button('stack_push_pageA')
          .id('stack_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('stack_push_pageB')
          .id('stack_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('stack_push_pageC')
          .id('stack_push_pageC')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageC' });
          })
          .margin(5)

        Button('stack_pop')
          .id('stack_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('stack_clear')
          .id('stack_clear')
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
    .title('StackNoEffect')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
    .configuration({
      clearContentStackOnPrimaryNavigation: true
    })
  }
}

@Component
struct PageAStack {
  build() {
    NavDestination() {
      Column() {
        Text('PageA Stack')
          .id('pageAStackText')
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
struct PageBStack {
  build() {
    NavDestination() {
      Column() {
        Text('PageB Stack')
          .id('pageBStackText')
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
struct PageCStack {
  build() {
    NavDestination() {
      Column() {
        Text('PageC Stack')
          .id('pageCStackText')
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
