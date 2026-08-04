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
import libpthreadattrextdestroyndktest from 'libpthreadattrextdestroyndktest.so';

export default function PthreadAttrExtDestroyNdkTest() {
  describe('PthreadAttrExtDestroyNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testpthreadAttrExtDestroyNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0100
     * @tc.desc   Destroy initialized pthread attr extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0200
     * @tc.desc   Destroy attr extension after attribute set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0300
     * @tc.desc   Destroy attr extension double destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0500
     * @tc.desc   Destroy attr extension with null attr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0600
     * @tc.desc   Destroy uninitialized attr extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0700
     * @tc.desc   Repeated init/destroy cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0800
     * @tc.desc   Destroy attr extension edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_0900
     * @tc.desc   Repeated attr destroy stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtDestroyThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_DESTROY_1000
     * @tc.desc   Multi-thread attr destroy concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtDestroyThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextdestroyndktest.pthreadAttrExtDestroyThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}