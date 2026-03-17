'use static';
import { Entry, Component, Column, Button, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LevelOrder } from '@ohos.promptAction';

@Entry
@Component
struct LevelOrderIndex {
  @State clampStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('LevelOrderIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('clamp')
        .id('levelOrderClampBtn')
        .onClick(() => {
          try {
            let order = LevelOrder.clamp(100);
            this.clampStatus = order !== undefined ? 'clamp_ok' : 'clamp_fail';
          } catch (error) {
            this.clampStatus = 'clamp_fail';
          }
        });
      Text(this.clampStatus).key('levelOrderClampStatus');
    }
    .width('100%')
    .height('100%');
  }
}
