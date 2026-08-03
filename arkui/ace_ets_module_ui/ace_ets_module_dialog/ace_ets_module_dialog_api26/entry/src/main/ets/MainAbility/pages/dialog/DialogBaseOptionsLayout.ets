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

import { DialogPresenter } from '@ohos.arkui.UIContext';
import { DialogBaseAlignment } from '@ohos.arkui.dialog';

@Entry
@Component
struct DialogBaseOptionsLayout {
  @State lastAction: string = 'none';
  @State lastAlign: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private async openAlign(tag: string, align: DialogBaseAlignment): Promise<void> {
    this.lastAlign = tag;
    await this.presenter().present({
      title: 'Align' + tag,
      message: { content: 'AlignMsg' + tag },
      alignment: align,
      width: '80%',
      height: 220,
      offset: { dx: 0, dy: 10 },
      borderWidth: 2,
      borderColor: Color.Blue,
      borderStyle: BorderStyle.Solid,
      borderRadius: 12,
      buttons: [
        {
          value: 'AlignOK',
          action: () => {
            this.lastAction = 'AlignOK_' + tag;
          }
        }
      ]
    });
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('DialogBaseOptions layout').fontSize(18).fontWeight(FontWeight.Bold)
        Text('align=' + this.lastAlign).id('base_layout_align')
        Text('action=' + this.lastAction).id('base_layout_action')
        Button('TOP').id('btn_align_TOP').onClick(() => {
          this.openAlign('TOP', DialogBaseAlignment.TOP);
        })
        Button('CENTER').id('btn_align_CENTER').onClick(() => {
          this.openAlign('CENTER', DialogBaseAlignment.CENTER);
        })
        Button('BOTTOM').id('btn_align_BOTTOM').onClick(() => {
          this.openAlign('BOTTOM', DialogBaseAlignment.BOTTOM);
        })
        Button('DEFAULT').id('btn_align_DEFAULT').onClick(() => {
          this.openAlign('DEFAULT', DialogBaseAlignment.DEFAULT);
        })
        Button('TOP_START').id('btn_align_TOP_START').onClick(() => {
          this.openAlign('TOP_START', DialogBaseAlignment.TOP_START);
        })
        Button('TOP_END').id('btn_align_TOP_END').onClick(() => {
          this.openAlign('TOP_END', DialogBaseAlignment.TOP_END);
        })
        Button('CENTER_START').id('btn_align_CENTER_START').onClick(() => {
          this.openAlign('CENTER_START', DialogBaseAlignment.CENTER_START);
        })
        Button('CENTER_END').id('btn_align_CENTER_END').onClick(() => {
          this.openAlign('CENTER_END', DialogBaseAlignment.CENTER_END);
        })
        Button('BOTTOM_START').id('btn_align_BOTTOM_START').onClick(() => {
          this.openAlign('BOTTOM_START', DialogBaseAlignment.BOTTOM_START);
        })
        Button('BOTTOM_END').id('btn_align_BOTTOM_END').onClick(() => {
          this.openAlign('BOTTOM_END', DialogBaseAlignment.BOTTOM_END);
        })
        Button('maskRect offset')
          .id('btn_layout_mask')
          .onClick(async () => {
            await this.presenter().present({
              title: 'MaskRectTitle',
              message: { content: 'MaskRectMessage' },
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              offset: { dx: 8, dy: -8 },
              width: 280,
              height: 180,
              buttons: [
                {
                  value: 'MaskOK',
                  action: () => {
                    this.lastAction = 'MaskOK';
                  }
                }
              ]
            });
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
