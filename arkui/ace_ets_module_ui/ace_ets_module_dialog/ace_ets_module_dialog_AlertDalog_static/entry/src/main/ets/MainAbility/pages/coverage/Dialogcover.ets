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
  ToolBarV2ItemState, ToolBarV2ItemAction
} from '@ohos.arkui.advanced.ToolBarV2';
import promptAction from '@ohos.promptAction';
import {
  Entry, ComponentV2, Column, Text, Button, Scroll, Radio, Rating, Slider,
  Builder, Color, BorderStyle, ShadowStyle, Matrix2D, TransitionEffect, RenderFit,
  LengthMetricsUnit, PulseSymbolEffect, SymbolGlyph, $r,
  OnRadioChangeCallback, OnRatingChangeCallback, SliderTriggerChangeCallback,
  SliderChangeMode, ButtonTriggerClickCallback, TransitionFinishCallback,
  TipsMessageType, Degree
} from '@ohos.arkui.component';
import { Local, AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ColorMetrics } from '@ohos.arkui.node';

type OnFilterChangedCallback = (filterResults: Array<FilterResult>) => void;

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
  @Local toolBarList: ToolBarV2Item[] = [];
  @Local popoverOptions: PopoverDialogV2Options = {
    builder: (): void => {
      this.dialogBuilder();
    }
  };
  private filterParam: FilterParams[] = [{
    name: '绫诲埆',
    options: ['鍏ㄩ儴', 'A', 'B']
  }];
  private additionParam: FilterParams = {
    name: '鏇村',
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
    this.typeAliasFlag = 'ready';
    this.filterCb([]);
    this.filterFlag = 'ready';
    this.radioFlag = 'bound';
    this.ratingFlag = 'bound';
    this.sliderFlag = 'bound';
    this.clickFlag = 'bound';
    this.pulseFlag = 'ok';
    new PulseSymbolEffect();
    this.initToolBarItems();
    const degreeAlias: Degree = '45deg';
    const tipMsg: TipsMessageType = 'static-tip';
    this.extraAliasFlag = degreeAlias.length > 0 ? 'ok' : 'fail';
    console.info('TipsMessageType len=' + `${tipMsg}`.length);
  }

  private initToolBarItems(): void {
    try {
      const textItem: ToolBarV2ItemText = new ToolBarV2ItemText({
        text: 'A',
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
      this.toolBarFlag = this.toolBarList.length >= 1 ? 'ready' : 'fail';
    } catch (err) {
      console.info('[CoverageStatic] initToolBarItems error ' + err);
      this.toolBarFlag = 'fail';
    }
  }

  @Builder
  dialogBuilder(): void {
    AlertDialogV2({
      content: 'popover content',
      primaryButton: new AdvancedDialogV2Button({
        content: '鍙栨秷',
        action: (): void => {
          this.isShow = false;
        }
      }),
      secondaryButton: new AdvancedDialogV2Button({
        content: '纭',
        action: (): void => {
          this.isShow = false;
        }
      })
    });
  }

  @Builder
  targetBuilder(): void {
    Button('鎵撳紑PopoverDialogV2')
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
