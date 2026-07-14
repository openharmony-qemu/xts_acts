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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import musl_logfinitendktest from 'libmusl_logfinitendktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function LogFiniteNdkTest() {
  describe('LogFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testLogFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0100
     * @tc.desc   Verify __log_finite computes natural log for typical positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteNormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0200
     * @tc.desc   Verify __log_finite handles e and powers of e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteNormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0300
     * @tc.desc   Verify __log_finite handles fractional values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteNormal003();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0400
     * @tc.desc   Verify __log_finite IsStubMode returns expected result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0500
     * @tc.desc   Verify __log_finite handles NaN input without errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteAbnormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0600
     * @tc.desc   Verify __log_finite handles Inf and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogFiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteAbnormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0700
     * @tc.desc   Verify __log_finite at boundary value 1.0 returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteBoundary001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0800
     * @tc.desc   Verify __log_finite at very small positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteBoundary002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_0900
     * @tc.desc   Verify __log_finite produces consistent results across repeated calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteStable001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLogFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_FINITE_1000
     * @tc.desc   Verify __log_finite thread safety with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_logfinitendktest.logFiniteThread001();
      expect(resNum >= 0).assertTrue();
      done();
    });
  });
}