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

class HasOwnPropertyPerson {
  public name: string = 'Alice';
  public age: int = 30;
}

class HasOwnPropertyBase {
  public baseProp: string = 'base';

  baseMethod(): string {
    return 'baseMethod';
  }
}

class HasOwnPropertyDerived extends HasOwnPropertyBase {
  public derivedProp: string = 'derived';
}


class HasOwnPropertyEmpty {
}

class HasOwnPropertyMulti {
  public a: int = 1;
  public b: string = 'b';
  public c: boolean = true;
}

class HasOwnPropertyWithMethod {
  public greet(): string {
    return 'hi';
  }
}

export default function ObjectHasOwnPropertyTest(): void {
  describe('ObjectHasOwnPropertyTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
    await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testHasOwnProperty0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0100
     * @tc.desc Verify hasOwnProperty returns true for existing numeric array indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(1)).assertTrue();
      expect(arr.hasOwnProperty(arr.length - 1)).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0200
     * @tc.desc Verify hasOwnProperty handles single-element array boundaries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [99];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(arr.length)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0300
     * @tc.desc Verify hasOwnProperty rejects out-of-range and negative array indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      expect(arr.hasOwnProperty(100)).assertFalse();
      expect(arr.hasOwnProperty(999999)).assertFalse();
      expect(arr.hasOwnProperty(-1)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0400
     * @tc.desc Verify hasOwnProperty returns false for numeric lookups on an empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(arr.hasOwnProperty(0)).assertFalse();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0500
     * @tc.desc Verify hasOwnProperty recognizes array own string keys and excludes unrelated keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      expect(arr.hasOwnProperty('length')).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('invalidProp')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0600
     * @tc.desc Verify numeric-like Record keys are readable while hasOwnProperty reports false for existing and unrelated keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '0': 'zero',
        '123': 'numericString',
        '1.5': 'floatLike'
      } as Record<string, Any>;
      expect(record['123'] as string).assertEqual('numericString');
      expect(record['0'] as string).assertEqual('zero');
      expect(record['1.5'] as string).assertEqual('floatLike');
      expect(record.hasOwnProperty(5)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0700
     * @tc.desc Verify Record special-character keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '': 'empty',
        'my-property': 1,
        'my property': 2,
        'hasOwnProperty': 'ownKey'
      } as Record<string, Any>;
      expect(record[''] as string).assertEqual('empty');
      expect(record['my-property'] as int).assertEqual(1);
      expect(record['my property'] as int).assertEqual(2);
      expect(record['hasOwnProperty'] as string).assertEqual('ownKey');
    });

    /**
     * @tc.name testHasOwnProperty0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0800
     * @tc.desc Verify Record index access preserves null and undefined values while missing hasOwnProperty is false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'nullable': null as Any,
        'undef': undefined as Any
      } as Record<string, Any>;
      expect(record['nullable'] as null).assertEqual(null);
      expect(record['undef'] as undefined).assertEqual(undefined);
      expect(record.hasOwnProperty('missing')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0900
     * @tc.desc Verify added Record keys are index-readable while hasOwnProperty still returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      expect(record.hasOwnProperty('newKey')).assertFalse();
      record['newKey'] = 'added';
      expect(record['newKey'] as string).assertEqual('added');
    });

    /**
     * @tc.name testHasOwnProperty1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1000
     * @tc.desc Verify reconstructed Record removes index access for the omitted key and hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'keep': 1,
        'removeMe': 2
      } as Record<string, Any>;
      expect(record['removeMe'] as int).assertEqual(2);
      record = { 'keep': record['keep'] } as Record<string, Any>;
      expect(record.hasOwnProperty('removeMe')).assertFalse();
      expect(record['keep'] as int).assertEqual(1);
    });

    /**
     * @tc.name testHasOwnProperty1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1100
     * @tc.desc Verify hasOwnProperty on a plain Object excludes inherited prototype members
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.hasOwnProperty('toString')).assertFalse();
      expect(obj.hasOwnProperty('constructor')).assertFalse();
      expect(obj.hasOwnProperty('missing')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1200
     * @tc.desc Verify hasOwnProperty finds own public fields on a custom class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new HasOwnPropertyPerson();
      expect(person.hasOwnProperty('name')).assertTrue();
      expect(person.hasOwnProperty('age')).assertTrue();
      expect(person.hasOwnProperty('salary')).assertFalse();
      expect(person.hasOwnProperty('missing')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1300
     * @tc.desc Verify hasOwnProperty on a derived instance distinguishes own fields from prototype methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new HasOwnPropertyDerived();
      expect(target.hasOwnProperty('baseProp')).assertTrue();
      expect(target.hasOwnProperty('derivedProp')).assertTrue();
      expect(target.hasOwnProperty('baseMethod')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1400
     * @tc.desc Verify hasOwnProperty on a string primitive reports in-range indexes and rejects out-of-range indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      expect(str.hasOwnProperty(0)).assertTrue();
      expect(str.hasOwnProperty(4)).assertTrue();
      expect(str.hasOwnProperty(5)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1500
     * @tc.desc Verify nested Record values remain index-readable while nested inner keys are not reported
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = { 'inner': 'value' } as Record<string, Any>;
      let record: Record<string, Any> = { 'nested': nested } as Record<string, Any>;
      expect(record['nested'] as Object).assertEqual(nested as Object);
      expect(record.hasOwnProperty('inner')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1600
     * @tc.desc Verify hasOwnProperty is consistent with Object.keys and Object.getOwnPropertyNames on arrays
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      let keys: string[] = Object.keys(arr);
      let names: string[] = Object.getOwnPropertyNames(arr);
      expect(keys.length).assertEqual(2);
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('1')).assertTrue();
      expect(arr.hasOwnProperty('length')).assertTrue();
      expect(names.length >= keys.length).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1700
     * @tc.desc Verify repeated hasOwnProperty checks remain stable for arrays, Record keys, and missing keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      let record: Record<string, Any> = { 'key': 'value' } as Record<string, Any>;
      let arrFirst: boolean = arr.hasOwnProperty(0);
      let arrSecond: boolean = arr.hasOwnProperty(0);
      let recFirst: boolean = record.hasOwnProperty('key');
      let recSecond: boolean = record.hasOwnProperty('key');
      let missFirst: boolean = record.hasOwnProperty('missing');
      let missSecond: boolean = record.hasOwnProperty('missing');
      expect(arrFirst).assertEqual(arrSecond);
      expect(recFirst).assertEqual(recSecond);
      expect(missFirst).assertEqual(missSecond);
      expect(arrFirst).assertTrue();
      expect(missFirst).assertFalse();
      expect(record['key'] as string).assertEqual('value');
    });

    /**
     * @tc.name testHasOwnProperty1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1800
     * @tc.desc Verify hasOwnProperty on a string primitive recognizes own length and excludes prototype methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hi';
      expect(str.hasOwnProperty('length')).assertTrue();
      expect(str.hasOwnProperty('toString')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1900
     * @tc.desc Verify Record direct access and missing-key hasOwnProperty result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'custom': 1 } as Record<string, Any>;
      expect(record['custom'] as int).assertEqual(1);
      expect(record.hasOwnProperty('missing')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2000
     * @tc.desc Verify hasOwnProperty on arrays excludes inherited prototype methods while preserving own element keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty('map')).assertFalse();
      expect(arr.hasOwnProperty('2')).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2100
     * @tc.desc Verify prototype-named Record keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'toString': 'ownToString',
        'constructor': 'ownConstructor'
      } as Record<string, Any>;
      expect(record['toString'] as string).assertEqual('ownToString');
      expect(record['constructor'] as string).assertEqual('ownConstructor');
    });

    /**
     * @tc.name testHasOwnProperty2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2200
     * @tc.desc Verify Unicode and zero-width Record keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '\u6C49\u5B57': 1,
        'zero\u200Bwidth': 2
      } as Record<string, Any>;
      expect(record['\u6C49\u5B57'] as int).assertEqual(1);
      expect(record['zero\u200Bwidth'] as int).assertEqual(2);
      expect(record.hasOwnProperty('zerowidth')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2300
     * @tc.desc Verify array own-property checks stay correct after an array is viewed through Object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [5, 6];
      let obj: Object = arr;
      expect(obj.hasOwnProperty('length')).assertTrue();
      expect(obj.hasOwnProperty('0')).assertTrue();
      expect(obj.hasOwnProperty('push')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2400
     * @tc.desc Verify an empty string primitive still has own length while lacking element indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = '';
      expect(empty.hasOwnProperty('length')).assertTrue();
      expect(empty.hasOwnProperty(0)).assertFalse();
      expect(empty.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2500
     * @tc.desc Verify negative zero is treated as the same own array index as zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [7];
      expect(arr.hasOwnProperty(-0.0)).assertTrue();
      expect(arr.hasOwnProperty(0)).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2600
     * @tc.desc Verify integer-like Record keys are index-readable while unrelated float hasOwnProperty is false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '2': 'two',
        '2.5': 'twoPointFive'
      } as Record<string, Any>;
      expect(record['2'] as string).assertEqual('two');
      expect(record['2.5'] as string).assertEqual('twoPointFive');
      expect(record.hasOwnProperty(3.0)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2700
     * @tc.desc Verify string primitives support string-form indexes in addition to numeric indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testHasOwnProperty2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      expect(str.hasOwnProperty('0')).assertTrue();
      expect(str.hasOwnProperty('2')).assertTrue();
      expect(str.hasOwnProperty('3')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2800
     * @tc.name testHasOwnProperty2800
     * @tc.desc Verify Empty Record returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Record<string, Any> = {} as Record<string, Any>;
      expect(empty.hasOwnProperty('a')).assertFalse();
      expect(empty.hasOwnProperty('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2900
     * @tc.name testHasOwnProperty2900
     * @tc.desc Verify Single property record hasOwnProperty returns false for existing keys in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'key': 'val' } as Record<string, Any>;
      expect(rec['key'] as string).assertEqual('val');
      expect(rec.hasOwnProperty('other')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3000
     * @tc.name testHasOwnProperty3000
     * @tc.desc Verify Array length is own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty('length')).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('3')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3100
     * @tc.name testHasOwnProperty3100
     * @tc.desc Verify Class instance fields are own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: HasOwnPropertyPerson = new HasOwnPropertyPerson();
      expect(person.hasOwnProperty('name')).assertTrue();
      expect(person.hasOwnProperty('age')).assertTrue();
      expect(person.hasOwnProperty('missing')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3200
     * @tc.name testHasOwnProperty3200
     * @tc.desc Verify Object.assign result keys via hasOwnProperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'a': 1 } as Record<string, Any>);
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3300
     * @tc.name testHasOwnProperty3300
     * @tc.desc Verify Negative array index returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x'];
      expect(arr.hasOwnProperty(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3400
     * @tc.name testHasOwnProperty3400
     * @tc.desc Verify hasOwnProperty on empty class instance returns false for arbitrary keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new HasOwnPropertyEmpty();
      expect(e.hasOwnProperty('any')).assertFalse();
      expect(e.hasOwnProperty('toString')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3500
     * @tc.name testHasOwnProperty3500
     * @tc.desc Verify hasOwnProperty on multi-field class returns true for all declared public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Object = new HasOwnPropertyMulti();
      expect(m.hasOwnProperty('a')).assertTrue();
      expect(m.hasOwnProperty('b')).assertTrue();
      expect(m.hasOwnProperty('c')).assertTrue();
      expect(m.hasOwnProperty('d')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3600
     * @tc.name testHasOwnProperty3600
     * @tc.desc Verify hasOwnProperty returns false for a method on a class (method lives on prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w: Object = new HasOwnPropertyWithMethod();
      expect(w.hasOwnProperty('greet')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3700
     * @tc.name testHasOwnProperty3700
     * @tc.desc Verify class fields remain own after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: HasOwnPropertyPerson = new HasOwnPropertyPerson();
      p.name = 'Bob';
      p.age = 40;
      expect(p.hasOwnProperty('name')).assertTrue();
      expect(p.hasOwnProperty('age')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3800
     * @tc.name testHasOwnProperty3800
     * @tc.desc Verify hasOwnProperty returns true for length on a non-empty array and false for push method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty('length')).assertTrue();
      expect(arr.hasOwnProperty('push')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3900
     * @tc.name testHasOwnProperty3900
     * @tc.desc Verify hasOwnProperty returns true for index 0 on a single-element boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4000
     * @tc.name testHasOwnProperty4000
     * @tc.desc Verify hasOwnProperty is stable across repeated calls with the same key and target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      for (let i: int = 0; i < 10; i++) {
        expect(arr.hasOwnProperty(0)).assertTrue();
        expect(arr.hasOwnProperty(9)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4100
     * @tc.name testHasOwnProperty4100
     * @tc.desc Verify hasOwnProperty on fresh plain Object returns false for any key including constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.hasOwnProperty('a')).assertFalse();
      expect(obj.hasOwnProperty('constructor')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4200
     * @tc.name testHasOwnProperty4200
     * @tc.desc Verify hasOwnProperty returns false for arbitrary key on an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = {} as Record<string, int>;
      expect(rec.hasOwnProperty('x')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4300
     * @tc.name testHasOwnProperty4300
     * @tc.desc Verify hasOwnProperty returns false for existing Record keys (current runtime Record bug) after value mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'k': 1 } as Record<string, int>;
      rec['k'] = 2;
      expect(rec['k']).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4400
     * @tc.name testHasOwnProperty4400
     * @tc.desc Verify hasOwnProperty returns false for toString/constructor shadow keys on a Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'toString': 1 } as Record<string, int>;
      expect(rec['toString'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4500
     * @tc.name testHasOwnProperty4500
     * @tc.desc Verify empty array only reports length as own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(arr.hasOwnProperty('length')).assertTrue();
      expect(arr.hasOwnProperty(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4600
     * @tc.name testHasOwnProperty4600
     * @tc.desc Verify boolean true/false primitive object view does not expose own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Object = true as Object;
      let f: Object = false as Object;
      expect(t.hasOwnProperty('toString')).assertFalse();
      expect(f.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4700
     * @tc.name testHasOwnProperty4700
     * @tc.desc Verify number primitive object view does not expose own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Object = 42 as Object;
      expect(n.hasOwnProperty('toString')).assertFalse();
      expect(n.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4800
     * @tc.name testHasOwnProperty4800
     * @tc.desc Verify string primitive reports length and character indexes as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = 'xy' as Object;
      expect(s.hasOwnProperty('length')).assertTrue();
      expect(s.hasOwnProperty('0')).assertTrue();
      expect(s.hasOwnProperty('1')).assertTrue();
      expect(s.hasOwnProperty('2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4900
     * @tc.name testHasOwnProperty4900
     * @tc.desc Verify empty string only reports length as own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = '' as Object;
      expect(s.hasOwnProperty('length')).assertTrue();
      expect(s.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5000
     * @tc.name testHasOwnProperty5000
     * @tc.desc nullish 入参边界：null 强转为 Object 后调用 hasOwnProperty 抛出 ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = '';
      try {
        (null as Object).hasOwnProperty('k');
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5100
     * @tc.name testHasOwnProperty5100
     * @tc.desc nullish 入参边界：undefined 强转为 Object 后调用 hasOwnProperty 抛出 ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = '';
      try {
        (undefined as Object).hasOwnProperty('k');
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5200
     * @tc.name testHasOwnProperty5200
     * @tc.desc Verify multi-element string array recognizes all in-range indexes as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b', 'c', 'd'];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(3)).assertTrue();
      expect(arr.hasOwnProperty(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5300
     * @tc.name testHasOwnProperty5300
     * @tc.desc Verify base class instance does not expose derived field as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Object = new HasOwnPropertyBase();
      expect(b.hasOwnProperty('baseProp')).assertTrue();
      expect(b.hasOwnProperty('derivedProp')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5400
     * @tc.name testHasOwnProperty5400
     * @tc.desc Verify keys produced by Object.keys on a class instance are all reported as own by hasOwnProperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      let keys: string[] = Object.keys(p);
      for (let i: int = 0; i < keys.length; i++) {
        expect(p.hasOwnProperty(keys[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5500
     * @tc.name testHasOwnProperty5500
     * @tc.desc Verify hasOwnProperty returns boolean primitive for both own and non-own cases on a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      let own: boolean = p.hasOwnProperty('name');
      let miss: boolean = p.hasOwnProperty('xxx');
      expect(own).assertTrue();
      expect(miss).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5600
     * @tc.name testHasOwnProperty5600
     * @tc.desc Verify string-formed numeric index "0" works the same as number 0 for arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('1')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5700
     * @tc.name testHasOwnProperty5700
     * @tc.desc Verify hasOwnProperty on Person class instance returns false for toString and constructor inherited members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      expect(p.hasOwnProperty('toString')).assertFalse();
      expect(p.hasOwnProperty('constructor')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5800
     * @tc.name testHasOwnProperty5800
     * @tc.desc Verify string-formed numeric index "0" works the same as number 0 for arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5900
     * @tc.name testHasOwnProperty5900
     * @tc.desc Verify array keys returned by Object.keys are all own properties, and length is also own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHasOwnProperty5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let keys: string[] = Object.keys(arr);
      for (let i: int = 0; i < keys.length; i++) {
        expect(arr.hasOwnProperty(keys[i])).assertTrue();
      }
      expect(arr.hasOwnProperty('length')).assertTrue();
    });
  });
}
