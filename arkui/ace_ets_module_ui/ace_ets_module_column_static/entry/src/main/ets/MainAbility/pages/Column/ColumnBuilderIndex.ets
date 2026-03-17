'use static';
import { Entry, Component, Column, ColumnOptions, Text, Button } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ColumnBuilderIndex {
  @State columnStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ColumnBuilderIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('column_builder_text_1').key('columnBuilderText1');
      Text('column_builder_text_2').key('columnBuilderText2');
      Button('verifyColumnBuilder')
        .id('verifyColumnBuilderBtn')
        .onClick(() => {
          this.columnStatus = 'column_builder_ok';
        });
      Text(this.columnStatus).key('columnBuilderStatus');
    }
    .id('columnBuilderRoot')
    .width('100%')
    .height('100%');
  }
}
