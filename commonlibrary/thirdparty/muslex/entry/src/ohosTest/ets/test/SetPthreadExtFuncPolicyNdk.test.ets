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
import libsetpthreadextfuncpolicyndktest from 'libsetpthreadextfuncpolicyndktest.so';

export default function SetPthreadExtFuncPolicyNdkTest() {
  describe('SetPthreadExtFuncPolicyNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0100
     * @tc.desc   Set pthread ext func policy basic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0200
     * @tc.desc   Set policy with specific value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0300
     * @tc.desc   Set policy multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0500
     * @tc.desc   Set policy with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0600
     * @tc.desc   Set policy error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0700
     * @tc.desc   Set policy boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0800
     * @tc.desc   Set policy reset to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyStable001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_0900
     * @tc.desc   Repeated set policy stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetPthreadExtFuncPolicyThread001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_PTHREAD_EXT_FUNC_POLICY_1000
     * @tc.desc   Multi-thread set policy concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetPthreadExtFuncPolicyThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetpthreadextfuncpolicyndktest.setPthreadExtFuncPolicyThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}