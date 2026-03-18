'use static';
import { Entry, Component, Column, Text, DragEvent, DragItemInfo } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DragEventIndex {
  @State getDisplayIdStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('DragEventIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('drag_source')
        .id('dragEventSource')
        .width('100%')
        .height(150)
        .backgroundColor('#33FF0000')
        .draggable(true)
        .onDragStart((event: DragEvent): DragItemInfo => {
          let _evt = event;
          return { extraInfo: 'dragEventTest' };
        });

      Text('drag_target')
        .id('dragEventTarget')
        .width('100%')
        .height(300)
        .backgroundColor('#3300FF00')
        .margin({ top: 20 })
        .allowDrop(['text/plain'])
        .onDrop((event: DragEvent) => {
          try {
            let displayId: number = event.getDisplayId();
            this.getDisplayIdStatus = displayId >= 0 ? 'getDisplayId_ok' : 'getDisplayId_fail';
          } catch (error) {
            this.getDisplayIdStatus = 'getDisplayId_fail';
          }
        });

      Text(this.getDisplayIdStatus).key('dragEventGetDisplayIdStatus');
    }
    .width('100%')
    .height('100%');
  }
}
