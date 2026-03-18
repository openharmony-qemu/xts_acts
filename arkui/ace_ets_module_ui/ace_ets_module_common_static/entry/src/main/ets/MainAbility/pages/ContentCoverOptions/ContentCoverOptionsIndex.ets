'use static';

import {
  Entry,
  Component,
  Builder,
  Column,
  Button,
  Color,
  FlexAlign,
  ContentCoverOptions,
  ModalTransition
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ContentCoverOptionsIndex {
  @State isShowContentCover: boolean = false;
  @State safeArea: boolean = true;

  @Builder
  contentCoverBuilder() {
    Column() {
      Button('change SafeArea')
        .fontSize(20)
        .id('Button1')
        .onClick(() => {
          this.safeArea = !this.safeArea;
        });
    }
    .id('SafeArea')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%');
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ContentCoverOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    let coverOptions = {
      modalTransition: ModalTransition.ALPHA,
      backgroundColor: Color.Red,
      enableSafeArea: this.safeArea
    } as ContentCoverOptions;

    Column() {
      Button('Open ContentCover')
        .onClick(() => {
          this.isShowContentCover = true;
        })
        .id('Button')
        .fontSize(20)
        .margin(10)
        .bindContentCover(this.isShowContentCover, this.contentCoverBuilder, coverOptions);
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%');
  }
}
