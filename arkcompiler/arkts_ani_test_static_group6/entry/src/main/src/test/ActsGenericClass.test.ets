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

export default function genericClassTest():void {

  describe("ActsGenericClassTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    it("test_FindClass_Generic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_Generic();
      expect(result).assertEqual(1);
    });

    it("test_ObjectNew_GenericString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_GenericString();
      expect(result).assertEqual(1);
    });

    it("test_GetField_Generic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Generic();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_GenericReturn", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_GenericReturn();
      expect(result).assertEqual(1);
    });

    it("test_GenericDerived", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GenericDerived();
      expect(result).assertEqual(1);
    });

    it("test_StringBox_Inheritance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_StringBox_Inheritance();
      expect(result).assertEqual(1);
    });

    it("test_GenericPair_TwoParams", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GenericPair_TwoParams();
      expect(result).assertEqual(1);
    });
  })
}
