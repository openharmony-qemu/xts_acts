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

const LOG_TAG = '[CoverageStaticTest]';

function assertFlagContains(key: string, token: string): void {
  const strJson: string = inspector.getInspectorByKey(key);
  console.info(`${LOG_TAG} ${key}=${strJson.substring(0, 120)}`);
  expect(strJson.length > 2).assertTrue();
  expect(strJson.indexOf(token) >= 0).assertTrue();
}

export default function CoverageStaticTest(): void {
  describe('CoverageStaticTest', () => {
    beforeEach(() => {
      console.info(`${LOG_TAG} beforeEach start`);
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        if (routerInstance !== undefined) {
          const pages = routerInstance.getState();
          if (pages.name !== 'CoverageStaticIndex') {
            const options: router.RouterOptions = {
              url: 'MainAbility/pages/coverage/CoverageStaticIndex',
            };
            routerInstance.replaceUrl(options);
          }
        }
      } catch (err) {
        console.error(`${LOG_TAG} beforeEach navigate soft-fail: ${err}`);
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
      assertFlagContains('dialogOptFlag', 'ok');
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
      assertFlagContains('coverageStaticTitle', 'CoverageStaticIndex');
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
      assertFlagContains('filterFlag', 'ready');
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
      assertFlagContains('typeAliasFlag', 'ready');
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
      assertFlagContains('pulseFlag', 'ok');
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
      assertFlagContains('radioFlag', 'bound');
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
      assertFlagContains('ratingFlag', 'bound');
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
      assertFlagContains('sliderFlag', 'bound');
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
      assertFlagContains('toolBarFlag', 'ready');
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
      assertFlagContains('extraAliasFlag', 'ok');
    });
  });
}
