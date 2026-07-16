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

import { ComponentContent, OverlayManager, LevelOrder, LevelMode } from '@kit.ArkUI';
import router from '@ohos.router';

class Params {
  public text: string = '';
  public offset: Position;

  constructor(text: string, offset: Position) {
    this.text = text;
    this.offset = offset;
  }
}

@Builder
function builderText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .id('overlay_text')
  }
  .width(100)
  .height(100)
  .backgroundColor(Color.White)
  .borderRadius(10)
  .justifyContent(FlexAlign.Center)
  .offset(params.offset)
}

@Entry
@Component
struct OpenOrderOverlayTestPage {
  @State message: string = 'OverlayTest';
  @State resultText: string = 'Ready';
  private uiContext: UIContext = this.getUIContext();
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager();
  private contentArray: ComponentContent<Params>[] = [];

  build() {
    Column() {
      Text('openOrderOverlay Test Page')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .id('title_text')

      Text(this.resultText)
        .fontSize(10)
        .id('result_text')

      Row() {
        Button('Content Only')
          .id('btn_content_only')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('ContentOnly', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent);
              this.resultText = 'Success: ContentOnly';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('With Options')
          .id('btn_with_options')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('WithOptions', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(100),
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: LevelOrder=100 OVERLAY';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
      }

      Row({ space: 10 }) {
        Button('LevelMode OVERLAY')
          .id('btn_overlay_mode')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('OVERLAY', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: OVERLAY mode';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('LevelMode EMBEDDED')
          .id('btn_embedded_mode')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('EMBEDDED', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelMode: LevelMode.EMBEDDED,
                levelUniqueId: 0
              });
              this.resultText = 'Success: EMBEDDED mode uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
      }

      Row() {
        Button('LevelOrder 0')
          .id('btn_order_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('Order0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(0),
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: LevelOrder=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('LevelOrder 100')
          .id('btn_order_100')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('Order100', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(100),
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: LevelOrder=100';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
      }

      Row() {
        Button('LevelOrder -100')
          .id('btn_order_neg100')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('Order-100', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(-100),
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: LevelOrder=-100';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('LevelOrder 100000')
          .id('btn_order_max')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('OrderMax', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(100000),
                levelMode: LevelMode.OVERLAY
              });
              this.resultText = 'Success: LevelOrder=100000';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
      }

      Row({ space: 10 }) {
        Button('levelUniqueId 0')
          .id('btn_uniqueid_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('UniqueId0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelMode: LevelMode.EMBEDDED,
                levelUniqueId: 0
              });
              this.resultText = 'Success: EMBEDDED uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('All Params')
          .id('btn_all_params')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('AllParams', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, {
                levelOrder: LevelOrder.clamp(50),
                levelMode: LevelMode.OVERLAY,
                levelUniqueId: 0
              });
              this.resultText = 'Success: All Params';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
      }

      Row({ space: 10 }) {
        Button('Remove Last')
          .id('btn_remove')
          .height('5%')
          .width('30%')
          .onClick(() => {
            if (this.contentArray.length > 0) {
              let content = this.contentArray.pop();
              this.overlayNode.removeComponentContent(content);
              this.resultText = 'Removed overlay';
            } else {
              this.resultText = 'No overlay to remove';
            }
          })

        Button('Back')
          .id('btn_back')
          .onClick(() => {
            router.back();
          })
      }
      Row({ space: 10 }) {
        Button('levelUniqueId 0')
          .id('btn_uniqueid_0')
          .height('5%')
          .width('20%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('UniqueId0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(undefined, {
                levelMode: LevelMode.EMBEDDED,
                levelUniqueId: 0
              });
              this.resultText = 'Success: EMBEDDED uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })
        Button('levelUniqueId 0')
          .id('btn_uniqueid_0')
          .height('5%')
          .width('20%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('UniqueId0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(null, {
                levelMode: LevelMode.EMBEDDED,
                levelUniqueId: 0
              });
              this.resultText = 'Success: EMBEDDED uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('levelUniqueId 0')
          .id('btn_uniqueid_0')
          .height('5%')
          .width('20%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('UniqueId0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, undefined);
              this.resultText = 'Success: EMBEDDED uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
            }
          })

        Button('levelUniqueId 0')
          .id('btn_uniqueid_0')
          .height('5%')
          .width('20%')
          .onClick(async () => {
            let componentContent = new ComponentContent(
              this.uiContext, wrapBuilder<[Params]>(builderText),
              new Params('UniqueId0', { x: 0, y: 80 })
            );
            try {
              await this.overlayNode.openOrderOverlay(componentContent, null);
              this.resultText = 'Success: EMBEDDED uniqueId=0';
              this.contentArray.push(componentContent);
            } catch (error) {
              this.resultText = 'Error: ' + (error as Error).message;
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