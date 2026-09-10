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
import promptAction from '@ohos.promptAction';
import {
  Entry, ComponentV2, Column, Text, Button, Scroll, Radio, Rating, Slider,
  Builder, Color, BorderStyle, ShadowStyle, Matrix2D, TransitionEffect, RenderFit
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct CoverageStaticIndex {
  @Local isShow: boolean = false;
  @Local dialogOptFlag: string = 'init';
  @Local filterFlag: string = 'init';
  @Local radioFlag: string = 'init';
  @Local typeAliasFlag: string = 'init';
  @Local popoverFlag: string = 'init';
  @Local pulseFlag: string = 'ok';
  @Local popoverOptions: PopoverDialogV2Options = {
    builder: (): void => {
      this.dialogBuilder();
    }
  };
  private filterParam: FilterParams[] = [{
    name: '类别',
    options: ['全部', 'A', 'B']
  }];
  private additionParam: FilterParams = {
    name: '更多',
    options: ['X', 'Y']
  };
  private visibleCb: PopoverDialogV2OnVisibleChange = (visible: boolean): void => {
    this.isShow = visible;
    this.popoverFlag = visible ? 'shown' : 'hidden';
  };

  aboutToAppear(): void {
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
    const ctrl: promptAction.CommonController | undefined = undefined;
    this.typeAliasFlag = (m1 !== undefined && ctrl === undefined) ? 'ready' : 'fail';
    this.filterFlag = 'ready';
    this.radioFlag = 'ready';
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
        Text(this.typeAliasFlag).id('typeAliasFlag')
        Text(this.popoverFlag).id('popoverFlag')
        Text(this.pulseFlag).id('pulseFlag')

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
          onFilterChanged: (results: FilterResult[]): void => {
            this.filterFlag = results.length >= 0 ? 'changed' : 'fail';
          },
          container: this.filterBody
        })

        Radio({ value: 'r1', group: 'g1' })
          .id('radioCoverage')
          .onChange((isChecked: boolean): void => {
            this.radioFlag = isChecked ? 'checked' : 'unchecked';
          })

        Rating({ rating: 1 }).id('ratingCoverage')
        Slider({ value: 20, min: 0, max: 100 }).id('sliderCoverage')

        Text('fitBottom')
          .id('fitBottom')
          .renderFit(RenderFit.BOTTOM)
          .transition(TransitionEffect.OPACITY)
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
