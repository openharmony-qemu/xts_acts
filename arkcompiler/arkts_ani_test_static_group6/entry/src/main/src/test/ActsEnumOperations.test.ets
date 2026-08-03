'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Foo } from '../ets/Index'

export default function enumOperationsTest():void {

  describe("ActsEnumOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    it("test_FindEnum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindEnum();
      expect(result).assertEqual(1);
    });

    it("test_GetEnumItemByName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetEnumItemByName();
      expect(result).assertEqual(1);
    });

    it("test_EnumItemGetValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_EnumItemGetValue();
      expect(result).assertEqual(1);
    });

    it("test_EnumItemGetName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_EnumItemGetName();
      expect(result).assertEqual(1);
    });

    it("test_EnumFieldAccess", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_EnumFieldAccess();
      expect(result).assertEqual(1);
    });
  })
}
