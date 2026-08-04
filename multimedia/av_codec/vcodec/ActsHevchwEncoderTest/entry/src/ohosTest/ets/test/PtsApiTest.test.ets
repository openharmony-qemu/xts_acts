/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function PtsApiTest() {
  describe('PtsApiTest.ets', () => {
    beforeAll(() => {
      entry.PtsApi_SetUpTestCase();
    })
    beforeEach(() => {

    })
    afterEach(() => {
      entry.PtsApi_TearDown()
    })
    afterAll(() => {

    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00100
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00100", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_001();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00200
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00200", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_002();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00300
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00300", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_003();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00400
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00400", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_004();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00500
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00500", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_005();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_PTS_FUNC_00600
     * @tc.number SUB_VIDEO_HW_ENCODE_PTS_FUNC_00600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_PTS_FUNC_00600", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_PTS_FUNC_006();
      expect(result).assertEqual(0);
      done();
    })
  })
}
