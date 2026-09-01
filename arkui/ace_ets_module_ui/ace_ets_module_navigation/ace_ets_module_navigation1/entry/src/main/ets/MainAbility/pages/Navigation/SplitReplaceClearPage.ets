@Entry
@Component
struct SplitReplaceClearPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageAReplace()
    } else if (name === 'pageB') {
      PageBReplace()
    } else if (name === 'pageC') {
      PageCReplace()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Button('splitrep_push_pageA')
          .id('splitrep_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('splitrep_push_pageB')
          .id('splitrep_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('splitrep_replace_pageC')
          .id('splitrep_replace_pageC')
          .onClick(() => {
            this.navPathStack.replacePath({ name: 'pageC' });
          })
          .margin(5)

        Button('splitrep_replaceByName_pageC')
          .id('splitrep_replaceByName_pageC')
          .onClick(() => {
            this.navPathStack.replacePathByName('pageC', null);
          })
          .margin(5)

        Button('splitrep_pop')
          .id('splitrep_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('splitrep_clear')
          .id('splitrep_clear')
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
    .title('SplitReplaceClear')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Split)
    .configuration({
      clearContentStackOnPrimaryNavigation: true
    })
  }
}

@Component
struct PageAReplace {
  build() {
    NavDestination() {
      Column() {
        Text('PageA ReplaceClear')
          .id('pageAReplaceText')
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
struct PageBReplace {
  build() {
    NavDestination() {
      Column() {
        Text('PageB ReplaceClear')
          .id('pageBReplaceText')
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
struct PageCReplace {
  build() {
    NavDestination() {
      Column() {
        Text('PageC ReplaceClear')
          .id('pageCReplaceText')
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
