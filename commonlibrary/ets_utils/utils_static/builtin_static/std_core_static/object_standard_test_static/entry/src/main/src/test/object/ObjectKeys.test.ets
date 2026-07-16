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

class KeysMyObj {
  x: int = 10;
  y: int = 20;
}

class KeysSingleProp {
  onlyOne: string = 'value';
}

class KeysNoProps {
  constructor() {
  }
}

class KeysPerson {
  name: string = 'Alice';
  age: int = 30;
  city: string = 'Beijing';
}

class KeysTwoProps {
  first: string = 'one';
  second: string = 'two';
}

class KeysEmptyClass {}

class KeysCalculator {
  result: int = 0;
  factor: int = 2;

  multiply(): int {
    return this.result * this.factor;
  }
}

class KeysOnePropOneMethod {
  count: int = 10;

  increment(): int {
    return this.count + 1;
  }
}

class KeysAllMethods {
  doSomething(): string {
    return 'done';
  }
}

class KeysBaseFields {
  baseField: string = 'base';

  baseMethod(): string {
    return 'baseMethod';
  }
}

class KeysDerivedFields extends KeysBaseFields {
  derivedField: string = 'derived';
}


class KeysEmptyMethod {
  greet(): string {
    return 'hi';
  }
}

export default function ObjectKeysTest(): void {
  describe('ObjectKeysTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectKeys0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0100
     * @tc.desc Verify Object.keys with Record containing multiple value types for normal property name enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'strVal': 'hello',
        'numVal': 42,
        'boolVal': true,
        'objVal': new Object(),
        'arrVal': [1, 2, 3]
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('strVal');
      expect(keys[1]).assertEqual('numVal');
      expect(keys[2]).assertEqual('boolVal');
      expect(keys[3]).assertEqual('objVal');
      expect(keys[4]).assertEqual('arrVal');
    });

    /**
     * @tc.name testObjectKeys0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0200
     * @tc.desc Verify Object.keys with two-property Record for property name enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let twoPropRecord: Record<string, Any> = {
        'first': 100,
        'second': 200
      } as Record<string, Any>;
      let twoKeys: string[] = Object.keys(twoPropRecord);
      expect(twoKeys.length).assertEqual(2);
      expect(twoKeys[0]).assertEqual('first');
      expect(twoKeys[1]).assertEqual('second');
    });

    /**
     * @tc.name testObjectKeys0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0300
     * @tc.desc Verify Object.keys return elements are string type via Class.of on multi-value Record keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'strVal': 'hello',
        'numVal': 42,
        'boolVal': true,
        'objVal': new Object(),
        'arrVal': [1, 2, 3]
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      for (let i: int = 0; i < keys.length; i++) {
        let elemType: string = Class.of(keys[i]).getName();
        expect(elemType).assertEqual('std.core.String');
      }
    });

    /**
     * @tc.name testObjectKeys0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0400
     * @tc.desc Verify Object.keys with KeysMyObj class instance for property name enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new KeysMyObj();
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
    });

    /**
     * @tc.name testObjectKeys0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0500
     * @tc.desc Verify Object.keys with KeysSingleProp class instance for single property name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleObj: Object = new KeysSingleProp();
      let singleKeys: string[] = Object.keys(singleObj);
      expect(singleKeys.length).assertEqual(1);
      expect(singleKeys[0]).assertEqual('onlyOne');
    });

    /**
     * @tc.name testObjectKeys0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0600
     * @tc.desc Verify Object.keys with KeysNoProps class instance returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let noPropsObj: Object = new KeysNoProps();
      let noKeys: string[] = Object.keys(noPropsObj);
      expect(noKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0700
     * @tc.desc Verify Object.keys with empty Record for empty array return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyRecord: Record<string, Any> = {} as Record<string, Any>;
      let keys: string[] = Object.keys(emptyRecord);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0800
     * @tc.desc Verify Object.keys with single numeric-value property Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'onlyKey': 42 } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('onlyKey');
    });

    /**
     * @tc.name testObjectKeys0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_0900
     * @tc.desc Verify Object.keys with single string-value property Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strRecord: Record<string, Any> = { 'singleStr': 'text' } as Record<string, Any>;
      let strKeys: string[] = Object.keys(strRecord);
      expect(strKeys.length).assertEqual(1);
      expect(strKeys[0]).assertEqual('singleStr');
    });

    /**
     * @tc.name testObjectKeys1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1000
     * @tc.desc Verify Object.keys with single boolean-value property Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleRec: Record<string, Any> = { 'only': true } as Record<string, Any>;
      let singleKeys: string[] = Object.keys(singleRec);
      expect(singleKeys.length).assertEqual(1);
      expect(singleKeys[0]).assertEqual('only');
    });

    /**
     * @tc.name testObjectKeys1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1100
     * @tc.desc Verify Object.keys with Record containing null value among mixed properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'a': 1,
        'b': null,
        'c': 'text'
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.name testObjectKeys1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1200
     * @tc.desc Verify Object.keys with Record containing only null-valued property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullOnlyRec: Record<string, Any> = { 'nullKey': null } as Record<string, Any>;
      let nullOnlyKeys: string[] = Object.keys(nullOnlyRec);
      expect(nullOnlyKeys.length).assertEqual(1);
      expect(nullOnlyKeys[0]).assertEqual('nullKey');
    });

    /**
     * @tc.name testObjectKeys1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1300
     * @tc.desc Verify Object.keys with Record containing null and numeric properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixedRec: Record<string, Any> = {
        'nullVal': null,
        'numVal': 0
      } as Record<string, Any>;
      let mixedKeys: string[] = Object.keys(mixedRec);
      expect(mixedKeys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectKeys1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1400
     * @tc.desc Verify Object.keys with Record containing undefined value among mixed properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'x': 10,
        'y': undefined,
        'z': 30
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
      expect(keys[2]).assertEqual('z');
    });

    /**
     * @tc.name testObjectKeys1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1500
     * @tc.desc Verify Object.keys with Record containing only undefined-valued property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let undefinedOnlyRec: Record<string, Any> = { 'undefKey': undefined } as Record<string, Any>;
      let undefinedOnlyKeys: string[] = Object.keys(undefinedOnlyRec);
      expect(undefinedOnlyKeys.length).assertEqual(1);
      expect(undefinedOnlyKeys[0]).assertEqual('undefKey');
    });

    /**
     * @tc.name testObjectKeys1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1600
     * @tc.desc Verify Object.keys with Record containing undefined and null properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let undefWithNullRec: Record<string, Any> = {
        'undef': undefined,
        'nil': null
      } as Record<string, Any>;
      let undefWithNullKeys: string[] = Object.keys(undefWithNullRec);
      expect(undefWithNullKeys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectKeys1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1700
     * @tc.desc Verify Object.keys with empty Object instance for empty array return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1800
     * @tc.desc Verify Object.keys with KeysPerson class instance for all property names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new KeysPerson();
      let keys: string[] = Object.keys(person);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('name');
      expect(keys[1]).assertEqual('age');
      expect(keys[2]).assertEqual('city');
    });

    /**
     * @tc.name testObjectKeys1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_1900
     * @tc.desc Verify Object.keys with KeysTwoProps class instance for property names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let twoObj: Object = new KeysTwoProps();
      let twoKeys: string[] = Object.keys(twoObj);
      expect(twoKeys.length).assertEqual(2);
      expect(twoKeys[0]).assertEqual('first');
      expect(twoKeys[1]).assertEqual('second');
    });

    /**
     * @tc.name testObjectKeys2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2000
     * @tc.desc Verify Object.keys with KeysEmptyClass instance returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyObj: Object = new KeysEmptyClass();
      let emptyKeys: string[] = Object.keys(emptyObj);
      expect(emptyKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2100
     * @tc.desc Verify Object.keys with multi-element number array returns index strings
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [100, 200, 300];
      let keys: string[] = Object.keys(arr);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(keys[2]).assertEqual('2');
    });

    /**
     * @tc.name testObjectKeys2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2200
     * @tc.desc Verify Object.keys with single-element number and int arrays returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleArr: int[] = [42];
      let singleKeys: string[] = Object.keys(singleArr);
      expect(singleKeys.length).assertEqual(1);
      expect(singleKeys[0]).assertEqual('0');
      let intArr: int[] = [42];
      let intKeys: string[] = Object.keys(intArr);
      expect(intKeys.length).assertEqual(1);
      expect(intKeys[0]).assertEqual('0');
    });

    /**
     * @tc.name testObjectKeys2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2300
     * @tc.desc Verify Object.keys with empty string array returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strEmptyArr: string[] = [];
      let strKeys: string[] = Object.keys(strEmptyArr);
      expect(strKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2400
     * @tc.desc Verify Object.keys with KeysCalculator excludes method names from result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Object = new KeysCalculator();
      let keys: string[] = Object.keys(calc);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('result');
      expect(keys[1]).assertEqual('factor');
    });

    /**
     * @tc.name testObjectKeys2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2500
     * @tc.desc Verify Object.keys with KeysOnePropOneMethod returns only field name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleObj: Object = new KeysOnePropOneMethod();
      let singleKeys: string[] = Object.keys(singleObj);
      expect(singleKeys.length).assertEqual(1);
      expect(singleKeys[0]).assertEqual('count');
    });

    /**
     * @tc.name testObjectKeys2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2600
     * @tc.desc Verify Object.keys with KeysAllMethods class returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allMethodsObj: Object = new KeysAllMethods();
      let methodKeys: string[] = Object.keys(allMethodsObj);
      expect(methodKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2700
     * @tc.desc Verify Object.keys return element type is string via Class.of on two-key Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'a': 1,
        'b': 2
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(2);
      let elementType: string = Class.of(keys[0]).getName();
      expect(elementType).assertEqual('std.core.String');
    });

    /**
     * @tc.name testObjectKeys2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2800
     * @tc.desc Verify Object.keys return element type is string via Class.of on single-key Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleRec: Record<string, Any> = { 'single': 'value' } as Record<string, Any>;
      let singleKeys: string[] = Object.keys(singleRec);
      expect(singleKeys.length).assertEqual(1);
      let singleElementType: string = Class.of(singleKeys[0]).getName();
      expect(singleElementType).assertEqual('std.core.String');
    });

    /**
     * @tc.name testObjectKeys2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_2900
     * @tc.desc Verify Object.keys return array contains all three property names by traversal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'alpha': 1,
        'beta': 2,
        'gamma': 3
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      let foundAlpha: boolean = false;
      let foundBeta: boolean = false;
      let foundGamma: boolean = false;
      let maxIter: int = keys.length;
      let idx: int = 0;
      while (idx < maxIter) {
        if (keys[idx] === 'alpha') {
          foundAlpha = true;
        }
        if (keys[idx] === 'beta') {
          foundBeta = true;
        }
        if (keys[idx] === 'gamma') {
          foundGamma = true;
        }
        idx++;
      }
      expect(foundAlpha).assertTrue();
      expect(foundBeta).assertTrue();
      expect(foundGamma).assertTrue();
    });

    /**
     * @tc.name testObjectKeys3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3000
     * @tc.desc Verify Object.keys return array contains two property names by traversal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let twoPropRec: Record<string, Any> = {
        'x': 10,
        'y': 20
      } as Record<string, Any>;
      let twoKeys: string[] = Object.keys(twoPropRec);
      expect(twoKeys.length).assertEqual(2);
      let foundX: boolean = false;
      let foundY: boolean = false;
      let twoIdx: int = 0;
      while (twoIdx < twoKeys.length) {
        if (twoKeys[twoIdx] === 'x') {
          foundX = true;
        }
        if (twoKeys[twoIdx] === 'y') {
          foundY = true;
        }
        twoIdx++;
      }
      expect(foundX).assertTrue();
      expect(foundY).assertTrue();
    });

    /**
     * @tc.name testObjectKeys3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3100
     * @tc.desc Verify Object.keys return length equals four enumerable own properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'p1': 1,
        'p2': 2,
        'p3': 3,
        'p4': 4
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(4);
    });

    /**
     * @tc.name testObjectKeys3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3200
     * @tc.desc Verify Object.keys return length equals two enumerable own properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let twoPropRec: Record<string, Any> = {
        'a': 1,
        'b': 2
      } as Record<string, Any>;
      let twoKeys: string[] = Object.keys(twoPropRec);
      expect(twoKeys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectKeys3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3300
     * @tc.desc Verify Object.keys return order follows three-property definition order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'first': 1,
        'second': 2,
        'third': 3
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
    });

    /**
     * @tc.name testObjectKeys3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3400
     * @tc.desc Verify Object.keys return order follows two-property definition order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let twoPropRec: Record<string, Any> = {
        'alpha': 10,
        'beta': 20
      } as Record<string, Any>;
      let twoKeys: string[] = Object.keys(twoPropRec);
      expect(twoKeys.length).assertEqual(2);
      expect(twoKeys[0]).assertEqual('alpha');
      expect(twoKeys[1]).assertEqual('beta');
    });

    /**
     * @tc.name testObjectKeys3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3500
     * @tc.desc Verify Object.keys with numeric-value Record for property name enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'count': 100,
        'total': 200
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('count');
      expect(keys[1]).assertEqual('total');
    });

    /**
     * @tc.name testObjectKeys3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3600
     * @tc.desc Verify Object.keys with string-value Record for property name enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strRecord: Record<string, Any> = {
        'key1': 'value1',
        'key2': 'value2'
      } as Record<string, Any>;
      let strKeys: string[] = Object.keys(strRecord);
      expect(strKeys.length).assertEqual(2);
      expect(strKeys[0]).assertEqual('key1');
      expect(strKeys[1]).assertEqual('key2');
    });

    /**
     * @tc.name testObjectKeys3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3700
     * @tc.desc Verify Object.keys preserves empty-string and representative special-character keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '': 'empty',
        'my-key': 1,
        'my key': 2,
        'key.with.dot': 3
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('');
      expect(keys[1]).assertEqual('my-key');
      expect(keys[2]).assertEqual('my key');
      expect(keys[3]).assertEqual('key.with.dot');
    });

    /**
     * @tc.name testObjectKeys3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3800
     * @tc.desc Verify Object.keys preserves Unicode and zero-width character keys exactly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '汉字': 1,
        'emoji😊': 2,
        'zero​width': 3
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('汉字');
      expect(keys[1]).assertEqual('emoji😊');
      expect(keys[2]).assertEqual('zero​width');
    });

    /**
     * @tc.name testObjectKeys3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_3900
     * @tc.desc Verify Object.keys includes own keys whose names match prototype members
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'toString': 'ownToString',
        'constructor': 'ownConstructor',
        'hasOwnProperty': 'ownHasOwnProperty'
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('toString');
      expect(keys[1]).assertEqual('constructor');
      expect(keys[2]).assertEqual('hasOwnProperty');
    });

    /**
     * @tc.name testObjectKeys4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4000
     * @tc.desc Verify Object.keys returns numeric-like Record keys as strings without dropping any key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '10': 'ten',
        '2': 'two',
        '0': 'zero',
        '1.5': 'floatLike'
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(4);
      expect(keys.indexOf('0') >= 0).assertTrue();
      expect(keys.indexOf('2') >= 0).assertTrue();
      expect(keys.indexOf('10') >= 0).assertTrue();
      expect(keys.indexOf('1.5') >= 0).assertTrue();
    });

    /**
     * @tc.name testObjectKeys4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4100
     * @tc.desc Verify Object.keys only returns top-level keys when a Record contains nested objects
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = { 'inner': 'value' } as Record<string, Any>;
      let record: Record<string, Any> = {
        'outer': nested,
        'flag': true
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('outer');
      expect(keys[1]).assertEqual('flag');
      expect(keys.indexOf('inner')).assertEqual(-1);
    });

    /**
     * @tc.name testObjectKeys4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4200
     * @tc.desc Verify Object.keys snapshots are stable while later calls reflect newly added properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'a': 1,
        'b': 2
      } as Record<string, Any>;
      let keysBefore: string[] = Object.keys(record);
      record['c'] = 3;
      let keysAfter: string[] = Object.keys(record);
      expect(keysBefore.length).assertEqual(2);
      expect(keysBefore[0]).assertEqual('a');
      expect(keysBefore[1]).assertEqual('b');
      expect(keysAfter.length).assertEqual(3);
      expect(keysAfter[2]).assertEqual('c');
    });

    /**
     * @tc.name testObjectKeys4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4300
     * @tc.desc Verify Object.keys reflects key removal on a reconstructed Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'keep': 1,
        'removeMe': 2
      } as Record<string, Any>;
      record = { 'keep': record['keep'] } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('keep');
    });

    /**
     * @tc.name testObjectKeys4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4400
     * @tc.desc Verify Object.keys on Object typed Record preserves dynamically assigned own keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      record['x'] = 10;
      record['y'] = 20;
      let obj: Object = record;
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
    });

    /**
     * @tc.name testObjectKeys4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4500
     * @tc.desc Verify Object.keys excludes inherited prototype member names when they are not own Record keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'ownA': 1,
        'ownB': 2
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('ownA');
      expect(keys[1]).assertEqual('ownB');
      expect(keys.indexOf('toString')).assertEqual(-1);
      expect(keys.indexOf('valueOf')).assertEqual(-1);
    });

    /**
     * @tc.name testObjectKeys4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4600
     * @tc.desc Verify Object.keys on a derived class instance returns own fields from base and derived classes but not methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new KeysDerivedFields();
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('baseField');
      expect(keys[1]).assertEqual('derivedField');
    });

    /**
     * @tc.name testObjectKeys4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4700
     * @tc.desc Verify Object.keys length stays consistent with Object.values and Object.entries on the same Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'x': 10,
        'y': true,
        'z': 'text',
        'w': null
      } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(Object.values(record).length);
      expect(keys.length).assertEqual(Object.entries(record).length);
      expect(keys.length).assertEqual(Object.keys(record).length);
    });

    /**
     * @tc.name testObjectKeys4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4800
     * @tc.desc Verify repeated Object.keys calls on the same target return stable results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        'first': 1,
        'second': 2
      } as Record<string, Any>;
      let keys1: string[] = Object.keys(record);
      let keys2: string[] = Object.keys(record);
      expect(keys1.length).assertEqual(keys2.length);
      expect(keys1[0]).assertEqual(keys2[0]);
      expect(keys1[1]).assertEqual(keys2[1]);
    });

    /**
     * @tc.name testObjectKeys4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_4900
     * @tc.desc Verify Object.keys on an array viewed as Object returns only enumerable index keys without length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [5, 6, 7];
      let obj: Object = arr;
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(keys[2]).assertEqual('2');
    });

    /**
     * @tc.name testObjectKeys5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5000
     * @tc.desc Verify Object.keys excludes length from array key results while Object.getOwnPropertyNames still includes it
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2];
      let keys: string[] = Object.keys(arr);
      let names: string[] = Object.getOwnPropertyNames(arr);
      let hasLengthInKeys: boolean = false;
      let hasLengthInNames: boolean = false;
      for (let i: int = 0; i < keys.length; i++) {
        if (keys[i] === 'length') {
          hasLengthInKeys = true;
        }
      }
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === 'length') {
          hasLengthInNames = true;
        }
      }
      expect(hasLengthInKeys).assertFalse();
      expect(hasLengthInNames).assertTrue();
    });

    /**
     * @tc.name testObjectKeys5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5100
     * @tc.desc Verify Object.keys on Object.assign result reflect merged properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'a': 1, 'b': 2 } as Record<string, Any>);
      let keys: string[] = Object.keys(target);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.name testObjectKeys5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5200
     * @tc.desc Verify Object.keys on empty int and number arrays returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArr: int[] = [];
      let keys: string[] = Object.keys(emptyArr);
      expect(keys.length).assertEqual(0);
      let numEmptyArr: int[] = [];
      let numKeys: string[] = Object.keys(numEmptyArr);
      expect(numKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5300
     * @tc.desc Verify Object.keys on int array returns index strings
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let keys: string[] = Object.keys(arr);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(keys[2]).assertEqual('2');
    });

    /**
     * @tc.name testObjectKeys5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5400
     * @tc.desc Verify Object.keys on single-element string array returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: string[] = ['only'];
      let keys: string[] = Object.keys(single);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
    });

    /**
     * @tc.name testObjectKeys5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5500
     * @tc.desc Verify Object.keys with Unicode key in Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '中文': 1 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('中文');
    });

    /**
     * @tc.name testObjectKeys5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5600
     * @tc.desc Verify Object.keys returns empty array for class with only methods and no fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Object = new KeysEmptyMethod();
      let keys: string[] = Object.keys(m);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5700
     * @tc.desc Verify Object.keys reflects field mutations on a class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: KeysPerson = new KeysPerson();
      p.name = 'Bob';
      p.city = 'Shanghai';
      let keys: string[] = Object.keys(p);
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testObjectKeys5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5800
     * @tc.desc Verify Object.keys on boolean array returns index strings for all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false, true];
      let keys: string[] = Object.keys(arr);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
    });

    /**
     * @tc.name testObjectKeys5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_5900
     * @tc.desc Verify Object.keys returns independent array snapshots across calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let k1: string[] = Object.keys(rec);
      let k2: string[] = Object.keys(rec);
      expect(k1.length).assertEqual(k2.length);
      expect(k1 !== k2).assertTrue();
      expect(k1[0]).assertEqual(k2[0]);
    });

    /**
     * @tc.name testObjectKeys6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6000
     * @tc.desc Verify Object.keys returns fresh array for 20 repeated calls with same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1, 'b': 2 } as Record<string, int>;
      let n: int = Object.keys(rec).length;
      for (let i: int = 0; i < 20; i++) {
        expect(Object.keys(rec).length).assertEqual(n);
      }
    });

    /**
     * @tc.name testObjectKeys6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6100
     * @tc.desc Verify Object.keys on boolean primitive object view returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Object = true as Object;
      let keys: string[] = Object.keys(b);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6200
     * @tc.desc Verify Object.keys on number primitive object view returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Object = 42 as Object;
      let keys: string[] = Object.keys(n);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6300
     * @tc.desc Verify Object.keys on string primitive object view returns character indexes (no length)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = 'ab' as Object;
      let keys: string[] = Object.keys(s);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
    });

    /**
     * @tc.name testObjectKeys6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6400
     * @tc.desc Verify Object.keys on empty string primitive object view returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = '' as Object;
      let keys: string[] = Object.keys(s);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6500
     * @tc.desc nullish 入参边界：null 强转为 Object 后调用 Object.keys 抛出 ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = '';
      try {
        Object.keys(null as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual('ClassCastError');
    });

    /**
     * @tc.name testObjectKeys6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6600
     * @tc.desc nullish 入参边界：undefined 强转为 Object 后调用 Object.keys 抛出 ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = '';
      try {
        Object.keys(undefined as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual('ClassCastError');
    });

    /**
     * @tc.name testObjectKeys6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6700
     * @tc.desc Verify Object.keys length matches Object.getOwnPropertyNames length for class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: KeysTwoProps = new KeysTwoProps();
      let keys: string[] = Object.keys(p);
      let names: string[] = Object.getOwnPropertyNames(p);
      expect(keys.length).assertEqual(names.length);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectKeys6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6800
     * @tc.desc Verify Object.keys results for Record align with Object.values indices pairwise
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 10, 'y': 20 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      let values = Object.values(rec);
      expect(keys.length).assertEqual(values.length);
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
      expect(values[0] as int).assertEqual(10);
      expect(values[1] as int).assertEqual(20);
    });

    /**
     * @tc.name testObjectKeys6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_6900
     * @tc.desc Verify Object.keys on Record with unicode keys returns those keys verbatim
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys6900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '姓名': 1, '年齢': 2 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('姓名');
      expect(keys[1]).assertEqual('年齢');
    });

    /**
     * @tc.name testObjectKeys7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_7000
     * @tc.desc Verify Object.keys length stays consistent with entries and values on a 3-key Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys7000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 'x', 'c': true } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      let vals = Object.values(rec);
      let entries = Object.entries(rec);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertEqual(vals.length);
      expect(keys.length).assertEqual(entries.length);
    });

    /**
     * @tc.name testObjectKeys7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_7100
     * @tc.desc Verify Object.keys on Date instances returns no enumerable own keys (current runtime baseline)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys7100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date: Date = new Date();
      let keys: string[] = Object.keys(date);
      expect(keys.length).assertEqual(0);
      let epochDate: Date = new Date(0);
      let epochKeys: string[] = Object.keys(epochDate);
      expect(epochKeys.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectKeys7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_KEYS_7200
     * @tc.desc Verify Object.keys returns string elements whose typeof is string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectKeys7200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      expect(keys.length).assertEqual(1);
      let first: string = keys[0];
      expect(first).assertEqual('a');
    });
  });
}
