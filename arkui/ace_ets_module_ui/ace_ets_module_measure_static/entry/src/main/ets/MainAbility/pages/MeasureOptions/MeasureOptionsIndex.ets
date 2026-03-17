'use static';
import { Entry, Component, Column, Button, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct MeasureOptionsIndex {
  @State textContentStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('MeasureOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('textContent')
        .id('measureOptionsTextContentBtn')
        .onClick(() => {
          try {
            let measuredWidth = this.getUIContext().getMeasureUtils().measureText({
              textContent: 'measure_options_text'
            });
            this.textContentStatus = measuredWidth > 0 ? 'textContent_ok' : 'textContent_fail';
          } catch (error) {
            this.textContentStatus = 'textContent_fail';
          }
        });
      Text(this.textContentStatus).key('measureOptionsTextContentStatus');
    }
    .width('100%')
    .height('100%');
  }
}
