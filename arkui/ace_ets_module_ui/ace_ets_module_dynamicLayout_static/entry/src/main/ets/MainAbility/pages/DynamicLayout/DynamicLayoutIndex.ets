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
import { Entry, Component, Column, Text, Builder } from '@ohos.arkui.component';
import { DynamicLayout, DynamicLayoutAttribute, LayoutAlgorithm } from '@ohos.arkui.components.ArkDynamicLayout';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Builder
function dlChildContent(): void {
  Text('DL Item A').key('dlItemA').id('dlItemA').fontSize(14).margin({ top: 4 })
  Text('DL Item B').key('dlItemB').id('dlItemB').fontSize(14).margin({ top: 4 })
  Text('DL Item C').key('dlItemC').id('dlItemC').fontSize(14).margin({ top: 4 })
}

@Entry
@Component
struct DynamicLayoutIndex {
  @State dlStatus: string = 'pending';
  private algorithm: LayoutAlgorithm = {};

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] DynamicLayoutIndex error ' + error);
    }
  }

  onPageShow() {
    try {
      this.dlStatus = 'rendered';
      AppStorage.setOrCreate<string>('dlPageShown', 'true');
      console.info('[ARKUI_NEW] DynamicLayoutIndex onPageShow done');
    } catch (error) {
      console.error('[ARKUI_NEW] DynamicLayoutIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('DynamicLayout Test Page')
        .key('dynamicLayoutRoot').id('dynamicLayoutRoot').fontSize(20).fontWeight(500)

      Text('Status: ' + this.dlStatus)
        .key('dlStatusText').id('dlStatusText').fontSize(14).margin({ top: 8 })

      DynamicLayout(this.algorithm, dlChildContent)
        .attributeModifier(undefined)
        .key('dlComp1').id('dlComp1')
        .width('100%').height('40%')

      DynamicLayout(this.algorithm, dlChildContent)
        .key('dlComp2').id('dlComp2')
        .width('100%').height('30%')

    }.width('100%').height('100%').padding(16)
  }
}
