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
import pthreadkeycreatendktest from 'libpthreadkeycreatendktest.so';

export default function PthreadKeyCreateNdkTest() {
  describe('PthreadKeyCreateNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testPthreadKeyCreateNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0100
     * @tc.desc   Create key with NULL destructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadKeyCreateNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0200
     * @tc.desc   Create key with destructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadKeyCreateNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0300
     * @tc.desc   Create and delete multiple keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadKeyCreateNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0104
     * @tc.desc   NULL key pointer should fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testPthreadKeyCreateAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateAbnormal001();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testPthreadKeyCreateAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0400
     * @tc.desc   Exceed PTHREAD_KEYS_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadKeyCreateAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0500
     * @tc.desc   Create key with complex destructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPthreadKeyCreateBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0600
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPthreadKeyCreateStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPthreadKeyCreateThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0700
     * @tc.desc   Multi-thread key creation and use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadKeyCreateThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = pthreadkeycreatendktest.pthreadKeyCreateThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}