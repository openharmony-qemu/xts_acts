'use static';
import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import uiExtension from '@ohos.arkui.uiExtension';

@Entry
@Component
struct RectChangeReasonIndex {
  @State hostWindowRectChangeValue: string = '' + uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('RectChangeReasonIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.hostWindowRectChangeValue).key('rectChangeReasonHostWindowRectChangeValue');
    }
    .width('100%')
    .height('100%');
  }
}
