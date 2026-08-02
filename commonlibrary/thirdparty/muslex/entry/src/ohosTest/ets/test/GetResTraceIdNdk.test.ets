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
import getrestraceidndktest from 'libgetrestraceidndktest.so';

export default function GetResTraceIdNdkTest() {
  describe('GetResTraceIdNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testGetResTraceIdNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0100
     * @tc.desc   Get trace ID basic query with valid pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0200
     * @tc.desc   Get trace ID returns current trace info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0300
     * @tc.desc   Get trace ID multiple calls consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0500
     * @tc.desc   Get trace ID with null output pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0600
     * @tc.desc   Get trace ID with partial null pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0700
     * @tc.desc   Get trace ID zero trace type boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0800
     * @tc.desc   Get trace ID max trace ID boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdStable001
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_0900
     * @tc.desc   Repeated get trace ID calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetResTraceIdThread001
     * @tc.number SUB_THIRDPARTY_MUSL_GET_RES_TRACE_ID_1000
     * @tc.desc   Multi-thread get trace ID concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResTraceIdThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getrestraceidndktest.getResTraceIdThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}