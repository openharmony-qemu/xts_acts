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
  ContextMenuOptions, MenuElement, Menu, MenuItem, MenuItemOptions, BlurStyle,
  BlurStyleActivePolicy, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, Color, FontWeight,
  $r, ResourceStr
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct BindContextMenuByIsShowBlurMaskIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('BindContextMenuByIsShowBlurMask error ' + error);
    }
  }

  private iconStr: ResourceStr = $r('app.media.icon');
  private bcmMenuElements: Array<MenuElement> = [
    { value: '菜单选项1', action: () => { console.info('menu1'); } } as MenuElement,
    { value: '菜单选项2', action: () => { console.info('menu2'); } } as MenuElement,
  ];


  private fmtIdx(idx: int): string {
    let n: number = idx + 1;
    return n < 10 ? '0' + n : '' + n;
  }

  private blurStyles: BlurStyle[] = [
    BlurStyle.Thin,
    BlurStyle.Regular,
    BlurStyle.Thick,
    BlurStyle.BACKGROUND_THIN,
    BlurStyle.BACKGROUND_REGULAR,
    BlurStyle.BACKGROUND_THICK,
    BlurStyle.BACKGROUND_ULTRA_THICK,
    BlurStyle.NONE,
    BlurStyle.COMPONENT_ULTRA_THIN,
    BlurStyle.COMPONENT_THIN,
    BlurStyle.COMPONENT_REGULAR,
    BlurStyle.COMPONENT_THICK,
    BlurStyle.COMPONENT_ULTRA_THICK
  ];
  private blurIds: string[] = [
    'Thin', 'Regular', 'Thick', 'BGThin', 'BGReg', 'BGThick', 'BGUltra',
    'None', 'CUltraThin', 'CThin', 'CReg', 'CThick', 'CUltraThick'
  ];

  @State bgShow0: boolean = false;
  @State bgShow1: boolean = false;
  @State bgShow2: boolean = false;
  @State bgShow3: boolean = false;
  @State bgShow4: boolean = false;
  @State bgShow5: boolean = false;
  @State bgShow6: boolean = false;
  @State bgShow7: boolean = false;
  @State bgShow8: boolean = false;
  @State bgShow9: boolean = false;
  @State bgShow10: boolean = false;
  @State bgShow11: boolean = false;
  @State bgShow12: boolean = false;
  @State bgTxt0: string = '';
  @State bgTxt1: string = '';
  @State bgTxt2: string = '';
  @State bgTxt3: string = '';
  @State bgTxt4: string = '';
  @State bgTxt5: string = '';
  @State bgTxt6: string = '';
  @State bgTxt7: string = '';
  @State bgTxt8: string = '';
  @State bgTxt9: string = '';
  @State bgTxt10: string = '';
  @State bgTxt11: string = '';
  @State bgTxt12: string = '';

  @State maskShow0: boolean = false;
  @State maskShow1: boolean = false;
  @State maskShow2: boolean = false;
  @State maskShow3: boolean = false;
  @State maskShow4: boolean = false;
  @State maskShow5: boolean = false;
  @State maskShow6: boolean = false;
  @State maskShow7: boolean = false;
  @State maskShow8: boolean = false;
  @State maskShow9: boolean = false;
  @State maskShow10: boolean = false;
  @State maskShow11: boolean = false;
  @State maskShow12: boolean = false;
  @State maskTxt0: string = '';
  @State maskTxt1: string = '';
  @State maskTxt2: string = '';
  @State maskTxt3: string = '';
  @State maskTxt4: string = '';
  @State maskTxt5: string = '';
  @State maskTxt6: string = '';
  @State maskTxt7: string = '';
  @State maskTxt8: string = '';
  @State maskTxt9: string = '';
  @State maskTxt10: string = '';
  @State maskTxt11: string = '';
  @State maskTxt12: string = '';

  @State isShowPolicy0: boolean = false;
  @State isShowPolicy1: boolean = false;
  @State isShowPolicy2: boolean = false;
  @State txtPolicy0: string = '';
  @State txtPolicy1: string = '';
  @State txtPolicy2: string = '';

  @State isShowClrMode0: boolean = false;
  @State isShowClrMode1: boolean = false;
  @State isShowClrMode2: boolean = false;
  @State txtClrMode0: string = '';
  @State txtClrMode1: string = '';
  @State txtClrMode2: string = '';

  @State isShowAdapt0: boolean = false;
  @State isShowAdapt1: boolean = false;
  @State txtAdapt0: string = '';
  @State txtAdapt1: string = '';

  @State isShowEffAdapt0: boolean = false;
  @State isShowEffAdapt1: boolean = false;
  @State isShowEffPolicy0: boolean = false;
  @State isShowEffPolicy1: boolean = false;
  @State isShowEffPolicy2: boolean = false;
  @State txtEffAdapt0: string = '';
  @State txtEffAdapt1: string = '';
  @State txtEffPolicy0: string = '';
  @State txtEffPolicy1: string = '';
  @State txtEffPolicy2: string = '';











  @Builder
  buildBlurStyleGrid() {
    Column() {
      Text('backgroundBlurStyle').fontSize(10).fontWeight(FontWeight.Bold)
      Row() {
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_01')
          .fontSize(8)
          .onClick(() => { this.bgShow0 = true; })
          .bindContextMenuByIsShow(this.bgShow0, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.Thin,
            onWillDisappear: () => {
              this.bgShow0 = false;
              this.bgTxt0 = 'Thin';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt0).id('BindContextMenuByIsShowBlurMask_txtBgBlur_01').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_02')
          .fontSize(8)
          .onClick(() => { this.bgShow1 = true; })
          .bindContextMenuByIsShow(this.bgShow1, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.Regular,
            onWillDisappear: () => {
              this.bgShow1 = false;
              this.bgTxt1 = 'Regular';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt1).id('BindContextMenuByIsShowBlurMask_txtBgBlur_02').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_03')
          .fontSize(8)
          .onClick(() => { this.bgShow2 = true; })
          .bindContextMenuByIsShow(this.bgShow2, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.Thick,
            onWillDisappear: () => {
              this.bgShow2 = false;
              this.bgTxt2 = 'Thick';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt2).id('BindContextMenuByIsShowBlurMask_txtBgBlur_03').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_04')
          .fontSize(8)
          .onClick(() => { this.bgShow3 = true; })
          .bindContextMenuByIsShow(this.bgShow3, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
            onWillDisappear: () => {
              this.bgShow3 = false;
              this.bgTxt3 = 'BGThin';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt3).id('BindContextMenuByIsShowBlurMask_txtBgBlur_04').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_05')
          .fontSize(8)
          .onClick(() => { this.bgShow4 = true; })
          .bindContextMenuByIsShow(this.bgShow4, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR,
            onWillDisappear: () => {
              this.bgShow4 = false;
              this.bgTxt4 = 'BGReg';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt4).id('BindContextMenuByIsShowBlurMask_txtBgBlur_05').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_06')
          .fontSize(8)
          .onClick(() => { this.bgShow5 = true; })
          .bindContextMenuByIsShow(this.bgShow5, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
            onWillDisappear: () => {
              this.bgShow5 = false;
              this.bgTxt5 = 'BGThick';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt5).id('BindContextMenuByIsShowBlurMask_txtBgBlur_06').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_07')
          .fontSize(8)
          .onClick(() => { this.bgShow6 = true; })
          .bindContextMenuByIsShow(this.bgShow6, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
            onWillDisappear: () => {
              this.bgShow6 = false;
              this.bgTxt6 = 'BGUltra';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt6).id('BindContextMenuByIsShowBlurMask_txtBgBlur_07').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_08')
          .fontSize(8)
          .onClick(() => { this.bgShow7 = true; })
          .bindContextMenuByIsShow(this.bgShow7, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.NONE,
            onWillDisappear: () => {
              this.bgShow7 = false;
              this.bgTxt7 = 'None';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt7).id('BindContextMenuByIsShowBlurMask_txtBgBlur_08').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_09')
          .fontSize(8)
          .onClick(() => { this.bgShow8 = true; })
          .bindContextMenuByIsShow(this.bgShow8, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
            onWillDisappear: () => {
              this.bgShow8 = false;
              this.bgTxt8 = 'CUltraThin';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt8).id('BindContextMenuByIsShowBlurMask_txtBgBlur_09').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_10')
          .fontSize(8)
          .onClick(() => { this.bgShow9 = true; })
          .bindContextMenuByIsShow(this.bgShow9, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
            onWillDisappear: () => {
              this.bgShow9 = false;
              this.bgTxt9 = 'CThin';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt9).id('BindContextMenuByIsShowBlurMask_txtBgBlur_10').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_11')
          .fontSize(8)
          .onClick(() => { this.bgShow10 = true; })
          .bindContextMenuByIsShow(this.bgShow10, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
            onWillDisappear: () => {
              this.bgShow10 = false;
              this.bgTxt10 = 'CReg';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt10).id('BindContextMenuByIsShowBlurMask_txtBgBlur_11').fontSize(7)
      }
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_12')
          .fontSize(8)
          .onClick(() => { this.bgShow11 = true; })
          .bindContextMenuByIsShow(this.bgShow11, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
            onWillDisappear: () => {
              this.bgShow11 = false;
              this.bgTxt11 = 'CThick';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt11).id('BindContextMenuByIsShowBlurMask_txtBgBlur_12').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('bg')
          .id('BindContextMenuByIsShowBlurMask_btnBgBlur_13')
          .fontSize(8)
          .onClick(() => { this.bgShow12 = true; })
          .bindContextMenuByIsShow(this.bgShow12, this.bcmMenuElements, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
            onWillDisappear: () => {
              this.bgShow12 = false;
              this.bgTxt12 = 'CUltraThick';
            }
          } as ContextMenuOptions)
        Text(this.bgTxt12).id('BindContextMenuByIsShowBlurMask_txtBgBlur_13').fontSize(7)
      }
      }
    }
  }

  @Builder
  buildMaskBlurGrid() {
    Column() {
      Text('mask.backgroundBlurStyle').fontSize(10).fontWeight(FontWeight.Bold)
      Row() {
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_01')
          .fontSize(8)
          .onClick(() => { this.maskShow0 = true; })
          .bindContextMenuByIsShow(this.maskShow0, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.Thin },
            onWillDisappear: () => {
              this.maskShow0 = false;
              this.maskTxt0 = 'Thin';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt0).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_01').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_02')
          .fontSize(8)
          .onClick(() => { this.maskShow1 = true; })
          .bindContextMenuByIsShow(this.maskShow1, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.Regular },
            onWillDisappear: () => {
              this.maskShow1 = false;
              this.maskTxt1 = 'Regular';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt1).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_02').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_03')
          .fontSize(8)
          .onClick(() => { this.maskShow2 = true; })
          .bindContextMenuByIsShow(this.maskShow2, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.Thick },
            onWillDisappear: () => {
              this.maskShow2 = false;
              this.maskTxt2 = 'Thick';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt2).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_03').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_04')
          .fontSize(8)
          .onClick(() => { this.maskShow3 = true; })
          .bindContextMenuByIsShow(this.maskShow3, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THIN },
            onWillDisappear: () => {
              this.maskShow3 = false;
              this.maskTxt3 = 'BGThin';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt3).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_04').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_05')
          .fontSize(8)
          .onClick(() => { this.maskShow4 = true; })
          .bindContextMenuByIsShow(this.maskShow4, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR },
            onWillDisappear: () => {
              this.maskShow4 = false;
              this.maskTxt4 = 'BGReg';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt4).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_05').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_06')
          .fontSize(8)
          .onClick(() => { this.maskShow5 = true; })
          .bindContextMenuByIsShow(this.maskShow5, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THICK },
            onWillDisappear: () => {
              this.maskShow5 = false;
              this.maskTxt5 = 'BGThick';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt5).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_06').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_07')
          .fontSize(8)
          .onClick(() => { this.maskShow6 = true; })
          .bindContextMenuByIsShow(this.maskShow6, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK },
            onWillDisappear: () => {
              this.maskShow6 = false;
              this.maskTxt6 = 'BGUltra';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt6).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_07').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_08')
          .fontSize(8)
          .onClick(() => { this.maskShow7 = true; })
          .bindContextMenuByIsShow(this.maskShow7, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.NONE },
            onWillDisappear: () => {
              this.maskShow7 = false;
              this.maskTxt7 = 'None';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt7).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_08').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_09')
          .fontSize(8)
          .onClick(() => { this.maskShow8 = true; })
          .bindContextMenuByIsShow(this.maskShow8, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN },
            onWillDisappear: () => {
              this.maskShow8 = false;
              this.maskTxt8 = 'CUltraThin';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt8).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_09').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_10')
          .fontSize(8)
          .onClick(() => { this.maskShow9 = true; })
          .bindContextMenuByIsShow(this.maskShow9, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THIN },
            onWillDisappear: () => {
              this.maskShow9 = false;
              this.maskTxt9 = 'CThin';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt9).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_10').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_11')
          .fontSize(8)
          .onClick(() => { this.maskShow10 = true; })
          .bindContextMenuByIsShow(this.maskShow10, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR },
            onWillDisappear: () => {
              this.maskShow10 = false;
              this.maskTxt10 = 'CReg';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt10).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_11').fontSize(7)
      }
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_12')
          .fontSize(8)
          .onClick(() => { this.maskShow11 = true; })
          .bindContextMenuByIsShow(this.maskShow11, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THICK },
            onWillDisappear: () => {
              this.maskShow11 = false;
              this.maskTxt11 = 'CThick';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt11).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_12').fontSize(7)
      }
      }
      Row() {
      Column() {
        Button('mk')
          .id('BindContextMenuByIsShowBlurMask_btnMaskBlur_13')
          .fontSize(8)
          .onClick(() => { this.maskShow12 = true; })
          .bindContextMenuByIsShow(this.maskShow12, this.bcmMenuElements, {
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK },
            onWillDisappear: () => {
              this.maskShow12 = false;
              this.maskTxt12 = 'CUltraThick';
            }
          } as ContextMenuOptions)
        Text(this.maskTxt12).id('BindContextMenuByIsShowBlurMask_txtMaskBlur_13').fontSize(7)
      }
      }
    }
  }

  @Builder
  buildBlurOptionsSection() {
    Column() {
      Text('backgroundBlurStyleOptions').fontSize(10).fontWeight(FontWeight.Bold)
      Row() {
        Column() {
          Button('pol:FW')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_01')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy0 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy0, this.bcmMenuElements, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE
              } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowPolicy0 = false;
                this.txtPolicy0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtPolicy0).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_01').fontSize(8)
        }
        Column() {
          Button('pol:AA')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_02')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy1 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy1, this.bcmMenuElements, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
              } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowPolicy1 = false;
                this.txtPolicy1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtPolicy1).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_02').fontSize(8)
        }
        Column() {
          Button('pol:AI')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_03')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy2 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy2, this.bcmMenuElements, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE
              } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowPolicy2 = false;
                this.txtPolicy2 = '2';
              }
            } as ContextMenuOptions)
          Text(this.txtPolicy2).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_03').fontSize(8)
        }
      }
      Row() {
        Column() {
          Button('cm:SYS')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_01')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode0 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode0, this.bcmMenuElements, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.SYSTEM } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowClrMode0 = false;
                this.txtClrMode0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtClrMode0).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_01').fontSize(8)
        }
        Column() {
          Button('cm:LGT')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_02')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode1 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode1, this.bcmMenuElements, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.LIGHT } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowClrMode1 = false;
                this.txtClrMode1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtClrMode1).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_02').fontSize(8)
        }
        Column() {
          Button('cm:DRK')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_03')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode2 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode2, this.bcmMenuElements, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.DARK } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowClrMode2 = false;
                this.txtClrMode2 = '2';
              }
            } as ContextMenuOptions)
          Text(this.txtClrMode2).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_03').fontSize(8)
        }
      }
      Row() {
        Column() {
          Button('ad:DEF')
            .id('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_01')
            .fontSize(9)
            .onClick(() => { this.isShowAdapt0 = true; })
            .bindContextMenuByIsShow(this.isShowAdapt0, this.bcmMenuElements, {
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.DEFAULT } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowAdapt0 = false;
                this.txtAdapt0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtAdapt0).id('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_01').fontSize(8)
        }
        Column() {
          Button('ad:AVG')
            .id('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_02')
            .fontSize(9)
            .onClick(() => { this.isShowAdapt1 = true; })
            .bindContextMenuByIsShow(this.isShowAdapt1, this.bcmMenuElements, {
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.AVERAGE } as BackgroundBlurStyleOptions,
              onWillDisappear: () => {
                this.isShowAdapt1 = false;
                this.txtAdapt1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtAdapt1).id('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_02').fontSize(8)
        }
      }
    }
  }

  @Builder
  buildEffectSection() {
    Column() {
      Text('backgroundEffect').fontSize(10).fontWeight(FontWeight.Bold)
      Row() {
        Column() {
          Button('efAd:DEF')
            .id('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_01')
            .fontSize(9)
            .onClick(() => { this.isShowEffAdapt0 = true; })
            .bindContextMenuByIsShow(this.isShowEffAdapt0, this.bcmMenuElements, {
              backgroundEffect: {
                radius: 60, saturation: 40, brightness: 1,
                color: Color.Orange, adaptiveColor: AdaptiveColor.DEFAULT
              } as BackgroundEffectOptions,
              onWillDisappear: () => {
                this.isShowEffAdapt0 = false;
                this.txtEffAdapt0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtEffAdapt0).id('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_01').fontSize(8)
        }
        Column() {
          Button('efAd:AVG')
            .id('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_02')
            .fontSize(9)
            .onClick(() => { this.isShowEffAdapt1 = true; })
            .bindContextMenuByIsShow(this.isShowEffAdapt1, this.bcmMenuElements, {
              backgroundEffect: {
                radius: 60, saturation: 40, brightness: 1,
                color: Color.Orange, adaptiveColor: AdaptiveColor.AVERAGE
              } as BackgroundEffectOptions,
              onWillDisappear: () => {
                this.isShowEffAdapt1 = false;
                this.txtEffAdapt1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtEffAdapt1).id('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_02').fontSize(8)
        }
      }
      Row() {
        Column() {
          Button('efPl:FW')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_01')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy0 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy0, this.bcmMenuElements, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE
              } as BackgroundEffectOptions,
              onWillDisappear: () => {
                this.isShowEffPolicy0 = false;
                this.txtEffPolicy0 = '0';
              }
            } as ContextMenuOptions)
          Text(this.txtEffPolicy0).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_01').fontSize(8)
        }
        Column() {
          Button('efPl:AA')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_02')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy1 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy1, this.bcmMenuElements, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
              } as BackgroundEffectOptions,
              onWillDisappear: () => {
                this.isShowEffPolicy1 = false;
                this.txtEffPolicy1 = '1';
              }
            } as ContextMenuOptions)
          Text(this.txtEffPolicy1).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_02').fontSize(8)
        }
        Column() {
          Button('efPl:AI')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_03')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy2 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy2, this.bcmMenuElements, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE
              } as BackgroundEffectOptions,
              onWillDisappear: () => {
                this.isShowEffPolicy2 = false;
                this.txtEffPolicy2 = '2';
              }
            } as ContextMenuOptions)
          Text(this.txtEffPolicy2).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_03').fontSize(8)
        }
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        this.buildBlurStyleGrid()
        this.buildMaskBlurGrid()
        this.buildBlurOptionsSection()
        this.buildEffectSection()
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}
