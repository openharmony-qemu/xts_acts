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
import libsetsigchainprevalndktest from 'libsetsigchainprevalndktest.so';

export default function SetSigchainPreValidationNdkTest() {
  describe('SetSigchainPreValidationNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testsetSigchainPreValidationNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0100
     * @tc.desc   Set sigchain pre-validation basic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0200
     * @tc.desc   Set pre-validation with different params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0300
     * @tc.desc   Set pre-validation multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0500
     * @tc.desc   Set pre-validation with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0600
     * @tc.desc   Set pre-validation error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0700
     * @tc.desc   Set pre-validation boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0800
     * @tc.desc   Set pre-validation edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationStable001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_0900
     * @tc.desc   Repeated pre-validation stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetSigchainPreValidationThread001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_SIGCHAIN_PRE_VALIDATION_1000
     * @tc.desc   Multi-thread pre-validation concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetSigchainPreValidationThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetsigchainprevalndktest.setSigchainPreValidationThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}