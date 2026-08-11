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

import {
  Entry,
  Component,
  Builder,
  Column,
  ColumnOptions,
  Button,
  Text,
  wrapBuilder
} from '@ohos.arkui.component';
import { AppStorage, State, StorageLink } from '@ohos.arkui.stateManagement';
import { Router, UIContext, OverlayManager, NodeRenderState, OverlayManagerOptions } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@kit.ArkUI';
import { FrameNode } from '@ohos.arkui.node';

@Builder
function overlayBuilderA() {
  Text('overlay_content_a')
    .key('overlayTextA')
    .fontSize(18);
}

@Builder
function overlayBuilderB() {
  Text('overlay_content_b')
    .key('overlayTextB')
    .fontSize(18);
}

@Builder
function overlayBuilderC() {
  Button('overlay_content_backpress')
    .id('overlayBackPressBtn')
    .fontSize(18)
    .height(40);
}

@Entry
@Component
struct OverlayManagerIndex {
  @State addStatus: string = 'init';
  @State addOrderStatus: string = 'init';
  @State hideStatus: string = 'init';
  @State showAllStatus: string = 'init';
  @State removeStatus: string = 'init';
  @State backPressStatus: string = 'init';
  @StorageLink('backPressCount') backPressCount: number = 0;
  @StorageLink('backPressMode') backPressMode: boolean = true;
  @State backPressOverlayVisible: string = 'closed';
  @StorageLink('nodeRenderStatus') nodeRenderStatus: string = 'init';
  @State nodeRenderVisible: boolean = true;

  private uiContext: UIContext = this.getUIContext();
  private contentA: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(overlayBuilderA));
  private contentB: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(overlayBuilderB));
  private contentC: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(overlayBuilderC));
  private hasAddedA: boolean = false;
  private hasAddedB: boolean = false;
  private hasAddedC: boolean = false;
  private nodeRenderText: string = 'node_render_origin';
  private nodeRenderRegistered: boolean = false;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<UIContext>('uiContext', this.getUIContext());
    } catch (error) {
      console.error('OverlayManagerIndex aboutToAppear error: ' + error);
    }
  }

  private registerBackPressOptions() {
    // setOverlayManagerOptions 仅注册一次；回调只访问 AppStorage
    const registered = AppStorage.get<boolean>('backPressRegistered');
    if (registered === true) {
      return;
    }
    AppStorage.setOrCreate<boolean>('backPressRegistered', true);
    AppStorage.setOrCreate<boolean>('backPressMode', true);
    AppStorage.setOrCreate<number>('backPressCount', 0);
    let options: OverlayManagerOptions = {
      enableBackPressedEvent: true,
      onBackPress: (): boolean => {
        let count: number = AppStorage.get<number>('backPressCount') as number;
        AppStorage.setOrCreate<number>('backPressCount', count + 1);
        return AppStorage.get<boolean>('backPressMode') as boolean;
      }
    };
    this.getUIContext().setOverlayManagerOptions(options);
  }

  aboutToDisappear() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    try {
      if (this.hasAddedA) {
        overlayManager.removeComponentContent(this.contentA);
      }
    } catch (error) {
      console.error('remove contentA in aboutToDisappear error: ' + error);
    }
    try {
      if (this.hasAddedB) {
        overlayManager.removeComponentContent(this.contentB);
      }
    } catch (error) {
      console.error('remove contentB in aboutToDisappear error: ' + error);
    }
    try {
      if (this.hasAddedC) {
        overlayManager.removeComponentContent(this.contentC);
      }
    } catch (error) {
      console.error('remove contentC in aboutToDisappear error: ' + error);
    }
    this.hasAddedA = false;
    this.hasAddedB = false;
    this.hasAddedC = false;
    if (this.nodeRenderRegistered) {
      try {
        this.getUIContext().getUIObserver().offNodeRenderState('nodeRenderTest');
      } catch (error) {
        console.error('off nodeRenderState in aboutToDisappear error: ' + error);
      }
      this.nodeRenderRegistered = false;
    }
  }

  private safeAddC() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    if (!this.hasAddedC) {
      overlayManager.addComponentContent(this.contentC, 0);
      this.hasAddedC = true;
      this.backPressOverlayVisible = 'open';
    }
  }

  private setBackPressOptions(result: boolean) {
    this.registerBackPressOptions();
    this.backPressMode = result;
    this.backPressStatus = 'option_set_' + (result ? 'true' : 'false');
    this.safeAddC();
  }

  private safeAddA() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    if (!this.hasAddedA) {
      overlayManager.addComponentContent(this.contentA, 0);
      this.hasAddedA = true;
    }
  }

  private safeAddB() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    if (!this.hasAddedB) {
      overlayManager.addComponentContentWithOrder(this.contentB);
      this.hasAddedB = true;
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('addComponentContent')
        .id('addContent')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.safeAddA();
            this.addStatus = 'add_ok';
          } catch (error) {
            this.addStatus = 'add_fail';
            console.error('addComponentContent error: ' + error);
          }
        });

      Text(this.addStatus).key('addStatus').height('3%');

      Button('addComponentContentWithOrder')
        .id('addContentWithOrder')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.safeAddB();
            this.addOrderStatus = 'add_order_ok';
          } catch (error) {
            this.addOrderStatus = 'add_order_fail';
            console.error('addComponentContentWithOrder error: ' + error);
          }
        });

      Text(this.addOrderStatus).key('addOrderStatus').height('3%');

      Button('hideComponentContent')
        .id('hideContent')
        .height('3.5%')
        .onClick((): void => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddA();
            overlayManager.hideComponentContent(this.contentA);
            this.hideStatus = 'hide_ok';
          } catch (error) {
            this.hideStatus = 'hide_fail';
            console.error('hideComponentContent error: ' + error);
          }
        });

      Text(this.hideStatus).key('hideStatus').height('3%');

      Button('showAllComponentContents')
        .id('showAllContents')
        .height('3.5%')
        .onClick((): void => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddA();
            overlayManager.showAllComponentContents();
            this.showAllStatus = 'show_all_ok';
          } catch (error) {
            this.showAllStatus = 'show_all_fail';
            console.error('showAllComponentContents error: ' + error);
          }
        });

      Text(this.showAllStatus).key('showAllStatus').height('3%');

      Button('removeComponentContent')
        .id('removeContent')
        .height('3.5%')
        .onClick((): void => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddB();
            overlayManager.removeComponentContent(this.contentB);
            this.hasAddedB = false;
            this.removeStatus = 'remove_ok';
          } catch (error) {
            this.removeStatus = 'remove_fail';
            console.error('removeComponentContent error: ' + error);
          }
        });

      Text(this.removeStatus).key('removeStatus').height('3%');

      Button('setBackPressReturnTrue')
        .id('setBackPressTrue')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.setBackPressOptions(true);
          } catch (error) {
            this.backPressStatus = 'set_option_fail';
            console.error('setOverlayManagerOptions(true) error: ' + error);
          }
        });

      Button('setBackPressReturnFalse')
        .id('setBackPressFalse')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.setBackPressOptions(false);
          } catch (error) {
            this.backPressStatus = 'set_option_fail';
            console.error('setOverlayManagerOptions(false) error: ' + error);
          }
        });

      Button('closeBackPressOverlay')
        .id('closeBackPressOverlay')
        .height('3.5%')
        .onClick((): void => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            if (this.hasAddedC) {
              overlayManager.removeComponentContent(this.contentC);
              this.hasAddedC = false;
            }
            this.backPressOverlayVisible = 'closed';
          } catch (error) {
            this.backPressOverlayVisible = 'close_fail';
            console.error('closeBackPressOverlay error: ' + error);
          }
        });

      Text(this.backPressStatus)
        .key('backPressStatus')
        .height('3%');
      Text('backPressCount: ' + this.backPressCount)
        .key('backPressCount')
        .height('3%');
      Text('overlay: ' + this.backPressOverlayVisible)
        .key('backPressOverlayVisible')
        .height('3%');

      Button('changeNodeRenderText')
        .id('changeNodeRenderText')
        .height('3.5%')
        .onClick((): void => {
          // 切换节点挂载状态触发渲染回调
          this.nodeRenderVisible = !this.nodeRenderVisible;
          this.nodeRenderText = 'node_render_changed';
        });

      Button('registerNodeRender')
        .id('registerNodeRender')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.nodeRenderRegistered = true;
            this.nodeRenderStatus = 'registered';
            // 注册时系统立即回调一次（当前节点状态），回调值覆盖为 callback_<state>
            this.getUIContext().getUIObserver().onNodeRenderState('nodeRenderTest', (state: NodeRenderState, node?: FrameNode) => {
              // 回调只写 AppStorage
              AppStorage.setOrCreate<string>('nodeRenderStatus', 'callback_' + state);
            });
          } catch (error) {
            this.nodeRenderStatus = 'register_fail';
            console.error('on nodeRenderState error: ' + error);
          }
        });

      Button('unregisterNodeRender')
        .id('unregisterNodeRender')
        .height('3.5%')
        .onClick((): void => {
          try {
            this.getUIContext().getUIObserver().offNodeRenderState('nodeRenderTest');
            this.nodeRenderRegistered = false;
            this.nodeRenderStatus = 'unregistered';
          } catch (error) {
            this.nodeRenderStatus = 'unregister_fail';
            console.error('off nodeRenderState error: ' + error);
          }
        });

      if (this.nodeRenderVisible) {
        Text(this.nodeRenderText)
          .id('nodeRenderTest')
          .height('3%');
      }

      Text(this.nodeRenderStatus).key('nodeRenderStatus').height('3%');
    }
    .width('100%')
    .height('100%');
  }
}
