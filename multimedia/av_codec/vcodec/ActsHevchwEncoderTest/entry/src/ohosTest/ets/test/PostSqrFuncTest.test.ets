/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function PostSqrFuncTest() {
  describe('PostSqrFuncTest', () => {
    beforeAll(() => {
      entry.PostSqr_SetUpTestCase();
    })
    beforeEach(() => {
      
    })
    afterEach(() => {
      entry.PostSqr_TearDown();
    })
    afterAll(() => {

    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00100
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00100", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_001();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00200
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00200", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_002();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00300
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00300", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_003();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00400
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00400", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_004();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00500
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00500", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_005();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00600
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00600", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_006();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00700
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00700", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_007();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00800
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00800", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_008();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_FUNC_SQR_00900
     * @tc.number SUB_VIDEO_HW_ENCODE_FUNC_SQR_00900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_VIDEO_HW_ENCODE_FUNC_SQR_00900", Level.LEVEL2, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_FUNC_SQR_009();
      expect(result).assertEqual(0);
      done();
    })
  })
}
