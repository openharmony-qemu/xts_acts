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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[coverageStaticTest]';


export default function coverageStaticTest(): void {
  describe('coverageStaticTest', () => {
    beforeEach(() => {
      console.info(`${LOG_TAG} beforeEach start`);
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        const pages = routerInstance.getState();
        if (pages.name !== 'CoverageStaticIndex') {
          const options: router.RouterOptions = {
            url: 'MainAbility/pages/coverage/CoverageStaticIndex',
          };
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.info(`${LOG_TAG} beforeEach navigate soft-fail: ${err}`);
      }
    });

    afterEach(() => {
      console.info(`${LOG_TAG} afterEach`);
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_DIALOGOPTIONS_0100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_DIALOGOPTIONS_0100
     * @tc.desc Cover DialogOptions* type aliases on static page
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_DIALOGOPTIONS_0100', Level.LEVEL1, async () => {
      await Utils.sleep(1200);
      const strJson: string = inspector.getInspectorByKey('dialogOptFlag');
      console.info(`${LOG_TAG} dialogOptFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_POPOVERV2_0200
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_POPOVERV2_0200
     * @tc.desc Cover PopoverDialogV2 call site exists on page
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_POPOVERV2_0200', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('coverageStaticTitle');
      console.info(`${LOG_TAG} coverageStaticTitle=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('CoverageStaticIndex') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300
     * @tc.desc Cover Filter / OnFilterChangedCallback call site
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('filterFlag');
      console.info(`${LOG_TAG} filterFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ready') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_TYPEALIAS_0400
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_TYPEALIAS_0400
     * @tc.desc Cover Matrix2D constructors and CommonController alias
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_TYPEALIAS_0400', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('typeAliasFlag');
      console.info(`${LOG_TAG} typeAliasFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ready') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_PULSE_0500
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_PULSE_0500
     * @tc.desc Cover PulseSymbolEffect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_PULSE_0500', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('pulseFlag');
      console.info(`${LOG_TAG} pulseFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_RADIO_0600
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_RADIO_0600
     * @tc.desc Cover OnRadioChangeCallback typed binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_RADIO_0600', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('radioFlag');
      console.info(`${LOG_TAG} radioFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('bound') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_RATING_0700
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_RATING_0700
     * @tc.desc Cover OnRatingChangeCallback typed binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_RATING_0700', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('ratingFlag');
      console.info(`${LOG_TAG} ratingFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('bound') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_SLIDER_0800
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_SLIDER_0800
     * @tc.desc Cover SliderTriggerChangeCallback typed binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_SLIDER_0800', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('sliderFlag');
      console.info(`${LOG_TAG} sliderFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('bound') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBAR_0900
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBAR_0900
     * @tc.desc Cover ToolBarV2 / ToolBarV2Item* constructors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBAR_0900', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('toolBarFlag');
      console.info(`${LOG_TAG} toolBarFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ready') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_EXTRALIAS_1000
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_EXTRALIAS_1000
     * @tc.desc Cover Degree / TipsMessageType / RegionBuilder / callbacks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_EXTRALIAS_1000', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('extraAliasFlag');
      console.info(`${LOG_TAG} extraAliasFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_MATRIXPROP_1100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_MATRIXPROP_1100
     * @tc.desc Cover Matrix2D rotateX/Y scaleX/Y translateX/Y setters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_MATRIXPROP_1100', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('matrixPropFlag');
      console.info(`${LOG_TAG} matrixPropFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_COMMONCTRL_1200
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_COMMONCTRL_1200
     * @tc.desc Cover promptAction.CommonController construct/getState/close
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_COMMONCTRL_1200', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('commonCtrlFlag');
      console.info(`${LOG_TAG} commonCtrlFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_CLICKSOUND_1300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_CLICKSOUND_1300
     * @tc.desc Cover Button.enableClickSoundEffect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_CLICKSOUND_1300', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('clickSoundFlag');
      console.info(`${LOG_TAG} clickSoundFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
      const strJson: string = inspector.getInspectorByKey('btnClick');
      console.info(`${LOG_TAG} btnClick=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('clickCb') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_MOREALIAS_1400
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_MOREALIAS_1400
     * @tc.desc Cover ContentTransition/Translation/SystemBarStyle and related aliases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_MOREALIAS_1400', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('moreAliasFlag');
      console.info(`${LOG_TAG} moreAliasFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBARSYMBOL_1600
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBARSYMBOL_1600
     * @tc.desc Cover ToolBarV2SymbolGlyph as ToolBarV2Item.icon
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_TOOLBARSYMBOL_1600', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      const strJson: string = inspector.getInspectorByKey('toolBarSymbolFlag');
      console.info(`${LOG_TAG} toolBarSymbolFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_TYPENODE_1700
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_TYPENODE_1700
     * @tc.desc Cover typeNode Badge/Marquee/QRCode/Rating/Select/SymbolGlyph/TextClock/TextTimer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_TYPENODE_1700', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('typeNodeFlag');
      console.info(`${LOG_TAG} typeNodeFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_INTEROP_1800
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_INTEROP_1800
     * @tc.desc Cover Compatible* callbacks and CustomDialogController.getState
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_INTEROP_1800', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('interopFlag');
      console.info(`${LOG_TAG} interopFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
      const strJson: string = inspector.getInspectorByKey('dialogGetStateFlag');
      console.info(`${LOG_TAG} dialogGetStateFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_SDKALIAS_1900
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_SDKALIAS_1900
     * @tc.desc Cover misc SDK aliases: SystemBar/ContentSlot/InputEventType and hover callback.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_SDKALIAS_1900', Level.LEVEL1, async () => {
      await Utils.sleep(500);
      const strJson: string = inspector.getInspectorByKey('sdkAliasFlag');
      console.info(`${LOG_TAG} sdkAliasFlag=${strJson.substring(0, 120)}`);
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });
  });
}
