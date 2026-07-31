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
  DialogPresenter,
  DialogButtonOrientation,
  LevelMode,
  dialog,
} from '@kit.ArkUI';

@Entry
@Component
struct DialogAbnormalOpts {
  @State lastAction: string = 'none';
  @State lastError: string = 'none';
  @State coverFlag: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private baseOpts(title: string, msg: string, ok: string, act: string): dialog.DialogStyleOptions {
    return {
      title: title,
      message: { content: msg },
      buttons: [{
        value: ok,
        action: () => {
          this.lastAction = act;
        }
      }]
    };
  }

  private async runProbe(tag: string, opts: dialog.DialogStyleOptions): Promise<void> {
    this.lastError = 'none';
    try {
      await this.presenter().present(opts);
      this.coverFlag = 'ok:' + tag;
    } catch (err) {
      this.lastError = String(err);
      this.coverFlag = 'fail:' + tag;
      this.lastAction = 'error';
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('Dialog optional undefined probe').fontSize(16).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('abn_action')
        Text('error=' + this.lastError).id('abn_error')
        Text('cover=' + this.coverFlag).id('abn_cover')
        Button('undefined subtitle')
          .id('btn_abn_subtitle')
          .onClick(async () => {
            let opts = this.baseOpts('AbnSubTitle', 'AbnMsg_subtitle', 'AbnOK_subtitle',
              'subtitle_undefined');
            opts.subtitle = undefined;
            await this.runProbe('subtitle', opts);
          })
        Button('undefined width')
          .id('btn_abn_width')
          .onClick(async () => {
            let opts = this.baseOpts('AbnWidthTitle', 'AbnMsg_width', 'AbnOK_width', 'width_undefined');
            opts.width = undefined;
            await this.runProbe('width', opts);
          })
        Button('undefined height')
          .id('btn_abn_height')
          .onClick(async () => {
            let opts = this.baseOpts('AbnHeightTitle', 'AbnMsg_height', 'AbnOK_height',
              'height_undefined');
            opts.height = undefined;
            await this.runProbe('height', opts);
          })
        Button('undefined maskColor')
          .id('btn_abn_maskColor')
          .onClick(async () => {
            let opts = this.baseOpts('AbnMaskTitle', 'AbnMsg_maskColor', 'AbnOK_maskColor',
              'maskColor_undefined');
            opts.maskColor = undefined;
            await this.runProbe('maskColor', opts);
          })
        Button('undefined offset')
          .id('btn_abn_offset')
          .onClick(async () => {
            let opts = this.baseOpts('AbnOffsetTitle', 'AbnMsg_offset', 'AbnOK_offset',
              'offset_undefined');
            opts.offset = undefined;
            await this.runProbe('offset', opts);
          })
        Button('undefined borderWidth')
          .id('btn_abn_borderWidth')
          .onClick(async () => {
            let opts = this.baseOpts(
              'AbnBWTitle', 'AbnMsg_borderWidth', 'AbnOK_borderWidth', 'borderWidth_undefined');
            opts.borderWidth = undefined;
            await this.runProbe('borderWidth', opts);
          })
        Button('undefined borderRadius')
          .id('btn_abn_borderRadius')
          .onClick(async () => {
            let opts = this.baseOpts(
              'AbnBRTitle', 'AbnMsg_borderRadius', 'AbnOK_borderRadius',
              'borderRadius_undefined');
            opts.borderRadius = undefined;
            await this.runProbe('borderRadius', opts);
          })
        Button('undefined shadow')
          .id('btn_abn_shadow')
          .onClick(async () => {
            let opts = this.baseOpts('AbnShadowTitle', 'AbnMsg_shadow', 'AbnOK_shadow',
              'shadow_undefined');
            opts.shadow = undefined;
            await this.runProbe('shadow', opts);
          })
        Button('undefined autoCancel')
          .id('btn_abn_autoCancel')
          .onClick(async () => {
            let opts = this.baseOpts('AbnACTitle', 'AbnMsg_autoCancel', 'AbnOK_autoCancel',
              'autoCancel_undefined');
            opts.autoCancel = undefined;
            await this.runProbe('autoCancel', opts);
          })
        Button('undefined isModal')
          .id('btn_abn_isModal')
          .onClick(async () => {
            let opts = this.baseOpts('AbnModalTitle', 'AbnMsg_isModal', 'AbnOK_isModal',
              'isModal_undefined');
            opts.isModal = undefined;
            await this.runProbe('isModal', opts);
          })
        Button('undefined backgroundColor')
          .id('btn_abn_backgroundColor')
          .onClick(async () => {
            let opts = this.baseOpts('AbnBgTitle', 'AbnMsg_backgroundColor', 'AbnOK_backgroundColor',
              'backgroundColor_undefined');
            opts.backgroundColor = undefined;
            await this.runProbe('backgroundColor', opts);
          })
        Button('undefined buttonDirection')
          .id('btn_abn_buttonDirection')
          .onClick(async () => {
            let opts = this.baseOpts('AbnDirTitle', 'AbnMsg_buttonDirection', 'AbnOK_buttonDirection',
              'buttonDirection_undefined');
            opts.buttonDirection = undefined;
            await this.runProbe('buttonDirection', opts);
          })
        Button('undefined wordBreak')
          .id('btn_abn_wordBreak')
          .onClick(async () => {
            let msg: dialog.DialogMessage = {
              content: 'AbnWordBreakMsg',
              wordBreak: undefined
            };
            let opts: dialog.DialogStyleOptions = {
              title: 'AbnWBTitle',
              message: msg,
              buttons: [{
                value: 'AbnOK_wordBreak',
                action: () => {
                  this.lastAction = 'wordBreak_undefined';
                }
              }]
            };
            await this.runProbe('wordBreak', opts);
          })
        Button('undefined levelMode')
          .id('btn_abn_levelMode')
          .onClick(async () => {
            let opts = this.baseOpts('AbnLevelTitle', 'AbnMsg_levelMode', 'AbnOK_levelMode',
              'levelMode_undefined');
            opts.levelMode = undefined;
            await this.runProbe('levelMode', opts);
          })
        Button('undefined focusable')
          .id('btn_abn_focusable')
          .onClick(async () => {
            let opts = this.baseOpts('AbnFocusTitle', 'AbnMsg_focusable', 'AbnOK_focusable',
              'focusable_undefined');
            opts.focusable = undefined;
            await this.runProbe('focusable', opts);
          })
        Button('omit optional all')
          .id('btn_abn_omit')
          .onClick(async () => {
            await this.runProbe('omit', this.baseOpts('AbnOmitTitle', 'AbnOmitMsg', 'AbnOmitOK',
              'omit_ok'));
          })
        Button('null probe cover note')
          .id('btn_abn_null_note')
          .onClick(() => {
            this.coverFlag = 'null_compile_skip';
            this.lastAction = 'null_noted';
          })
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
