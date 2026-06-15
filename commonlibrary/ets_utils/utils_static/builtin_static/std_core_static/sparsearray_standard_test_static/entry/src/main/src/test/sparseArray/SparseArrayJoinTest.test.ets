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

export default function SparseArrayJoinTest(): void {
  describe('SparseArrayJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0100
     * @tc.name testSparseArrayJoin001
     * @tc.desc Test SparseArray.join, verify method result (result equals "a,b,c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join();
        expect(result).assertEqual("a,b,c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0200
     * @tc.name testSparseArrayJoin002
     * @tc.desc join() on [4,5,3], verify default comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 5, 3);
        const result = arr.join();
        expect(result).assertEqual("4,5,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0300
     * @tc.name testSparseArrayJoin003
     * @tc.desc Test SparseArray.join, verify method result (result equals "abc")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("");
        expect(result).assertEqual("abc");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0400
     * @tc.name testSparseArrayJoin004
     * @tc.desc Test SparseArray.join, verify method result (result equals "a😀b😀c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("😀");
        expect(result).assertEqual("a😀b😀c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0500
     * @tc.name testSparseArrayJoin005
     * @tc.desc Test SparseArray.join, verify method result (result equals "a\u200Bb\u200Bc")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("\u200B");
        expect(result).assertEqual("a\u200Bb\u200Bc");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0600
     * @tc.name testSparseArrayJoin006
     * @tc.desc Test SparseArray.join, verify method result (result!.length equals 2 + 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const longSep = "x".repeat(10000);
        const result = arr.join(longSep);
        expect(result!.length).assertEqual(2 + 10000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0700
     * @tc.name testSparseArrayJoin007
     * @tc.desc Test SparseArray.join, verify method result (result equals "a\n\tb\n\tc")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("\n\t");
        expect(result).assertEqual("a\n\tb\n\tc");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0800
     * @tc.name testSparseArrayJoin008
     * @tc.desc Test SparseArray.join with localized separator, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("分隔");
        expect(result).assertEqual("a分隔b分隔c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_0900
     * @tc.name testSparseArrayJoin009
     * @tc.desc Test SparseArray.join, verify method result (result equals "a--b")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const sep = "-";
        const result = arr.join(`${sep}${sep}`);
        expect(result).assertEqual("a--b");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1000
     * @tc.name testSparseArrayJoin010
     * @tc.desc Test SparseArray.join error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        try {
          arr.join((null as Object as string));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1100
     * @tc.name testSparseArrayJoin011
     * @tc.desc Test SparseArray.join error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        try {
          arr.join(undefined as string);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1200
     * @tc.name testSparseArrayJoin012
     * @tc.desc Test SparseArray.join error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        try {
          arr.join((123 as Object as string));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1300
     * @tc.name testSparseArrayJoin013
     * @tc.desc Test SparseArray.join, verify method result (result !== null && result !== undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const result = arr.join("\udc04");
        expect(result !== null && result !== undefined).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1400
     * @tc.name testSparseArrayJoin014
     * @tc.desc Test SparseArray.join, verify method result (result equals "a<script>alert(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const result = arr.join("<script>alert(1)</script>");
        expect(result).assertEqual("a<script>alert(1)</script>b");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1500
     * @tc.name testSparseArrayJoin015
     * @tc.desc Test SparseArray.join, verify method result (result equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const result = arr.join("-");
        expect(result).assertEqual("");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1600
     * @tc.name testSparseArrayJoin016
     * @tc.desc Test SparseArray.join, verify method result (result equals "--")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        const result = arr.join("-");
        expect(result).assertEqual("--");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1700
     * @tc.name testSparseArrayJoin017
     * @tc.desc Test SparseArray.join, verify method result (result equals "-b-")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr[1] = "b";
        const result = arr.join("-");
        expect(result).assertEqual("-b-");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1800
     * @tc.name testSparseArrayJoin018
     * @tc.desc Test SparseArray.join, verify method result (result equals "a-")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(2);
        arr[0] = "a";
        const result = arr.join("-");
        expect(result).assertEqual("a-");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_1900
     * @tc.name testSparseArrayJoin019
     * @tc.desc Test SparseArray.join, verify method result (result equals "a,b,c,d")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        arr.push("a", "b", "c", "d");
        const result = arr.join(",");
        expect(result).assertEqual("a,b,c,d");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2000
     * @tc.name testSparseArrayJoin020
     * @tc.desc Test SparseArray.join, verify method result (result equals "a--c--e")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(5);
        arr[0] = "a";
        arr[2] = "c";
        arr[4] = "e";
        const result = arr.join("-");
        expect(result).assertEqual("a--c--e");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2100
     * @tc.name testSparseArrayJoin021
     * @tc.desc join('-') on [2,4,4], verify custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 4, 4);
        const result = arr.join("-");
        expect(result).assertEqual("2-4-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2200
     * @tc.name testSparseArrayJoin022
     * @tc.desc join('|') on [3,5,5], verify pipe-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 5, 5);
        const result = arr.join("|");
        expect(result).assertEqual("3|5|5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2300
     * @tc.name testSparseArrayJoin023
     * @tc.desc Test SparseArray.join, verify method result (result equals "only")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("only");
        const result = arr.join("-");
        expect(result).assertEqual("only");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2400
     * @tc.name testSparseArrayJoin024
     * @tc.desc Test SparseArray.join, verify method result (result equals "a,,c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr[0] = "a";
        arr[2] = "c";
        const result = arr.join(",");
        expect(result).assertEqual("a,,c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2500
     * @tc.name testSparseArrayJoin025
     * @tc.desc Test SparseArray.join with custom separator, verify typeof string, length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.join("-");
        expect(typeof result).assertEqual("string");
        expect(result!.length).assertEqual(5);
        expect(result).assertEqual("a-b-c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2600
     * @tc.name testSparseArrayJoin026
     * @tc.desc Test SparseArray.join, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        for (let i = 0; i < 10000; i++) {
          arr.push(i.toString());
        }
        const result = arr.join(",");
        expect(result.split(",").length).assertEqual(10000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2700
     * @tc.name testSparseArrayJoin027
     * @tc.desc Test SparseArray.join, verify method result (result!.length equals 20001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const longStr = "x".repeat(10000);
        arr.push(longStr, longStr);
        const result = arr.join("-");
        expect(result!.length).assertEqual(20001);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2800
     * @tc.name testSparseArrayJoin028
     * @tc.desc Test SparseArray.join, verify method result (result equals "a\nb|c\td|e\rf")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a\nb", "c\td", "e\rf");
        const result = arr.join("|");
        expect(result).assertEqual("a\nb|c\td|e\rf");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_2900
     * @tc.name testSparseArrayJoin029
     * @tc.desc Test SparseArray.join with localized strings, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("中文", "日本語", "한글");
        const result = arr.join("-");
        expect(result).assertEqual("中文-日本語-한글");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3000
     * @tc.name testSparseArrayJoin030
     * @tc.desc Test SparseArray.join, verify method result (result equals "a-b-c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        arr.push("c");
        const result = arr.join("-");
        expect(result).assertEqual("a-b-c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3100
     * @tc.name testSparseArrayJoin031
     * @tc.desc Test SparseArray.join, verify method result (result equals "a-b")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.pop();
        const result = arr.join("-");
        expect(result).assertEqual("a-b");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3200
     * @tc.name testSparseArrayJoin032
     * @tc.desc Test SparseArray.join, verify method result (result equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.length = 0;
        const result = arr.join("-");
        expect(result).assertEqual("");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3300
     * @tc.name testSparseArrayJoin033
     * @tc.desc join strings containing zero-width space and tab, verify separator preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("\u200B", "\t", "a");
        const result = arr.join("|");
        expect(result).assertEqual("\u200B|\t|a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3400
     * @tc.name testSparseArrayJoin034
     * @tc.desc join on SparseArray<short> with separator joins short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        const result = arr.join("-");
        expect(result).assertEqual("10-20-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3500
     * @tc.name testSparseArrayJoin035
     * @tc.desc join on SparseArray<float> with separator joins float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        const result = arr.join("|");
        expect(result).assertEqual("1|2.5|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3600
     * @tc.name testSparseArrayJoin036
     * @tc.desc join element of 65535-char string with comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longElem = "z".repeat(65535);
        const arr = new SparseArray<string>("a", longElem);
        const result = arr.join(",");
        expect(result.startsWith("a,")).assertTrue();
        expect(result.length).assertEqual(1 + 65535 + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3700
     * @tc.name testSparseArrayJoin037
     * @tc.desc join phone email and id-card format strings with pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("13800138000", "user@test.com", "110101199001011234");
        const result = arr.join("|");
        expect(result).assertEqual("13800138000|user@test.com|110101199001011234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3800
     * @tc.name testSparseArrayJoin038
     * @tc.desc join SparseArray with undefined element slot between strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | undefined>("a", undefined, "c");
        const result = arr.join(",");
        expect(result.indexOf("a")).assertEqual(0);
        expect(result.indexOf("c")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_3900
     * @tc.name testSparseArrayJoin039
     * @tc.desc join int array with Chinese separator \u4e2d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5);
        const joined = arr.join("\u4e2d");
        expect(joined).assertEqual("0\u4e2d1\u4e2d2\u4e2d3\u4e2d4\u4e2d5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_4000
     * @tc.name testSparseArrayJoin040
     * @tc.desc join 8192-char element with pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chunk = "j".repeat(8192);
        const arr = new SparseArray<string>("head", chunk);
        const result = arr.join("|");
        expect(result.startsWith("head|")).assertTrue();
        expect(result.length).assertEqual(5 + 8192);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_JOIN_4100
     * @tc.name testSparseArrayJoin041
     * @tc.desc join 131072-char string element (near static doc mega tier, below 16777215)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayJoin041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chunk = "L".repeat(131072);
        const arr = new SparseArray<string>(chunk);
        const result = arr.join(",");
        expect(result.length).assertEqual(131072);
    });

  });
}
