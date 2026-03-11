import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';

@Component
export struct TestPageHome {
  @State message: string = 'TestPageHome';
  param: Object = new Object();
  @Consume('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .height('5%')
          .id('MultiNavPathStackPushPath_text_home')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Component
export struct TestPageDetail {
  @State message: string = 'TestPageDetail';
  param: Object = new Object();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .id('MultiNavPathStackPushPath_text_detail')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Component
export struct TestPageFull {
  @State message: string = 'TestPageFull';
  param: Object = new Object();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .id('MultiNavPathStackPushPath_text_full')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Entry
@Component
struct MultiNavPathStackPushPath {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'TestPageHome') {
      TestPageHome({ param: param });
    } else if (name === 'TestPageDetail') {
      TestPageDetail({ param: param });
    } else if (name === 'TestPageFull') {
      TestPageFull({ param: param });
    }
  }

  aboutToAppear(): void {
    AppStorage.setOrCreate<MultiNavPathStack>('MultiNavPathStackPushPath', this.pageStack)
  }

  build() {
    Column() {
      Row() {
        Text('首页')
        MultiNavigation({ navDestination: this.PageMap, multiStack: this.pageStack })
          .id('MultiNavPathStackPushPath_MultiNavigation')
      }
      .width('100%')
    }
  }
}
