/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import pthreadjoindetach from 'libpthreadjoindetach.so'

export default function muslPthreadJoinDetachTest() {
  describe('MuslPthreadJoinDetachTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslPthreadJoinDetach001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0100
     * @tc.desc   detached thread running join returns EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadJoinDetach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0100();
      console.info("PthreadJoinDetach_0100 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0200
     * @tc.desc   retval not modified
     */
    it('testMuslPthreadJoinDetach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0200();
      console.info("PthreadJoinDetach_0200 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0300
     * @tc.desc   multiple join same detached thread
     */
    it('testMuslPthreadJoinDetach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0300();
      console.info("PthreadJoinDetach_0300 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0400
     * @tc.desc   multiple independent detached threads
     */
    it('testMuslPthreadJoinDetach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0400();
      console.info("PthreadJoinDetach_0400 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach005
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0500
     * @tc.desc   join immediately after detach
     */
    it('testMuslPthreadJoinDetach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0500();
      console.info("PthreadJoinDetach_0500 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach006
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0600
     * @tc.desc   concurrent join same detached thread
     */
    it('testMuslPthreadJoinDetach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0600();
      console.info("PthreadJoinDetach_0600 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach007
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0700
     * @tc.desc   concurrent join with retval not modified
     */
    it('testMuslPthreadJoinDetach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0700();
      console.info("PthreadJoinDetach_0700 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach008
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0800
     * @tc.desc   mixed retval concurrent join
     */
    it('testMuslPthreadJoinDetach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0800();
      console.info("PthreadJoinDetach_0800 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach009
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_0900
     * @tc.desc   all calling threads survive
     */
    it('testMuslPthreadJoinDetach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_0900();
      console.info("PthreadJoinDetach_0900 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach010
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1000
     * @tc.desc   joinable normal join returns 0
     */
    it('testMuslPthreadJoinDetach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1000();
      console.info("PthreadJoinDetach_1000 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach011
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1100
     * @tc.desc   NULL argument returns ESRCH
     */
    it('testMuslPthreadJoinDetach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1100();
      console.info("PthreadJoinDetach_1100 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach012
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1200
     * @tc.desc   repeated detach returns 0
     */
    it('testMuslPthreadJoinDetach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1200();
      console.info("PthreadJoinDetach_1200 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach013
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1300
     * @tc.desc   multiple repeated detach
     */
    it('testMuslPthreadJoinDetach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1300();
      console.info("PthreadJoinDetach_1300 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach014
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1400
     * @tc.desc   cross-platform consistency
     */
    it('testMuslPthreadJoinDetach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1400();
      console.info("PthreadJoinDetach_1400 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPthreadJoinDetach015
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_DETACH_1500
     * @tc.desc   errno not modified (detached)
     */
    it('testMuslPthreadJoinDetach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = pthreadjoindetach.PthreadJoinDetach_1500();
      console.info("PthreadJoinDetach_1500 result = " + result);
      expect(result).assertEqual(0);
      done()
    });

  })
}
