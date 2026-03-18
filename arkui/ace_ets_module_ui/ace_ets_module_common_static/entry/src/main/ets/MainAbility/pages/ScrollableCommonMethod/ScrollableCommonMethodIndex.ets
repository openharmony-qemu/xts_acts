'use static';
import { Entry, Component, Column, Button, Text, Scroll } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ScrollableCommonMethodIndex {
  @State scrollBarColorStatus: string = 'init';

  private hasScrollableInspectorInfo(): boolean {
    try {
      return inspector.getInspectorByKey('scrollableCommonMethodTargetKey').length > 0;
    } catch (error) {
      return false;
    }
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ScrollableCommonMethodIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Scroll() {
        Text('scrollable_common_content');
      }
      .id('scrollableCommonMethodTarget')
      .key('scrollableCommonMethodTargetKey')
      .scrollBarColor('#ff0000')
      .height(60);
    }
    .width('100%')
    .height('100%');
  }
}
