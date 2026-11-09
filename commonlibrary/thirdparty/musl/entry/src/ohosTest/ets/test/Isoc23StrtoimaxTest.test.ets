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
import mod from 'libisoc23_strtoimax_test.so';

export default function isoc23StrtoimaxTest() {
  describe('ActsIsoc23StrtoimaxTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtoimax0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtoimax0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtoimax_0700();
      expect(data).assertEqual(0);
      done()
    })
  })
}
