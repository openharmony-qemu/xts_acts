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
import mod from 'libisoc23_wcstoull_test.so';

export default function isoc23WcstoullTest() {
  describe('ActsIsoc23WcstoullTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0100()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0200()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0300()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0400()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0500()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0600()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstoull0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstoull0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstoull_0700()).assertEqual(0);
      done()
    })
  })
}
