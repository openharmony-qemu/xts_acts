'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { util } from '@kit.ArkTS';
import Utils from '../Util.test';

interface UtilObj1 {
  name: string;
}

interface ArrayBufferViewObj1 {
  age: number;
}

interface nullObj1 {}

interface AsyncFunctionObj1 {
  func: () => nullObj1;
}

interface MapObj1 {
  key: string;
}

interface DateObj1 {
  year: number;
  month: number;
}

interface RegExpObj1 {
  pattern: string;
  flags: string;
}

interface TypeArrayObj1 {
  length: number;
}

interface ProxyObj1 {
  name: string;
}

interface ProxyObj2 {
  name: string;
}

interface ProxyObj3 {
  inner: ProxyObj2;
}

interface ProxyObj4 {
  proxy: nullObj1;
}

interface NativeObj1 {
  message: string;
}

interface numberObj {
  gen: () => number
}

interface WeakMapObj2 {
  key: string;
}

interface SharedArrayBufferObj1 {
  buffer: ArrayBuffer;
}

interface ArgumentsObject {
  zero: number;
  length: number;
}

interface ArrayBuffer1 {
  byteLength: number;
}

interface DataView1 {
  buffer: ArrayBuffer;
}

interface FloatArray1 {
  length: number;
}

interface SetObj1 {
  size: number;
}

export default function Util1Test(): void {
  describe('Util1Test', () => {
    afterEach(async () => {
      await Utils.msSleep(30);
    });

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0100
     * @tc.name Util1Test001
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab1 = new ArrayBuffer(8);
      expect(type.isAnyArrayBuffer(ab1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0200
     * @tc.name Util1Test002
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab1 = new ArrayBuffer(16);
      expect(type.isAnyArrayBuffer(sab1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0300
     * @tc.name Util1Test003
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj1: UtilObj1 = { name: 'test' };
      expect(type.isAnyArrayBuffer(obj1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0400
     * @tc.name Util1Test004
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr1 = [1, 2, 3];
      expect(type.isAnyArrayBuffer(arr1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0500
     * @tc.name Util1Test005
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dv1 = new DataView(new ArrayBuffer(8));
      expect(type.isAnyArrayBuffer(dv1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0600
     * @tc.name Util1Test006
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num1: int = 123;
      expect(type.isAnyArrayBuffer(num1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0700
     * @tc.name Util1Test007
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str1 = 'arraybuffer';
      expect(type.isAnyArrayBuffer(str1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0800
     * @tc.name Util1Test008
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bool1 = true;
      expect(type.isAnyArrayBuffer(bool1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_0900
     * @tc.name Util1Test009
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map1 = new Map<number, number>();
      expect(type.isAnyArrayBuffer(map1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1000
     * @tc.name Util1Test010
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab2 = new ArrayBuffer(0);
      expect(type.isAnyArrayBuffer(ab2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1100
     * @tc.name Util1Test011
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr1 = new Int8Array(8);
      expect(type.isArrayBufferView(int8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1200
     * @tc.name Util1Test012
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr1 = new Uint8Array(16);
      expect(type.isArrayBufferView(uint8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1300
     * @tc.name Util1Test013
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arraybuffer = new ArrayBuffer(8)
      const dv2 = new DataView(arraybuffer);
      expect(type.isArrayBufferView(dv2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1400
     * @tc.name Util1Test014
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr1 = new Float32Array(4);
      expect(type.isArrayBufferView(float32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1500
     * @tc.name Util1Test015
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab3 = new ArrayBuffer(8);
      expect(type.isArrayBufferView(ab3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1600
     * @tc.name Util1Test016
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj2: ArrayBufferViewObj1 = { age: 20 };
      expect(type.isArrayBufferView(obj2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1700
     * @tc.name Util1Test017
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str2 = 'arraybufferview';
      expect(type.isArrayBufferView(str2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1800
     * @tc.name Util1Test018
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set1 = new Set<string>();
      expect(type.isArrayBufferView(set1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_1900
     * @tc.name Util1Test019
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr1 = new Uint32Array(2);
      expect(type.isArrayBufferView(uint32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2000
     * @tc.name Util1Test020
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num2: int = 456;
      expect(type.isArrayBufferView(num2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2100
     * @tc.name Util1Test021
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc1 = async () => {
        return 1.0;
      };
      expect(type.isAsyncFunction(asyncFunc1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2200
     * @tc.name Util1Test022
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc1 = () => {
        return 2;
      };
      expect(type.isAsyncFunction(normalFunc1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2300
     * @tc.name Util1Test023
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc2 = async () => {
      };
      expect(type.isAsyncFunction(asyncFunc2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2500
     * @tc.name Util1Test025
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj3 = {
        func: () => {
        }
      } as AsyncFunctionObj1;
      expect(type.isAsyncFunction(obj3.func)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2600
     * @tc.name Util1Test026
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str3 = 'async function() {}';
      expect(type.isAsyncFunction(str3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2700
     * @tc.name Util1Test027
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num3: int = 789;
      expect(type.isAsyncFunction(num3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2800
     * @tc.name Util1Test028
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise1 = Promise.resolve(1);
      expect(type.isAsyncFunction(promise1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_2900
     * @tc.name Util1Test029
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc3 = async () => await Promise.resolve(3);
      expect(type.isAsyncFunction(asyncFunc3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3000
     * @tc.name Util1Test030
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr2 = [async () => {
      }, 1, 2];
      expect(type.isAsyncFunction(arr2[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3100
     * @tc.name Util1Test031
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map2 = new Map<number, number>();
      expect(type.isMap(map2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3200
     * @tc.name Util1Test032
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj4: MapObj1 = { key: 'value' };
      expect(type.isMap(obj4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3300
     * @tc.name Util1Test033
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map3 = new Map<string, number | string>([['name', 'test'], ['age', 20]]);
      expect(type.isMap(map3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3400
     * @tc.name Util1Test034
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap1 = new WeakMap<object, string>();
      expect(type.isMap(weakMap1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3500
     * @tc.name Util1Test035
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str4 = 'map';
      expect(type.isMap(str4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3600
     * @tc.name Util1Test036
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num4: int = 100;
      expect(type.isMap(num4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3700
     * @tc.name Util1Test037
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr3 = [1, 2, 3];
      expect(type.isMap(arr3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3800
     * @tc.name Util1Test038
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map4 = new Map<string, number>();
      map4.set('id', 1);
      expect(type.isMap(map4)).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_3900
     * @tc.name Util1Test039
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isMap(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4000
     * @tc.name Util1Test040
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<string>();
      expect(type.isMap(set2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4100
     * @tc.name Util1Test041
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise2 = Promise.resolve(1);
      expect(type.isPromise(promise2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4200
     * @tc.name Util1Test042
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise3 = new Promise<number>((resolve) => resolve(2));
      expect(type.isPromise(promise3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4300
     * @tc.name Util1Test043
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error('test')
      const promise4 = Promise.reject(error1);
      expect(type.isPromise(promise4)).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4400
     * @tc.name Util1Test044
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc2 = () => {
        return 3;
      };
      expect(type.isPromise(normalFunc2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4500
     * @tc.name Util1Test045
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj5 = {
        func: () => {
        }
      } as AsyncFunctionObj1;
      expect(type.isPromise(obj5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4600
     * @tc.name Util1Test046
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str5 = 'promise';
      expect(type.isPromise(str5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4700
     * @tc.name Util1Test047
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr4 = [Promise.resolve(1), 2];
      expect(type.isPromise(arr4[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4800
     * @tc.name Util1Test048
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map5 = new Map<string, string>();
      expect(type.isPromise(map5)).assertEqual(false);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_4900
     * @tc.name Util1Test049
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc4 = async () => {
      };
      expect(type.isPromise(asyncFunc4())).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5000
     * @tc.name Util1Test050
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num5: int = 200;
      expect(type.isPromise(num5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5100
     * @tc.name Util1Test051
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date1 = new Date();
      expect(type.isDate(date1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5200
     * @tc.name Util1Test052
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date2 = new Date('2025-01-01');
      expect(type.isDate(date2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5300
     * @tc.name Util1Test053
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str6 = '2025-01-01';
      expect(type.isDate(str6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5400
     * @tc.name Util1Test054
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num6 = 1735689600000;
      expect(type.isDate(num6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5500
     * @tc.name Util1Test055
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj6: DateObj1 = { year: 2025, month: 1 };
      expect(type.isDate(obj6)).assertEqual(false);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5600
     * @tc.name Util1Test056
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date3 = new Date(0);
      expect(type.isDate(date3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5700
     * @tc.name Util1Test057
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr5 = [new Date(), 1, 2];
      expect(type.isDate(arr5[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5800
     * @tc.name Util1Test058
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map6 = new Map<number, number>();
      expect(type.isDate(map6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_5900
     * @tc.name Util1Test059
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isDate(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6000
     * @tc.name Util1Test060
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isDate(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6100
     * @tc.name Util1Test061
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg1 = new RegExp('abc');
      expect(type.isRegExp(reg1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6200
     * @tc.name Util1Test062
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg2 = new RegExp("^test$");
      expect(type.isRegExp(reg2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6300
     * @tc.name Util1Test063
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str7 = '/^test$/';
      expect(type.isRegExp(str7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6400
     * @tc.name Util1Test064
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj7: RegExpObj1 = { pattern: 'abc', flags: 'i' };
      expect(type.isRegExp(obj7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6500
     * @tc.name Util1Test065
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg3 = new RegExp('');
      expect(type.isRegExp(reg3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6600
     * @tc.name Util1Test066
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num7: int = 123;
      expect(type.isRegExp(num7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6700
     * @tc.name Util1Test067
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr6 = [new RegExp("abc"), 1, 2];
      expect(type.isRegExp(arr6[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6800
     * @tc.name Util1Test068
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set3 = new Set<number>();
      expect(type.isRegExp(set3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_6900
     * @tc.name Util1Test069
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg4 = new RegExp('\\d+', 'g');
      expect(type.isRegExp(reg4)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7000
     * @tc.name Util1Test070
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bool2 = true;
      expect(type.isRegExp(bool2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7100
     * @tc.name Util1Test071
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr1 = new Int16Array(4);
      expect(type.isTypedArray(int16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7200
     * @tc.name Util1Test072
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr1 = new Uint8ClampedArray(8);
      expect(type.isTypedArray(uint8ClampedArr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7300
     * @tc.name Util1Test073
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr1 = new Float64Array(2);
      expect(type.isTypedArray(float64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7400
     * @tc.name Util1Test074
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr1 = new BigInt64Array(1);
      expect(type.isTypedArray(bigInt64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7500
     * @tc.name Util1Test075
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab4 = new ArrayBuffer(8);
      expect(type.isTypedArray(ab4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7600
     * @tc.name Util1Test076
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab4 = new ArrayBuffer(8);
      const dv3 = new DataView(ab4);
      expect(type.isTypedArray(dv3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7700
     * @tc.name Util1Test077
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str8 = 'typedarray';
      expect(type.isTypedArray(str8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7800
     * @tc.name Util1Test078
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr1 = new BigUint64Array(3);
      expect(type.isTypedArray(bigUint64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_7900
     * @tc.name Util1Test079
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj8: TypeArrayObj1 = { length: 5 };
      expect(type.isTypedArray(obj8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_8000
     * @tc.name Util1Test080
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr7 = [new Int32Array(), 1, 2];
      expect(type.isTypedArray(arr7[0])).assertEqual(true);
    });
    // Proxy/isProxy API removed in ArkTS-Sta, tests Util1Test081-090 disabled
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9100
     * @tc.name Util1Test091
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error('test error');
      expect(type.isNativeError(error1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9200
     * @tc.name Util1Test092
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const typeError1 = new TypeError('type error');
      expect(type.isNativeError(typeError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9300
     * @tc.name Util1Test093
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const referenceError1 = new ReferenceError('ref error');
      expect(type.isNativeError(referenceError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9400
     * @tc.name Util1Test094
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str10 = 'Error: test error';
      expect(type.isNativeError(str10)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9500
     * @tc.name Util1Test095
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj10: NativeObj1 = { message: 'error' };
      expect(type.isNativeError(obj10)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9600
     * @tc.name Util1Test096
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const rangeError1 = new RangeError('range error');
      expect(type.isNativeError(rangeError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9700
     * @tc.name Util1Test097
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num9: int = 789;
      expect(type.isNativeError(num9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9800
     * @tc.name Util1Test098
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error()
      const arr8 = [error1, 1, 2];
      expect(type.isNativeError(arr8[0])).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_9900
     * @tc.name Util1Test099
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set4 = new Set<number>();
      expect(type.isNativeError(set4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0100
     * @tc.name Util1Test100
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const syntaxError1 = new SyntaxError('syntax error');
      expect(type.isNativeError(syntaxError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0200
     * @tc.name Util1Test111
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap2 = new WeakMap<object, string>();
      expect(type.isWeakMap(weakMap2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0300
     * @tc.name Util1Test112
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap3 = new WeakMap<nullObj1, string>([[key1, 'value1']]);
      expect(type.isWeakMap(weakMap3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0400
     * @tc.name Util1Test113
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map9 = new Map<number, number>();
      expect(type.isWeakMap(map9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0500
     * @tc.name Util1Test114
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj12: WeakMapObj2 = { key: 'value' };
      expect(type.isWeakMap(obj12)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0600
     * @tc.name Util1Test115
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str12 = 'weakmap';
      expect(type.isWeakMap(str12)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0700
     * @tc.name Util1Test116
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num11: int = 200;
      expect(type.isWeakMap(num11)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0800
     * @tc.name Util1Test117
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap4 = new WeakMap<object, number>();
      weakMap4.set({} as nullObj1, 100);
      expect(type.isWeakMap(weakMap4)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_0900
     * @tc.name Util1Test118
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weak = new WeakMap<object, number>();
      const arr10 = [weak, 1, 2];
      expect(type.isWeakMap(arr10[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1000
     * @tc.name Util1Test119
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set5 = new Set<number>();
      expect(type.isWeakMap(set5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1100
     * @tc.name Util1Test120
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSet1 = new WeakSet<object>();
      expect(type.isWeakMap(weakSet1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1200
     * @tc.name Util1Test121
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ws1 = new WeakSet<object>();
      expect(type.isWeakSet(ws1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1300
     * @tc.name Util1Test122
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ws2 = new WeakSet<object>();
      ws2.add({} as nullObj1);
      expect(type.isWeakSet(ws2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1400
     * @tc.name Util1Test123
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isWeakSet(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1500
     * @tc.name Util1Test124
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj = {} as nullObj1;
      expect(type.isWeakSet(obj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1600
     * @tc.name Util1Test125
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str13 = 'hello';
      expect(type.isWeakSet(str13)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1700
     * @tc.name Util1Test126
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 100;
      expect(type.isWeakSet(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1800
     * @tc.name Util1Test128
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ws4 = new WeakSet<object>();
      const arr11 = [ws4, 1, 2];
      expect(type.isWeakSet(arr11[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_1900
     * @tc.name Util1Test129
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<string, number>();
      expect(type.isWeakSet(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2000
     * @tc.name Util1Test130
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const wm = new WeakMap<object, number>();
      expect(type.isWeakSet(wm)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2100
     * @tc.name Util1Test161
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv1 = new DataView(ab);
      expect(type.isDataView(dv1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2200
     * @tc.name Util1Test162
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv2 = new DataView(ab, 2, 8);
      expect(type.isDataView(dv2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2300
     * @tc.name Util1Test163
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const plainObj: DataView1 = { buffer: ab };
      expect(type.isDataView(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2400
     * @tc.name Util1Test164
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'dataview';
      expect(type.isDataView(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2500
     * @tc.name Util1Test165
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 16;
      expect(type.isDataView(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2600
     * @tc.name Util1Test166
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv1 = new DataView(ab);
      const arrWithDv = [dv1, 'test'];
      expect(type.isDataView(arrWithDv[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2700
     * @tc.name Util1Test167
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const int8Arr = new Int8Array(ab);
      expect(type.isDataView(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2800
     * @tc.name Util1Test168
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isDataView(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_2900
     * @tc.name Util1Test169
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isDataView(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3000
     * @tc.name Util1Test170
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      expect(type.isDataView(ab)).assertEqual(false);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3100
     * @tc.name Util1Test171
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr2 = new Float32Array(8);
      expect(type.isFloat32Array(float32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3200
     * @tc.name Util1Test172
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr = new Float64Array();
      expect(type.isFloat32Array(float64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3300
     * @tc.name Util1Test173
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      expect(type.isFloat32Array(ab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3400
     * @tc.name Util1Test174
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj: FloatArray1 = { length: 8 };
      expect(type.isFloat32Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3500
     * @tc.name Util1Test175
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'float32array';
      expect(type.isFloat32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3600
     * @tc.name Util1Test176
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr2 = new Float32Array(8);
      const arrWithFloat32 = [float32Arr2, 'test'];
      expect(type.isFloat32Array(arrWithFloat32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3700
     * @tc.name Util1Test177
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 8;
      expect(type.isFloat32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3800
     * @tc.name Util1Test178
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isFloat32Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_3900
     * @tc.name Util1Test179
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isFloat32Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4000
     * @tc.name Util1Test180
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr1 = new Float32Array();
      expect(type.isFloat32Array(float32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4100
     * @tc.name Util1Test191
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set1 = new Set<number>();
      expect(type.isSet(set1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4200
     * @tc.name Util1Test192
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<number>([1, 2, 3]);
      expect(type.isSet(set2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4300
     * @tc.name Util1Test193
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number, number>();
      expect(type.isSet(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4400
     * @tc.name Util1Test194
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isSet(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4500
     * @tc.name Util1Test195
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj: SetObj1 = { size: 3 };
      expect(type.isSet(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4600
     * @tc.name Util1Test196
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'set';
      expect(type.isSet(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4700
     * @tc.name Util1Test197
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<number>([1, 2, 3]);
      const arrWithSet = [set2, 'test'];
      expect(type.isSet(arrWithSet[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4800
     * @tc.name Util1Test198
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 3;
      expect(type.isSet(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_4900
     * @tc.name Util1Test199
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isSet(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5000
     * @tc.name Util1Test200
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSetVal = new WeakSet<object>();
      expect(type.isSet(weakSetVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5100
     * @tc.name Util1Test201
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr1 = new Float64Array();
      expect(type.isFloat64Array(float64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5200
     * @tc.name Util1Test202
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr2 = new Float64Array(10);
      expect(type.isFloat64Array(float64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5300
     * @tc.name Util1Test203
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr = new Float32Array();
      expect(type.isFloat64Array(float32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5400
     * @tc.name Util1Test204
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(32);
      expect(type.isFloat64Array(ab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5500
     * @tc.name Util1Test205
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 32 } as ArrayBuffer1;
      expect(type.isFloat64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5600
     * @tc.name Util1Test206
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'float64array';
      expect(type.isFloat64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5700
     * @tc.name Util1Test207
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr2 = new Float64Array(10);
      const arrWithFloat64 = [float64Arr2, 'test'];
      expect(type.isFloat64Array(arrWithFloat64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5800
     * @tc.name Util1Test208
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr = new BigInt64Array();
      expect(type.isFloat64Array(bigInt64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_5900
     * @tc.name Util1Test209
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isFloat64Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6000
     * @tc.name Util1Test210
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isFloat64Array(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6100
     * @tc.name Util1Test211
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr1 = new Int8Array();
      expect(type.isInt8Array(int8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6200
     * @tc.name Util1Test212
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const int8Arr2 = new Int8Array(ab);
      expect(type.isInt8Array(int8Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6300
     * @tc.name Util1Test213
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr = new Uint8Array();
      expect(type.isInt8Array(uint8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6400
     * @tc.name Util1Test214
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isInt8Array(int16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6500
     * @tc.name Util1Test215
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr = [1, 2, 3];
      expect(type.isInt8Array(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6600
     * @tc.name Util1Test216
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 8;
      expect(type.isInt8Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6700
     * @tc.name Util1Test217
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const int8Arr2 = new Int8Array(ab);
      const arrWithInt8 = [int8Arr2, 'test'];
      expect(type.isInt8Array(arrWithInt8[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6800
     * @tc.name Util1Test218
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'int8array';
      expect(type.isInt8Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_6900
     * @tc.name Util1Test219
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isInt8Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7000
     * @tc.name Util1Test220
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number, number>();
      expect(type.isInt8Array(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7100
     * @tc.name Util1Test221
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr1 = new Int16Array();
      expect(type.isInt16Array(int16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7200
     * @tc.name Util1Test222
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr2 = new Int16Array([10, 20, 30]);
      expect(type.isInt16Array(int16Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7300
     * @tc.name Util1Test223
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr = new Int8Array();
      expect(type.isInt16Array(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7400
     * @tc.name Util1Test224
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isInt16Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7500
     * @tc.name Util1Test225
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = {} as nullObj1;
      expect(type.isInt16Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7600
     * @tc.name Util1Test226
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = true;
      expect(type.isInt16Array(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7700
     * @tc.name Util1Test227
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr2 = new Int16Array([10, 20, 30]);
      const arrWithInt16 = [int16Arr2, 'test'];
      expect(type.isInt16Array(arrWithInt16[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7800
     * @tc.name Util1Test228
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isInt16Array(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_7900
     * @tc.name Util1Test229
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isInt16Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8000
     * @tc.name Util1Test230
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv = new DataView(ab);
      expect(type.isInt16Array(dv)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8100
     * @tc.name Util1Test231
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr1 = new Int32Array();
      expect(type.isInt32Array(int32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8200
     * @tc.name Util1Test232
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr2 = new Int32Array(5);
      expect(type.isInt32Array(int32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8300
     * @tc.name Util1Test233
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isInt32Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8400
     * @tc.name Util1Test234
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isInt32Array(int16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8500
     * @tc.name Util1Test235
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'int32array';
      expect(type.isInt32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8600
     * @tc.name Util1Test236
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 5;
      expect(type.isInt32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8700
     * @tc.name Util1Test237
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr2 = new Int32Array(5);
      const arrWithInt32 = [int32Arr2, 'test'];
      expect(type.isInt32Array(arrWithInt32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8800
     * @tc.name Util1Test238
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isInt32Array(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_8900
     * @tc.name Util1Test239
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isInt32Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9000
     * @tc.name Util1Test240
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const errorVal = new Error('test');
      expect(type.isInt32Array(errorVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9100
     * @tc.name Util1Test241
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const mapKeysIter = map.keys();
      expect(type.isMapIterator(mapKeysIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9200
     * @tc.name Util1Test242
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const mapValsIter = map.values();
      expect(type.isMapIterator(mapValsIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9300
     * @tc.name Util1Test243
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const mapEntriesIter = map.entries();
      expect(type.isMapIterator(mapEntriesIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9400
     * @tc.name Util1Test244
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>();
      const setIter = set.keys();
      expect(type.isMapIterator(setIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9500
     * @tc.name Util1Test245
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr = [1, 2];
      const arrIter = arr.values();
      expect(type.isMapIterator(arrIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9600
     * @tc.name Util1Test246
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      expect(type.isMapIterator(map)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9700
     * @tc.name Util1Test247
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'map iterator';
      expect(type.isMapIterator(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9800
     * @tc.name Util1Test248
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const mapKeysIter = map.keys();
      const arrWithMapIter = [mapKeysIter, 'test'];
      expect(type.isMapIterator(arrWithMapIter[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_TWO_9900
     * @tc.name Util1Test249
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isMapIterator(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0100
     * @tc.name Util1Test250
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 100;
      expect(type.isMapIterator(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0200
     * @tc.name Util1Test251
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setKeysIter = set.keys();
      expect(type.isSetIterator(setKeysIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0300
     * @tc.name Util1Test252
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setValsIter = set.values();
      expect(type.isSetIterator(setValsIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0400
     * @tc.name Util1Test253
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setEntriesIter = set.entries();
      expect(type.isSetIterator(setEntriesIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0500
     * @tc.name Util1Test254
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<number, number>();
      const mapIter = map.keys();
      expect(type.isSetIterator(mapIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0600
     * @tc.name Util1Test255
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr = [1, 2];
      const arrIter = arr.values();
      expect(type.isSetIterator(arrIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0700
     * @tc.name Util1Test256
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      expect(type.isSetIterator(set)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0800
     * @tc.name Util1Test257
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'set iterator';
      expect(type.isSetIterator(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_0900
     * @tc.name Util1Test258
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setKeysIter = set.keys();
      const arrWithSetIter = [setKeysIter, 'test'];
      expect(type.isSetIterator(arrWithSetIter[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1000
     * @tc.name Util1Test259
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isSetIterator(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1100
     * @tc.name Util1Test260
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = false;
      expect(type.isSetIterator(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1200
     * @tc.name Util1Test261
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr1 = new Uint8Array();
      expect(type.isUint8Array(uint8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1300
     * @tc.name Util1Test262
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const uint8Arr2 = new Uint8Array(ab);
      expect(type.isUint8Array(uint8Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1400
     * @tc.name Util1Test263
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr = new Uint8ClampedArray();
      expect(type.isUint8Array(uint8ClampedArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1500
     * @tc.name Util1Test264
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr = new Int8Array();
      expect(type.isUint8Array(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1600
     * @tc.name Util1Test265
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 8 } as ArrayBuffer1;
      expect(type.isUint8Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1700
     * @tc.name Util1Test266
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 8;
      expect(type.isUint8Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1800
     * @tc.name Util1Test267
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const uint8Arr2 = new Uint8Array(ab);
      const arrWithUint8 = [uint8Arr2, 'test'];
      expect(type.isUint8Array(arrWithUint8[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_1900
     * @tc.name Util1Test268
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint8array';
      expect(type.isUint8Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2000
     * @tc.name Util1Test269
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isUint8Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2100
     * @tc.name Util1Test270
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object, number>();
      expect(type.isUint8Array(weakMapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2200
     * @tc.name Util1Test271
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr1 = new Uint8ClampedArray();
      expect(type.isUint8ClampedArray(uint8ClampedArr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2300
     * @tc.name Util1Test272
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const uint8ClampedArr2 = new Uint8ClampedArray(ab);
      expect(type.isUint8ClampedArray(uint8ClampedArr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2400
     * @tc.name Util1Test273
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr = new Uint8Array();
      expect(type.isUint8ClampedArray(uint8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2500
     * @tc.name Util1Test274
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr = new Uint16Array();
      expect(type.isUint8ClampedArray(uint16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2600
     * @tc.name Util1Test275
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr = [255, 256];
      expect(type.isUint8ClampedArray(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2700
     * @tc.name Util1Test276
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 16;
      expect(type.isUint8ClampedArray(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2800
     * @tc.name Util1Test277
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const uint8ClampedArr2 = new Uint8ClampedArray(ab);
      const arrWithUint8Clamped = [uint8ClampedArr2, 'test'];
      expect(type.isUint8ClampedArray(arrWithUint8Clamped[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_2900
     * @tc.name Util1Test278
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint8clampedarray';
      expect(type.isUint8ClampedArray(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3000
     * @tc.name Util1Test279
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isUint8ClampedArray(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3100
     * @tc.name Util1Test280
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isUint8ClampedArray(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3200
     * @tc.name Util1Test281
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr1 = new Uint16Array();
      expect(type.isUint16Array(uint16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3300
     * @tc.name Util1Test282
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr2 = new Uint16Array([100, 200]);
      expect(type.isUint16Array(uint16Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3400
     * @tc.name Util1Test283
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isUint16Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3500
     * @tc.name Util1Test284
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isUint16Array(int16Arr)).assertEqual(false);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3600
     * @tc.name Util1Test285
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { length: 2 } as FloatArray1;
      expect(type.isUint16Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3700
     * @tc.name Util1Test286
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = true;
      expect(type.isUint16Array(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3800
     * @tc.name Util1Test287
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr2 = new Uint16Array([100, 200]);
      const arrWithUint16 = [uint16Arr2, 'test'];
      expect(type.isUint16Array(arrWithUint16[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_3900
     * @tc.name Util1Test288
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number, number>();
      expect(type.isUint16Array(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4000
     * @tc.name Util1Test289
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isUint16Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4100
     * @tc.name Util1Test290
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const dv = new DataView(ab);
      expect(type.isUint16Array(dv)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4200
     * @tc.name Util1Test291
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const errorVal = new Error('test');
      expect(type.isUint32Array(errorVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4300
     * @tc.name Util1Test292
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr1 = new Uint32Array();
      expect(type.isUint32Array(uint32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4400
     * @tc.name Util1Test293
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr2 = new Uint32Array(6);
      expect(type.isUint32Array(uint32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4500
     * @tc.name Util1Test294
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isUint32Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4600
     * @tc.name Util1Test295
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr = new Uint16Array();
      expect(type.isUint32Array(uint16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4700
     * @tc.name Util1Test296
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint32array';
      expect(type.isUint32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4800
     * @tc.name Util1Test297
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 6;
      expect(type.isUint32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_4900
     * @tc.name Util1Test298
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr2 = new Uint32Array(6);
      const arrWithUint32 = [uint32Arr2, 'test'];
      expect(type.isUint32Array(arrWithUint32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5000
     * @tc.name Util1Test299
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isUint32Array(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5100
     * @tc.name Util1Test300
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isUint32Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5200
     * @tc.name Util1Test301
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap1 = new WeakMap<object, number>();
      expect(type.isWeakMap(weakMap1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5300
     * @tc.name Util1Test302
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap2 = new WeakMap<nullObj1, string>([[key1, 'value']]);
      expect(type.isWeakMap(weakMap2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5400
     * @tc.name Util1Test303
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<string, string>();
      expect(type.isWeakMap(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5500
     * @tc.name Util1Test304
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSetVal = new WeakSet<object>();
      expect(type.isWeakMap(weakSetVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5600
     * @tc.name Util1Test305
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { key: 'value' } as MapObj1;
      expect(type.isWeakMap(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5700
     * @tc.name Util1Test306
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'weakmap';
      expect(type.isWeakMap(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5800
     * @tc.name Util1Test307
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap2 = new WeakMap<nullObj1, string>([[key1, 'value']]);
      const arrWithWeakMap = [weakMap2, 'test'];
      expect(type.isWeakMap(arrWithWeakMap[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_5900
     * @tc.name Util1Test308
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 100;
      expect(type.isWeakMap(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6000
     * @tc.name Util1Test309
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isWeakMap(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6100
     * @tc.name Util1Test310
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isWeakMap(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6200
     * @tc.name Util1Test311
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSet1 = new WeakSet<object>();
      expect(type.isWeakSet(weakSet1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6300
     * @tc.name Util1Test312
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakSet2 = new WeakSet<nullObj1>([key1]);
      expect(type.isWeakSet(weakSet2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6400
     * @tc.name Util1Test313
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isWeakSet(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6500
     * @tc.name Util1Test314
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object, string>();
      expect(type.isWeakSet(weakMapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6600
     * @tc.name Util1Test315
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr: nullObj1[] = [{} as nullObj1, {} as nullObj1];
      expect(type.isWeakSet(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6700
     * @tc.name Util1Test316
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'weakset';
      expect(type.isWeakSet(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6800
     * @tc.name Util1Test317
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakSet2 = new WeakSet<nullObj1>([key1]);
      const arrWithWeakSet = [weakSet2, 'test'];
      expect(type.isWeakSet(arrWithWeakSet[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_6900
     * @tc.name Util1Test318
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal: int = 200;
      expect(type.isWeakSet(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7000
     * @tc.name Util1Test319
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isWeakSet(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7100
     * @tc.name Util1Test320
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isWeakSet(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7200
     * @tc.name Util1Test321
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr1 = new BigInt64Array();
      expect(type.isBigInt64Array(bigInt64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7300
     * @tc.name Util1Test322
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const bigInt64Arr2 = new BigInt64Array(ab);
      expect(type.isBigInt64Array(bigInt64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7400
     * @tc.name Util1Test323
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr = new BigUint64Array();
      expect(type.isBigInt64Array(bigUint64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7500
     * @tc.name Util1Test324
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isBigInt64Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7600
     * @tc.name Util1Test325
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 16 } as ArrayBuffer1;
      expect(type.isBigInt64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7700
     * @tc.name Util1Test326
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigIntVal = BigInt(123);
      expect(type.isBigInt64Array(bigIntVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7800
     * @tc.name Util1Test327
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const bigInt64Arr2 = new BigInt64Array(ab);
      const arrWithBigInt64 = [bigInt64Arr2, 'test'];
      expect(type.isBigInt64Array(arrWithBigInt64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_7900
     * @tc.name Util1Test328
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'bigint64array';
      expect(type.isBigInt64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8000
     * @tc.name Util1Test329
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isBigInt64Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8100
     * @tc.name Util1Test330
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isBigInt64Array(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8200
     * @tc.name Util1Test331
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr1 = new BigUint64Array();
      expect(type.isBigUint64Array(bigUint64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8300
     * @tc.name Util1Test332
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr2 = new BigUint64Array([BigInt(100), BigInt(200)]);
      expect(type.isBigUint64Array(bigUint64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8400
     * @tc.name Util1Test333
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr = new BigInt64Array();
      expect(type.isBigUint64Array(bigInt64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8500
     * @tc.name Util1Test334
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isBigUint64Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8600
     * @tc.name Util1Test335
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { length: 2 } as TypeArrayObj1;
      expect(type.isBigUint64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8700
     * @tc.name Util1Test336
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigIntVal = BigInt(300);
      expect(type.isBigUint64Array(bigIntVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8800
     * @tc.name Util1Test337
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr2 = new BigUint64Array([BigInt(100), BigInt(200)]);
      const arrWithBigUint64 = [bigUint64Arr2, 'test'];
      expect(type.isBigUint64Array(arrWithBigUint64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_8900
     * @tc.name Util1Test338
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'biguint64array';
      expect(type.isBigUint64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_9000
     * @tc.name Util1Test339
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      expect(type.isBigUint64Array(new Object())).assertEqual(false);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_Util1_TEST_THREE_9100
     * @tc.name Util1Test340
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object, number>();
      expect(type.isBigUint64Array(weakMapVal)).assertEqual(false);
    });
  })
}

