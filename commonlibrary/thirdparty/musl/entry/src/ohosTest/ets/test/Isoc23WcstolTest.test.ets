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
import mod from 'libisoc23_wcstol_test.so';

export default function isoc23WcstolTest() {
  describe('ActsIsoc23WcstolTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0100()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0200()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0300()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0400()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0500()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0600()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0700()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0800()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Wcstol0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Wcstol0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Isoc23Wcstol_0900()).assertEqual(0);
      done()
    })
  })
}
