'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { LevelOrder, LevelMode } from '@ohos.promptAction';
import { OverlayManager, UIContext, OrderOverlayOptions, Router } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Component,
  Column,
  Text,
  Row,
  Button,
  Color,
  FontWeight,
  FlexAlign,
  HorizontalAlign,
  Position,
  RowOptions,
  ClickEvent,
  wrapBuilder
} from '@ohos.arkui.component';

let currentOverlayLabel: string = '';
let currentOverlayOffset: Position = { x: 0, y: 80 } as Position;

@Builder
function builderOverlayText() {
  Column() {
    Text(currentOverlayLabel)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .id('OpenOrderOverlayTestPage_overlay_text')
  }
  .width(100)
  .height(100)
  .backgroundColor(Color.White)
  .borderRadius(10)
  .justifyContent(FlexAlign.Center)
  .offset(currentOverlayOffset)
}

@Entry
@Component
struct OpenOrderOverlayTestPage {
  @State resultText: string = 'Ready';
  private uiContext: UIContext = this.getUIContext();
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager();
  private contentArray: ComponentContent<Object>[] = [];

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('OpenOrderOverlayTestPage router init error: ' + error);
    }
  }

  private runOpenOverlay(label: string, successMsg: string, options?: OrderOverlayOptions): void {
    this.openOverlayTask(label, successMsg, options);
  }

  private async openOverlayTask(label: string, successMsg: string, options?: OrderOverlayOptions): Promise<void> {
    currentOverlayLabel = label;
    currentOverlayOffset = { x: 0, y: 80 } as Position;
    let componentContent = new ComponentContent<Object>(this.uiContext, wrapBuilder(builderOverlayText));
    try {
      if (options !== undefined) {
        await this.overlayNode.openOrderOverlay(componentContent, options);
      } else {
        await this.overlayNode.openOrderOverlay(componentContent);
      }
      this.resultText = successMsg;
      this.contentArray.push(componentContent);
    } catch (error) {
      this.resultText = 'Error: ' + (error as Error).message;
      console.error('OpenOrderOverlayTestPage openOverlay failed: ' + JSON.stringify(error));
    }
  }

  build(): void {
    Column() {
      Text('openOrderOverlay Test Page')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .id('OpenOrderOverlayTestPage_title_text')

      Text(this.resultText)
        .fontSize(10)
        .id('OpenOrderOverlayTestPage_result_text')

      Row() {
        Button('Content Only')
          .id('OpenOrderOverlayTestPage_btn_content_only')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('ContentOnly', 'Success: ContentOnly', {} as OrderOverlayOptions);
          })

        Button('With Options')
          .id('OpenOrderOverlayTestPage_btn_with_options')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('WithOptions', 'Success: LevelOrder=100 OVERLAY', {
              levelOrder: LevelOrder.clamp(100),
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })
      }

      Row({ space: 10 } as RowOptions) {
        Button('LevelMode OVERLAY')
          .id('OpenOrderOverlayTestPage_btn_overlay_mode')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('OVERLAY', 'Success: OVERLAY mode', {
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })

        Button('LevelMode EMBEDDED')
          .id('OpenOrderOverlayTestPage_btn_embedded_mode')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('EMBEDDED', 'Success: EMBEDDED mode uniqueId=0', {
              levelMode: LevelMode.EMBEDDED,
              levelUniqueId: 0
            } as OrderOverlayOptions);
          })
      }

      Row() {
        Button('LevelOrder 0')
          .id('OpenOrderOverlayTestPage_btn_order_0')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('Order0', 'Success: LevelOrder=0', {
              levelOrder: LevelOrder.clamp(0),
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })

        Button('LevelOrder 100')
          .id('OpenOrderOverlayTestPage_btn_order_100')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('Order100', 'Success: LevelOrder=100', {
              levelOrder: LevelOrder.clamp(100),
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })
      }

      Row() {
        Button('LevelOrder -100')
          .id('OpenOrderOverlayTestPage_btn_order_neg100')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('Order-100', 'Success: LevelOrder=-100', {
              levelOrder: LevelOrder.clamp(-100),
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })

        Button('LevelOrder 100000')
          .id('OpenOrderOverlayTestPage_btn_order_max')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('OrderMax', 'Success: LevelOrder=100000', {
              levelOrder: LevelOrder.clamp(100000),
              levelMode: LevelMode.OVERLAY
            } as OrderOverlayOptions);
          })
      }

      Row({ space: 10 } as RowOptions) {
        Button('levelUniqueId 0')
          .id('OpenOrderOverlayTestPage_btn_uniqueid_0')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('UniqueId0', 'Success: EMBEDDED uniqueId=0', {
              levelMode: LevelMode.EMBEDDED,
              levelUniqueId: 0
            } as OrderOverlayOptions);
          })

        Button('All Params')
          .id('OpenOrderOverlayTestPage_btn_all_params')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            this.runOpenOverlay('AllParams', 'Success: All Params', {
              levelOrder: LevelOrder.clamp(50),
              levelMode: LevelMode.OVERLAY,
              levelUniqueId: 0
            } as OrderOverlayOptions);
          })
      }

      Row({ space: 10 } as RowOptions) {
        Button('Remove Last')
          .id('OpenOrderOverlayTestPage_btn_remove')
          .height('5%')
          .width('30%')
          .onClick((event?: ClickEvent): void => {
            if (this.contentArray.length > 0) {
              let content = this.contentArray.pop();
              if (content !== undefined) {
                this.overlayNode.removeComponentContent(content);
              }
              this.resultText = 'Removed overlay';
            } else {
              this.resultText = 'No overlay to remove';
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
