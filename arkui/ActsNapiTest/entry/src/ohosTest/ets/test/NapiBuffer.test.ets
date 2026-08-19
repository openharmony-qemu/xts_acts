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
import testNapi from 'libnapiBuffer.so';

export default function bufferTest() {
  describe('ActsBufferTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name testNapiBuffer0001
     * @tc.number SUB_NAPI_BUFFER_0100
     * @tc.desc Original simple test for buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testNapiBuffer001';
      console.info(`${caseName} START`);
      expect(testNapi.isBuffer()).assertTrue();
      console.info(`${caseName} END`);
      done();
    });

    /**
     * @tc.name testNapiBuffer0002
     * @tc.number SUB_NAPI_BUFFER_0200
     * @tc.desc Test isBuffer with pending exception — napi_create_buffer fails under pending exception,
     *        buffer remains nullptr, causing napi_is_buffer to return napi_invalid_arg (1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testNapiBuffer002';
      console.info(`${caseName} START`);
      let status: number = testNapi.isBufferAfterException();
      expect(status).assertEqual(1);
      console.info(`${caseName} END`);
      done();
    });

    /**
     * @tc.name testNapiBuffer0003
     * @tc.number SUB_NAPI_BUFFER_0300
     * @tc.desc Test isBuffer on non-Buffer object returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testNapiBuffer003';
      console.info(`${caseName} START`);
      let ret: number = testNapi.isBufferOnNonBuffer();
      expect(ret).assertEqual(0);
      console.info(`${caseName} END`);
      done();
    });

    /**
     * @tc.name testNapiBuffer0004
     * @tc.number SUB_NAPI_BUFFER_0400
     * @tc.desc Test isBuffer on normal Buffer returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testNapiBuffer004';
      console.info(`${caseName} START`);
      let ret: number = testNapi.isBufferOnSlice();
      expect(ret).assertEqual(1);
      console.info(`${caseName} END`);
      done();
    });

    /**
     * @tc.name testNapiBuffer0005
     * @tc.number SUB_NAPI_BUFFER_0500
     * @tc.desc Test full flow: create buffer → isBuffer → write → verify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testNapiBuffer005';
      console.info(`${caseName} START`);
      let result: number = testNapi.createBufferAndVerify();
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
      done();
    });
  })
}
