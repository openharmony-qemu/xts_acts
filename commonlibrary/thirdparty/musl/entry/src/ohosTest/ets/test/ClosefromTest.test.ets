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
import closefrom_test from 'libclosefrom_test.so';

export default function closefromTest() {
  describe('ActsClosefromTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslClosefrom0100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom0200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom0300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom0500
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom0600
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom0700
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslClosefrom1000
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_1000
     * @tc.desc   test SUB_THIRDPARTY_MUSL_CLOSEFROM_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslClosefrom1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = closefrom_test.Closefrom_1000();
      expect(data).assertEqual(0);
      done()
    })
  });
}
