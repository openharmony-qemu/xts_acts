/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  observeDetachedMathAbs,
  observeDetachedMathPow,
  observeMathAbsDescriptor,
  observeMathAbsFunctionMetadata,
  observeMathConstantReadStability,
  observeMathConstantsAreOwnProperties,
  observeMathConstantTypes,
  observeMathMethodLengths,
  observeMathObjectString,
  observeMathPiDescriptor,
  observeMathPrototypeIdentity,
  observeMathToStringTagDescriptor
} from './math';

export default function mathObjectContractTest(): void {
  describe('MathObjectContractTest', (): void => {
    /**
     * @tc.name testMathObjectContract001
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0100
     * @tc.desc Verify PI exposes the standard constant property descriptor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = observeMathPiDescriptor();
      expect(descriptor.value).assertEqual(Math.PI);
      expect(descriptor.writable).assertFalse();
      expect(descriptor.enumerable).assertFalse();
      expect(descriptor.configurable).assertFalse();
    });

    /**
     * @tc.name testMathObjectContract002
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0200
     * @tc.desc Verify abs exposes the standard method property descriptor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = observeMathAbsDescriptor();
      expect(descriptor.sameFunction).assertTrue();
      expect(descriptor.writable).assertTrue();
      expect(descriptor.enumerable).assertFalse();
      expect(descriptor.configurable).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract003
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0300
     * @tc.desc Verify Symbol toStringTag exposes the standard property descriptor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = observeMathToStringTagDescriptor();
      expect(descriptor.value).assertEqual('Math');
      expect(descriptor.writable).assertFalse();
      expect(descriptor.enumerable).assertFalse();
      expect(descriptor.configurable).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract004
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0400
     * @tc.desc Verify the Math object inherits directly from Object prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: boolean = observeMathPrototypeIdentity();
      expect(observedResult).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract005
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0500
     * @tc.desc Verify Object toString classifies the Math object by its tag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: string = observeMathObjectString();
      expect(observedResult).assertEqual('[object Math]');
    });

    /**
     * @tc.name testMathObjectContract006
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0600
     * @tc.desc Verify all declared Math constants are own properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: boolean = observeMathConstantsAreOwnProperties();
      expect(observedResult).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract007
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0700
     * @tc.desc Verify all declared Math constants have numeric runtime values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: boolean = observeMathConstantTypes();
      expect(observedResult).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract008
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0800
     * @tc.desc Verify repeated reads preserve every declared Math constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: boolean = observeMathConstantReadStability();
      expect(observedResult).assertTrue();
    });

    /**
     * @tc.name testMathObjectContract009
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_0900
     * @tc.desc Verify a detached unary Math method does not require Math as receiver
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeDetachedMathAbs();
      expect(observedResult).assertEqual(13);
    });

    /**
     * @tc.name testMathObjectContract010
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_1000
     * @tc.desc Verify a detached binary Math method does not require Math as receiver
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeDetachedMathPow();
      expect(observedResult).assertEqual(81);
    });

    /**
     * @tc.name testMathObjectContract011
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_1100
     * @tc.desc Verify representative Math functions expose their declared arity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lengths = observeMathMethodLengths();
      expect(lengths.random).assertEqual(0);
      expect(lengths.abs).assertEqual(1);
      expect(lengths.pow).assertEqual(2);
      expect(lengths.max).assertEqual(2);
    });

    /**
     * @tc.name testMathObjectContract012
     * @tc.number SUB_BUILTINS_UTIL_MATH_OBJECT_CONTRACT_1200
     * @tc.desc Verify abs exposes builtin function name and no constructor prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathObjectContract012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const metadata = observeMathAbsFunctionMetadata();
      expect(metadata.name).assertEqual('abs');
      expect(metadata.hasPrototype).assertFalse();
    });
  });
}
