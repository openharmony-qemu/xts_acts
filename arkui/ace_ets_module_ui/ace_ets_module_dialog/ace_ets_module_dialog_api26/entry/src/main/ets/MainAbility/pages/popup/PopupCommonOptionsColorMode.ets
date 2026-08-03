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

import { ComponentContent } from '@kit.ArkUI';

interface PopupParam {
  closeFunc?: () => void;
  label: string;
}

@Builder
function buildColorPopup(param: PopupParam) {
  Column() {
    Text(param.label)
      .fontSize(18)
      .margin({ top: 12, bottom: 12 })
      .id('popup_common_color_content')
    Button('Close')
      .id('popup_common_color_close')
      .onClick(() => {
        if (param.closeFunc !== undefined) {
          param.closeFunc();
        }
      })
  }
  .padding(16)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct PopupCommonOptionsColorMode {
  contentFollowSystem: ComponentContent<PopupParam> | null = null;
  contentFollowTarget: ComponentContent<PopupParam> | null = null;
  contentCombined: ComponentContent<PopupParam> | null = null;

  async openWithColorMode(btnId: string, label: string, mode: AnchoredColorMode,
    holder: 'system' | 'target' | 'combined') {
    let promptAction = this.getUIContext().getPromptAction();
    let popupParam: PopupParam = { closeFunc: undefined, label: label };
    let content = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildColorPopup), popupParam);
    popupParam.closeFunc = () => {
      promptAction.closePopup(content);
    };
    if (holder === 'system') {
      this.contentFollowSystem = content;
    } else if (holder === 'target') {
      this.contentFollowTarget = content;
    } else {
      this.contentCombined = content;
    }
    await promptAction.openPopup(content, { id: btnId }, {
      placement: Placement.Bottom,
      colorMode: mode,
    });
  }

  build() {
    Column({ space: 12 }) {
      Text('PopupCommonOptions.colorMode').fontSize(18).fontWeight(FontWeight.Bold)
      WithTheme({ colorMode: ThemeColorMode.LIGHT }) {
        Column({ space: 10 }) {
          Button('openPopup FOLLOW_SYSTEM')
            .id('btn_common_color_follow_system')
            .onClick(async () => {
              await this.openWithColorMode('btn_common_color_follow_system',
                'Common color FOLLOW_SYSTEM', AnchoredColorMode.FOLLOW_SYSTEM, 'system');
            })
          Button('openPopup FOLLOW_TARGET')
            .id('btn_common_color_follow_target')
            .onClick(async () => {
              await this.openWithColorMode('btn_common_color_follow_target',
                'Common color FOLLOW_TARGET', AnchoredColorMode.FOLLOW_TARGET, 'target');
            })
          Button('openPopup combined')
            .id('btn_common_color_combined')
            .onClick(async () => {
              await this.openWithColorMode('btn_common_color_combined',
                'Common color combined', AnchoredColorMode.FOLLOW_SYSTEM, 'combined');
            })
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
