/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { promptAction, uiMaterial } from '@kit.ArkUI';
import router from '@ohos.router';

@Entry
@Component
struct ShowToastOptionsTestPage {
  @State toastId: number = 0;
  @State resultText: string = '';

  async openToast(options: promptAction.ShowToastOptions): Promise<number> {
    let id = await promptAction.openToast(options);
    this.toastId = id;
    this.resultText = 'ToastId: ' + id;
    return id;
  }

  closeToast() {
    promptAction.closeToast(this.toastId);
    this.resultText = 'Toast Closed';
  }

  build() {
    Column() {
      Text('ShowToastOptions Test Page')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .id('title_text')

      Text(this.resultText)
        .fontSize(10)
        .id('result_text')

      Row() {
        Button('Message String')
          .id('btn_message_string')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Test Message String' });
          })

        Button('Message Resource')
          .id('btn_message_resource')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: $r('app.string.app_name') });
          })
      }

      Row() {
        Button('Duration 1500')
          .id('btn_duration_min')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Duration 1500ms', duration: 1500 });
          })

        Button('Duration 10000')
          .id('btn_duration_max')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Duration 10000ms', duration: 10000 });
          })
      }

      Row() {
        Button('Bottom 50vp')
          .id('btn_bottom_string')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Bottom 50vp', bottom: '50vp' });
          })

        Button('Bottom 100')
          .id('btn_bottom_number')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Bottom 100', bottom: 100 });
          })
      }

      Row() {
        Button('Align Top')
          .id('btn_align_top')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Top', alignment: Alignment.Top });
          })

        Button('Align Center')
          .id('btn_align_center')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Center', alignment: Alignment.Center });
          })
      }

      Row() {
        Button('Align Bottom')
          .id('btn_align_bottom')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Bottom', alignment: Alignment.Bottom });
          })

        Button('Align TopStart')
          .id('btn_align_topstart')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment TopStart', alignment: Alignment.TopStart });
          })
      }

      Row() {
        Button('Offset Positive')
          .id('btn_offset_positive')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Offset Positive', offset: { dx: 50, dy: 50 } });
          })

        Button('Offset Negative')
          .id('btn_offset_negative')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Offset Negative', offset: { dx: -50, dy: -50 } });
          })
      }

      Row() {
        Button('ShowMode DEFAULT')
          .id('btn_showmode_default')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'ShowMode DEFAULT', showMode: promptAction.ToastShowMode.DEFAULT });
          })

        Button('ShowMode TOP_MOST')
          .id('btn_showmode_topmost')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'ShowMode TOP_MOST', showMode: promptAction.ToastShowMode.TOP_MOST });
          })
      }

      Row() {
        Button('BG Color Red')
          .id('btn_bgcolor_red')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'BG Color Red', backgroundColor: '#FF0000' });
          })

        Button('Text Color White')
          .id('btn_textcolor_white')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Text Color White', textColor: '#FFFFFF' });
          })
      }

      Row() {
        Button('BlurStyle NONE')
          .id('btn_blur_none')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'BlurStyle NONE', backgroundBlurStyle: BlurStyle.NONE });
          })

        Button('BlurStyle THIN')
          .id('btn_blur_thin')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'BlurStyle THIN', backgroundBlurStyle: BlurStyle.Thin });
          })
      }

      Row() {
        Button('Shadow Style')
          .id('btn_shadow_style')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'Shadow Style', shadow: ShadowStyle.OUTER_DEFAULT_MD });
          })

        Button('Shadow Options')
          .id('btn_shadow_options')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({
              message: 'Shadow Options',
              shadow: { radius: 10, color: Color.Black, offsetX: 5, offsetY: 5 }
            });
          })
      }

      Row() {
        Button('HoverMode False')
          .id('btn_hover_false')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'HoverMode False', enableHoverMode: false });
          })

        Button('HoverMode True')
          .id('btn_hover_true')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({ message: 'HoverMode True', enableHoverMode: true });
          })
      }

      Row() {
        Button('SystemMaterial')
          .id('btn_system_material')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({
              message: 'SystemMaterial',
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            });
          })

        Button('All Parameters')
          .id('btn_all_params')
          .width('40vp')
          .height('10vp')
          .onClick(async () => {
            await this.openToast({
              message: 'All Parameters Test',
              duration: 5000,
              bottom: '50vp',
              alignment: Alignment.Center,
              offset: { dx: 10, dy: 10 },
              showMode: promptAction.ToastShowMode.DEFAULT,
              backgroundColor: '#333333',
              textColor: '#FFFFFF',
              backgroundBlurStyle: BlurStyle.NONE,
              shadow: ShadowStyle.OUTER_DEFAULT_MD,
              enableHoverMode: false
            });
          })
      }

      Button('Close Toast')
        .id('btn_close')
        .width('40vp')
        .height('10vp')
        .onClick(() => {
          this.closeToast();
        })

      Button('Back')
        .id('btn_back')
        .width('40vp')
        .height('10vp')
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}