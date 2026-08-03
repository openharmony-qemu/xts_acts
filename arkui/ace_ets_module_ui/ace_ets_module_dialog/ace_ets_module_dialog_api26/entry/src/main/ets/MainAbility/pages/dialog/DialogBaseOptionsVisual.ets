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
import { LevelMode, ImmersiveMode, LevelOrder, LengthMetrics } from '@kit.ArkUI';
import uiMaterial from '@ohos.arkui.uiMaterial';

@Entry
@Component
struct DialogBaseOptionsVisual {
  @State lastAction: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DialogBaseOptions visual').fontSize(18).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('base_visual_action')
        Button('backgroundColor blur')
          .id('btn_visual_bg')
          .onClick(async () => {
            await this.presenter().present({
              title: 'BgTitle',
              message: { content: 'BgMessage' },
              backgroundColor: '#EEF5FF',
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                scale: 0.6
              },
              maskColor: '#66000000',
              shadow: ShadowStyle.OUTER_DEFAULT_MD,
              buttons: [
                {
                  value: 'BgOK',
                  action: () => {
                    this.lastAction = 'BgOK';
                  }
                }
              ]
            });
          })
        Button('backgroundEffect')
          .id('btn_visual_effect')
          .onClick(async () => {
            await this.presenter().present({
              title: 'EffectTitle',
              message: { content: 'EffectMessage' },
              backgroundEffect: {
                radius: 20,
                saturation: 1.1,
                brightness: 1.0,
                color: '#AA99FF'
              },
              buttons: [
                {
                  value: 'EffectOK',
                  action: () => {
                    this.lastAction = 'EffectOK';
                  }
                }
              ]
            });
          })
        Button('levelMode OVERLAY')
          .id('btn_visual_level_overlay')
          .onClick(async () => {
            await this.presenter().present({
              title: 'LevelOverlay',
              message: { content: 'LevelOverlayMsg' },
              levelMode: LevelMode.OVERLAY,
              immersiveMode: ImmersiveMode.DEFAULT,
              levelOrder: LevelOrder.clamp(1),
              buttons: [
                {
                  value: 'LevelOK',
                  action: () => {
                    this.lastAction = 'LevelOK';
                  }
                }
              ]
            });
          })
        Button('levelMode EMBEDDED')
          .id('btn_visual_level_embedded')
          .onClick(async () => {
            await this.presenter().present({
              title: 'LevelEmbedded',
              message: { content: 'LevelEmbeddedMsg' },
              levelMode: LevelMode.EMBEDDED,
              immersiveMode: ImmersiveMode.EXTEND,
              buttons: [
                {
                  value: 'EmbedOK',
                  action: () => {
                    this.lastAction = 'EmbedOK';
                  }
                }
              ]
            });
          })
        Button('isModal false')
          .id('btn_visual_not_modal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'NotModal',
              message: { content: 'NotModalMsg' },
              isModal: false,
              autoCancel: true,
              focusable: true,
              buttons: [
                {
                  value: 'ModalOK',
                  action: () => {
                    this.lastAction = 'ModalOK';
                  }
                }
              ]
            });
          })
        Button('hover mode opts')
          .id('btn_visual_hover')
          .onClick(async () => {
            await this.presenter().present({
              title: 'HoverTitle',
              message: { content: 'HoverMessage' },
              enableHoverMode: true,
              hoverModeArea: HoverModeAreaType.BOTTOM_SCREEN,
              buttons: [
                {
                  value: 'HoverOK',
                  action: () => {
                    this.lastAction = 'HoverOK';
                  }
                }
              ]
            });
          })
        Button('transition keyboard')
          .id('btn_visual_transition')
          .onClick(async () => {
            await this.presenter().present({
              title: 'TransTitle',
              message: { content: 'TransMessage' },
              dialogTransition: TransitionEffect.OPACITY,
              maskTransition: TransitionEffect.OPACITY,
              keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
              keyboardAvoidDistance: LengthMetrics.vp(12),
              buttons: [
                {
                  value: 'TransOK',
                  action: () => {
                    this.lastAction = 'TransOK';
                  }
                }
              ]
            });
          })
        Button('levelUniqueId embed')
          .id('btn_visual_level_uid')
          .onClick(async () => {
            await this.presenter().present({
              title: 'LevelUidTitle',
              message: { content: 'LevelUidMessage' },
              levelMode: LevelMode.EMBEDDED,
              levelUniqueId: 1,
              immersiveMode: ImmersiveMode.DEFAULT,
              buttons: [
                {
                  value: 'UidOK',
                  action: () => {
                    this.lastAction = 'UidOK';
                  }
                }
              ]
            });
          })
        Button('systemMaterial')
          .id('btn_visual_material')
          .onClick(async () => {
            await this.presenter().present({
              title: 'MaterialTitle',
              message: { content: 'MaterialMessage' },
              systemMaterial: uiMaterial.Material.empty,
              buttons: [
                {
                  value: 'MaterialOK',
                  action: () => {
                    this.lastAction = 'MaterialOK';
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
