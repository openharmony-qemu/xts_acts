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

@Entry
@Component
struct BindContextMenuByIsShowBlurMaskIndex {
  private iconStr: ResourceStr = $r('app.media.icon');

  private fmtIdx(idx: number): string {
    let n: number = idx + 1;
    return n < 10 ? `0${n}` : `${n}`;
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
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项1' }).id('BindContextMenuByIsShowBlurMask_menuItem_01')
      MenuItem({ startIcon: this.iconStr, content: '菜单选项2' })
    }
    .key('BindContextMenuByIsShowBlurMask_menu')
  }

  private setBgShow(idx: number, val: boolean): void {
    switch (idx) {
      case 0: this.bgShow0 = val; break;
      case 1: this.bgShow1 = val; break;
      case 2: this.bgShow2 = val; break;
      case 3: this.bgShow3 = val; break;
      case 4: this.bgShow4 = val; break;
      case 5: this.bgShow5 = val; break;
      case 6: this.bgShow6 = val; break;
      case 7: this.bgShow7 = val; break;
      case 8: this.bgShow8 = val; break;
      case 9: this.bgShow9 = val; break;
      case 10: this.bgShow10 = val; break;
      case 11: this.bgShow11 = val; break;
      case 12: this.bgShow12 = val; break;
      default: break;
    }
  }

  private setBgTxt(idx: number, val: string): void {
    switch (idx) {
      case 0: this.bgTxt0 = val; break;
      case 1: this.bgTxt1 = val; break;
      case 2: this.bgTxt2 = val; break;
      case 3: this.bgTxt3 = val; break;
      case 4: this.bgTxt4 = val; break;
      case 5: this.bgTxt5 = val; break;
      case 6: this.bgTxt6 = val; break;
      case 7: this.bgTxt7 = val; break;
      case 8: this.bgTxt8 = val; break;
      case 9: this.bgTxt9 = val; break;
      case 10: this.bgTxt10 = val; break;
      case 11: this.bgTxt11 = val; break;
      case 12: this.bgTxt12 = val; break;
      default: break;
    }
  }

  private getBgShow(idx: number): boolean {
    if (idx === 0) { return this.bgShow0; }
    if (idx === 1) { return this.bgShow1; }
    if (idx === 2) { return this.bgShow2; }
    if (idx === 3) { return this.bgShow3; }
    if (idx === 4) { return this.bgShow4; }
    if (idx === 5) { return this.bgShow5; }
    if (idx === 6) { return this.bgShow6; }
    if (idx === 7) { return this.bgShow7; }
    if (idx === 8) { return this.bgShow8; }
    if (idx === 9) { return this.bgShow9; }
    if (idx === 10) { return this.bgShow10; }
    if (idx === 11) { return this.bgShow11; }
    return this.bgShow12;
  }

  private getBgTxt(idx: number): string {
    if (idx === 0) { return this.bgTxt0; }
    if (idx === 1) { return this.bgTxt1; }
    if (idx === 2) { return this.bgTxt2; }
    if (idx === 3) { return this.bgTxt3; }
    if (idx === 4) { return this.bgTxt4; }
    if (idx === 5) { return this.bgTxt5; }
    if (idx === 6) { return this.bgTxt6; }
    if (idx === 7) { return this.bgTxt7; }
    if (idx === 8) { return this.bgTxt8; }
    if (idx === 9) { return this.bgTxt9; }
    if (idx === 10) { return this.bgTxt10; }
    if (idx === 11) { return this.bgTxt11; }
    return this.bgTxt12;
  }

  private setMaskShow(idx: number, val: boolean): void {
    switch (idx) {
      case 0: this.maskShow0 = val; break;
      case 1: this.maskShow1 = val; break;
      case 2: this.maskShow2 = val; break;
      case 3: this.maskShow3 = val; break;
      case 4: this.maskShow4 = val; break;
      case 5: this.maskShow5 = val; break;
      case 6: this.maskShow6 = val; break;
      case 7: this.maskShow7 = val; break;
      case 8: this.maskShow8 = val; break;
      case 9: this.maskShow9 = val; break;
      case 10: this.maskShow10 = val; break;
      case 11: this.maskShow11 = val; break;
      case 12: this.maskShow12 = val; break;
      default: break;
    }
  }

  private setMaskTxt(idx: number, val: string): void {
    switch (idx) {
      case 0: this.maskTxt0 = val; break;
      case 1: this.maskTxt1 = val; break;
      case 2: this.maskTxt2 = val; break;
      case 3: this.maskTxt3 = val; break;
      case 4: this.maskTxt4 = val; break;
      case 5: this.maskTxt5 = val; break;
      case 6: this.maskTxt6 = val; break;
      case 7: this.maskTxt7 = val; break;
      case 8: this.maskTxt8 = val; break;
      case 9: this.maskTxt9 = val; break;
      case 10: this.maskTxt10 = val; break;
      case 11: this.maskTxt11 = val; break;
      case 12: this.maskTxt12 = val; break;
      default: break;
    }
  }

  private getMaskShow(idx: number): boolean {
    if (idx === 0) { return this.maskShow0; }
    if (idx === 1) { return this.maskShow1; }
    if (idx === 2) { return this.maskShow2; }
    if (idx === 3) { return this.maskShow3; }
    if (idx === 4) { return this.maskShow4; }
    if (idx === 5) { return this.maskShow5; }
    if (idx === 6) { return this.maskShow6; }
    if (idx === 7) { return this.maskShow7; }
    if (idx === 8) { return this.maskShow8; }
    if (idx === 9) { return this.maskShow9; }
    if (idx === 10) { return this.maskShow10; }
    if (idx === 11) { return this.maskShow11; }
    return this.maskShow12;
  }

  private getMaskTxt(idx: number): string {
    if (idx === 0) { return this.maskTxt0; }
    if (idx === 1) { return this.maskTxt1; }
    if (idx === 2) { return this.maskTxt2; }
    if (idx === 3) { return this.maskTxt3; }
    if (idx === 4) { return this.maskTxt4; }
    if (idx === 5) { return this.maskTxt5; }
    if (idx === 6) { return this.maskTxt6; }
    if (idx === 7) { return this.maskTxt7; }
    if (idx === 8) { return this.maskTxt8; }
    if (idx === 9) { return this.maskTxt9; }
    if (idx === 10) { return this.maskTxt10; }
    if (idx === 11) { return this.maskTxt11; }
    return this.maskTxt12;
  }

  @Builder
  buildBgBlurBtn(idx: number) {
    Column() {
      Button(`bg:${this.blurIds[idx]}`)
        .id(`BindContextMenuByIsShowBlurMask_btnBgBlur_${this.fmtIdx(idx)}`)
        .fontSize(8)
        .onClick(() => { this.setBgShow(idx, true); })
        .bindContextMenuByIsShow(this.getBgShow(idx), this.MyMenu, {
          backgroundBlurStyle: this.blurStyles[idx],
          onWillDisappear: () => {
            this.setBgShow(idx, false);
            this.setBgTxt(idx, this.blurIds[idx]);
          }
        })
      Text(this.getBgTxt(idx)).id(`BindContextMenuByIsShowBlurMask_txtBgBlur_${this.fmtIdx(idx)}`).fontSize(7)
    }
  }

  @Builder
  buildMaskBlurBtn(idx: number) {
    Column() {
      Button(`mk:${this.blurIds[idx]}`)
        .id(`BindContextMenuByIsShowBlurMask_btnMaskBlur_${this.fmtIdx(idx)}`)
        .fontSize(8)
        .onClick(() => { this.setMaskShow(idx, true); })
        .bindContextMenuByIsShow(this.getMaskShow(idx), this.MyMenu, {
          mask: { backgroundBlurStyle: this.blurStyles[idx] },
          onWillDisappear: () => {
            this.setMaskShow(idx, false);
            this.setMaskTxt(idx, this.blurIds[idx]);
          }
        })
      Text(this.getMaskTxt(idx)).id(`BindContextMenuByIsShowBlurMask_txtMaskBlur_${this.fmtIdx(idx)}`).fontSize(7)
    }
  }

  @Builder
  buildBlurStyleGrid() {
    Column({ space: 4 }) {
      Text('backgroundBlurStyle').fontSize(10).fontWeight(FontWeight.Bold)
      Row({ space: 2 }) {
        this.buildBgBlurBtn(0)
        this.buildBgBlurBtn(1)
        this.buildBgBlurBtn(2)
        this.buildBgBlurBtn(3)
      }
      Row({ space: 2 }) {
        this.buildBgBlurBtn(4)
        this.buildBgBlurBtn(5)
        this.buildBgBlurBtn(6)
        this.buildBgBlurBtn(7)
      }
      Row({ space: 2 }) {
        this.buildBgBlurBtn(8)
        this.buildBgBlurBtn(9)
        this.buildBgBlurBtn(10)
        this.buildBgBlurBtn(11)
      }
      Row({ space: 2 }) {
        this.buildBgBlurBtn(12)
      }
    }
  }

  @Builder
  buildMaskBlurGrid() {
    Column({ space: 4 }) {
      Text('mask.backgroundBlurStyle').fontSize(10).fontWeight(FontWeight.Bold)
      Row({ space: 2 }) {
        this.buildMaskBlurBtn(0)
        this.buildMaskBlurBtn(1)
        this.buildMaskBlurBtn(2)
        this.buildMaskBlurBtn(3)
      }
      Row({ space: 2 }) {
        this.buildMaskBlurBtn(4)
        this.buildMaskBlurBtn(5)
        this.buildMaskBlurBtn(6)
        this.buildMaskBlurBtn(7)
      }
      Row({ space: 2 }) {
        this.buildMaskBlurBtn(8)
        this.buildMaskBlurBtn(9)
        this.buildMaskBlurBtn(10)
        this.buildMaskBlurBtn(11)
      }
      Row({ space: 2 }) {
        this.buildMaskBlurBtn(12)
      }
    }
  }

  @Builder
  buildBlurOptionsSection() {
    Column({ space: 4 }) {
      Text('backgroundBlurStyleOptions').fontSize(10).fontWeight(FontWeight.Bold)
      Row({ space: 4 }) {
        Column() {
          Button('pol:FW')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_01')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy0 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy0, this.MyMenu, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE
              },
              onWillDisappear: () => {
                this.isShowPolicy0 = false;
                this.txtPolicy0 = '0';
              }
            })
          Text(this.txtPolicy0).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_01').fontSize(8)
        }
        Column() {
          Button('pol:AA')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_02')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy1 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy1, this.MyMenu, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
              },
              onWillDisappear: () => {
                this.isShowPolicy1 = false;
                this.txtPolicy1 = '1';
              }
            })
          Text(this.txtPolicy1).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_02').fontSize(8)
        }
        Column() {
          Button('pol:AI')
            .id('BindContextMenuByIsShowBlurMask_btnBlurPolicy_03')
            .fontSize(9)
            .onClick(() => { this.isShowPolicy2 = true; })
            .bindContextMenuByIsShow(this.isShowPolicy2, this.MyMenu, {
              backgroundBlurStyleOptions: {
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE
              },
              onWillDisappear: () => {
                this.isShowPolicy2 = false;
                this.txtPolicy2 = '2';
              }
            })
          Text(this.txtPolicy2).id('BindContextMenuByIsShowBlurMask_txtBlurPolicy_03').fontSize(8)
        }
      }
      Row({ space: 4 }) {
        Column() {
          Button('cm:SYS')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_01')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode0 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode0, this.MyMenu, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.SYSTEM },
              onWillDisappear: () => {
                this.isShowClrMode0 = false;
                this.txtClrMode0 = '0';
              }
            })
          Text(this.txtClrMode0).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_01').fontSize(8)
        }
        Column() {
          Button('cm:LGT')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_02')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode1 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode1, this.MyMenu, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.LIGHT },
              onWillDisappear: () => {
                this.isShowClrMode1 = false;
                this.txtClrMode1 = '1';
              }
            })
          Text(this.txtClrMode1).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_02').fontSize(8)
        }
        Column() {
          Button('cm:DRK')
            .id('BindContextMenuByIsShowBlurMask_btnBlurColorMode_03')
            .fontSize(9)
            .onClick(() => { this.isShowClrMode2 = true; })
            .bindContextMenuByIsShow(this.isShowClrMode2, this.MyMenu, {
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.DARK },
              onWillDisappear: () => {
                this.isShowClrMode2 = false;
                this.txtClrMode2 = '2';
              }
            })
          Text(this.txtClrMode2).id('BindContextMenuByIsShowBlurMask_txtBlurColorMode_03').fontSize(8)
        }
      }
      Row({ space: 4 }) {
        Column() {
          Button('ad:DEF')
            .id('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_01')
            .fontSize(9)
            .onClick(() => { this.isShowAdapt0 = true; })
            .bindContextMenuByIsShow(this.isShowAdapt0, this.MyMenu, {
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.DEFAULT },
              onWillDisappear: () => {
                this.isShowAdapt0 = false;
                this.txtAdapt0 = '0';
              }
            })
          Text(this.txtAdapt0).id('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_01').fontSize(8)
        }
        Column() {
          Button('ad:AVG')
            .id('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_02')
            .fontSize(9)
            .onClick(() => { this.isShowAdapt1 = true; })
            .bindContextMenuByIsShow(this.isShowAdapt1, this.MyMenu, {
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.AVERAGE },
              onWillDisappear: () => {
                this.isShowAdapt1 = false;
                this.txtAdapt1 = '1';
              }
            })
          Text(this.txtAdapt1).id('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_02').fontSize(8)
        }
      }
    }
  }

  @Builder
  buildEffectSection() {
    Column({ space: 4 }) {
      Text('backgroundEffect').fontSize(10).fontWeight(FontWeight.Bold)
      Row({ space: 4 }) {
        Column() {
          Button('efAd:DEF')
            .id('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_01')
            .fontSize(9)
            .onClick(() => { this.isShowEffAdapt0 = true; })
            .bindContextMenuByIsShow(this.isShowEffAdapt0, this.MyMenu, {
              backgroundEffect: {
                radius: 60, saturation: 40, brightness: 1,
                color: Color.Orange, adaptiveColor: AdaptiveColor.DEFAULT
              },
              onWillDisappear: () => {
                this.isShowEffAdapt0 = false;
                this.txtEffAdapt0 = '0';
              }
            })
          Text(this.txtEffAdapt0).id('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_01').fontSize(8)
        }
        Column() {
          Button('efAd:AVG')
            .id('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_02')
            .fontSize(9)
            .onClick(() => { this.isShowEffAdapt1 = true; })
            .bindContextMenuByIsShow(this.isShowEffAdapt1, this.MyMenu, {
              backgroundEffect: {
                radius: 60, saturation: 40, brightness: 1,
                color: Color.Orange, adaptiveColor: AdaptiveColor.AVERAGE
              },
              onWillDisappear: () => {
                this.isShowEffAdapt1 = false;
                this.txtEffAdapt1 = '1';
              }
            })
          Text(this.txtEffAdapt1).id('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_02').fontSize(8)
        }
      }
      Row({ space: 4 }) {
        Column() {
          Button('efPl:FW')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_01')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy0 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy0, this.MyMenu, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE
              },
              onWillDisappear: () => {
                this.isShowEffPolicy0 = false;
                this.txtEffPolicy0 = '0';
              }
            })
          Text(this.txtEffPolicy0).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_01').fontSize(8)
        }
        Column() {
          Button('efPl:AA')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_02')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy1 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy1, this.MyMenu, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
              },
              onWillDisappear: () => {
                this.isShowEffPolicy1 = false;
                this.txtEffPolicy1 = '1';
              }
            })
          Text(this.txtEffPolicy1).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_02').fontSize(8)
        }
        Column() {
          Button('efPl:AI')
            .id('BindContextMenuByIsShowBlurMask_btnEffectPolicy_03')
            .fontSize(9)
            .onClick(() => { this.isShowEffPolicy2 = true; })
            .bindContextMenuByIsShow(this.isShowEffPolicy2, this.MyMenu, {
              backgroundEffect: {
                radius: 60, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE
              },
              onWillDisappear: () => {
                this.isShowEffPolicy2 = false;
                this.txtEffPolicy2 = '2';
              }
            })
          Text(this.txtEffPolicy2).id('BindContextMenuByIsShowBlurMask_txtEffectPolicy_03').fontSize(8)
        }
      }
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
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
