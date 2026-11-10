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
import mod from 'libstrtol_legacy_test.so';

export default function strtolLegacyTest() {
  describe('ActsStrtolLegacyTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslStrtol0100
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Strtol_0100()).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtol0200
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(mod.Strtol_0200()).assertEqual(0);
      done()
    })
  })
}
