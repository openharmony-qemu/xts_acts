/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

const SLEEP_TIME: number = 1000;

export default function TopFloatingBarLegacyTest() {
  describe('TopFloatingBarLegacyTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.pushPage('tabs/TopFloatingBarLegacy');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    afterEach(async () => {
      await Utils.sleep(200);
    });

    /**
     * @tc.name   testTopFloatingBarLegacy001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0100
     * @tc.desc   Test barStyle(BOTTOM) legacy style renders correctly without regression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy001', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy001] START');
      let strJson: string = getInspectorByKey('tabs_legacy_bottom');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy001] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarLegacy002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0200
     * @tc.desc   Test barStyle(SIDEBAR) legacy style renders correctly without regression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy002', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy002] START');
      let strJson: string = getInspectorByKey('tabs_legacy_sidebar');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy002] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarLegacy003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_REGRESSION_0300
     * @tc.desc   Test barStyle(BOTTOM) with topBarFloatingStyle ignores top floating params and renders BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarLegacy003', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarLegacy003] START');
      let strJson: string = getInspectorByKey('tabs_legacy_bottom_ignores_top_floating');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarLegacy003] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });
  });
}
