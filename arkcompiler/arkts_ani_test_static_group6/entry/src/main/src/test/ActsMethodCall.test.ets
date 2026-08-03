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

export default function methodCallTest():void {

  describe("ActsMethodCallTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    it("test_CallMethod_Instance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_Instance();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_ReturnInt", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_ReturnInt();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_Static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_Static();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_Override", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_Override();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_SelfReturn", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_SelfReturn();
      expect(result).assertEqual(1);
    });

    it("test_CallMethodByName_Instance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethodByName_Instance();
      expect(result).assertEqual(1);
    });

    it("test_CallMethodByName_Static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethodByName_Static();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_Final", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_Final();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_AbstractViaConcrete", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_AbstractViaConcrete();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_VoidReturn", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_VoidReturn();
      expect(result).assertEqual(1);
    });

    it("test_CallMethod_MultipleParams", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CallMethod_MultipleParams();
      expect(result).assertEqual(1);
    });
  })
}
