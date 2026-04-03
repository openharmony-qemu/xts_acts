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
import { Entry, Component, Column, Text, List, ListItem, Button } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIObserver } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIObserverIndex {
  @State observerInfo: string = 'initializing';
  @State renderStateInfo: string = 'not set';
  @State nodeRenderCallback: string = 'not registered';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] UIObserverIndex error ' + error); }
  }

  onPageShow() {
    try {
      let uiObserver: UIObserver = this.getUIContext().getUIObserver();
      this.observerInfo = 'created';
      AppStorage.setOrCreate<string>('uiObserverExists', 'true');

      let renderInVal = 0;
      let renderOutVal = 1;
      this.renderStateInfo = 'IN=' + renderInVal + ',OUT=' + renderOutVal;
      AppStorage.setOrCreate<string>('nodeRenderStateValues', this.renderStateInfo);

      uiObserver.onNodeRenderState('observedTarget', (state: int): void => {
        console.info('[ARKUI_NEW] NodeRenderState changed: ' + state);
        AppStorage.setOrCreate<string>('nodeRenderStateCallback', 'triggered:' + state);
      });
      this.nodeRenderCallback = 'registered';
      AppStorage.setOrCreate<string>('onNodeRenderStateRegistered', 'true');

      setTimeout((): void => {
        uiObserver.offNodeRenderState('observedTarget');
        AppStorage.setOrCreate<string>('offNodeRenderStateCalled', 'true');
      }, 2000);
    } catch (error) {
      this.observerInfo = 'error';
      AppStorage.setOrCreate<string>('uiObserverExists', 'error:' + error);
      console.error('[ARKUI_NEW] UIObserverIndex onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('UIObserver Test').key('uiObserverRoot').id('uiObserverRoot').fontSize(20)
      Text('Observer: ' + this.observerInfo).key('uiObserverStatus').id('uiObserverStatus').fontSize(14)
      Text('RenderState: ' + this.renderStateInfo).key('uiObserverRenderState').id('uiObserverRenderState').fontSize(14)
      Text('Callback: ' + this.nodeRenderCallback).key('uiObserverCallback').id('uiObserverCallback').fontSize(14)

      List() {
        ListItem() {
          Text('Observed Item 1').fontSize(14).key('obsItem1').id('obsItem1')
        }
        ListItem() {
          Text('Observed Item 2').fontSize(14).key('obsItem2').id('obsItem2')
        }
        ListItem() {
          Text('Observed Item 3').fontSize(14).key('obsItem3').id('obsItem3')
        }
      }.key('observedList').id('observedList').width('100%').height('30%')

      Text('Observed Target')
        .key('observedTarget').id('observedTarget').fontSize(16).margin({ top: 10 })

      Button('UIObserver Action')
        .key('uiObserverBtn').id('uiObserverBtn')
        .fontSize(14).width('60%').margin({ top: 10 })
    }.width('100%').height('100%')
  }
}
