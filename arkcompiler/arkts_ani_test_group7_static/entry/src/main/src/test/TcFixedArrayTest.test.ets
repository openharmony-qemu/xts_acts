'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcFixedArrayTest(): void {
  describe("TcFixedArrayTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0400
     * @tc.name testTcFixedArray0004
     * @tc.desc Verify that FixedArray<string> can be created and accessed with reference APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_FixedArrayString();
      expect(cls.test_CheckFixedArrayString(array)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1300
     * @tc.name testTcFixedArray0013
     * @tc.desc Verify that FixedArray<object> can store different reference objects.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_FixedArrayObjectRefs();
      expect(cls.test_CheckFixedArrayObjectRefs(array)).assertTrue();
    });
  });
}
