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
import libsetrestraceidndktest from 'libsetrestraceidndktest.so';

export default function SetResTraceIdNdkTest() {
  describe('SetResTraceIdNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testsetResTraceIdNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0100
     * @tc.desc   Set resource trace ID basic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0200
     * @tc.desc   Set trace ID with specific type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0300
     * @tc.desc   Set trace ID and verify via Get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0500
     * @tc.desc   Set trace ID with null pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0600
     * @tc.desc   Set trace ID invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0700
     * @tc.desc   Set trace ID max value boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0800
     * @tc.desc   Set trace ID zero value boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdStable001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_0900
     * @tc.desc   Repeated set trace ID stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetResTraceIdThread001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_RES_TRACE_ID_1000
     * @tc.desc   Multi-thread set trace ID concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetResTraceIdThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetrestraceidndktest.setResTraceIdThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}