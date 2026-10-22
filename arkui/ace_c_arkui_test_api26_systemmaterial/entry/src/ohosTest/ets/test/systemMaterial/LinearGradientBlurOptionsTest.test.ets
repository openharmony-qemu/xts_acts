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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

function runCase(name: string, done: Function): void {
  expect(nativeFunc[name]()).assertEqual(0);
  done();
}

export default function linearGradientBlurOptionsTest() {
  describe('LinearGradientBlurOptionsTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0001
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0001
     * @tc.desc   LinearGradientBlurOptions Create and Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0001', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurCreateDestroy001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0002
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0002
     * @tc.desc   LinearGradientBlurOptions Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0002', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurDestroyNull002', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0003
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0003
     * @tc.desc   LinearGradientBlurOptions Set/Get BlurRadius
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0003', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurSetGetRadius003', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0004
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0004
     * @tc.desc   LinearGradientBlurOptions Get default BlurRadius (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0004', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurGetRadiusDefault004', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0005
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0005
     * @tc.desc   LinearGradientBlurOptions Set BlurRadius to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0005', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetRadiusZero005', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0006
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0006
     * @tc.desc   LinearGradientBlurOptions Set large BlurRadius (10000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0006', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetRadiusLarge006', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0007
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0007
     * @tc.desc   LinearGradientBlurOptions SetBlurRadius with nullptr options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0007', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetRadiusNull007', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0008
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0008
     * @tc.desc   LinearGradientBlurOptions GetBlurRadius with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0008', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurGetRadiusNull008', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0009
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0009
     * @tc.desc   LinearGradientBlurOptions Set/Get FractionStops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0009', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurSetGetFractionStops009', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0010
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0010
     * @tc.desc   LinearGradientBlurOptions Set custom FractionStops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0010', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetFractionStopsCustom010', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0011
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0011
     * @tc.desc   LinearGradientBlurOptions SetFractionStops with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0011', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetFractionStopsNull011', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0012
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0012
     * @tc.desc   LinearGradientBlurOptions GetFractionStops with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0012', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurGetFractionStopsNull012', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0013
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0013
     * @tc.desc   LinearGradientBlurOptions Set/Get Direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0013', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurSetGetDirection013', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0014
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0014
     * @tc.desc   LinearGradientBlurOptions all Direction enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0014', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurDirectionEnum014', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0015
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0015
     * @tc.desc   LinearGradientBlurOptions SetDirection with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0015', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurSetDirectionNull015', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0016
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0016
     * @tc.desc   LinearGradientBlurOptions GetDirection with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0016', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientBlurGetDirectionNull016', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0017
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0017
     * @tc.desc   LinearGradientBlurOptions Get default Direction (BOTTOM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0017', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurGetDefaultDirection017', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0018
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0018
     * @tc.desc   LinearGradientBlurOptions Get default FractionStops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0018', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurGetDefaultFractionStops018', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0019
     * @tc.number SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0019
     * @tc.desc   LinearGradientBlurOptions Update all params together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_LINEAR_GRADIENT_BLUR_0019', Level.LEVEL0, async (done: Function) => {
      runCase('testLinearGradientBlurUpdateAllParams019', done);
    });

  })
}
