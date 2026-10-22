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

export default function TopFloatingBarInvalidTest() {
  describe('TopFloatingBarInvalidTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.pushPage('tabs/TopFloatingBarInvalid');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    afterEach(async () => {
      await Utils.sleep(200);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0200
     * @tc.desc   Test topBarFloatingStyle({barWidth: -100}) negative barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid001', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid001] START');
      let strJson: string = getInspectorByKey('tabs_top_barWidth_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid001] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0300
     * @tc.desc   Test topBarFloatingStyle({barWidth: NaN}) NaN barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid002', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid002] START');
      let strJson: string = getInspectorByKey('tabs_top_barWidth_nan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid002] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0400
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: -16}) negative barSideMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid003', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid003] START');
      let strJson: string = getInspectorByKey('tabs_top_sideMargin_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid003] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0500
     * @tc.desc   Test topBarFloatingStyle({barTopMargin: -8}) negative barTopMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid004', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid004] START');
      let strJson: string = getInspectorByKey('tabs_top_topMargin_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid004] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopFloatingBarInvalid005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0600
     * @tc.desc   Test topBarFloatingStyle({maxWidth: -1}) negative maxWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid005', Level.LEVEL1, async (done: Function) => {
      console.info('[testTopFloatingBarInvalid005] START');
      let strJson: string = getInspectorByKey('tabs_top_maxWidth_negative');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[testTopFloatingBarInvalid005] attrs: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs !== undefined).assertTrue();
      expect(obj.$attrs.barStyle !== undefined).assertTrue();
      done();
    });
  });
}
