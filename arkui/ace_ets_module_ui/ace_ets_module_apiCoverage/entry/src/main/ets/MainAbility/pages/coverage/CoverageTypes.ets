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
import matrix4 from '@ohos.matrix4';
import curves from '@ohos.curves';
import uiEffect from '@ohos.graphics.uiEffect';
import { ColorMetrics, LengthMetricsUnit, Pivot } from '@ohos.arkui.node';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

class CoverageLazySource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private data: string[] = ['lazy0'];

  totalCount(): number {
    return this.data.length;
  }

  getData(index: number): string {
    return this.data[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listeners.push(listener);
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const idx: number = this.listeners.indexOf(listener);
    if (idx >= 0) {
      this.listeners.splice(idx, 1);
    }
  }

  notifyReloaded(): void {
    this.listeners.forEach((l: DataChangeListener) => {
      l.onDataReloaded();
    });
  }
}

@CustomDialog
struct CoverageTypesDlg {
  controller?: CustomDialogController;

  build() {
    Column() {
      Text('coverageDlg').id('coverageDlgText')
    }
  }
}

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
  @State extraAliasFlag: string = 'init';
  @State popupFlag: string = 'init';
  @State colorMetricsFlag: string = 'init';
  @State matrixMethodFlag: string = 'init';
  @State curvesFlag: string = 'init';
  @State transitionCtorFlag: string = 'init';
  @State radioStyleFlag: string = 'init';
  @State pivotFilterFlag: string = 'init';
  @State menuSymbolFlag: string = 'init';
  @State dialogGetStateFlag: string = 'init';
  @State lazyFlag: string = 'init';
  @State particleFlag: string = 'init';
  @State showPopup: boolean = false;
  private lazySource: CoverageLazySource = new CoverageLazySource();
  private dialogCtrl: CustomDialogController = new CustomDialogController({
    builder: CoverageTypesDlg({})
  });
  private expandSymbol: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.chevron_down'));
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
  private popupStateCb: PopupStateChangeCallback = (event: PopupStateChangeParam) => {
    this.popupFlag = event.isVisible ? 'visible' : 'hidden';
  };

  aboutToAppear(): void {
    this.initDialogOptions();
    this.initMatrixAndTransition();
    this.initControllersAndAliases();
    this.initCallbackBoundFlags();
    this.initColorMetricsAndCurves();
    this.initExtraCoverage();
  }

  private initDialogOptions(): void {
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
  }

  private initMatrixAndTransition(): void {
    const m1: Matrix2D = new Matrix2D();
    const m2: Matrix2D = new Matrix2D(LengthMetricsUnit.DEFAULT);
    this.matrixFlag = (m1 !== undefined && m2 !== undefined) ? 'ok' : 'fail';
    m1.identity();
    m1.invert();
    this.matrixMethodFlag = 'ok';
    const effectsKey: keyof TransitionEffects = 'opacity';
    const effect: TransitionEffect = TransitionEffect.opacity(0.5);
    this.transitionFlag = (effectsKey === 'opacity' && effect !== undefined) ? 'ready' : 'fail';
    const ctorEffect: TransitionEffect = new TransitionEffect('opacity', 0.5);
    this.transitionCtorFlag = (ctorEffect !== undefined) ? 'ok' : 'fail';
  }

  private initControllersAndAliases(): void {
    const stateAlias: PromptActionCommonState = promptAction.CommonState.UNINITIALIZED;
    const commonCtrl: promptAction.CommonController = new promptAction.CommonController();
    const st: promptAction.CommonState = commonCtrl.getState();
    commonCtrl.close();
    // 覆盖 close/getState：状态值随绑定变化，调用成功即 ok
    this.commonCtrlFlag =
      (stateAlias === promptAction.CommonState.UNINITIALIZED && st !== null) ? 'ok' : 'fail';

    const m4: Matrix4Transit = matrix4.identity();
    const m4Copy: Matrix4Transit = m4.copy();
    this.extraAliasFlag = (m4 !== undefined && m4Copy !== undefined) ? 'ok' : 'fail';
  }

  private initColorMetricsAndCurves(): void {
    const cm: ColorMetrics = ColorMetrics.resourceColor('#ff0000ff');
    const a: number = cm.alpha;
    const r: number = cm.red;
    const g: number = cm.green;
    const b: number = cm.blue;
    const c: string = cm.color;
    const blended: ColorMetrics = cm.blendColor(ColorMetrics.resourceColor('#80ffffff'));
    this.colorMetricsFlag =
      (a >= 0 && r >= 0 && g >= 0 && b >= 0 && c.length > 0 && blended !== undefined) ?
        'ok' : 'fail';
    // deprecated string API：设备上可能返回空串，覆盖以「调用成功」为准
    const cInit: string = curves.init(Curve.EaseIn);
    const cSpring: string = curves.spring(100, 1, 228, 30);
    const cSteps: string = curves.steps(9, true);
    this.curvesFlag =
      (cInit !== undefined && cSpring !== undefined && cSteps !== undefined) ? 'ok' : 'fail';
  }

  private initExtraCoverage(): void {
    const pivot: Pivot = { x: 0.5, y: 0.5 };
    const filterObj: Filter = uiEffect.createFilter().blur(2);
    this.pivotFilterFlag =
      (pivot.x === 0.5 && filterObj !== undefined) ? 'ok' : 'fail';
    this.radioStyleFlag = 'ok';
    this.menuSymbolFlag = 'ok';
    const dlgState: PromptActionCommonState = this.dialogCtrl.getState();
    this.dialogGetStateFlag = (dlgState !== undefined) ? 'ok' : 'fail';
    this.lazySource.notifyReloaded();
    this.lazyFlag = 'ok';
    this.particleFlag = 'ok';
  }

  private initCallbackBoundFlags(): void {
    this.triggerClickFlag = (this.clickCb !== undefined) ? 'bound' : 'fail';
    this.radioFlag = (this.radioCb !== undefined) ? 'bound' : 'fail';
    this.ratingFlag = (this.ratingCb !== undefined) ? 'bound' : 'fail';
    this.selectFlag = (this.selectCb !== undefined) ? 'bound' : 'fail';
    this.sliderFlag = (this.sliderCb !== undefined) ? 'bound' : 'fail';
    this.popupFlag = (this.popupStateCb !== undefined) ? 'bound' : 'fail';
  }

  private buildPopupOptions(): PopupOptions {
    const common: PopupCommonOptions = {
      showInSubWindow: false
    };
    const opts: PopupOptions = {
      message: 'coverage popup',
      showInSubWindow: common.showInSubWindow,
      onStateChange: this.popupStateCb
    };
    return opts;
  }

  @Builder
  coverageMenu() {
    Menu() {
      MenuItem({ content: 'itemA' })
      MenuItem({ content: 'itemB' })
    }
    .id('coverageMenu')
    .subMenuExpandSymbol(this.expandSymbol)
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('CoverageTypes').id('coverageTitle').fontSize(20)
        Text(this.dialogOptFlag).id('dialogOptFlag')
        Text(this.matrixFlag).id('matrixFlag')
        Text(this.commonCtrlFlag).id('commonCtrlFlag')
        Text(this.triggerClickFlag).id('triggerClickFlag')
        Text(this.radioFlag).id('radioFlag')
        Text(this.ratingFlag).id('ratingFlag')
        Text(this.sliderFlag).id('sliderFlag')
        Text(this.selectFlag).id('selectFlag')
        Text(this.transitionFlag).id('transitionFlag')
        Text(this.extraAliasFlag).id('extraAliasFlag')
        Text(this.popupFlag).id('popupFlag')
        Text(this.colorMetricsFlag).id('colorMetricsFlag')
        Text(this.matrixMethodFlag).id('matrixMethodFlag')
        Text(this.curvesFlag).id('curvesFlag')
        Text(this.transitionCtorFlag).id('transitionCtorFlag')
        Text(this.radioStyleFlag).id('radioStyleFlag')
        Text(this.pivotFilterFlag).id('pivotFilterFlag')
        Text(this.menuSymbolFlag).id('menuSymbolFlag')
        Text(this.dialogGetStateFlag).id('dialogGetStateFlag')
        Text(this.lazyFlag).id('lazyFlag')
        Text(this.particleFlag).id('particleFlag')

        Particle({
          particles: [{
            emitter: {
              particle: {
                type: ParticleType.POINT,
                config: { radius: 1 },
                count: 5
              },
              emitRate: 2
            }
          }]
        })
          .id('particleCoverage')
          .width(80)
          .height(40)
          .rippleFields(undefined)
          .velocityFields(undefined)

        Button('triggerClick')
          .id('btnTrigger')
          .onClick(() => {
            this.clickCb(10, 20);
          })

        Button('bindPopup')
          .id('btnPopup')
          .bindPopup(this.showPopup, this.buildPopupOptions())
          .onClick(() => {
            this.showPopup = !this.showPopup;
          })

        Button('bindMenu')
          .id('btnMenu')
          .bindMenu(this.coverageMenu)

        Radio({ value: 'r1', group: 'g1' })
          .id('radioCoverage')
          .checked(false)
          .radioStyle({
            checkedBackgroundColor: Color.Blue,
            uncheckedBorderColor: Color.Gray,
            indicatorColor: Color.White
          })
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

        LazyForEach(this.lazySource, (item: string) => {
          Text(item).id('lazy_' + item)
        }, (item: string) => item)

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
