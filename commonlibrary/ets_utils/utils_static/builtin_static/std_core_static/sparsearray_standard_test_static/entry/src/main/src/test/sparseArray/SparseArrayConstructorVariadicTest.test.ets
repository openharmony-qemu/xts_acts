'use static';
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

enum Color003 {
    Red,
    Green,
    Blue
  }


class NullFieldUser021 {
    name: string | null = null;
    age: int | null = null;
}

class Point014 {
    x: number;
    y: number;
    constructor(x: number, y: number) {
      this.x = x;
      this.y = y;
    }
  }

class AbnormalUser024 {
    displayName: string = "x".repeat(256);
    email: string = "not-an-email";
  }

export default function SparseArrayConstructorVariadicTest(): void {
  describe('SparseArrayConstructorVariadicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0100
     * @tc.name testSparseArrayConstructorVariadic001
     * @tc.desc Variadic string constructor, verify instanceof SparseArray and length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<string>("apple", "banana", "cherry");
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0200
     * @tc.name testSparseArrayConstructorVariadic002
     * @tc.desc Nested SparseArray variadic constructor, verify instanceof and element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner1 = new SparseArray<int>(1, 2, 3);
        const inner2 = new SparseArray<int>(4, 5, 6);
        const arr = new SparseArray<SparseArray<int>>(inner1, inner2);
        const first = arr[0];
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr.length).assertEqual(2);
        expect(first instanceof SparseArray).assertTrue();
        expect(first!.length).assertEqual(3);
        expect(first![0]).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0300
     * @tc.name testSparseArrayConstructorVariadic003
     * @tc.desc Enum variadic constructor, verify instanceof SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Color003>(Color003.Red, Color003.Green, Color003.Blue);
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0400
     * @tc.name testSparseArrayConstructorVariadic004
     * @tc.desc Variadic ClassCastError when null passed as string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<string>((null as Object as string));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0500
     * @tc.name testSparseArrayConstructorVariadic005
     * @tc.desc Variadic ClassCastError when number passed as string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<string>("hello", (123 as Object as string));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0600
     * @tc.name testSparseArrayConstructorVariadic006
     * @tc.desc Variadic constructor with very long string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let longStr = "a".repeat(10000);
        const arr = new SparseArray<string>(longStr);
        const s0 = arr[0];
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr.length).assertEqual(1);
        expect(s0).assertEqual(longStr);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0700
     * @tc.name testSparseArrayConstructorVariadic007
     * @tc.desc SparseArray.isArray on variadic instance and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(SparseArray.isArray(arr)).assertEqual(true);
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0800
     * @tc.name testSparseArrayConstructorVariadic008
     * @tc.desc Variadic int elements, verify indexed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_0900
     * @tc.name testSparseArrayConstructorVariadic009
     * @tc.desc Variadic constructor with null element in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | null>(1, null, 3);
        expect(arr[1]).assertEqual(null);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1000
     * @tc.name testSparseArrayConstructorVariadic010
     * @tc.desc Variadic constructor with undefined element in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | undefined>(1, undefined, 3);
        expect(arr[1]).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1100
     * @tc.name testSparseArrayConstructorVariadic011
     * @tc.desc Variadic constructor with zero elements at ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 0);
        expect(arr[0]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1200
     * @tc.name testSparseArrayConstructorVariadic012
     * @tc.desc Variadic boolean constructor, verify first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false, true, false);
        expect(arr[0]).assertEqual(false);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1300
     * @tc.name testSparseArrayConstructorVariadic013
     * @tc.desc Variadic empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "hello", "");
        expect(arr[0]).assertEqual("");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1400
     * @tc.name testSparseArrayConstructorVariadic014
     * @tc.desc Variadic custom class element, verify field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Point014>(new Point014(1, 2));
        const p = arr[0];
        expect(p !== null && p !== undefined).assertTrue();
        expect((p as Point014).x).assertEqual(1);
        expect((p as Point014).y).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1500
     * @tc.name testSparseArrayConstructorVariadic015
     * @tc.desc Zero-argument variadic constructor yields empty SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        expect(arr.length).assertEqual(0);
        expect(arr[0]).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1600
     * @tc.name testSparseArrayConstructorVariadic016
     * @tc.desc Single numeric arg is length allocation not one element (OH semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        expect(arr.length).assertEqual(42);
        expect(arr[0]).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1700
     * @tc.name testSparseArrayConstructorVariadic017
     * @tc.desc Variadic spread from large Array, verify length and boundary indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hugeArray: Array<int> = [];
        for (let i = 0; i < 2000; i++) {
          hugeArray.push(i);
        }
        const arr = new SparseArray<int>(...hugeArray);
        expect(arr.length).assertEqual(2000);
        expect(arr[0]).assertEqual(0);
        expect(arr[1999]).assertEqual(1999);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1800
     * @tc.name testSparseArrayConstructorVariadic018
     * @tc.desc Variadic constructor with byte elements, verify length and indexed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 127 as byte, (-128 as byte));
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(10 as byte);
        expect(arr[1]).assertEqual(127 as byte);
        expect(arr[2]).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_1900
     * @tc.name testSparseArrayConstructorVariadic019
     * @tc.desc Variadic constructor with short boundary elements, verify indexed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(32767 as short, (-32768 as short));
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(32767 as short);
        expect(arr[1]).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2000
     * @tc.name testSparseArrayConstructorVariadic020
     * @tc.desc Variadic constructor with long large integer elements, verify indexed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a: long = 10000000000 as long;
        const b: long = 9223372036854775807 as long;
        const arr = new SparseArray<long>(a, b);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(a);
        expect(arr[1]).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2100
     * @tc.name testSparseArrayConstructorVariadic021
     * @tc.desc variadic constructor stores POJO with all-null fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const user = new NullFieldUser021();
        const arr = new SparseArray<NullFieldUser021>(user);
        expect(arr.length).assertEqual(1);
        expect(arr[0]!.name).assertEqual(null);
        expect(arr[0]!.age).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2200
     * @tc.name testSparseArrayConstructorVariadic022
     * @tc.desc variadic constructor stores decimal-format hex string element "0x123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const token = "0x123";
        const arr = new SparseArray<string>("plain", token);
        expect(arr[1]).assertEqual(token);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2300
     * @tc.name testSparseArrayConstructorVariadic023
     * @tc.desc variadic constructor stores Japanese Korean Arabic mixed-language strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("\u65e5\u672c", "\ud55c\uad6d", "\u0627\u0644\u0639\u0631\u0628\u064a\u0629");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual("\u65e5\u672c");
        expect(arr[2]).assertEqual("\u0627\u0644\u0639\u0631\u0628\u064a\u0629");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2400
     * @tc.name testSparseArrayConstructorVariadic024
     * @tc.desc variadic constructor stores POJO with long name and invalid email
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const user = new AbnormalUser024();
        const arr = new SparseArray<AbnormalUser024>(user);
        expect(arr[0]!.displayName.length).assertEqual(256);
        expect(arr[0]!.email).assertEqual("not-an-email");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2500
     * @tc.name testSparseArrayConstructorVariadic025
     * @tc.desc variadic constructor with mixed int string boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | boolean>(42, "mix", true);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(42);
        expect(arr[1]).assertEqual("mix");
        expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2600
     * @tc.name testSparseArrayConstructorVariadic026
     * @tc.desc variadic constructor stores literal "0b1010" as string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const token = "0b1010";
        const arr = new SparseArray<string>(token, "end");
        expect(arr[0]).assertEqual(token);
        expect(arr.indexOf("0b1010")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2700
     * @tc.name testSparseArrayConstructorVariadic027
     * @tc.desc variadic constructor stores zero-width \u200B string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zw = "\u200B";
        const arr = new SparseArray<string>(zw, "visible");
        expect(arr[0]).assertEqual(zw);
        expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2800
     * @tc.name testSparseArrayConstructorVariadic028
     * @tc.desc Variadic int constructor with (1, 2, 3), verify first element equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_VARIADIC_2900
     * @tc.name testSparseArrayConstructorVariadic029
     * @tc.desc Variadic int constructor with (1, 2, 3), verify typed element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorVariadic029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const val: int = arr[0] as int;
        expect(val).assertEqual(1);
    });
  });
}
