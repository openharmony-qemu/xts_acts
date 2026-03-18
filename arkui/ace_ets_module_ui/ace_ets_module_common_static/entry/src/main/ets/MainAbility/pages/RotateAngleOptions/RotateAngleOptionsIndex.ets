'use static';
import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RotateAngleOptionsIndex {
  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('RotateAngleOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('RotateAngleOptionsangleX')
        .id('RotateAngleOptionsangleX')
        .key('RotateAngleOptionsangleX')
        .rotate({ angleX: 10 });

      Text('RotateAngleOptionsangleY')
        .id('RotateAngleOptionsangleY')
        .key('RotateAngleOptionsangleY')
        .rotate({ angleY: 20 });

      Text('RotateAngleOptionsangleZ')
        .id('RotateAngleOptionsangleZ')
        .key('RotateAngleOptionsangleZ')
        .rotate({ angleZ: 30 });

      Text('RotateAngleOptionscenterX')
        .id('RotateAngleOptionscenterX')
        .key('RotateAngleOptionscenterX')
        .rotate({ centerX: 20 });

      Text('RotateAngleOptionscenterY')
        .id('RotateAngleOptionscenterY')
        .key('RotateAngleOptionscenterY')
        .rotate({ centerY: 30 });

      Text('RotateAngleOptionscenterZ')
        .id('RotateAngleOptionscenterZ')
        .key('RotateAngleOptionscenterZ')
        .rotate({ centerZ: 10 });

      Text('RotateAngleOptionsperspective')
        .id('RotateAngleOptionsperspective')
        .key('RotateAngleOptionsperspective')
        .rotate({ perspective: 1 });
    }
    .width('100%')
    .height('100%');
  }
}
