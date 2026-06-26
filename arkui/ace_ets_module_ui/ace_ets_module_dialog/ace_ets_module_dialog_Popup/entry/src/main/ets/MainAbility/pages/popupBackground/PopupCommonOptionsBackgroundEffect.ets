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

import { ComponentContent } from '@kit.ArkUI';

interface PopupParam {
  closeFunc?: () => void;
}

@Builder
function buildPopupText(param: PopupParam) {
  Column() {
    Text('Popup Content')
      .fontSize(20)
      .margin({ top: 20, bottom: 20 })
    Button('Close')
      .onClick(() => {
        param.closeFunc?.();
      })
  }
  .width('100%')
  .padding(20)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct PopupCommonOptionsBackgroundEffect {
  contentRadius0: ComponentContent<PopupParam> | null = null;
  contentRadius20: ComponentContent<PopupParam> | null = null;
  contentRadius60: ComponentContent<PopupParam> | null = null;
  contentSaturation0: ComponentContent<PopupParam> | null = null;
  contentSaturation1: ComponentContent<PopupParam> | null = null;
  contentSaturation2: ComponentContent<PopupParam> | null = null;
  contentBrightness0: ComponentContent<PopupParam> | null = null;
  contentBrightness1: ComponentContent<PopupParam> | null = null;
  contentBrightness2: ComponentContent<PopupParam> | null = null;
  contentColorRed: ComponentContent<PopupParam> | null = null;
  contentColorString: ComponentContent<PopupParam> | null = null;
  contentAdaptiveColorDefault: ComponentContent<PopupParam> | null = null;
  contentAdaptiveColorAverage: ComponentContent<PopupParam> | null = null;
  contentPolicyAlwaysActive: ComponentContent<PopupParam> | null = null;
  contentPolicyAlwaysInactiveInactiveColor: ComponentContent<PopupParam> | null = null;
  contentCombined: ComponentContent<PopupParam> | null = null;

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('radius_0')
          .id('radius_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentRadius0 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentRadius0!); };
            await promptAction.openPopup(this.contentRadius0, { id: 'radius_0' }, {
              backgroundEffect: { radius: 0 }
            });
          })

        Button('radius_20')
          .id('radius_20')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentRadius20 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentRadius20!); };
            await promptAction.openPopup(this.contentRadius20, { id: 'radius_20' }, {
              backgroundEffect: { radius: 20 }
            });
          })
      }

      Row({ space: 5 }) {
        Button('radius_60')
          .id('radius_60')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentRadius60 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentRadius60!); };
            await promptAction.openPopup(this.contentRadius60, { id: 'radius_60' }, {
              backgroundEffect: { radius: 60 }
            });
          })

        Button('saturation_0')
          .id('saturation_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentSaturation0 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentSaturation0!); };
            await promptAction.openPopup(this.contentSaturation0, { id: 'saturation_0' }, {
              backgroundEffect: { radius: 20, saturation: 0 }
            });
          })
      }

      Row({ space: 5 }) {
        Button('saturation_1')
          .id('saturation_1')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentSaturation1 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentSaturation1!); };
            await promptAction.openPopup(this.contentSaturation1, { id: 'saturation_1' }, {
              backgroundEffect: { radius: 20, saturation: 1 }
            });
          })

        Button('saturation_2')
          .id('saturation_2')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentSaturation2 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentSaturation2!); };
            await promptAction.openPopup(this.contentSaturation2, { id: 'saturation_2' }, {
              backgroundEffect: { radius: 20, saturation: 2 }
            });
          })
      }

      Row({ space: 5 }) {
        Button('brightness_0')
          .id('brightness_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentBrightness0 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentBrightness0!); };
            await promptAction.openPopup(this.contentBrightness0, { id: 'brightness_0' }, {
              backgroundEffect: { radius: 20, brightness: 0 }
            });
          })

        Button('brightness_1')
          .id('brightness_1')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentBrightness1 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentBrightness1!); };
            await promptAction.openPopup(this.contentBrightness1, { id: 'brightness_1' }, {
              backgroundEffect: { radius: 20, brightness: 1 }
            });
          })
      }

      Row({ space: 5 }) {
        Button('brightness_2')
          .id('brightness_2')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentBrightness2 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentBrightness2!); };
            await promptAction.openPopup(this.contentBrightness2, { id: 'brightness_2' }, {
              backgroundEffect: { radius: 20, brightness: 2 }
            });
          })

        Button('color_Color.Red')
          .id('color_red')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentColorRed = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentColorRed!); };
            await promptAction.openPopup(this.contentColorRed, { id: 'color_red' }, {
              backgroundEffect: { radius: 20, color: Color.Red }
            });
          })
      }

      Row({ space: 5 }) {
        Button('color_string')
          .id('color_string')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentColorString = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentColorString!); };
            await promptAction.openPopup(this.contentColorString, { id: 'color_string' }, {
              backgroundEffect: { radius: 20, color: '#80FF0000' }
            });
          })

        Button('adaptiveColor_DEFAULT')
          .id('adaptiveColor_DEFAULT')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentAdaptiveColorDefault = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentAdaptiveColorDefault!); };
            await promptAction.openPopup(this.contentAdaptiveColorDefault, { id: 'adaptiveColor_DEFAULT' }, {
              backgroundEffect: { radius: 20, adaptiveColor: AdaptiveColor.DEFAULT }
            });
          })
      }

      Row({ space: 5 }) {
        Button('adaptiveColor_AVERAGE')
          .id('adaptiveColor_AVERAGE')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentAdaptiveColorAverage = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentAdaptiveColorAverage!); };
            await promptAction.openPopup(this.contentAdaptiveColorAverage, { id: 'adaptiveColor_AVERAGE' }, {
              backgroundEffect: { radius: 60, color: '#80FF0000', adaptiveColor: AdaptiveColor.AVERAGE }
            });
          })

        Button('policy_ALWAYS_ACTIVE')
          .id('policy_ALWAYS_ACTIVE')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentPolicyAlwaysActive = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentPolicyAlwaysActive!); };
            await promptAction.openPopup(this.contentPolicyAlwaysActive, { id: 'policy_ALWAYS_ACTIVE' }, {
              backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE }
            });
          })
      }

      Row({ space: 5 }) {
        Button('policy_ALWAYS_INACTIVE_inactiveColor')
          .id('policy_ALWAYS_INACTIVE_inactiveColor')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentPolicyAlwaysInactiveInactiveColor = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentPolicyAlwaysInactiveInactiveColor!); };
            await promptAction.openPopup(this.contentPolicyAlwaysInactiveInactiveColor, { id: 'policy_ALWAYS_INACTIVE_inactiveColor' }, {
              backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
               inactiveColor: Color.Orange }
            });
          })

        Button('combinedOptions')
          .id('combinedOptions')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentCombined = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => { promptAction.closePopup(this.contentCombined!); };
            await promptAction.openPopup(this.contentCombined, { id: 'combinedOptions' }, {
              backgroundEffect: {
                radius: 60,
                saturation: 2,
                brightness: 1,
                color: '#80FF0000',
                adaptiveColor: AdaptiveColor.DEFAULT,
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                inactiveColor: Color.Blue,
              }
            });
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}