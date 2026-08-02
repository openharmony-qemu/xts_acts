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
import pthreadextfuncpolicyndktest from 'libpthreadextfuncpolicyndktest.so';

export default function PthreadExtFuncPolicyNdkTest() {
  describe('PthreadExtFuncPolicyNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testPthreadExtFuncPolicyNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0100
     * @tc.desc   Get pthread extended function policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0200
     * @tc.desc   Get policy with different parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0300
     * @tc.desc   Get policy multiple times consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0500
     * @tc.desc   Get policy with invalid input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0600
     * @tc.desc   Repeated policy get calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0700
     * @tc.desc   Get policy boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0800
     * @tc.desc   Get policy edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_0900
     * @tc.desc   Repeated policy get stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadExtFuncPolicyThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXT_FUNC_POLICY_1000
     * @tc.desc   Multi-thread policy get concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadExtFuncPolicyThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadextfuncpolicyndktest.pthreadExtFuncPolicyThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}