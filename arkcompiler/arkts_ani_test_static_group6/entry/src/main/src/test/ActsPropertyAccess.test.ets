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

export default function propertyAccessTest():void {

  describe("ActsPropertyAccessTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    it("test_GetProperty_InterfaceField", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetProperty_InterfaceField();
      expect(result).assertEqual(1);
    });

    it("test_SetProperty_InterfaceField", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetProperty_InterfaceField();
      expect(result).assertEqual(1);
    });

    it("test_GetProperty_InterfaceInt", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetProperty_InterfaceInt();
      expect(result).assertEqual(1);
    });

    it("test_SetProperty_InterfaceInt", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetProperty_InterfaceInt();
      expect(result).assertEqual(1);
    });

    it("test_GetProperty_Accessor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetProperty_Accessor();
      expect(result).assertEqual(1);
    });

    it("test_SetProperty_Accessor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetProperty_Accessor();
      expect(result).assertEqual(1);
    });

    it("test_GetProperty_ReadOnly", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetProperty_ReadOnly();
      expect(result).assertEqual(1);
    });

    it("test_PropertyVsField_Distinction", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_PropertyVsField_Distinction();
      expect(result).assertEqual(1);
    });

    it("test_GetProperty_MultiInterface", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetProperty_MultiInterface();
      expect(result).assertEqual(1);
    });

    it("test_GetStaticProperty_Accessor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetStaticProperty_Accessor();
      expect(result).assertEqual(1);
    });
  })
}
