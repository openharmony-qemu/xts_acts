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

export default function CoverageStaticTest(): void {
  describe('CoverageStaticTest', () => {
    beforeEach(() => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/CoverageStaticIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        const pages = routerInstance.getState();
        if (pages.name !== 'CoverageStaticIndex') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error(`${LOG_TAG} beforeEach replaceUrl error: ${err}`);
        expect().assertFail();
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
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('dialogOptFlag');
      expect(strJson.length > 2).assertTrue();
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
      let strJson: string = inspector.getInspectorByKey('coverageStaticTitle');
      expect(strJson.length > 2).assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300
     * @tc.desc Cover Filter / FilterParams call site
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_STATIC_FILTER_0300', Level.LEVEL1, async () => {
      await Utils.sleep(800);
      let strJson: string = inspector.getInspectorByKey('filterFlag');
      expect(strJson.length > 2).assertTrue();
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
      let strJson: string = inspector.getInspectorByKey('typeAliasFlag');
      expect(strJson.length > 2).assertTrue();
    });
  });
}
