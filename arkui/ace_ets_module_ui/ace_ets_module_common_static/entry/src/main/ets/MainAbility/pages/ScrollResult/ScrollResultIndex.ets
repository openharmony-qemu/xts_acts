'use static';
import { Entry, Component, Column, Button, Text, Scroll, ScrollResult } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ScrollResultIndex {
  @State setOffsetRemainStatus: string = 'init';
  @State getOffsetRemainStatus: string = 'init';
  @State offsetRemainValue: number = 0;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ScrollResultIndex aboutToAppear error: ' + error);
    }
  }

  private hasScrollInspectorInfo(): boolean {
    try {
      return inspector.getInspectorByKey('scrollResultTargetKey').length > 0;
    } catch (error) {
      return false;
    }
  }

  build() {
    Column() {
      Scroll() {
        Text('scroll_result_content')
          .height(400);
      }
      .id('scrollResultTarget')
      .key('scrollResultTargetKey')
      .height(80);

      Button('setOffsetRemain')
        .id('scrollResultSetOffsetRemainBtn')
        .onClick(() => {
          try {
            let scrollResult: ScrollResult = { offsetRemain: 0 };
            scrollResult.offsetRemain = 88;
            this.offsetRemainValue = scrollResult.offsetRemain;
            this.setOffsetRemainStatus = this.hasScrollInspectorInfo() && this.offsetRemainValue === 88 ?
              'setOffsetRemain_ok' : 'setOffsetRemain_fail';
          } catch (error) {
            this.setOffsetRemainStatus = 'setOffsetRemain_fail';
          }
        });
      Text(this.setOffsetRemainStatus).key('scrollResultSetOffsetRemainStatus');

      Button('getOffsetRemain')
        .id('scrollResultGetOffsetRemainBtn')
        .onClick(() => {
          try {
            let scrollResult: ScrollResult = { offsetRemain: 66 };
            this.offsetRemainValue = scrollResult.offsetRemain;
            this.getOffsetRemainStatus = this.hasScrollInspectorInfo() && this.offsetRemainValue === 66 ?
              'getOffsetRemain_ok' : 'getOffsetRemain_fail';
          } catch (error) {
            this.getOffsetRemainStatus = 'getOffsetRemain_fail';
          }
        });
      Text(this.getOffsetRemainStatus).key('scrollResultGetOffsetRemainStatus');
      Text(this.offsetRemainValue.toString()).key('scrollResultOffsetRemainValue');
    }
    .width('100%')
    .height('100%');
  }
}
