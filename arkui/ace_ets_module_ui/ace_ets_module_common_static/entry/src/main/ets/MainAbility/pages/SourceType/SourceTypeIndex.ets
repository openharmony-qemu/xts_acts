'use static';
import { Entry, Component, Column, Text, SourceType } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SourceTypeIndex {
  @State keyValue: string = '' + SourceType.KEY;
  @State joystickValue: string = '' + SourceType.JOYSTICK;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('SourceTypeIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.keyValue).key('sourceTypeKeyValue');
      Text(this.joystickValue).key('sourceTypeJoystickValue');
    }
    .width('100%')
    .height('100%');
  }
}
