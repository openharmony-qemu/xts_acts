'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class From2Bad029 {
  a: int = 1;
  b: int = 2;
}

export default function SparseArrayFrom2Test(): void {
  describe('SparseArrayFrom2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0001
     * @tc.name testSparseArrayFrom001
     * @tc.desc Test SparseArray.from with null Array, verify ClassCastError is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int>(null as Array<int>)
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0002
     * @tc.name testSparseArrayFrom002
     * @tc.desc Test SparseArray.from with mapFn that throws Error, verify Error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => {
            throw new Error('invalid map path')
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0003
     * @tc.name testSparseArrayFrom003
     * @tc.desc Test SparseArray.from with string Array, verify SparseArray content (arr[0] equals "a", arr[1] equals "b")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string>(["a", "b", "c"])
        expect(arr[0]).assertEqual("a")
        expect(arr[1]).assertEqual("b")
        expect(arr[2]).assertEqual("c")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0004
     * @tc.name testSparseArrayFrom004
     * @tc.desc Test SparseArray.from with double Array, verify SparseArray content (arr[0] equals 1.1, arr[1] equals 2.2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<double>([1.1, 2.2, 3.3])
        expect(arr[0]).assertEqual(1.1)
        expect(arr[1]).assertEqual(2.2)
        expect(arr[2]).assertEqual(3.3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0005
     * @tc.name testSparseArrayFrom005
     * @tc.desc SparseArray.from with empty Array, verify empty SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src = [] as Array<int>;
        const arr = SparseArray.from<int>(src);
        expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0006
     * @tc.name testSparseArrayFrom006
     * @tc.desc SparseArray.from with Array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], verify elements copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] as Array<int>;
        const arr = SparseArray.from<int>(src);
        expect(arr.length).assertEqual(10);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0007
     * @tc.name testSparseArrayFrom007
     * @tc.desc Test SparseArray.from with Array with null elements, verify SparseArray content (arr[0] equals 1, arr[1] is null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int | null>([1, null, 3])
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0008
     * @tc.name testSparseArrayFrom008
     * @tc.desc Test SparseArray.from with Uint8Array converted to Array, verify converted elements in SparseArray (arr.length equals 3, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const typedArr = new Uint8Array([1, 2, 3])
        const plain: Array<int> = []
        for (let i = 0; i < typedArr.length; i++) {
          plain.push(Double.toInt(typedArr[i]))
        }
        const arr = SparseArray.from<int>(plain)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0009
     * @tc.name testSparseArrayFrom009
     * @tc.desc Test SparseArray.from with Int32Array converted to Array, verify converted elements in SparseArray (arr[0] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const typedArr = new Int32Array([100, 200, 300])
        const plain: Array<int> = []
        for (let i = 0; i < typedArr.length; i++) {
          plain.push(Double.toInt(typedArr[i]))
        }
        const arr = SparseArray.from<int>(plain)
        expect(arr[0]).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0010
     * @tc.name testSparseArrayFrom010
     * @tc.desc Test SparseArray.from with Float64Array converted to Array, verify converted elements in SparseArray (arr[0] is close to 1.1, 0.0001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const typedArr = new Float64Array([1.1, 2.2, 3.3])
        const plain: Array<float> = []
        for (let i = 0; i < typedArr.length; i++) {
          plain.push(Double.toFloat(typedArr[i]))
        }
        const arr = SparseArray.from<float>(plain)
        expect(arr[0]).assertClose(1.1, 0.0001)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0011
     * @tc.name testSparseArrayFrom011
     * @tc.desc Test SparseArray.from with localized string Array, verify SparseArray content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string>(["你", "好"])
        expect(arr.length).assertEqual(2)
        expect(arr[0]).assertEqual("你")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0012
     * @tc.name testSparseArrayFrom012
     * @tc.desc Test SparseArray.from with Set, verify elements and length (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const set = new Set<int>([1, 2, 3])
        const arr = SparseArray.from<int>(set)
        expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0013
     * @tc.name testSparseArrayFrom013
     * @tc.desc Test SparseArray.from with empty Set, verify length is 0 (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const set = new Set<int>()
        const arr = SparseArray.from<int>(set)
        expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0014
     * @tc.name testSparseArrayFrom014
     * @tc.desc Test SparseArray.from with Map.values() iterator, verify values are copied to SparseArray (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const map = new Map<string, int>()
        map.set("a", 1)
        map.set("b", 2)
        const arr = SparseArray.from<int>(map.values())
        expect(arr.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0015
     * @tc.name testSparseArrayFrom015
     * @tc.desc Test SparseArray.from with undefined Array, verify ClassCastError is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int>(undefined as Array<int>)
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0016
     * @tc.name testSparseArrayFrom016
     * @tc.desc Test SparseArray.from with invalid Object cast to Array, verify ClassCastError is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int>((new From2Bad029()) as Object as Array<int>)
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0017
     * @tc.name testSparseArrayFrom017
     * @tc.desc Test SparseArray.from with empty Array, verify SparseArray content (arr.length equals 1000, arr[999] equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const largeArr = [] as Array<int>
        for (let i = 0; i < 1000; i++) {
          largeArr.push(i)
        }
        const arr = SparseArray.from<int>(largeArr)
        expect(arr.length).assertEqual(1000)
        expect(arr[999]).assertEqual(999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0018
     * @tc.name testSparseArrayFrom018
     * @tc.desc Test SparseArray.from with Array with infinity values, verify SparseArray content (arr[0] equals Double.POSITIVE_INFINITY, arr[1] equals Double.NEGATIVE_INFINITY)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<double>([Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY])
        expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY)
        expect(arr[1]).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0019
     * @tc.name testSparseArrayFrom019
     * @tc.desc Test SparseArray.from with Array with NaN, verify SparseArray content (element is NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<double>([Double.NaN])
        expect(isNaN(arr[0] as number)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0020
     * @tc.name testSparseArrayFrom020
     * @tc.desc Test SparseArray.from with sparse Array holes, verify length and hole values after from (arr.length equals 5, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int | undefined>([1, 2, undefined, undefined, undefined])
        expect(arr.length).assertEqual(5)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0021
     * @tc.name testSparseArrayFrom021
     * @tc.desc Test SparseArray.from with sparse Array holes, verify length and hole values after from (arr.length equals 5, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int | undefined>([1, undefined, 3, undefined, 5])
        expect(arr.length).assertEqual(5)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertUndefined()
        expect(arr[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0022
     * @tc.name testSparseArrayFrom022
     * @tc.desc Test SparseArray.from with mixed int/string Array, verify SparseArray content (arr.length equals 4, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int | string>([1, "hello", 2, "world"])
        expect(arr.length).assertEqual(4)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0023
     * @tc.name testSparseArrayFrom023
     * @tc.desc Test SparseArray.from with SparseArray elements, verify nested SparseArray references are preserved (arr.length equals 2, arr[0] === inner1 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner1 = new SparseArray<int>(1, 2)
        const inner2 = new SparseArray<int>(3, 4)
        const arr = SparseArray.from<SparseArray<int>>([inner1, inner2])
        expect(arr.length).assertEqual(2)
        expect(arr[0] === inner1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0024
     * @tc.name testSparseArrayFrom024
     * @tc.desc Test SparseArray.from with multiline string Array, verify SparseArray content (arr[0] equals "line1\nline2", arr[1] equals "tab\there")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string>(["line1\nline2", "tab\there"])
        expect(arr[0]).assertEqual("line1\nline2")
        expect(arr[1]).assertEqual("tab\there")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0025
     * @tc.name testSparseArrayFrom025
     * @tc.desc Test SparseArray.from with emoji string Array, verify SparseArray content (arr[0] equals "😀", arr[1] equals "🎉")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string>(["😀", "🎉", "❤️"])
        expect(arr[0]).assertEqual("😀")
        expect(arr[1]).assertEqual("🎉")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0026
     * @tc.name testSparseArrayFrom026
     * @tc.desc Test SparseArray.from with empty Array, verify SparseArray content (arr.length equals 10000, arr[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const largeArr = [] as Array<int>
        for (let i = 0; i < 10000; i++) {
          largeArr.push(i)
        }
        const arr = SparseArray.from<int>(largeArr)
        expect(arr.length).assertEqual(10000)
        expect(arr[0]).assertEqual(0)
        expect(arr[9999]).assertEqual(9999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0027
     * @tc.name testSparseArrayFrom027
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testSparseArrayFrom027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // const arr = SparseArray.from<string>([1, 2, 3])
        const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v)
        expect(arr instanceof SparseArray).assertTrue()
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0028
     * @tc.name testSparseArrayFrom028
     * @tc.desc from short Array with mapFn, verify mapped short elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<short> = [10 as short, 20 as short];
        const arr = SparseArray.from<short, short>(src, (v: short, _k: int): short => (Short.toInt(v) * 2).toShort());
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(20 as short);
        expect(arr[1]).assertEqual(40 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0029
     * @tc.name testSparseArrayFrom029
     * @tc.desc from string Array containing null and empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<string | null> = [null, "", "ok"];
        const arr = SparseArray.from<string | null>(src);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(null);
        expect(arr[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0030
     * @tc.name testSparseArrayFrom030
     * @tc.desc from string Array with XSS script element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const xss = "<script>alert(1)</script>";
        const arr = SparseArray.from<string>(["safe", xss]);
        expect(arr[1]).assertEqual(xss);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0031
     * @tc.name testSparseArrayFrom031
     * @tc.desc from int Array with 0x and 0b literal elements via mapFn identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<int> = [0x10, 0b11, 5];
        const arr = SparseArray.from<int, int>(src, (v: int, _k: int): int => v);
        expect(arr[0]).assertEqual(16);
        expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0032
     * @tc.name testSparseArrayFrom032
     * @tc.desc from int Array mapFn maps index 1 to overflow literal 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<int> = [1, 2, 3];
        const overflow: int = (2147483647 as int + 1 as int) as int;
        const arr = SparseArray.from<int, int>(src, (v: int, k: int): int => {
          if (k === 1) {
            return overflow;
          }
          return v;
        });
        expect(arr[1]).assertEqual(overflow);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2_0033
     * @tc.name testSparseArrayFrom033
     * @tc.desc from Array with undefined slot preserves undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<int | undefined> = [1, undefined, 3];
        const arr = SparseArray.from<int | undefined>(src);
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(undefined);
    });
  });
}
