'use static';
import { Entry, Component, Column, Text, DismissReason } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DismissReasonIndex {
  @State slideValue: string = '' + DismissReason.SLIDE;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('DismissReasonIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.slideValue).key('dismissReasonSlideValue');
    }
    .width('100%')
    .height('100%');
  }
}
