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

import promptAction from '@ohos.promptAction';
import { LengthMetricsUnit } from '@ohos.arkui.node';

@Entry
@Component
struct CoverageTypes {
  @State radioFlag: string = 'init';
  @State ratingFlag: string = 'init';
  @State sliderFlag: string = 'init';
  @State selectFlag: string = 'init';
  @State triggerClickFlag: string = 'init';
  @State transitionFlag: string = 'init';
  @State dialogOptFlag: string = 'init';
  @State matrixFlag: string = 'init';
  @State commonCtrlFlag: string = 'init';
  private radioCb: OnRadioChangeCallback = (isChecked: boolean) => {
    this.radioFlag = isChecked ? 'checked' : 'unchecked';
  };
  private ratingCb: OnRatingChangeCallback = (rating: number) => {
    this.ratingFlag = `${rating}`;
  };
  private sliderCb: SliderTriggerChangeCallback = (value: number, mode: SliderChangeMode) => {
    this.sliderFlag = `${value}_${mode}`;
  };
  private selectCb: OnSelectCallback = (index: number, selectStr: string) => {
    this.selectFlag = `${index}_${selectStr}`;
  };
  private clickCb: ButtonTriggerClickCallback = (xPos: number, yPos: number) => {
    this.triggerClickFlag = `${xPos}_${yPos}`;
  };
  private finishCb: TransitionFinishCallback = (transitionIn: boolean) => {
    this.transitionFlag = transitionIn ? 'in' : 'out';
  };

  aboutToAppear(): void {
    const corner: promptAction.DialogOptionsCornerRadius = 12;
    const borderW: promptAction.DialogOptionsBorderWidth = 1;
    const borderC: promptAction.DialogOptionsBorderColor = Color.Blue;
    const borderS: promptAction.DialogOptionsBorderStyle = BorderStyle.Solid;
    const shadow: promptAction.DialogOptionsShadow = ShadowStyle.OUTER_DEFAULT_MD;
    const opts: promptAction.DialogOptions = {
      cornerRadius: corner,
      borderWidth: borderW,
      borderColor: borderC,
      borderStyle: borderS,
      shadow: shadow
    };
    this.dialogOptFlag = opts.cornerRadius !== undefined ? 'ok' : 'fail';

    const m1: Matrix2D = new Matrix2D();
    const m2: Matrix2D = new Matrix2D(LengthMetricsUnit.DEFAULT);
    this.matrixFlag = (m1 !== undefined && m2 !== undefined) ? 'ok' : 'fail';

    const effectsKey: keyof TransitionEffects = 'opacity';
    const effect: TransitionEffect = TransitionEffect.opacity(0.5);
    this.transitionFlag = (effectsKey === 'opacity' && effect !== undefined) ? 'ready' : 'fail';

    const stateAlias: PromptActionCommonState = promptAction.CommonState.UNINITIALIZED;
    const commonCtrl: promptAction.CommonController | undefined = undefined;
    const dialogCtrl: promptAction.DialogController | undefined = undefined;
    this.commonCtrlFlag =
      (stateAlias === promptAction.CommonState.UNINITIALIZED &&
        commonCtrl === undefined && dialogCtrl === undefined) ? 'ok' : 'fail';
    // Mark typed callbacks as bound for coverage assertions
    this.triggerClickFlag = (this.clickCb !== undefined) ? 'bound' : 'fail';
    this.radioFlag = (this.radioCb !== undefined) ? 'bound' : 'fail';
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('CoverageTypes')
          .id('coverageTitle')
          .fontSize(20)
        Text(this.dialogOptFlag).id('dialogOptFlag')
        Text(this.matrixFlag).id('matrixFlag')
        Text(this.commonCtrlFlag).id('commonCtrlFlag')
        Text(this.triggerClickFlag).id('triggerClickFlag')
        Text(this.radioFlag).id('radioFlag')
        Text(this.ratingFlag).id('ratingFlag')
        Text(this.sliderFlag).id('sliderFlag')
        Text(this.selectFlag).id('selectFlag')
        Text(this.transitionFlag).id('transitionFlag')

        Button('triggerClick')
          .id('btnTrigger')
          .onClick(() => {
            this.clickCb(10, 20);
          })

        Radio({ value: 'r1', group: 'g1' })
          .id('radioCoverage')
          .checked(false)
          .onChange(this.radioCb)

        Rating({ rating: 2 })
          .id('ratingCoverage')
          .onChange(this.ratingCb)

        Slider({ value: 30, min: 0, max: 100 })
          .id('sliderCoverage')
          .onChange((value: number, mode: SliderChangeMode) => {
            this.sliderCb(value, mode);
          })

        Select([{ value: 'A' }, { value: 'B' }])
          .id('selectCoverage')
          .selected(0)
          .value('A')
          .onSelect(this.selectCb)

        Text('transitionTarget')
          .id('transitionTarget')
          .transition(TransitionEffect.OPACITY, this.finishCb)
          .renderFit(RenderFit.BOTTOM)
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
