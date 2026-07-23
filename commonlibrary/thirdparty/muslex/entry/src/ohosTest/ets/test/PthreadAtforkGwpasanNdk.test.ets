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
import libpthreadatforkgwpasanndktest from 'libpthreadatforkgwpasanndktest.so';

export default function PthreadAtforkGwpasanNdkTest() {
  describe('PthreadAtforkGwpasanNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testpthreadAtforkGwpasanNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0100
     * @tc.desc   Register atfork handler basic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0200
     * @tc.desc   Register atfork with prepare handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0300
     * @tc.desc   Register atfork with all handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0500
     * @tc.desc   Register atfork with null pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0600
     * @tc.desc   Register atfork error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0700
     * @tc.desc   Register atfork boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0800
     * @tc.desc   Register atfork multiple handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_0900
     * @tc.desc   Repeated atfork register stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAtforkGwpasanThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_GWPASAN_1000
     * @tc.desc   Multi-thread atfork concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAtforkGwpasanThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadatforkgwpasanndktest.pthreadAtforkGwpasanThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}