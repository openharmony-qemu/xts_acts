import { BusinessError } from '@ohos.base'

class DestParam {
  public id: number = 0;
  public label: string = '';
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

@Entry
@Component
struct NavPushReplacePage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageOne') {
      PageOne()
    } else if (name === 'pageTwo') {
      PageTwo()
    } else if (name === 'pageThree') {
      PageThree()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Scroll() {
        Column() {
          Button('pushPath_name_only')
          .id('pushPath_name_only')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne' });
          })
          .margin(5)

        Button('pushPath_with_param')
          .id('pushPath_with_param')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne', param: new DestParam(1, 'testParam') });
          })
          .margin(5)

        Button('pushPath_standard')
          .id('pushPath_standard')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.STANDARD });
          })
          .margin(5)

        Button('pushPath_moveToTopSingleton')
          .id('pushPath_moveToTopSingleton')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
          })
          .margin(5)

        Button('pushPath_popToSingleton')
          .id('pushPath_popToSingleton')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageTwo' }, { launchMode: LaunchMode.POP_TO_SINGLETON });
          })
          .margin(5)

        Button('pushPath_newInstance')
          .id('pushPath_newInstance')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.NEW_INSTANCE });
          })
          .margin(5)

        Button('replacePath_name_only')
          .id('replacePath_name_only')
          .onClick(() => {
            this.navPathStack.replacePath({ name: 'pageTwo' });
          })
          .margin(5)

        Button('replacePath_with_param')
          .id('replacePath_with_param')
          .onClick(() => {
            this.navPathStack.replacePath({ name: 'pageTwo', param: new DestParam(2, 'replaceParam') });
          })
          .margin(5)

        Button('replacePath_standard')
          .id('replacePath_standard')
          .onClick(() => {
            this.navPathStack.replacePath({ name: 'pageTwo' }, { launchMode: LaunchMode.STANDARD });
          })
          .margin(5)

        Button('replacePath_moveToTopSingleton')
          .id('replacePath_moveToTopSingleton')
          .onClick(() => {
            this.navPathStack.replacePath({ name: 'pageTwo' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
          })
          .margin(5)

        Button('pushPathByName_null')
          .id('pushPathByName_null')
          .onClick(() => {
            this.navPathStack.pushPathByName('pageOne', null);
          })
          .margin(5)

        Button('pushPathByName_with_param')
          .id('pushPathByName_with_param')
          .onClick(() => {
            this.navPathStack.pushPathByName('pageOne', new DestParam(3, 'byNameParam'));
          })
          .margin(5)

        Button('replacePathByName_null')
          .id('replacePathByName_null')
          .onClick(() => {
            this.navPathStack.replacePathByName('pageTwo', null);
          })
          .margin(5)

        Button('replacePathByName_with_param')
          .id('replacePathByName_with_param')
          .onClick(() => {
            this.navPathStack.replacePathByName('pageTwo', new DestParam(4, 'replaceByNameParam'));
          })
          .margin(5)

        Button('pushDestination_basic')
          .id('pushDestination_basic')
          .onClick(() => {
            this.navPathStack.pushDestination({ name: 'pageOne' }).then(() => {
              AppStorage.setOrCreate<string>('pushDestinationResult', 'resolved');
            }).catch((err: BusinessError) => {
              AppStorage.setOrCreate<string>('pushDestinationResult', 'rejected:' + err.code);
            });
          })
          .margin(5)

        Button('pushDestination_with_launchMode')
          .id('pushDestination_with_launchMode')
          .onClick(() => {
            this.navPathStack.pushDestination({ name: 'pageOne' }, { launchMode: LaunchMode.STANDARD }).then(() => {
              AppStorage.setOrCreate<string>('pushDestinationLaunchModeResult', 'resolved');
            }).catch((err: BusinessError) => {
              AppStorage.setOrCreate<string>('pushDestinationLaunchModeResult', 'rejected:' + err.code);
            });
          })
          .margin(5)

        Button('pushDestinationByName_null')
          .id('pushDestinationByName_null')
          .onClick(() => {
            this.navPathStack.pushDestinationByName('pageOne', null).then(() => {
              AppStorage.setOrCreate<string>('pushDestinationByNameResult', 'resolved');
            }).catch((err: BusinessError) => {
              AppStorage.setOrCreate<string>('pushDestinationByNameResult', 'rejected:' + err.code);
            });
          })
          .margin(5)

        Button('pushDestinationByName_with_param')
          .id('pushDestinationByName_with_param')
          .onClick(() => {
            this.navPathStack.pushDestinationByName('pageOne', new DestParam(5, 'asyncByNameParam')).then(() => {
              AppStorage.setOrCreate<string>('pushDestinationByNameParamResult', 'resolved');
            }).catch((err: BusinessError) => {
              AppStorage.setOrCreate<string>('pushDestinationByNameParamResult', 'rejected:' + err.code);
            });
          })
          .margin(5)

        Button('pop')
          .id('popBtn')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('clear')
          .id('clearBtn')
          .onClick(() => {
            this.navPathStack.clear();
          })
          .margin(5)
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('NavPushReplace')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
  }
}

@Component
struct PageOne {
  build() {
    NavDestination() {
      Column() {
        Text('PageOne Content')
          .id('pageOneText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageOne')
  }
}

@Component
struct PageTwo {
  build() {
    NavDestination() {
      Column() {
        Text('PageTwo Content')
          .id('pageTwoText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageTwo')
  }
}

@Component
struct PageThree {
  build() {
    NavDestination() {
      Column() {
        Text('PageThree Content')
          .id('pageThreeText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageThree')
  }
}
