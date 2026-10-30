/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import close_range_test from 'libclose_range_test.so';

export default function closeRangeTest() {
  describe('ActsCloseRangeTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslCloseRange0100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0400
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0500
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0600
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0700
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0800
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslCloseRange0900
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslCloseRange0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = close_range_test.CloseRange_0900();
      expect(data).assertEqual(0);
      done()
    })
  });
}
