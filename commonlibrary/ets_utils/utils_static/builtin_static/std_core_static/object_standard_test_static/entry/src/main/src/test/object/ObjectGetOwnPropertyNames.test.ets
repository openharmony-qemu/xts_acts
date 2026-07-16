'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

class GetOwnPropertyNamesPerson {
  name: string = 'Alice';
  age: int = 30;
}

class GetOwnPropertyNamesBase {
  baseField: string = 'base';
}

class GetOwnPropertyNamesDerived extends GetOwnPropertyNamesBase {
  derivedField: string = 'derived';
}

class GetOwnPropertyNamesEmpty {
}

class GetOwnPropertyNamesWithMethod {
  greet(): string {
    return 'hi';
  }
}

class GetOwnPropertyNamesWithPrivate {
  publicProp: string = 'public';
  private privateProp: string = 'private';
}

export default function ObjectGetOwnPropertyNamesTest(): void {
  describe('ObjectGetOwnPropertyNamesTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
    await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0100
     * @tc.name testObjectGetOwnPropertyNames0100
     * @tc.desc Verify getOwnPropertyNames returns own property names for a normal Record in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'name': 'ArkTS', 'year': 2026 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('name');
      expect(names[1]).assertEqual('year');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0200
     * @tc.name testObjectGetOwnPropertyNames0200
     * @tc.desc Verify getOwnPropertyNames returns an empty array for an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyRecord: Record<string, Any> = {} as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(emptyRecord);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0300
     * @tc.name testObjectGetOwnPropertyNames0300
     * @tc.desc Verify getOwnPropertyNames returns the single key for a one-property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'onlyKey': 'value' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('onlyKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0400
     * @tc.name testObjectGetOwnPropertyNames0400
     * @tc.desc Verify getOwnPropertyNames is unaffected by mixed property value types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'str': 'hello',
        'num': 42,
        'flag': true
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('str');
      expect(names[1]).assertEqual('num');
      expect(names[2]).assertEqual('flag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0500
     * @tc.name testObjectGetOwnPropertyNames0500
     * @tc.desc Verify getOwnPropertyNames only returns top-level keys when a property value is a nested Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = { 'inner': 'value' } as Record<string, Any>;
      let record: Record<string, Any> = { 'outer': nested } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('outer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0600
     * @tc.name testObjectGetOwnPropertyNames0600
     * @tc.desc Verify getOwnPropertyNames preserves an empty string property key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { '': 'empty' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0700
     * @tc.name testObjectGetOwnPropertyNames0700
     * @tc.desc Verify getOwnPropertyNames preserves special character keys as defined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'my-key': 1,
        'my key': 2,
        'key.with.dot': 3
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('my-key');
      expect(names[1]).assertEqual('my key');
      expect(names[2]).assertEqual('key.with.dot');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0800
     * @tc.name testObjectGetOwnPropertyNames0800
     * @tc.desc Verify getOwnPropertyNames returns numeric-like property names as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '0': 'zero',
        '123': 'oneTwoThree'
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('0');
      expect(names[1]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_0900
     * @tc.name testObjectGetOwnPropertyNames0900
     * @tc.desc Verify getOwnPropertyNames returns all keys for a larger Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'a0': 0, 'a1': 1, 'a2': 2, 'a3': 3, 'a4': 4,
        'a5': 5, 'a6': 6, 'a7': 7, 'a8': 8, 'a9': 9,
        'a10': 10, 'a11': 11, 'a12': 12
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(13);
      expect(names[0]).assertEqual('a0');
      expect(names[12]).assertEqual('a12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1000
     * @tc.name testObjectGetOwnPropertyNames1000
     * @tc.desc Verify getOwnPropertyNames preserves definition order for non-numeric keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'x': 10, 'y': 20, 'z': 30 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('x');
      expect(names[1]).assertEqual('y');
      expect(names[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1100
     * @tc.name testObjectGetOwnPropertyNames1100
     * @tc.desc Verify getOwnPropertyNames returns string elements in the result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'name': 'ArkTS' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      let elementType: string = Class.of(names[0]).getName();
      expect(names.length).assertEqual(1);
      expect(elementType).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1200
     * @tc.name testObjectGetOwnPropertyNames1200
     * @tc.desc Verify getOwnPropertyNames returns all own property names for the same Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'a': 1,
        'b': 'two',
        'c': true,
        'd': 4.5
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(4);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
      expect(names[2]).assertEqual('c');
      expect(names[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1300
     * @tc.name testObjectGetOwnPropertyNames1300
     * @tc.desc Verify getOwnPropertyNames returns a stable snapshot after the source Record is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      record['c'] = 3;
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1400
     * @tc.name testObjectGetOwnPropertyNames1400
     * @tc.desc Verify getOwnPropertyNames does not include inherited prototype members for a Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'own': 'prop' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      let hasToString: boolean = false;
      let index: int = 0;
      while (index < names.length) {
        if (names[index] === 'toString') {
          hasToString = true;
        }
        index++;
      }
      expect(hasToString).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1500
     * @tc.name testObjectGetOwnPropertyNames1500
     * @tc.desc Verify getOwnPropertyNames returns an empty array for a plain Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1600
     * @tc.name testObjectGetOwnPropertyNames1600
     * @tc.desc Verify getOwnPropertyNames returns public field names for a custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new GetOwnPropertyNamesPerson();
      let names: string[] = Object.getOwnPropertyNames(person);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('name');
      expect(names[1]).assertEqual('age');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1700
     * @tc.name testObjectGetOwnPropertyNames1700
     * @tc.desc Verify getOwnPropertyNames reports public fields while private class fields are not reported in the current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: Object = new GetOwnPropertyNamesWithPrivate();
      let names: string[] = Object.getOwnPropertyNames(instance);
      let hasPublicProp: boolean = false;
      let hasPrivateProp: boolean = false;
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === 'publicProp') {
          hasPublicProp = true;
        }
        if (names[i] === 'privateProp') {
          hasPrivateProp = true;
        }
      }
      expect(hasPublicProp).assertTrue();
      expect(hasPrivateProp).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1800
     * @tc.name testObjectGetOwnPropertyNames1800
     * @tc.desc Verify getOwnPropertyNames reflects key removal on a reconstructed Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      record = { 'b': record['b'] } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_1900
     * @tc.name testObjectGetOwnPropertyNames1900
     * @tc.desc Verify repeated getOwnPropertyNames calls on the same Record return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'x': 1, 'y': 2 } as Record<string, Any>;
      let names1: string[] = Object.getOwnPropertyNames(record);
      let names2: string[] = Object.getOwnPropertyNames(record);
      expect(names1.length).assertEqual(names2.length);
      expect(names1[0]).assertEqual(names2[0]);
      expect(names1[1]).assertEqual(names2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2000
     * @tc.name testObjectGetOwnPropertyNames2000
     * @tc.desc Verify getOwnPropertyNames in a normal try-catch-finally flow reaches the finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted: boolean = false;
      let record: Record<string, Any> = { 'name': 'ArkTS' } as Record<string, Any>;
      try {
        let names: string[] = Object.getOwnPropertyNames(record);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('name');
      } catch (e) {
        expect().assertFail();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2100
     * @tc.name testObjectGetOwnPropertyNames2100
     * @tc.desc nullish 入参边界：null 强转为 Object 后调用 getOwnPropertyNames 抛出 ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.getOwnPropertyNames(null as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2200
     * @tc.name testObjectGetOwnPropertyNames2200
     * @tc.desc nullish 入参边界：undefined 强转为 Object 后调用 getOwnPropertyNames 抛出 ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.getOwnPropertyNames(undefined as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2300
     * @tc.name testObjectGetOwnPropertyNames2300
     * @tc.desc Verify getOwnPropertyNames returns empty array for int literal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = Object.getOwnPropertyNames(42 as Object);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2400
     * @tc.name testObjectGetOwnPropertyNames2400
     * @tc.desc Verify getOwnPropertyNames returns character indexes and length for string literal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = Object.getOwnPropertyNames('str' as Object);
      expect(names.length).assertEqual(4);
      expect(names[0]).assertEqual('0');
      expect(names[3]).assertEqual('length');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2500
     * @tc.name testObjectGetOwnPropertyNames2500
     * @tc.desc Verify getOwnPropertyNames returns empty array for boolean literal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = Object.getOwnPropertyNames(true as Object);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2600
     * @tc.name testObjectGetOwnPropertyNames2600
     * @tc.desc Verify getOwnPropertyNames includes a key added before a later call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      record['b'] = 2;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2700
     * @tc.name testObjectGetOwnPropertyNames2700
     * @tc.desc Verify getOwnPropertyNames length stays consistent with Object.keys Object.values and Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'x': 10, 'y': 20 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(Object.keys(record).length);
      expect(names.length).assertEqual(Object.values(record).length);
      expect(names.length).assertEqual(Object.entries(record).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2800
     * @tc.name testObjectGetOwnPropertyNames2800
     * @tc.desc Verify getOwnPropertyNames includes own keys that share names with common prototype members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'toString': 'own',
        'constructor': 1,
        'hasOwnProperty': false
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('toString');
      expect(names[1]).assertEqual('constructor');
      expect(names[2]).assertEqual('hasOwnProperty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_2900
     * @tc.name testObjectGetOwnPropertyNames2900
     * @tc.desc Verify getOwnPropertyNames on an array returns index names together with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [5, 6];
      let names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('0');
      expect(names[1]).assertEqual('1');
      expect(names[2]).assertEqual('length');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3000
     * @tc.name testObjectGetOwnPropertyNames3000
     * @tc.desc Verify getOwnPropertyNames preserves emoji and zero-width-character keys exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroWidthKey: string = 'a\u200bb';
      let record: Record<string, Any> = {} as Record<string, Any>;
      record['🔑'] = 1;
      record[zeroWidthKey] = 2;
      let names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('🔑');
      expect(names[1]).assertEqual(zeroWidthKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3100
     * @tc.name testObjectGetOwnPropertyNames3100
     * @tc.desc Verify Object-typed Record view returns the same own property names as Record-typed access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'alpha': 1, 'beta': 2 } as Record<string, Any>;
      let obj: Object = record;
      let names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('alpha');
      expect(names[1]).assertEqual('beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3200
     * @tc.name testObjectGetOwnPropertyNames3200
     * @tc.desc Verify getOwnPropertyNames returns all numeric-like and float-like keys for the same Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '0': 'zero',
        '2': 'two',
        '10': 'ten',
        '1.5': 'floatLike'
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(record);
      let hasZero: boolean = false;
      let hasTwo: boolean = false;
      let hasTen: boolean = false;
      let hasFloat: boolean = false;
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === '0') {
          hasZero = true;
        }
        if (names[i] === '2') {
          hasTwo = true;
        }
        if (names[i] === '10') {
          hasTen = true;
        }
        if (names[i] === '1.5') {
          hasFloat = true;
        }
      }
      expect(names.length).assertEqual(4);
      expect(hasZero).assertTrue();
      expect(hasTwo).assertTrue();
      expect(hasTen).assertTrue();
      expect(hasFloat).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3300
     * @tc.name testObjectGetOwnPropertyNames3300
     * @tc.desc Verify Empty Record returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Record<string, Any> = {} as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(empty);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3400
     * @tc.name testObjectGetOwnPropertyNames3400
     * @tc.desc Verify Single property Record returns one name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3500
     * @tc.name testObjectGetOwnPropertyNames3500
     * @tc.desc Verify Two property Record returns names in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 1, 'y': 2 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('x');
      expect(names[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3600
     * @tc.name testObjectGetOwnPropertyNames3600
     * @tc.desc Verify Empty array returns names with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let names: string[] = Object.getOwnPropertyNames(arr);
      let hasLen: boolean = false;
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === 'length') { hasLen = true; }
      }
      expect(hasLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3700
     * @tc.name testObjectGetOwnPropertyNames3700
     * @tc.desc Verify Class instance returns field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new Object();
      let names: string[] = Object.getOwnPropertyNames(person);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3800
     * @tc.name testObjectGetOwnPropertyNames3800
     * @tc.desc Verify Boolean-valued Record returns property names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'flag': true, 'off': false } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_3900
     * @tc.name testObjectGetOwnPropertyNames3900
     * @tc.desc Verify Multiple properties with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 'hello', 'b': 'world' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4000
     * @tc.name testObjectGetOwnPropertyNames4000
     * @tc.desc Verify Result is an array of strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'k': 'v' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(1);
      let firstType: string = Class.of(names[0]).getName();
      expect(firstType).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4100
     * @tc.name testObjectGetOwnPropertyNames4100
     * @tc.desc Verify getOwnPropertyNames on Object.assign result reflects target's own keys after merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tgt: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let src: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(tgt, src);
      let names: string[] = Object.getOwnPropertyNames(tgt);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4200
     * @tc.name testObjectGetOwnPropertyNames4200
     * @tc.desc Verify getOwnPropertyNames length matches Object.keys length for plain Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      let keys: string[] = Object.keys(rec);
      expect(names.length).assertEqual(keys.length);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4300
     * @tc.name testObjectGetOwnPropertyNames4300
     * @tc.desc Verify getOwnPropertyNames length matches Object.entries length for plain Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'p': 'a', 'q': 'b' } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      let entries = Object.entries(rec);
      expect(names.length).assertEqual(entries.length);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4400
     * @tc.name testObjectGetOwnPropertyNames4400
     * @tc.desc Verify getOwnPropertyNames on derived class instance includes both base and derived own fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: GetOwnPropertyNamesDerived = new GetOwnPropertyNamesDerived();
      let names: string[] = Object.getOwnPropertyNames(d);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4500
     * @tc.name testObjectGetOwnPropertyNames4500
     * @tc.desc Verify getOwnPropertyNames on empty custom class returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: GetOwnPropertyNamesEmpty = new GetOwnPropertyNamesEmpty();
      let names: string[] = Object.getOwnPropertyNames(e);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4600
     * @tc.name testObjectGetOwnPropertyNames4600
     * @tc.desc Verify getOwnPropertyNames on class with method lists only own fields not prototype method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: GetOwnPropertyNamesWithMethod = new GetOwnPropertyNamesWithMethod();
      let names: string[] = Object.getOwnPropertyNames(m);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4700
     * @tc.name testObjectGetOwnPropertyNames4700
     * @tc.desc Verify getOwnPropertyNames returns fresh array per call (arrays not same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1 } as Record<string, int>;
      let n1: string[] = Object.getOwnPropertyNames(rec);
      let n2: string[] = Object.getOwnPropertyNames(rec);
      expect(n1.length).assertEqual(n2.length);
      expect(n1 !== n2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4800
     * @tc.name testObjectGetOwnPropertyNames4800
     * @tc.desc Verify getOwnPropertyNames on unicode Chinese keys returns those keys verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '姓名': 1, '年齢': 2 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('姓名');
      expect(names[1]).assertEqual('年齢');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_4900
     * @tc.name testObjectGetOwnPropertyNames4900
     * @tc.desc Verify getOwnPropertyNames on record with dash and underscore keys preserves them exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a-b': 1, 'a_b': 2 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a-b');
      expect(names[1]).assertEqual('a_b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5000
     * @tc.name testObjectGetOwnPropertyNames5000
     * @tc.desc Verify getOwnPropertyNames on empty array returns names including length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let names: string[] = Object.getOwnPropertyNames(arr as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5100
     * @tc.name testObjectGetOwnPropertyNames5100
     * @tc.desc Verify getOwnPropertyNames on three-element int array returns three index strings plus length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let names: string[] = Object.getOwnPropertyNames(arr as Object);
      expect(names.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5200
     * @tc.name testObjectGetOwnPropertyNames5200
     * @tc.desc Verify getOwnPropertyNames on string "ab" returns indexed character keys plus length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ab';
      let names: string[] = Object.getOwnPropertyNames(s as Object);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5300
     * @tc.name testObjectGetOwnPropertyNames5300
     * @tc.desc Verify getOwnPropertyNames on Person instance after field mutation retains field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: GetOwnPropertyNamesPerson = new GetOwnPropertyNamesPerson();
      p.name = 'Bob';
      p.age = 40;
      let names: string[] = Object.getOwnPropertyNames(p);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5400
     * @tc.name testObjectGetOwnPropertyNames5400
     * @tc.desc Verify getOwnPropertyNames on boolean false primitive object view returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = Object.getOwnPropertyNames(false as Object);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5500
     * @tc.name testObjectGetOwnPropertyNames5500
     * @tc.desc Verify getOwnPropertyNames on number zero primitive object view returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = Object.getOwnPropertyNames(0 as Object);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5600
     * @tc.name testObjectGetOwnPropertyNames5600
     * @tc.desc Verify getOwnPropertyNames on record with keys that shadow toString/hasOwnProperty lists those own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'toString': 1, 'hasOwnProperty': 2 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5700
     * @tc.name testObjectGetOwnPropertyNames5700
     * @tc.desc Verify getOwnPropertyNames on record with 10 properties returns 10 names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {
        'a0': 0, 'a1': 1, 'a2': 2, 'a3': 3, 'a4': 4,
        'a5': 5, 'a6': 6, 'a7': 7, 'a8': 8, 'a9': 9
      } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5800
     * @tc.name testObjectGetOwnPropertyNames5800
     * @tc.desc Verify multiple consecutive getOwnPropertyNames calls on same record return same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1 } as Record<string, int>;
      let baseLen: int = Object.getOwnPropertyNames(rec).length;
      for (let i: int = 0; i < 20; i++) {
        expect(Object.getOwnPropertyNames(rec).length).assertEqual(baseLen);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_5900
     * @tc.name testObjectGetOwnPropertyNames5900
     * @tc.desc Verify getOwnPropertyNames on record with numeric string keys in non-numeric order preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '2': 2, '1': 1 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('2');
      expect(names[1]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6000
     * @tc.name testObjectGetOwnPropertyNames6000
     * @tc.desc Verify getOwnPropertyNames returns a mutable array (push does not throw and increases length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1 } as Record<string, int>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      let lenBefore: int = names.length;
      names.push('extra');
      expect(names.length).assertEqual(lenBefore + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6100
     * @tc.name testObjectGetOwnPropertyNames6100
     * @tc.desc Verify getOwnPropertyNames on two equal-shape records produce same-length independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, Any> = { 'k': 1 } as Record<string, Any>;
      let b: Record<string, Any> = { 'k': 1 } as Record<string, Any>;
      let na: string[] = Object.getOwnPropertyNames(a);
      let nb: string[] = Object.getOwnPropertyNames(b);
      expect(na.length).assertEqual(nb.length);
      expect(na !== nb).assertTrue();
      expect(na[0]).assertEqual(nb[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6200
     * @tc.name testObjectGetOwnPropertyNames6200
     * @tc.desc Verify getOwnPropertyNames on record with null and undefined values still lists their keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'n': null as Any, 'u': undefined as Any } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('n');
      expect(names[1]).assertEqual('u');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6300
     * @tc.name testObjectGetOwnPropertyNames6300
     * @tc.desc Verify getOwnPropertyNames on record with BigInt value lists its single key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'b': BigInt(123) } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6400
     * @tc.name testObjectGetOwnPropertyNames6400
     * @tc.desc Verify getOwnPropertyNames on record after adding property via Object.assign includes the new key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let add: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(rec, add);
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GET_OWN_PROPERTY_NAMES_6500
     * @tc.name testObjectGetOwnPropertyNames6500
     * @tc.desc Verify getOwnPropertyNames on single-property record key matches Object.keys[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectGetOwnPropertyNames6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'only': 42 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(rec);
      let keys: string[] = Object.keys(rec);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual(keys[0]);
      expect(names[0]).assertEqual('only');
    });
  });
}
