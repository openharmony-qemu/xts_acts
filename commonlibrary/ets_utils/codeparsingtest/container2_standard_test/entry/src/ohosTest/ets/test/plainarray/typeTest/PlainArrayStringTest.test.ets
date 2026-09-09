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

import { PlainArray } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
interface StringInvalidObject { marker: string; }
const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };
type StringDynamicItem = string | null | undefined;
const STRING_LONG_VALUE: string = 'a'.repeat(1000);
const VALID_VALUES: Array<StringDynamicItem> = [
  'test', '测试', '', '\u200B', '\u0000', STRING_LONG_VALUE, null, undefined,
];
type StringInvalidValue = number | bigint | StringInvalidObject | Array<string>;
type AllValue = StringDynamicItem | StringInvalidValue;
const ALL_VALUES: Array<AllValue> = [
  ...VALID_VALUES, 123, 0n, STRING_INVALID_OBJECT, [], 'Symbol()',
];
type Value = StringDynamicItem;

export default function PlainArrayStringTest(): void {
  describe('PlainArrayStringTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_STRING_TEST_0100
     * @tc.name      testPlainArrayStringTest0100
     * @tc.desc      Verify PlainArray construction, add, length, key lookup, and empty-state behavior with String values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArrayStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const array: PlainArray<Value> = new PlainArray<Value>();
      expect(array.length).assertEqual(0);
      expect(array.isEmpty()).assertTrue();
      array.add(10, valueA);
      array.add(20, valueB);
      expect(array.length).assertEqual(2);
      expect(array.has(10)).assertTrue();
      expect(array.get(10)).assertEqual(valueA);
      expect(array.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_STRING_TEST_0200
     * @tc.name      testPlainArrayStringTest0200
     * @tc.desc      Verify PlainArray index and value lookup together with clone behavior with String values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArrayStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const array: PlainArray<Value> = new PlainArray<Value>();
      array.add(10, valueA);
      array.add(20, valueB);
      expect(array.getIndexOfKey(20)).assertEqual(1);
      expect(array.getIndexOfValue(valueA)).assertEqual(0);
      expect(array.getKeyAt(0)).assertEqual(10);
      expect(array.getValueAt(1)).assertEqual(valueB);
      const clone: PlainArray<Value> = array.clone();
      expect(clone === array).assertFalse();
      expect(clone.get(10)).assertEqual(valueA);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_STRING_TEST_0300
     * @tc.name      testPlainArrayStringTest0300
     * @tc.desc      Verify PlainArray removal, range removal, value update, and length behavior with String values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArrayStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const array: PlainArray<Value> = new PlainArray<Value>();
      array.add(10, valueA);
      array.add(20, valueB);
      array.add(30, valueC);
      expect(array.remove(20)).assertEqual(valueB);
      expect(array.removeAt(0)).assertEqual(valueA);
      array.add(40, valueC);
      expect(array.removeRangeFrom(0, 1)).assertEqual(1);
      expect(array.length).assertEqual(1);
      array.setValueAt(0, valueA);
      expect(array.getValueAt(0)).assertEqual(valueA);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_STRING_TEST_0400
     * @tc.name      testPlainArrayStringTest0400
     * @tc.desc      Verify PlainArray forEach callback and iterator behavior with String values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArrayStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const array: PlainArray<Value> = new PlainArray<Value>();
      array.add(10, valueA);
      array.add(20, valueB);
      let callbackCount: number = 0;
      let sawKey10: boolean = false;
      let sawKey20: boolean = false;
      let sawContainer: boolean = false;
      array.forEach((value: Value, index?: number, container?: PlainArray<Value>): void => {
        callbackCount++;
        sawKey10 = sawKey10 || index === 10;
        sawKey20 = sawKey20 || index === 20;
        sawContainer = sawContainer || container === array;
        expect(value === undefined).assertFalse();
      });
      expect(callbackCount).assertEqual(2);
      expect(sawKey10).assertTrue();
      expect(sawKey20).assertTrue();
      expect(sawContainer).assertTrue();
      const iterator: IterableIterator<[number, Value]> = array[Symbol.iterator]();
      const entry: [number, Value] = iterator.next().value;
      expect(entry[0]).assertEqual(10);
      expect(entry[1]).assertEqual(valueA);
      expect(iterator.next().done).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_STRING_TEST_0500
     * @tc.name      testPlainArrayStringTest0500
     * @tc.desc      Verify PlainArray dynamic-value access, conversion, and clear behavior with String values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArrayStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicArray: PlainArray<AllValue> = new PlainArray<AllValue>();
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      dynamicArray.add(1, dynamicValue);
      expect(dynamicArray.get(1)).assertEqual(dynamicValue);
      expect(dynamicArray.has(1)).assertTrue();
      expect(dynamicArray.length).assertEqual(1);
      expect(typeof dynamicArray.toString()).assertEqual('string');
      dynamicArray.clear();
      expect(dynamicArray.length).assertEqual(0);
      expect(dynamicArray.isEmpty()).assertTrue();
    });
  });
}
