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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';

export default function coverageTypesTest() {
  describe('CoverageTypesTest', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] CoverageTypesTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/CoverageTypes',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.error('[ARKUI_DYN] CoverageTypesTest push error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100
     * @tc.desc Cover DialogOptionsCornerRadius/BorderWidth/BorderColor/BorderStyle/Shadow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('dialogOptFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200
     * @tc.name SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200
     * @tc.desc Cover Matrix2D constructors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('matrixFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300
     * @tc.desc Cover PromptActionCommonState / CommonController / DialogController
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('commonCtrlFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400
     * @tc.name SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400
     * @tc.desc Cover ButtonTriggerClickCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('triggerClickFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      let btn = getInspectorByKey('btnTrigger');
      expect(btn.length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500
     * @tc.name SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500
     * @tc.desc Cover OnRadioChangeCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('radioFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      let radio = getInspectorByKey('radioCoverage');
      expect(radio.length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600
     * @tc.name SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600
     * @tc.desc Cover TransitionEffects / TransitionFinishCallback / RenderFit.BOTTOM
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('transitionFlag');
      let content: string = JSON.stringify(JSON.parse(node).$attrs.content);
      expect(content.indexOf('ready') >= 0 || content.indexOf('in') >= 0 ||
        content.indexOf('out') >= 0).assertTrue();
      let target: string = getInspectorByKey('transitionTarget');
      expect(target.length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_RATINGCB_0700
     * @tc.name SUB_ARKUI_APICOVERAGE0910_RATINGCB_0700
     * @tc.desc Cover OnRatingChangeCallback binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_RATINGCB_0700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('ratingFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      expect(getInspectorByKey('ratingCoverage').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_SELECTCB_0800
     * @tc.name SUB_ARKUI_APICOVERAGE0910_SELECTCB_0800
     * @tc.desc Cover OnSelectCallback binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_SELECTCB_0800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('selectFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      expect(getInspectorByKey('selectCoverage').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_SLIDERCB_0900
     * @tc.name SUB_ARKUI_APICOVERAGE0910_SLIDERCB_0900
     * @tc.desc Cover SliderTriggerChangeCallback binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_SLIDERCB_0900', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('sliderFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      expect(getInspectorByKey('sliderCoverage').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_EXTRALIAS_1000
     * @tc.name SUB_ARKUI_APICOVERAGE0910_EXTRALIAS_1000
     * @tc.desc Cover Pivot / Matrix4Transit type aliases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_EXTRALIAS_1000', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('extraAliasFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_POPUPCB_1100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_POPUPCB_1100
     * @tc.desc Cover PopupStateChangeCallback / PopupOptions / showInSubWindow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_POPUPCB_1100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('popupFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      expect(getInspectorByKey('btnPopup').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_COLORMETRICS_1200
     * @tc.name SUB_ARKUI_APICOVERAGE0910_COLORMETRICS_1200
     * @tc.desc Cover ColorMetrics getters alpha/red/green/blue/color and blendColor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_COLORMETRICS_1200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('colorMetricsFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_MATRIXMETHOD_1300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_MATRIXMETHOD_1300
     * @tc.desc Cover Matrix2D.identity / invert
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_MATRIXMETHOD_1300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('matrixMethodFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_CURVES_1400
     * @tc.name SUB_ARKUI_APICOVERAGE0910_CURVES_1400
     * @tc.desc Cover curves.init / spring / steps
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_CURVES_1400', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('curvesFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_TRANSITIONCTOR_1500
     * @tc.name SUB_ARKUI_APICOVERAGE0910_TRANSITIONCTOR_1500
     * @tc.desc Cover TransitionEffect constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_TRANSITIONCTOR_1500', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('transitionCtorFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_RADIOSTYLE_1600
     * @tc.name SUB_ARKUI_APICOVERAGE0910_RADIOSTYLE_1600
     * @tc.desc Cover RadioAttribute.radioStyle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_RADIOSTYLE_1600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('radioStyleFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      expect(getInspectorByKey('radioCoverage').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_PIVOTFILTER_1700
     * @tc.name SUB_ARKUI_APICOVERAGE0910_PIVOTFILTER_1700
     * @tc.desc Cover Pivot / Filter type aliases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_PIVOTFILTER_1700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('pivotFilterFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_MENUSYMBOL_1800
     * @tc.name SUB_ARKUI_APICOVERAGE0910_MENUSYMBOL_1800
     * @tc.desc Cover Menu.subMenuExpandSymbol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_MENUSYMBOL_1800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('menuSymbolFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      expect(getInspectorByKey('btnMenu').length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_DIALOGGETSTATE_1900
     * @tc.name SUB_ARKUI_APICOVERAGE0910_DIALOGGETSTATE_1900
     * @tc.desc Cover CustomDialogController.getState
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_DIALOGGETSTATE_1900', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('dialogGetStateFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_LAZYFOREACH_2000
     * @tc.name SUB_ARKUI_APICOVERAGE0910_LAZYFOREACH_2000
     * @tc.desc Cover LazyForEach and DataChangeListener.onDataReloaded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_LAZYFOREACH_2000', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('lazyFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_PARTICLE_2100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_PARTICLE_2100
     * @tc.desc Cover ParticleAttribute.rippleFields / velocityFields
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_PARTICLE_2100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('particleFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      expect(getInspectorByKey('particleCoverage').length > 0).assertTrue();
      done();
    });
  });
}
