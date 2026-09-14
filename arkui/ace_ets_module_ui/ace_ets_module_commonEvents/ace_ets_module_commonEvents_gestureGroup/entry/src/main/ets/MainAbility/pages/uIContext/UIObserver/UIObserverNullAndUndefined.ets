/*
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
import { NodeRenderState } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIObserverNullAndUndefined {
  @State result: string = 'Init';
  @State notice: string = '';

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
    }.width('100%')
  }

  build() {
    Column() {
      Text('UIObserver Null And Undefined Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('observerResultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.notice)
        .id('observerNoticeText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFDDDDDD')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Button('removeGlobalGestureListener type null').id('btnRemoveGestureNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getUIObserver().removeGlobalGestureListener(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('removeGlobalGestureListener type undefined').id('btnRemoveGestureUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getUIObserver().removeGlobalGestureListener(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('removeGlobalGestureListener type outOfRange').id('btnRemoveGestureOutOfRange').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getUIObserver().removeGlobalGestureListener(99);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('addMultiCallback').id('btnAddMultiCallback').width('100%').height('5%').onClick(() => {
            this.notice = '';
            let node: FrameNode | null = this.getUIContext().getFrameNodeById('nodeRsTarget');
            if (node) {
              let uniqueId: number = node.getUniqueId();
              let observer = this.getUIContext().getUIObserver();
              observer.on('nodeRenderState', uniqueId, (state: NodeRenderState, node?: FrameNode) => {
                let suffix: string = (state === NodeRenderState.ABOUT_TO_RENDER_IN) ? 'RENDER_IN' : 'RENDER_OUT';
                this.notice += 'CB1_' + suffix + ';';
              });
              observer.on('nodeRenderState', uniqueId, (state: NodeRenderState, node?: FrameNode) => {
                let suffix: string = (state === NodeRenderState.ABOUT_TO_RENDER_IN) ? 'RENDER_IN' : 'RENDER_OUT';
                this.notice += 'CB2_' + suffix + ';';
              });
              observer.on('nodeRenderState', uniqueId, (state: NodeRenderState, node?: FrameNode) => {
                let suffix: string = (state === NodeRenderState.ABOUT_TO_RENDER_IN) ? 'RENDER_IN' : 'RENDER_OUT';
                this.notice += 'CB3_' + suffix + ';';
              });
              this.result = 'MultiCallbackRegistered';
            } else {
              this.result = 'Error: node not found';
            }
          })
          Button('offAllNodeRenderState').id('btnOffAllNodeRenderState').width('100%').height('5%').onClick(() => {
            let node: FrameNode | null = this.getUIContext().getFrameNodeById('nodeRsTarget');
            if (node) {
              let observer = this.getUIContext().getUIObserver();
              observer.off('nodeRenderState', node.getUniqueId());
              this.result = 'OffAllDone';
            }
          })
        }
      }
      .width('100%')
      .height('40%')

      Tabs({ barPosition: BarPosition.Start, index: 0 }) {
        TabContent() {
          Column() {
            Button('monitored node').id('nodeRsTarget').width('80%').height('20%')
          }.width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.tabBuilder(0, 'green'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.tabBuilder(1, 'blue'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .width('100%')
      .height('30%')
    }
  }
}
