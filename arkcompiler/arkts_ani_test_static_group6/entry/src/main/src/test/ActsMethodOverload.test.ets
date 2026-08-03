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

export default function methodOverloadTest():void {

  describe("ActsMethodOverloadTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    it("test_ImplicitOverload_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ImplicitOverload_Int();
      expect(result).assertEqual(1);
    });

    it("test_ImplicitOverload_String", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ImplicitOverload_String();
      expect(result).assertEqual(1);
    });

    it("test_ImplicitOverload_Ambiguous", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ImplicitOverload_Ambiguous();
      expect(result).assertEqual(1);
    });

    it("test_ExplicitOverload_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ExplicitOverload_Int();
      expect(result).assertEqual(1);
    });

    it("test_ExplicitOverload_String", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ExplicitOverload_String();
      expect(result).assertEqual(1);
    });

    it("test_StaticOverload_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_StaticOverload_Int();
      expect(result).assertEqual(1);
    });

    it("test_StaticOverload_String", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_StaticOverload_String();
      expect(result).assertEqual(1);
    });

    it("test_ConstructorOverload_Default", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ConstructorOverload_Default();
      expect(result).assertEqual(1);
    });

    it("test_ConstructorOverload_WithParams", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ConstructorOverload_WithParams();
      expect(result).assertEqual(1);
    });
  })
}
