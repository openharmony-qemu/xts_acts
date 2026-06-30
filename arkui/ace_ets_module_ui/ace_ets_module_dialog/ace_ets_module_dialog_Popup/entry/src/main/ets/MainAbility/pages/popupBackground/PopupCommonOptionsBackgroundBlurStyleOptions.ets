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
struct PopupCommonOptionsBackgroundBlurStyleOptions {
  contentPolicyFollows: ComponentContent<PopupParam> | null = null;
  contentPolicyAlwaysActive: ComponentContent<PopupParam> | null = null;
  contentPolicyAlwaysInactive: ComponentContent<PopupParam> | null = null;
  contentInactiveColorRed: ComponentContent<PopupParam> | null = null;
  contentInactiveColorString: ComponentContent<PopupParam> | null = null;
  contentInactiveColorNumber: ComponentContent<PopupParam> | null = null;
  contentColorModeLight: ComponentContent<PopupParam> | null = null;
  contentColorModeDark: ComponentContent<PopupParam> | null = null;
  contentAdaptiveColorDefault: ComponentContent<PopupParam> | null = null;
  contentAdaptiveColorAverage: ComponentContent<PopupParam> | null = null;
  contentScale0: ComponentContent<PopupParam> | null = null;
  contentScale1: ComponentContent<PopupParam> | null = null;
  contentScale2: ComponentContent<PopupParam> | null = null;
  contentCombined: ComponentContent<PopupParam> | null = null;

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .id('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentPolicyFollows = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentPolicyFollows!);
            };
            await promptAction.openPopup(this.contentPolicyFollows, { id: 'policy_FOLLOWS_WINDOW_ACTIVE_STATE' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              }
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
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentPolicyAlwaysActive!);
            };
            await promptAction.openPopup(this.contentPolicyAlwaysActive, { id: 'policy_ALWAYS_ACTIVE' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('policy_ALWAYS_INACTIVE')
          .id('policy_ALWAYS_INACTIVE')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentPolicyAlwaysInactive = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentPolicyAlwaysInactive!);
            };
            await promptAction.openPopup(this.contentPolicyAlwaysInactive, { id: 'policy_ALWAYS_INACTIVE' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              }
            });
          })

        Button('inactiveColor_Color.Red')
          .id('inactiveColor_red')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentInactiveColorRed = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentInactiveColorRed!);
            };
            await promptAction.openPopup(this.contentInactiveColorRed, { id: 'inactiveColor_red' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
                inactiveColor: Color.Red,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('inactiveColor_string')
          .id('inactiveColor_string')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentInactiveColorString = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentInactiveColorString!);
            };
            await promptAction.openPopup(this.contentInactiveColorString, { id: 'inactiveColor_string' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
                inactiveColor: '#FFFF0000',
              }
            });
          })

        Button('inactiveColor_number')
          .id('inactiveColor_number')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentInactiveColorNumber = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentInactiveColorNumber!);
            };
            await promptAction.openPopup(this.contentInactiveColorNumber, { id: 'inactiveColor_number' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
                inactiveColor: 0xFFFF0000,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('colorMode_LIGHT')
          .id('colorMode_LIGHT')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentColorModeLight = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentColorModeLight!);
            };
            await promptAction.openPopup(this.contentColorModeLight, { id: 'colorMode_LIGHT' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                colorMode: ThemeColorMode.LIGHT,
              }
            });
          })

        Button('colorMode_DARK')
          .id('colorMode_DARK')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentColorModeDark = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentColorModeDark!);
            };
            await promptAction.openPopup(this.contentColorModeDark, { id: 'colorMode_DARK' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                colorMode: ThemeColorMode.DARK,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('adaptiveColor_DEFAULT')
          .id('adaptiveColor_DEFAULT')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentAdaptiveColorDefault = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentAdaptiveColorDefault!);
            };
            await promptAction.openPopup(this.contentAdaptiveColorDefault, { id: 'adaptiveColor_DEFAULT' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                adaptiveColor: AdaptiveColor.DEFAULT,
              }
            });
          })

        Button('adaptiveColor_AVERAGE')
          .id('adaptiveColor_AVERAGE')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentAdaptiveColorAverage = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentAdaptiveColorAverage!);
            };
            await promptAction.openPopup(this.contentAdaptiveColorAverage, { id: 'adaptiveColor_AVERAGE' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                adaptiveColor: AdaptiveColor.AVERAGE,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('scale_0')
          .id('scale_0')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentScale0 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentScale0!);
            };
            await promptAction.openPopup(this.contentScale0, { id: 'scale_0' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                scale: 0,
              }
            });
          })

        Button('scale_1')
          .id('scale_1')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentScale1 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentScale1!);
            };
            await promptAction.openPopup(this.contentScale1, { id: 'scale_1' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                scale: 1,
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('scale_2')
          .id('scale_2')
          .height('5%')
          .width('30%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentScale2 = new ComponentContent(this.getUIContext(),
             wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentScale2!);
            };
            await promptAction.openPopup(this.contentScale2, { id: 'scale_2' }, {
              backgroundBlurStyle: BlurStyle.Thin,
              backgroundBlurStyleOptions: {
                scale: 2,
              }
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
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentCombined!);
            };
            await promptAction.openPopup(this.contentCombined, { id: 'combinedOptions' }, {
              backgroundBlurStyle: BlurStyle.Regular,
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                inactiveColor: Color.Blue,
                colorMode: ThemeColorMode.LIGHT,
                adaptiveColor: AdaptiveColor.DEFAULT,
                scale: 1.0,
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