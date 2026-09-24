'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Text, NodeContainer, wrapBuilder, CustomBuilder, WrappedBuilder } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { typeNode } from 'arkui.FrameNode';
import { ComponentContent, ComponentContentBase, BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node';
import { Content } from 'arkui.Content';
import { InputEventType } from 'arkui.BuilderNode';

@Builder
function inputEventBuilder() {
  Column() {
    Text('InputEvent Test')
      .id('inputEventText')
      .fontSize(20)
  }.width('100%').height(50)
}

@Builder
function emptyBuilder() {
  Column() {
    Text('empty')
  }
}

class InputEventNodeController extends NodeController {
  private rootNode: BuilderNode | null = null;
  private wrapBuilderFn: WrappedBuilder<CustomBuilder> = wrapBuilder(inputEventBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new BuilderNode(uiContext);
    this.rootNode!.build(this.wrapBuilderFn);
    return this.rootNode!.getFrameNode();
  }

  postInputEventFn(event: InputEventType): boolean {
    if (this.rootNode == null) {
      return false;
    }
    let result = this.rootNode!.postInputEvent(event);
    AppStorage.setOrCreate<string>('tn2_InputEventType', result ? 'ok' : 'false');
    return result;
  }
}

@Entry
@Component
struct TypeNode2 {
  @State statusText: string = 'pending';
  private inputEventController: InputEventNodeController = new InputEventNodeController();

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] TypeNodeIndex2 error ' + error); }
  }

  onPageShow() {
    try {
      let uiCtx = this.getUIContext();
      
      try {
        let emptyWrapBuilder: WrappedBuilder<CustomBuilder> = wrapBuilder(emptyBuilder);
        let cc = new ComponentContent(uiCtx, emptyWrapBuilder);
        let ccBase: ComponentContentBase = cc;
        AppStorage.setOrCreate<string>('tn2_ComponentContentBase', ccBase != null && ccBase != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_ComponentContentBase', 'error:' + error);
      }
      
      try {
        let emptyWrapBuilder2: WrappedBuilder<CustomBuilder> = wrapBuilder(emptyBuilder);
        let cc2 = new ComponentContent(uiCtx, emptyWrapBuilder2);
        let contentBase: Content = cc2;
        AppStorage.setOrCreate<string>('tn2_Content', contentBase != null && contentBase != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_Content', 'error:' + error);
      }
      
      try {
        let textClockNode = typeNode.createTextClockNode(uiCtx);
        let textClockAttr = textClockNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getTextClockAttribute', textClockAttr != null && textClockAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getTextClockAttribute', 'error:' + error);
      }
      
      try {
        let textTimerNode = typeNode.createTextTimerNode(uiCtx);
        let textTimerAttr = textTimerNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getTextTimerAttribute', textTimerAttr != null && textTimerAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getTextTimerAttribute', 'error:' + error);
      }
      
      try {
        let symbolGlyphNode = typeNode.createSymbolGlyphNode(uiCtx);
        let symbolGlyphAttr = symbolGlyphNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getSymbolGlyphAttribute', symbolGlyphAttr != null && symbolGlyphAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getSymbolGlyphAttribute', 'error:' + error);
      }
      
      try {
        let qrCodeNode = typeNode.createQRCodeNode(uiCtx);
        let qrCodeAttr = qrCodeNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getQRCodeAttribute', qrCodeAttr != null && qrCodeAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getQRCodeAttribute', 'error:' + error);
      }
      
      try {
        let badgeNode = typeNode.createBadgeNode(uiCtx);
        let badgeAttr = badgeNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getBadgeAttribute', badgeAttr != null && badgeAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getBadgeAttribute', 'error:' + error);
      }

      try {
        let marqueeNode = typeNode.createMarqueeNode(uiCtx);
        let marqueeAttr = marqueeNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getMarqueeAttribute', marqueeAttr != null && marqueeAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getMarqueeAttribute', 'error:' + error);
      }
      
      try {
        let ratingNode = typeNode.createRatingNode(uiCtx);
        let ratingAttr = ratingNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getRatingAttribute', ratingAttr != null && ratingAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getRatingAttribute', 'error:' + error);
      }
      
      try {
        let selectNode = typeNode.createSelectNode(uiCtx);
        let selectAttr = selectNode.attribute;
        AppStorage.setOrCreate<string>('tn2_getSelectAttribute', selectAttr != null && selectAttr != undefined ? 'ok' : 'undefined');
      } catch (error) {
        AppStorage.setOrCreate<string>('tn2_getSelectAttribute', 'error:' + error);
      }

      this.statusText = 'done';
      console.info('[ARKUI_NEW] TypeNodeIndex2 onPageShow all calls completed');
    } catch (error) {
      this.statusText = 'error';
      console.error('[ARKUI_NEW] TypeNodeIndex2 onPageShow error: ' + error);
    }
  }

  build() {
    Column() {
      Text('TypeNode2 Test Page').key('typeNode2Root').id('typeNode2Root').fontSize(20)
      Text('Status: ' + this.statusText).key('typeNode2Status').id('typeNode2Status').fontSize(14)
      NodeContainer(this.inputEventController)
        .key('inputEventNodeContainer')
        .id('inputEventNodeContainer')
        .width('100%')
        .height(50)
        .onTouch((event) => {
          if (event != undefined) {
            this.inputEventController.postInputEventFn(event);
          }
        })
    }.width('100%').height('100%').padding(16)
  }
}
