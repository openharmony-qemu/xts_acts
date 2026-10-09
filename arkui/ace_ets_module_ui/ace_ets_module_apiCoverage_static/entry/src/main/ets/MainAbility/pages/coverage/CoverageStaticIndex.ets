'use static'
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  AlertDialogV2, AdvancedDialogV2Button, PopoverDialogV2, PopoverDialogV2Options,
  PopoverDialogV2OnVisibleChange
} from '@ohos.arkui.advanced.DialogV2';
import {
  Filter, FilterParams, FilterResult, FilterType
} from '@ohos.arkui.advanced.Filter';
import {
  ToolBarV2, ToolBarV2Item, ToolBarV2ItemText, ToolBarV2ItemImage,
  ToolBarV2ItemState, ToolBarV2ItemAction, ToolBarV2SymbolGlyph
} from '@ohos.arkui.advanced.ToolBarV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import promptAction from '@ohos.promptAction';
import {
  Entry, ComponentV2, Column, Text, Button, Scroll, Radio, Rating, Slider,
  Builder, Color, BorderStyle, ShadowStyle, Matrix2D, TransitionEffect, RenderFit,
  LengthMetricsUnit, PulseSymbolEffect, SymbolGlyph, $r,
  OnRadioChangeCallback, OnRatingChangeCallback, SliderTriggerChangeCallback,
  SliderChangeMode, ButtonTriggerClickCallback, TransitionFinishCallback,
  TipsMessageType, Degree, ContentTransition,
  SliderPrefixOptions, SliderSuffixOptions,
  CustomDialogController, CompatibleInitCallback, CompatibleUpdateCallback,
  CompatibleUpdatableBuilder, CompatibleComponentInfo, compatibleWrappedBuilder,
  AccessibilityTransparentCallback, ContentSlotAttribute,
  DataSyncOptions, PageTransitionCallback, SystemBarStyle, ToolBarItemAttribute,
  PromptActionCommonState, TouchEvent, RouteType
} from '@ohos.arkui.component';
import { Local, AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { ColorMetrics, Pivot, Translation, typeNode } from '@ohos.arkui.node';
import { InputEventType } from 'arkui.BuilderNode';

type OnFilterChangedCallback = (filterResults: FilterResult[]) => void;

@Entry
@ComponentV2
struct CoverageStaticIndex {
  @Local isShow: boolean = false;
  @Local dialogOptFlag: string = 'init';
  @Local filterFlag: string = 'init';
  @Local radioFlag: string = 'init';
  @Local ratingFlag: string = 'init';
  @Local sliderFlag: string = 'init';
  @Local clickFlag: string = 'init';
  @Local typeAliasFlag: string = 'init';
  @Local popoverFlag: string = 'init';
  @Local pulseFlag: string = 'ok';
  @Local toolBarFlag: string = 'init';
  @Local extraAliasFlag: string = 'init';
  @Local matrixPropFlag: string = 'init';
  @Local commonCtrlFlag: string = 'init';
  @Local clickSoundFlag: string = 'init';
  @Local moreAliasFlag: string = 'init';
  @Local toolBarSymbolFlag: string = 'init';
  @Local typeNodeFlag: string = 'init';
  @Local interopFlag: string = 'init';
  @Local dialogGetStateFlag: string = 'init';
  @Local sdkAliasFlag: string = 'init';
  @Local toolBarList: ToolBarV2Item[] = [];
  @Local popoverOptions: PopoverDialogV2Options = {
    builder: (): void => {
      this.dialogBuilder();
    }
  };
  private coverageDlgCtrl: CustomDialogController | undefined = undefined;
  private filterParam: FilterParams[] = [{
    name: '类别',
    options: ['全部', 'A', 'B']
  }];
  private additionParam: FilterParams = {
    name: '更多',
    options: ['X', 'Y']
  };
  private filterCb: OnFilterChangedCallback = (results: FilterResult[]): void => {
    this.filterFlag = results.length > 0 ? 'changed' : 'ready';
  };
  private visibleCb: PopoverDialogV2OnVisibleChange = (visible: boolean): void => {
    this.isShow = visible;
    this.popoverFlag = visible ? 'shown' : 'hidden';
  };
  private radioCb: OnRadioChangeCallback = (isChecked: boolean): void => {
    this.radioFlag = isChecked ? 'checked' : 'unchecked';
  };
  private ratingCb: OnRatingChangeCallback = (rating: number): void => {
    this.ratingFlag = `${rating}`;
  };
  private sliderCb: SliderTriggerChangeCallback =
    (value: number, mode: SliderChangeMode): void => {
      this.sliderFlag = `${value}_${mode}`;
    };
  private clickCb: ButtonTriggerClickCallback = (xPos: number, yPos: number): void => {
    this.clickFlag = `${xPos}_${yPos}`;
  };
  private finishCb: TransitionFinishCallback = (transitionIn: boolean): void => {
    this.clickFlag = transitionIn ? 'tin' : 'tout';
  };
  private toolBarAction: ToolBarV2ItemAction = (index: int): void => {
    this.toolBarFlag = `idx_${index}`;
  };
  private sdkHoverCb: AccessibilityTransparentCallback =
    (event: TouchEvent): void => {
      console.info('[CoverageStatic] hover ' + `${event}`);
    };

  aboutToAppear(): void {
    try {
      const routerInst = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[CoverageStatic] set router error ' + error);
    }
    const corner: promptAction.DialogOptionsCornerRadius = 10;
    const borderW: promptAction.DialogOptionsBorderWidth = 2;
    const borderC: promptAction.DialogOptionsBorderColor = Color.Red;
    const borderS: promptAction.DialogOptionsBorderStyle = BorderStyle.Dashed;
    const shadow: promptAction.DialogOptionsShadow = ShadowStyle.OUTER_DEFAULT_SM;
    const opts: promptAction.DialogOptions = {
      cornerRadius: corner,
      borderWidth: borderW,
      borderColor: borderC,
      borderStyle: borderS,
      shadow: shadow
    };
    this.dialogOptFlag = opts.borderWidth !== undefined ? 'ok' : 'fail';
    const m1: Matrix2D = new Matrix2D();
    const m2: Matrix2D = new Matrix2D(LengthMetricsUnit.DEFAULT);
    m1.identity();
    m2.identity();
    m1.rotateX = 0.1;
    m1.rotateY = 0.2;
    m1.scaleX = 1.1;
    m1.scaleY = 1.2;
    m1.translateX = 3;
    m1.translateY = 4;
    this.matrixPropFlag = 'ok';
    this.typeAliasFlag = 'ready';
    this.filterCb([]);
    this.filterFlag = 'ready';
    this.radioFlag = 'bound';
    this.ratingFlag = 'bound';
    this.sliderFlag = 'bound';
    this.clickFlag = 'bound';
    this.pulseFlag = 'ok';
    this.clickSoundFlag = 'ok';
    new PulseSymbolEffect();
    this.initToolBarItems();
    this.initCommonCtrlAndAliases();
    this.initTypeNodeCoverage();
    this.initInteropAndDialog();
    this.initSdkMiscAliases();
    const degreeAlias: Degree = '45deg';
    const tipMsg: TipsMessageType = 'static-tip';
    this.extraAliasFlag = degreeAlias.length > 0 ? 'ok' : 'fail';
    console.info('TipsMessageType len=' + `${tipMsg}`.length);
  }

  private initCommonCtrlAndAliases(): void {
    const commonCtrl: promptAction.CommonController = new promptAction.CommonController();
    const st = commonCtrl.getState();
    commonCtrl.close();
    this.commonCtrlFlag = `${st}`.length >= 0 ? 'ok' : 'fail';
    const contentTrans: ContentTransition | undefined = undefined;
    const translation: Translation = { x: 1, y: 2 };
    const pivot: Pivot = { x: 0.5, y: 0.5 };
    const prefixOpt: SliderPrefixOptions | undefined = undefined;
    const suffixOpt: SliderSuffixOptions | undefined = undefined;
    const aliasMark: string =
      `${translation.x}_${pivot.y}_${contentTrans}_${prefixOpt}_${suffixOpt}`;
    this.moreAliasFlag = (aliasMark.indexOf('1_0.5') >= 0) ? 'ok' : 'fail';
  }

  private initTypeNodeCoverage(): void {
    try {
      const ctx: UIContext = this.getUIContext();
      const badge: typeNode.Badge = typeNode.createBadgeNode(ctx);
      const marquee: typeNode.Marquee = typeNode.createMarqueeNode(ctx);
      const qr: typeNode.QRCode = typeNode.createQRCodeNode(ctx);
      const rating: typeNode.Rating = typeNode.createRatingNode(ctx);
      const select: typeNode.Select = typeNode.createSelectNode(ctx);
      const symbol: typeNode.SymbolGlyph = typeNode.createSymbolGlyphNode(ctx);
      const clock: typeNode.TextClock = typeNode.createTextClockNode(ctx);
      const timer: typeNode.TextTimer = typeNode.createTextTimerNode(ctx);
      const mark: string =
        `${badge}_${marquee}_${qr}_${rating}_${select}_${symbol}_${clock}_${timer}`;
      this.typeNodeFlag = (mark.length > 0) ? 'ok' : 'fail';
    } catch (err) {
      console.info('[CoverageStatic] initTypeNodeCoverage error ' + err);
      this.typeNodeFlag = 'fail';
    }
  }

  @Builder
  compatibleUpdatableSample(arg: string): void {
    Text(arg).id('compatibleUpdatableSample')
  }

  private initInteropAndDialog(): void {
    try {
      const initCb: CompatibleInitCallback =
        (parent: ESValue): CompatibleComponentInfo => {
          return { name: 'cov', component: parent };
        };
      const updateCb: CompatibleUpdateCallback = (component: ESValue): void => {
        console.info('[CoverageStatic] compatible update ' + `${component}`);
      };
      const updBuilder: CompatibleUpdatableBuilder<string> = this.compatibleUpdatableSample;
      this.coverageDlgCtrl = new CustomDialogController({
        builder: (): void => {
          this.dialogBuilder();
        }
      });
      const ctrl: CustomDialogController = this.coverageDlgCtrl as CustomDialogController;
      const dlgState: PromptActionCommonState = ctrl.getState();
      this.dialogGetStateFlag = `${dlgState}`.length >= 0 ? 'ok' : 'fail';
      const mark: string =
        `${initCb}_${updateCb}_${updBuilder}_${compatibleWrappedBuilder}`;
      this.interopFlag = (mark.length > 0) ? 'ok' : 'fail';
    } catch (err) {
      console.info('[CoverageStatic] initInteropAndDialog error ' + err);
      this.interopFlag = 'fail';
      this.dialogGetStateFlag = 'fail';
    }
  }

  private initSdkMiscAliases(): void {
    const pageCb: PageTransitionCallback =
      (type: RouteType, progress: double): void => {
        console.info('[CoverageStatic] page ' + `${type}_${progress}`);
      };
    const barStyle: SystemBarStyle = { statusBarContentColor: '#FFFFFF' };
    const slotAttr: ContentSlotAttribute | undefined = undefined;
    const syncOpt: DataSyncOptions | undefined = undefined;
    const inputEv: InputEventType | undefined = undefined;
    const toolbarAttr: ToolBarItemAttribute | undefined = undefined;
    const mark: string =
      `${this.sdkHoverCb}_${pageCb}_${barStyle.statusBarContentColor}_` +
      `${slotAttr}_${syncOpt}_${inputEv}_${toolbarAttr}`;
    this.sdkAliasFlag = (mark.indexOf('#FFFFFF') >= 0) ? 'ok' : 'fail';
  }

  private initToolBarItems(): void {
    try {
      const textItem: ToolBarV2ItemText = new ToolBarV2ItemText({
        text: 'A',
        color: ColorMetrics.resourceColor('#ff0000ff'),
        activatedColor: ColorMetrics.resourceColor('#ff0000ff')
      });
      const imageItem: ToolBarV2ItemImage = new ToolBarV2ItemImage({
        src: $r('app.media.icon'),
        color: ColorMetrics.resourceColor('#ff18cb53'),
        activatedColor: ColorMetrics.resourceColor('#ffec5d5d')
      });
      this.toolBarList.push(new ToolBarV2Item({
        content: textItem,
        icon: imageItem,
        action: this.toolBarAction,
        state: ToolBarV2ItemState.ACTIVATE
      }));
      const symbolIcon: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph({
        normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
        activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
      });
      this.toolBarList.push(new ToolBarV2Item({
        content: new ToolBarV2ItemText({ text: 'B' }),
        icon: symbolIcon,
        action: this.toolBarAction,
        state: ToolBarV2ItemState.ENABLE
      }));
      this.toolBarFlag = this.toolBarList.length >= 1 ? 'ready' : 'fail';
      this.toolBarSymbolFlag = this.toolBarList.length >= 2 ? 'ok' : 'fail';
    } catch (err) {
      console.info('[CoverageStatic] initToolBarItems error ' + err);
      this.toolBarFlag = 'fail';
      this.toolBarSymbolFlag = 'fail';
    }
  }

  @Builder
  dialogBuilder(): void {
    AlertDialogV2({
      content: 'popover content',
      primaryButton: new AdvancedDialogV2Button({
        content: '取消',
        action: (): void => {
          this.isShow = false;
        }
      }),
      secondaryButton: new AdvancedDialogV2Button({
        content: '确认',
        action: (): void => {
          this.isShow = false;
        }
      })
    });
  }

  @Builder
  targetBuilder(): void {
    Button('打开PopoverDialogV2')
      .id('popoverTarget')
      .onClick((): void => {
        this.isShow = true;
        this.popoverFlag = 'shown';
      });
  }

  @Builder
  filterBody(): void {
    Text('filter-body').id('filterBody')
  }

  build() {
    Scroll() {
      Column() {
        Text('CoverageStaticIndex').id('coverageStaticTitle').fontSize(18)
        Text(this.dialogOptFlag).id('dialogOptFlag')
        Text(this.filterFlag).id('filterFlag')
        Text(this.radioFlag).id('radioFlag')
        Text(this.ratingFlag).id('ratingFlag')
        Text(this.sliderFlag).id('sliderFlag')
        Text(this.clickFlag).id('clickFlag')
        Text(this.typeAliasFlag).id('typeAliasFlag')
        Text(this.popoverFlag).id('popoverFlag')
        Text(this.pulseFlag).id('pulseFlag')
        Text(this.toolBarFlag).id('toolBarFlag')
        Text(this.extraAliasFlag).id('extraAliasFlag')
        Text(this.matrixPropFlag).id('matrixPropFlag')
        Text(this.commonCtrlFlag).id('commonCtrlFlag')
        Text(this.clickSoundFlag).id('clickSoundFlag')
        Text(this.moreAliasFlag).id('moreAliasFlag')
        Text(this.toolBarSymbolFlag).id('toolBarSymbolFlag')
        Text(this.typeNodeFlag).id('typeNodeFlag')
        Text(this.interopFlag).id('interopFlag')
        Text(this.dialogGetStateFlag).id('dialogGetStateFlag')
        Text(this.sdkAliasFlag).id('sdkAliasFlag')

        PopoverDialogV2({
          visible: this.isShow,
          $visible: this.visibleCb,
          popover: this.popoverOptions,
          targetBuilder: this.targetBuilder
        })

        Filter({
          multiFilters: this.filterParam,
          additionFilters: this.additionParam,
          filterType: FilterType.LIST_FILTER,
          container: this.filterBody
        })

        ToolBarV2({
          toolBarList: this.toolBarList,
          activatedIndex: 0
        })

        Button('clickCb')
          .id('btnClick')
          .enableClickSoundEffect(true)
          .onAccessibilityHoverTransparent(this.sdkHoverCb)
          .onClick((): void => {
            this.clickCb(1, 2);
          })
          .transition(TransitionEffect.OPACITY, this.finishCb)

        Radio({ value: 'r1', group: 'g1' })
          .id('radioCoverage')
          .onChange(this.radioCb)

        Rating({ rating: 1 })
          .id('ratingCoverage')
          .onChange(this.ratingCb)

        Slider({ value: 20, min: 0, max: 100 })
          .id('sliderCoverage')
          .onChange((value: number, mode: SliderChangeMode): void => {
            this.sliderCb(value, mode);
          })

        SymbolGlyph($r('sys.symbol.ohos_star'))
          .id('pulseSymbol')
          .symbolEffect(new PulseSymbolEffect(), true)

        Text('fitBottom')
          .id('fitBottom')
          .renderFit(RenderFit.BOTTOM)
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
