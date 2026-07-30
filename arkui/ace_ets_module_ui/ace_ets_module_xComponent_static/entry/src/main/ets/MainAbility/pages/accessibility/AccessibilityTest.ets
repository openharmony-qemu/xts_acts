'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { Entry, Component, Column, Scroll, Text, BarState, ColumnOptions} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct AccessibilityTest {
  
  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('AccessibilityTest aboutToAppear error: ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('accessibilityNextFocusId no param')
          .width('90%')
          .height('10%')
          .id('text_nextFocusId_noParam')
          .fontSize(16)
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusTarget')

        Text('accessibilityNextFocusId undefined')
          .width('90%')
          .height('10%')
          .id('text_nextFocusId_undefined')
          .fontSize(16)
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusTarget', undefined)

        Text('accessibilityNextFocusId false')
          .width('90%')
          .height('10%')
          .id('text_nextFocusId_false')
          .fontSize(16)
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusTarget', { isConsiderDescendants: false })

        Text('accessibilityNextFocusId true')
          .width('90%')
          .height('10%')
          .id('text_nextFocusId_true')
          .fontSize(16)
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusTarget', { isConsiderDescendants: true })

        Text('accessibilityCustomActions valid')
          .width('90%')
          .height('10%')
          .id('text_customActions_valid')
          .fontSize(16)
          .maxLines(1)
          .accessibilityCustomActions([
            { name: 'action1', onAction: () => { console.info('action1 triggered'); } }
          ])

        Text('accessibilityCustomActions undefined')
          .width('90%')
          .height('10%')
          .id('text_customActions_undefined')
          .fontSize(16)
          .maxLines(1)
          .accessibilityCustomActions(undefined)

        Text('accessibilityCustomActions empty')
          .width('90%')
          .height('10%')
          .id('text_customActions_empty')
          .fontSize(16)
          .maxLines(1)
          .accessibilityCustomActions([])
      }
      .width('100%')
      .padding({ left: 10, right: 10, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}