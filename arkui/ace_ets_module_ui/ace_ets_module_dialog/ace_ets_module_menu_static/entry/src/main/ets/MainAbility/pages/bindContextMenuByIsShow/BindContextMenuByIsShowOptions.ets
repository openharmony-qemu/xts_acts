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

'use static';

import {
  Entry, Column, ColumnOptions, Component, Builder, Button, Text, Scroll, Row, RowOptions,
  ContextMenuOptions, MenuElement, Menu, MenuItem, MenuItemOptions, MenuPreviewMode,
  PreviewScaleMode, AvailableLayoutArea, ModalMode, MenuKeyboardAvoidMode,
  HapticFeedbackMode, AnchoredColorMode, Color, FontWeight, $r, CustomBuilder,
  ResourceStr, Image
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct BindContextMenuByIsShowOptionsIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('BindContextMenuByIsShowOptions error ' + error);
    }
  }

  private iconStr: ResourceStr = $r('app.media.icon');
  private bcmMenuElements: Array<MenuElement> = [
    { value: '菜单选项1', action: () => { console.info('menu1'); } } as MenuElement,
    { value: '菜单选项2', action: () => { console.info('menu2'); } } as MenuElement,
  ];


  @State isShowArrowT: boolean = false;
  @State isShowArrowF: boolean = false;
  @State txtArrowT: string = '';
  @State txtArrowF: string = '';

  @State isShowHoverT: boolean = false;
  @State isShowHoverF: boolean = false;
  @State txtHoverT: string = '';
  @State txtHoverF: string = '';

  @State isShowPreviewNone: boolean = false;
  @State isShowPreviewImg: boolean = false;
  @State isShowPreviewBuilder: boolean = false;
  @State txtPreviewNone: string = '';
  @State txtPreviewImg: string = '';
  @State txtPreviewBuilder: string = '';

  @State isShowAnimScale: boolean = false;
  @State isShowAnimHoverF: boolean = false;
  @State isShowAnimHoverT: boolean = false;
  @State txtAnimScale: string = '';
  @State txtAnimHoverF: string = '';
  @State txtAnimHoverT: string = '';

  @State isShowHap0: boolean = false;
  @State isShowHap1: boolean = false;
  @State isShowHap2: boolean = false;
  @State txtHap0: string = '';
  @State txtHap1: string = '';
  @State txtHap2: string = '';

  @State isShowModal0: boolean = false;
  @State isShowModal1: boolean = false;
  @State isShowModal2: boolean = false;
  @State txtModal0: string = '';
  @State txtModal1: string = '';
  @State txtModal2: string = '';

  @State isShowScale0: boolean = false;
  @State isShowScale1: boolean = false;
  @State isShowScale2: boolean = false;
  @State txtScale0: string = '';
  @State txtScale1: string = '';
  @State txtScale2: string = '';

  @State isShowArea: boolean = false;
  @State txtArea: string = '';

  @State isShowKbd0: boolean = false;
  @State isShowKbd1: boolean = false;
  @State txtKbd0: string = '';
  @State txtKbd1: string = '';

  @State isShowColor0: boolean = false;
  @State isShowColor1: boolean = false;
  @State txtColor0: string = '';
  @State txtColor1: string = '';

  @State isShowMaskT: boolean = false;
  @State isShowMaskF: boolean = false;
  @State txtMaskT: string = '';
  @State txtMaskF: string = '';


  @Builder
  MyPreview() {
    Column() {
      Image($r('app.media.icon')).width(50).height(30)
    }
  }

  @Builder
  buildArrowSection() {
    Row() {
      Column() {
        Button('arrow:T')
          .id('BindContextMenuByIsShowOptions_btnEnableArrow_01')
          .fontSize(9)
          .onClick(() => { this.isShowArrowT = true; })
          .bindContextMenuByIsShow(this.isShowArrowT, this.bcmMenuElements, {
            enableArrow: true,
            onWillDisappear: () => {
              this.isShowArrowT = false;
              this.txtArrowT = 'true';
            }
          } as ContextMenuOptions)
        Text(this.txtArrowT).id('BindContextMenuByIsShowOptions_txtEnableArrow_01').fontSize(8)
      }
      Column() {
        Button('arrow:F')
          .id('BindContextMenuByIsShowOptions_btnEnableArrow_02')
          .fontSize(9)
          .onClick(() => { this.isShowArrowF = true; })
          .bindContextMenuByIsShow(this.isShowArrowF, this.bcmMenuElements, {
            enableArrow: false,
            onWillDisappear: () => {
              this.isShowArrowF = false;
              this.txtArrowF = 'false';
            }
          } as ContextMenuOptions)
        Text(this.txtArrowF).id('BindContextMenuByIsShowOptions_txtEnableArrow_02').fontSize(8)
      }
    }
  }

  @Builder
  buildHoverModeSection() {
    Row() {
      Column() {
        Button('hover:T')
          .id('BindContextMenuByIsShowOptions_btnEnableHoverMode_01')
          .fontSize(9)
          .onClick(() => { this.isShowHoverT = true; })
          .bindContextMenuByIsShow(this.isShowHoverT, this.bcmMenuElements, {
            enableHoverMode: true,
            onWillDisappear: () => {
              this.isShowHoverT = false;
              this.txtHoverT = 'true';
            }
          } as ContextMenuOptions)
        Text(this.txtHoverT).id('BindContextMenuByIsShowOptions_txtEnableHoverMode_01').fontSize(8)
      }
      Column() {
        Button('hover:F')
          .id('BindContextMenuByIsShowOptions_btnEnableHoverMode_02')
          .fontSize(9)
          .onClick(() => { this.isShowHoverF = true; })
          .bindContextMenuByIsShow(this.isShowHoverF, this.bcmMenuElements, {
            enableHoverMode: false,
            onWillDisappear: () => {
              this.isShowHoverF = false;
              this.txtHoverF = 'false';
            }
          } as ContextMenuOptions)
        Text(this.txtHoverF).id('BindContextMenuByIsShowOptions_txtEnableHoverMode_02').fontSize(8)
      }
    }
  }

  @Builder
  buildPreviewSection() {
    Row() {
      Column() {
        Button('prev:N')
          .id('BindContextMenuByIsShowOptions_btnPreview_01')
          .fontSize(9)
          .onClick(() => { this.isShowPreviewNone = true; })
          .bindContextMenuByIsShow(this.isShowPreviewNone, this.bcmMenuElements, {
            preview: MenuPreviewMode.NONE,
            onWillDisappear: () => {
              this.isShowPreviewNone = false;
              this.txtPreviewNone = '0';
            }
          } as ContextMenuOptions)
        Text(this.txtPreviewNone).id('BindContextMenuByIsShowOptions_txtPreview_01').fontSize(8)
      }
      Column() {
        Button('prev:I')
          .id('BindContextMenuByIsShowOptions_btnPreview_02')
          .fontSize(9)
          .onClick(() => { this.isShowPreviewImg = true; })
          .bindContextMenuByIsShow(this.isShowPreviewImg, this.bcmMenuElements, {
            preview: MenuPreviewMode.IMAGE,
            onWillDisappear: () => {
              this.isShowPreviewImg = false;
              this.txtPreviewImg = '1';
            }
          } as ContextMenuOptions)
        Text(this.txtPreviewImg).id('BindContextMenuByIsShowOptions_txtPreview_02').fontSize(8)
      }
      Column() {
        Button('prev:B')
          .id('BindContextMenuByIsShowOptions_btnPreview_03')
          .fontSize(9)
          .onClick(() => { this.isShowPreviewBuilder = true; })
          .bindContextMenuByIsShow(this.isShowPreviewBuilder, this.bcmMenuElements, {
            preview: this.MyPreview,
            onWillDisappear: () => {
              this.isShowPreviewBuilder = false;
              this.txtPreviewBuilder = 'builder';
            }
          } as ContextMenuOptions)
        Text(this.txtPreviewBuilder).id('BindContextMenuByIsShowOptions_txtPreview_03').fontSize(8)
      }
    }
  }

  @Builder
  buildAnimSection() {
    Row() {
      Column() {
        Button('anim:sc')
          .id('BindContextMenuByIsShowOptions_btnPreviewAnimation_01')
          .fontSize(9)
          .onClick(() => { this.isShowAnimScale = true; })
          .bindContextMenuByIsShow(this.isShowAnimScale, this.bcmMenuElements, {
            preview: this.MyPreview,
            previewAnimationOptions: { scale: [0.8, 1.0] },
            onWillDisappear: () => {
              this.isShowAnimScale = false;
              this.txtAnimScale = 'scale';
            }
          } as ContextMenuOptions)
        Text(this.txtAnimScale).id('BindContextMenuByIsShowOptions_txtPreviewAnimation_01').fontSize(8)
      }
      Column() {
        Button('hs:F')
          .id('BindContextMenuByIsShowOptions_btnHoverScaleInterruption_01')
          .fontSize(9)
          .onClick(() => { this.isShowAnimHoverF = true; })
          .bindContextMenuByIsShow(this.isShowAnimHoverF, this.bcmMenuElements, {
            preview: this.MyPreview,
            previewAnimationOptions: {
              hoverScale: [1.0, 0.8],
              hoverScaleInterruption: false
            },
            onWillDisappear: () => {
              this.isShowAnimHoverF = false;
              this.txtAnimHoverF = 'false';
            }
          } as ContextMenuOptions)
        Text(this.txtAnimHoverF).id('BindContextMenuByIsShowOptions_txtHoverScaleInterruption_01').fontSize(8)
      }
      Column() {
        Button('hs:T')
          .id('BindContextMenuByIsShowOptions_btnHoverScaleInterruption_02')
          .fontSize(9)
          .onClick(() => { this.isShowAnimHoverT = true; })
          .bindContextMenuByIsShow(this.isShowAnimHoverT, this.bcmMenuElements, {
            preview: this.MyPreview,
            previewAnimationOptions: {
              hoverScale: [1.0, 0.8],
              hoverScaleInterruption: true
            },
            onWillDisappear: () => {
              this.isShowAnimHoverT = false;
              this.txtAnimHoverT = 'true';
            }
          } as ContextMenuOptions)
        Text(this.txtAnimHoverT).id('BindContextMenuByIsShowOptions_txtHoverScaleInterruption_02').fontSize(8)
      }
    }
  }

  @Builder
  buildHapticSection() {
    Row() {
      Column() {
        Button('hap:0')
          .id('BindContextMenuByIsShowOptions_btnHapticFeedback_01')
          .fontSize(9)
          .onClick(() => { this.isShowHap0 = true; })
          .bindContextMenuByIsShow(this.isShowHap0, this.bcmMenuElements, {
            hapticFeedbackMode: HapticFeedbackMode.DISABLED,
            onWillDisappear: () => {
              this.isShowHap0 = false;
              this.txtHap0 = '0';
            }
          } as ContextMenuOptions)
        Text(this.txtHap0).id('BindContextMenuByIsShowOptions_txtHapticFeedback_01').fontSize(8)
      }
      Column() {
        Button('hap:1')
          .id('BindContextMenuByIsShowOptions_btnHapticFeedback_02')
          .fontSize(9)
          .onClick(() => { this.isShowHap1 = true; })
          .bindContextMenuByIsShow(this.isShowHap1, this.bcmMenuElements, {
            hapticFeedbackMode: HapticFeedbackMode.ENABLED,
            onWillDisappear: () => {
              this.isShowHap1 = false;
              this.txtHap1 = '1';
            }
          } as ContextMenuOptions)
        Text(this.txtHap1).id('BindContextMenuByIsShowOptions_txtHapticFeedback_02').fontSize(8)
      }
      Column() {
        Button('hap:2')
          .id('BindContextMenuByIsShowOptions_btnHapticFeedback_03')
          .fontSize(9)
          .onClick(() => { this.isShowHap2 = true; })
          .bindContextMenuByIsShow(this.isShowHap2, this.bcmMenuElements, {
            hapticFeedbackMode: HapticFeedbackMode.AUTO,
            onWillDisappear: () => {
              this.isShowHap2 = false;
              this.txtHap2 = '2';
            }
          } as ContextMenuOptions)
        Text(this.txtHap2).id('BindContextMenuByIsShowOptions_txtHapticFeedback_03').fontSize(8)
      }
    }
  }

  @Builder
  buildModalSection() {
    Row() {
      Column() {
        Button('mod:A')
          .id('BindContextMenuByIsShowOptions_btnModalMode_01')
          .fontSize(9)
          .onClick(() => { this.isShowModal0 = true; })
          .bindContextMenuByIsShow(this.isShowModal0, this.bcmMenuElements, {
            modalMode: ModalMode.AUTO,
            onWillDisappear: () => {
              this.isShowModal0 = false;
              this.txtModal0 = 'AUTO';
            }
          } as ContextMenuOptions)
        Text(this.txtModal0).id('BindContextMenuByIsShowOptions_txtModalMode_01').fontSize(8)
      }
      Column() {
        Button('mod:N')
          .id('BindContextMenuByIsShowOptions_btnModalMode_02')
          .fontSize(9)
          .onClick(() => { this.isShowModal1 = true; })
          .bindContextMenuByIsShow(this.isShowModal1, this.bcmMenuElements, {
            modalMode: ModalMode.NONE,
            onWillDisappear: () => {
              this.isShowModal1 = false;
              this.txtModal1 = 'NONE';
            }
          } as ContextMenuOptions)
        Text(this.txtModal1).id('BindContextMenuByIsShowOptions_txtModalMode_02').fontSize(8)
      }
      Column() {
        Button('mod:TW')
          .id('BindContextMenuByIsShowOptions_btnModalMode_03')
          .fontSize(9)
          .onClick(() => { this.isShowModal2 = true; })
          .bindContextMenuByIsShow(this.isShowModal2, this.bcmMenuElements, {
            modalMode: ModalMode.TARGET_WINDOW,
            onWillDisappear: () => {
              this.isShowModal2 = false;
              this.txtModal2 = 'TARGET';
            }
          } as ContextMenuOptions)
        Text(this.txtModal2).id('BindContextMenuByIsShowOptions_txtModalMode_03').fontSize(8)
      }
    }
  }

  @Builder
  buildScaleModeSection() {
    Row() {
      Column() {
        Button('ps:A')
          .id('BindContextMenuByIsShowOptions_btnPreviewScaleMode_01')
          .fontSize(9)
          .onClick(() => { this.isShowScale0 = true; })
          .bindContextMenuByIsShow(this.isShowScale0, this.bcmMenuElements, {
            preview: MenuPreviewMode.IMAGE,
            previewScaleMode: PreviewScaleMode.AUTO,
            onWillDisappear: () => {
              this.isShowScale0 = false;
              this.txtScale0 = 'AUTO';
            }
          } as ContextMenuOptions)
        Text(this.txtScale0).id('BindContextMenuByIsShowOptions_txtPreviewScaleMode_01').fontSize(8)
      }
      Column() {
        Button('ps:C')
          .id('BindContextMenuByIsShowOptions_btnPreviewScaleMode_02')
          .fontSize(9)
          .onClick(() => { this.isShowScale1 = true; })
          .bindContextMenuByIsShow(this.isShowScale1, this.bcmMenuElements, {
            preview: MenuPreviewMode.IMAGE,
            previewScaleMode: PreviewScaleMode.CONSTANT,
            onWillDisappear: () => {
              this.isShowScale1 = false;
              this.txtScale1 = 'CONSTANT';
            }
          } as ContextMenuOptions)
        Text(this.txtScale1).id('BindContextMenuByIsShowOptions_txtPreviewScaleMode_02').fontSize(8)
      }
      Column() {
        Button('ps:M')
          .id('BindContextMenuByIsShowOptions_btnPreviewScaleMode_03')
          .fontSize(9)
          .onClick(() => { this.isShowScale2 = true; })
          .bindContextMenuByIsShow(this.isShowScale2, this.bcmMenuElements, {
            preview: MenuPreviewMode.IMAGE,
            previewScaleMode: PreviewScaleMode.MAINTAIN,
            onWillDisappear: () => {
              this.isShowScale2 = false;
              this.txtScale2 = 'MAINTAIN';
            }
          } as ContextMenuOptions)
        Text(this.txtScale2).id('BindContextMenuByIsShowOptions_txtPreviewScaleMode_03').fontSize(8)
      }
    }
  }

  @Builder
  buildMiscSection() {
    Column() {
      Row() {
        Column() {
          Button('area:SA')
            .id('BindContextMenuByIsShowOptions_btnAvailableLayoutArea_01')
            .fontSize(9)
            .onClick(() => { this.isShowArea = true; })
            .bindContextMenuByIsShow(this.isShowArea, this.bcmMenuElements, {
              preview: MenuPreviewMode.IMAGE,
              availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
              onWillDisappear: () => {
                this.isShowArea = false;
                this.txtArea = 'SAFE_AREA';
              }
            } as ContextMenuOptions)
          Text(this.txtArea).id('BindContextMenuByIsShowOptions_txtAvailableLayoutArea_01').fontSize(8)
        }
        Column() {
          Button('kbd:0')
            .id('BindContextMenuByIsShowOptions_btnKeyboardAvoidMode_01')
            .fontSize(9)
            .onClick(() => { this.isShowKbd0 = true; })
            .bindContextMenuByIsShow(this.isShowKbd0, this.bcmMenuElements, {
              keyboardAvoidMode: MenuKeyboardAvoidMode.NONE,
              onWillDisappear: () => {
                this.isShowKbd0 = false;
                this.txtKbd0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtKbd0).id('BindContextMenuByIsShowOptions_txtKeyboardAvoidMode_01').fontSize(8)
        }
        Column() {
          Button('kbd:1')
            .id('BindContextMenuByIsShowOptions_btnKeyboardAvoidMode_02')
            .fontSize(9)
            .onClick(() => { this.isShowKbd1 = true; })
            .bindContextMenuByIsShow(this.isShowKbd1, this.bcmMenuElements, {
              keyboardAvoidMode: MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE,
              onWillDisappear: () => {
                this.isShowKbd1 = false;
                this.txtKbd1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtKbd1).id('BindContextMenuByIsShowOptions_txtKeyboardAvoidMode_02').fontSize(8)
        }
      }
      Row() {
        Column() {
          Button('clr:FS')
            .id('BindContextMenuByIsShowOptions_btnColorMode_01')
            .fontSize(9)
            .onClick(() => { this.isShowColor0 = true; })
            .bindContextMenuByIsShow(this.isShowColor0, this.bcmMenuElements, {
              colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
              onWillDisappear: () => {
                this.isShowColor0 = false;
                this.txtColor0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtColor0).id('BindContextMenuByIsShowOptions_txtColorMode_01').fontSize(8)
        }
        Column() {
          Button('clr:FT')
            .id('BindContextMenuByIsShowOptions_btnColorMode_02')
            .fontSize(9)
            .onClick(() => { this.isShowColor1 = true; })
            .bindContextMenuByIsShow(this.isShowColor1, this.bcmMenuElements, {
              colorMode: AnchoredColorMode.FOLLOW_TARGET,
              onWillDisappear: () => {
                this.isShowColor1 = false;
                this.txtColor1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtColor1).id('BindContextMenuByIsShowOptions_txtColorMode_02').fontSize(8)
        }
        Column() {
          Button('mask:T')
            .id('BindContextMenuByIsShowOptions_btnMask_01')
            .fontSize(9)
            .onClick(() => { this.isShowMaskT = true; })
            .bindContextMenuByIsShow(this.isShowMaskT, this.bcmMenuElements, {
              mask: true,
              onWillDisappear: () => {
                this.isShowMaskT = false;
                this.txtMaskT = 'true';
              }
            } as ContextMenuOptions)
          Text(this.txtMaskT).id('BindContextMenuByIsShowOptions_txtMask_01').fontSize(8)
        }
        Column() {
          Button('mask:F')
            .id('BindContextMenuByIsShowOptions_btnMask_02')
            .fontSize(9)
            .onClick(() => { this.isShowMaskF = true; })
            .bindContextMenuByIsShow(this.isShowMaskF, this.bcmMenuElements, {
              mask: false,
              onWillDisappear: () => {
                this.isShowMaskF = false;
                this.txtMaskF = 'false';
              }
            } as ContextMenuOptions)
          Text(this.txtMaskF).id('BindContextMenuByIsShowOptions_txtMask_02').fontSize(8)
        }
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        this.buildArrowSection()
        this.buildHoverModeSection()
        this.buildPreviewSection()
        this.buildAnimSection()
        this.buildHapticSection()
        this.buildModalSection()
        this.buildScaleModeSection()
        this.buildMiscSection()
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}
