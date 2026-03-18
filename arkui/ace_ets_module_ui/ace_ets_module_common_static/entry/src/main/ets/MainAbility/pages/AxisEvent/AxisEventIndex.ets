'use static';
import { Entry, Component, Column, Scroll, Text, AxisEvent, AxisType } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct AxisEventIndex {
  @State hasAxisStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('AxisEventIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('item_0').width('100%').height(60);
          Text('item_1').width('100%').height(60);
          Text('item_2').width('100%').height(60);
          Text('item_3').width('100%').height(60);
          Text('item_4').width('100%').height(60);
          Text('item_5').width('100%').height(60);
          Text('item_6').width('100%').height(60);
          Text('item_7').width('100%').height(60);
          Text('item_8').width('100%').height(60);
          Text('item_9').width('100%').height(60);
        }
      }
      .id('axisEventList')
      .width('100%')
      .height(200)
      .onAxisEvent((event: AxisEvent) => {
        try {
          this.hasAxisStatus = event.hasAxis(AxisType.VERTICAL_AXIS) ? 'hasAxis_ok' : 'hasAxis_fail';
        } catch (error) {
          this.hasAxisStatus = 'hasAxis_fail';
        }
      });

      Text(this.hasAxisStatus).key('axisEventHasAxisStatus');
    }
    .width('100%')
    .height('100%');
  }
}
