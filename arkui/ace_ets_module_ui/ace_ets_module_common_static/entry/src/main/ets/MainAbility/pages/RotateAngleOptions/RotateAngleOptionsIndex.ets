'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
