'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import * as ns_alltest from '../ets/ns_alltest';

export default function functiontestAllTest(): void {
  describe("ActsNamespaceFunctiontestAllTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    // ============ functiontest namespace - Constants ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC72_STATIC_0100
     * @tc.name      test_functiontest_constants_values_Static_0001
     * @tc.desc      functiontest namespace constants should have correct values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_constants_values_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_constants_values_Static_0001 start');
      let pass: boolean = true;
      try {
        expect(ns_alltest.functiontest.CONSTANT_I8_001).assertEqual(127);
        expect(ns_alltest.functiontest.CONSTANT_I8_002).assertEqual(-128);
        expect(ns_alltest.functiontest.CONSTANT_I32_001).assertEqual(2147483647);
      } catch (e) {
        pass = false;
        console.log('functiontest_constants_values failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_constants_values_Static_0001 done');
      done();
      console.log('test_functiontest_constants_values_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest1-9 void noreturn with primitives ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC73_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest1_9_void_Static_0001
     * @tc.desc      functiontest baseFunctionTest1-9 void calls with primitives should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest1_9_void_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest1_9_void_Static_0001 start');
      let pass: boolean = true;
      try {
        ns_alltest.functiontest.baseFunctionTest1();
        ns_alltest.functiontest.baseFunctionTest2(127);
        ns_alltest.functiontest.baseFunctionTest3(32767);
        ns_alltest.functiontest.baseFunctionTest4(100000);
        ns_alltest.functiontest.baseFunctionTest5(1234567890);
        ns_alltest.functiontest.baseFunctionTest6(3.14f);
        ns_alltest.functiontest.baseFunctionTest7(3.14159);
        ns_alltest.functiontest.baseFunctionTest8("hello");
        ns_alltest.functiontest.baseFunctionTest9(true);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest1_9_void failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest1_9_void_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest1_9_void_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest10-15 void noreturn with containers ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC74_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest10_15_void_Static_0001
     * @tc.desc      functiontest baseFunctionTest10-15 void calls with containers should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest10_15_void_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest10_15_void_Static_0001 start');
      let pass: boolean = true;
      try {
        let arr10: Array<byte> = [1, 2, 3];
        ns_alltest.functiontest.baseFunctionTest10(arr10);
        let arr11: Array<short> = [4, 5, 6];
        ns_alltest.functiontest.baseFunctionTest11(arr11);
        ns_alltest.functiontest.baseFunctionTest12(100);
        ns_alltest.functiontest.baseFunctionTest12(undefined);
        ns_alltest.functiontest.baseFunctionTest13(1000);
        ns_alltest.functiontest.baseFunctionTest13(undefined);
        let arr14: Array<byte> = [10, 20, 30];
        let arrbuf14: ArrayBuffer = new ArrayBuffer(arr14.length);
        for (let i = 0; i < arr14.length; i++) {
            arrbuf14.set(i, arr14[i]);
        }
        ns_alltest.functiontest.baseFunctionTest14(arrbuf14);
        let rec15: Record<string, int> = { "key1": 1, "key2": 2 };
        ns_alltest.functiontest.baseFunctionTest15(rec15);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest10_15_void failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest10_15_void_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest10_15_void_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest16-23 primitives return ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC75_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest16_23_return_Static_0001
     * @tc.desc      functiontest baseFunctionTest16-23 primitives return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest16_23_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest16_23_return_Static_0001 start');
      let pass: boolean = true;
      try {
        let r16 = ns_alltest.functiontest.baseFunctionTest16((110).toByte());
        expect(r16).assertEqual(120);
        let r17 = ns_alltest.functiontest.baseFunctionTest17(10);
        expect(r17).assertEqual(100);
        let r18 = ns_alltest.functiontest.baseFunctionTest18(10);
        expect(r18).assertEqual(1000);
        let r19 = ns_alltest.functiontest.baseFunctionTest19(10);
        expect(r19).assertEqual(100);
        let r20 = ns_alltest.functiontest.baseFunctionTest20(1.0);
        expect(r20).assertEqual(101.0);
        let r21 = ns_alltest.functiontest.baseFunctionTest21(1.0);
        expect(r21).assertEqual(2.01);
        let r22 = ns_alltest.functiontest.baseFunctionTest22("BaseFunctionTest22");
        expect(r22).assertEqual("BaseFunctionTest22hello ani");
        let r23t = ns_alltest.functiontest.baseFunctionTest23(true);
        expect(r23t).assertFalse();
        let r23f = ns_alltest.functiontest.baseFunctionTest23(false);
        expect(r23f).assertTrue();
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest16_23_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest16_23_return_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest16_23_return_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest24-29 containers return ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC76_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest24_29_container_return_Static_0001
     * @tc.desc      functiontest baseFunctionTest24-29 containers return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest24_29_container_return_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest24_29_container_return_Static_0001 start');
      let pass: boolean = true;
      try {
        let arr24: Array<byte> = [1, 2, 3, 4, 5];
        let r24: byte[] = ns_alltest.functiontest.baseFunctionTest24(arr24);
        let temp24: byte[] = [2, 4, 6, 8, 10];
        for (let i = 0; i < r24.length; i++) {
            expect(r24[i]).assertEqual(temp24[i]);
        }
        let arr25: Array<short> = [1, 2, 3, 4, 5];
        let r25 = ns_alltest.functiontest.baseFunctionTest25(arr25);
        let temp25: short[] = [3, 4, 5, 6, 7];
        for (let i = 0; i < r25.length; i++) {
            expect(r25[i]).assertEqual(temp25[i]);
        }
        let r26 = ns_alltest.functiontest.baseFunctionTest26((3276).toShort());
        expect(r26).assertEqual(3286);
        let r26u = ns_alltest.functiontest.baseFunctionTest26(undefined);
        expect(r26u).assertEqual(undefined);
        let r27 = ns_alltest.functiontest.baseFunctionTest27(922337203685477580);
        expect(r27).assertEqual(922337203685477590);
        let r27u = ns_alltest.functiontest.baseFunctionTest27(undefined);
        expect(r27u).assertEqual(undefined);
        let arr28: Array<byte> = [11, 2, 3, 4, 5];
        let arrbuf28: ArrayBuffer = new ArrayBuffer(arr28.length);
        for (let i = 0; i < arr28.length; i++) {
            arrbuf28.set(i, arr28[i]);
        }
        let r28 = ns_alltest.functiontest.baseFunctionTest28(arrbuf28);
        expect(r28.getByteLength()).assertEqual(5);
        for (let i = 0; i < r28.getByteLength(); i++) {
            expect(r28.at(i)).assertEqual(arr28[i] * 10);
        }
        let rec29: Record<string, int> = { "key1": 10, "key2": 20, "key3": 30 };
        let r29 = ns_alltest.functiontest.baseFunctionTest29(rec29);
        expect(r29.get("test0")).assertEqual(10);
        expect(r29.get("test1")).assertEqual(11);
        expect(r29.get("test2")).assertEqual(12);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest24_29_container_return failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest24_29_container_return_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest24_29_container_return_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest30-31 enum ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC77_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest30_31_enum_Static_0001
     * @tc.desc      functiontest baseFunctionTest30-31 enum functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest30_31_enum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest30_31_enum_Static_0001 start');
      let pass: boolean = true;
      try {
        let r30 = ns_alltest.functiontest.baseFunctionTest30(ns_alltest.functiontest.Color.BLUE);
        expect(r30).assertEqual(ns_alltest.functiontest.Color.RED);
        ns_alltest.functiontest.baseFunctionTest31(ns_alltest.functiontest.Color.RED);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest30_31_enum failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest30_31_enum_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest30_31_enum_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest32-41 multi-param ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC78_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest32_35_multi_Static_0001
     * @tc.desc      functiontest baseFunctionTest32-35 multi-param return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest32_35_multi_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest32_35_multi_Static_0001 start');
      let pass: boolean = true;
      try {
        let r32 = ns_alltest.functiontest.baseFunctionTest32(1, 2, 3, 4, true);
        expect(r32).assertEqual(2);
        let r32f = ns_alltest.functiontest.baseFunctionTest32((127).toByte(), (100).toShort(), 256, 10000, false);
        expect(r32f).assertEqual(127);
        let r33 = ns_alltest.functiontest.baseFunctionTest33(1, 2, 3, 4, true);
        expect(r33).assertEqual(3);
        let r33f = ns_alltest.functiontest.baseFunctionTest33((127).toByte(), (100).toShort(), 256, 10000, false);
        expect(r33f).assertEqual(100);
        let r34 = ns_alltest.functiontest.baseFunctionTest34(1, 2, 3, 4, true);
        expect(r34).assertEqual(4);
        let r34f = ns_alltest.functiontest.baseFunctionTest34((127).toByte(), (100).toShort(), 256, 10000, false);
        expect(r34f).assertEqual(100);
        let r35 = ns_alltest.functiontest.baseFunctionTest35(1, 2, 3, 4, true);
        expect(r35).assertEqual(1);
        let r35f = ns_alltest.functiontest.baseFunctionTest35((127).toByte(), (100).toShort(), 256, 10000, false);
        expect(r35f).assertEqual(100);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest32_35_multi failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest32_35_multi_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest32_35_multi_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC79_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest36_40_complex_Static_0001
     * @tc.desc      functiontest baseFunctionTest36-40 complex multi-param functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest36_40_complex_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest36_40_complex_Static_0001 start');
      let pass: boolean = true;
      try {
        let arr9: Array<byte> = [1, 2, 3, 4, 5];
        let arr10_64: Array<long> = [9223372036854775807, -100, 121, -2147483648, -9223372036854775808];
        let r36 = ns_alltest.functiontest.baseFunctionTest36(10, 11, true, arr9, arr10_64);
        expect(r36.length).assertEqual(arr9.length);
        let temp36: int[] = [22, 23, 24, 25, 26];
        for (let i: int = 0; i < r36.length; i++) {
            expect(r36[i]).assertEqual(temp36[i]);
        }
        let r36f = ns_alltest.functiontest.baseFunctionTest36(127, 100, false, arr9, arr10_64);
        expect(r36f.length).assertEqual(arr10_64.length);
        let temp36f: int[] = [-1, -100, 121, -2147483648, 0];
        for (let i: int = 0; i < r36f.length; i++) {
            expect(r36f[i]).assertEqual(temp36f[i]);
        }
        let r37 = ns_alltest.functiontest.baseFunctionTest37(10, 11, 12, true, arr10_64);
        expect(r37.length).assertEqual(arr10_64.length);
        let temp37: long[] = [-9223372036854775776, -67, 154, -2147483615, -9223372036854775775];
        for (let i: int = 0; i < r37.length; i++) {
            expect(r37[i]).assertEqual(temp37[i]);
        }
        let byteArray38: Array<byte> = [1, 2, 3, 4, 5];
        let int16Array38: Array<short> = [100, -100, 121, -200, -500];
        let r38 = ns_alltest.functiontest.baseFunctionTest38(10, "test1", true, byteArray38, int16Array38);
        expect(r38).assertEqual("test110");
        let arr9_bool: Array<boolean> = [true, false, true, false, true];
        let arr10_i32: Array<int> = [922337, -100, 121, -2147483648, -92233720];
        let r39 = ns_alltest.functiontest.baseFunctionTest39(11, "test1", true, arr9_bool, arr10_i32);
        expect(r39).assertFalse();
        let arr9_40: Array<byte> = [1, 2, 3, 4, 5];
        let numbersU8: byte[] = [10, 20, 30, 40, 50];
        let arrbuf40: ArrayBuffer = new ArrayBuffer(numbersU8.length);
        for (let i = 0; i < numbersU8.length; i++) {
            arrbuf40.set(i, numbersU8[i]);
        }
        let r40 = ns_alltest.functiontest.baseFunctionTest40(-2.0002, "test1", true, arr9_40, arrbuf40);
        expect(r40.length).assertEqual(arr9_40.length);
        for (let i: int = 0; i < r40.length; i++) {
            expect(r40[i]).assertEqual(arr9_40[i] * 2);
        }
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest36_40_complex failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest36_40_complex_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest36_40_complex_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC80_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest41_void_Static_0001
     * @tc.desc      functiontest.baseFunctionTest41() multi-param void should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest41_void_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest41_void_Static_0001 start');
      let pass: boolean = true;
      try {
        ns_alltest.functiontest.baseFunctionTest41(1, 2, 3, 4, 5.0);
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest41_void failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest41_void_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest41_void_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest42 overloads ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC81_STATIC_0100
     * @tc.name      test_functiontest_BaseFunctionTest42_all_overloads_Static_0001
     * @tc.desc      functiontest BaseFunctionTest42 all 4 overload variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_BaseFunctionTest42_all_overloads_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_BaseFunctionTest42_all_overloads_Static_0001 start');
      let pass: boolean = true;
      try {
        let r_int = ns_alltest.functiontest.BaseFunctionTest42(10000, (256).toShort());
        expect(r_int).assertEqual(10256);
        let record: Record<string, int> = { "test1": 0, "test2": 1, "test3": 2 };
        let r_container = ns_alltest.functiontest.BaseFunctionTest42(10000, record);
        expect(r_container).assertEqual(10010);
        let r_container_u = ns_alltest.functiontest.BaseFunctionTest42(undefined, record);
        expect(r_container_u).assertEqual(-2147483648);
        let r_void = ns_alltest.functiontest.BaseFunctionTest42();
        expect(r_void).assertEqual(2147483647);
        let data: ns_alltest.functiontest.Data = { data1: "BaseFunctionTest42", data2: true, data3: 2147483647 };
        ns_alltest.functiontest.BaseFunctionTest42(data);
      } catch (e) {
        pass = false;
        console.log('functiontest_BaseFunctionTest42_all_overloads failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_BaseFunctionTest42_all_overloads_Static_0001 done');
      done();
      console.log('test_functiontest_BaseFunctionTest42_all_overloads_Static_0001 end');
    });

    // ============ functiontest namespace - BaseFunctionTest59-60 Record params ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC82_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest59_60_record_Static_0001
     * @tc.desc      functiontest baseFunctionTest59-60 Record parameter functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest59_60_record_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest59_60_record_Static_0001 start');
      let pass: boolean = true;
      try {
        let map59: Record<string, string> = { "key1": "value1", "key2": "value2" };
        ns_alltest.functiontest.baseFunctionTest59(map59);
        let map60: Record<Long, boolean> = { 1: true, 2: false };
        let r60 = ns_alltest.functiontest.baseFunctionTest60(map60);
        expect(r60).assertTrue();
        let map60f: Record<Long, boolean> = { 50: false, 10: true, 20: false, 0: true };
        let r60f = ns_alltest.functiontest.baseFunctionTest60(map60f);
        expect(r60f).assertFalse();
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest59_60_record failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest59_60_record_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest59_60_record_Static_0001 end');
    });

    // ============ functiontest namespace - TestNameSpace interface ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC83_STATIC_0100
     * @tc.name      test_functiontest_get_interface_TestNameSpace_Static_0001
     * @tc.desc      functiontest.get_interface_NameSpace() returns TestNameSpace instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_get_interface_TestNameSpace_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_get_interface_TestNameSpace_Static_0001 start');
      let pass: boolean = true;
      try {
        let ns = ns_alltest.functiontest.get_interface_NameSpace();
      } catch (e) {
        pass = false;
        console.log('functiontest_get_interface_TestNameSpace failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_get_interface_TestNameSpace_Static_0001 done');
      done();
      console.log('test_functiontest_get_interface_TestNameSpace_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC84_STATIC_0100
     * @tc.name      test_functiontest_TestNameSpace_all_methods_Static_0001
     * @tc.desc      functiontest TestNameSpace interface all methods and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_TestNameSpace_all_methods_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_TestNameSpace_all_methods_Static_0001 start');
      let pass: boolean = true;
      try {
        let ns = ns_alltest.functiontest.get_interface_NameSpace();
        ns.baseFunctionTest43();
        let r44 = ns.baseFunctionTest44((-10).toByte());
        expect(r44).assertEqual(90);
        let r45 = ns.baseFunctionTest45(320);
        expect(r45).assertEqual(32000);
        let r46 = ns.baseFunctionTest46(2147483);
        expect(r46).assertEqual(214748300);
        let r47 = ns.baseFunctionTest47(9223372036854775);
        expect(r47).assertEqual(922337203685477500);
        let r48 = ns.baseFunctionTest48((100.123).toFloat());
        expect(r48).assertEqual((90.123).toFloat());
        let r49 = ns.baseFunctionTest49(200.66);
        expect(r49).assertEqual(100.66);
        let r50 = ns.baseFunctionTest50("testCasebaseFunctionTest53");
        expect(r50).assertEqual("testCasebaseFunctionTest53BaseFunctionTest50");
        let r51 = ns.baseFunctionTest51(true);
        expect(r51).assertFalse();
        let r51f = ns.baseFunctionTest51(false);
        expect(r51f).assertTrue();
        let r52 = ns.baseFunctionTest52(new ArrayBuffer(5));
        expect(r52.getByteLength()).assertEqual(5);
        let r53 = ns.baseFunctionTest53((101).toByte());
        expect(r53).assertEqual(1);
        let r53u = ns.baseFunctionTest53(undefined);
        expect(r53u).assertEqual(undefined);
        let r54 = ns.baseFunctionTest54(2147483647);
        expect(r54).assertEqual(2147483547);
        let r54u = ns.baseFunctionTest54(undefined);
        expect(r54u).assertEqual(undefined);
        let r55 = ns.baseFunctionTest55({});
        let keys = Object.keys(r55);
        expect(keys.length).assertEqual(0);
        let r56 = ns.baseFunctionTest56(100);
        expect(r56).assertEqual(10000);
        let r57 = ns.baseFunctionTest57((127).toByte());
        expect(r57).assertEqual(12700);
        let testStr: string = ns.testStr;
        expect(testStr).assertEqual("testNameSpace");
        let r58 = ns.baseFunctionTest58(true);
        expect(r58.success).assertTrue();
        expect(r58.errorCode).assertEqual(10000);
        expect(r58.errorMessage).assertEqual("test58");
        let r58f = ns.baseFunctionTest58(false);
        expect(r58f.success).assertFalse();
        expect(r58f.errorCode).assertEqual(100);
        expect(r58f.errorMessage).assertEqual("test581");
      } catch (e) {
        pass = false;
        console.log('functiontest_TestNameSpace_all_methods failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_TestNameSpace_all_methods_Static_0001 done');
      done();
      console.log('test_functiontest_TestNameSpace_all_methods_Static_0001 end');
    });

    // ============ functiontest namespace - TestInterfacePerformance1-20 ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC85_STATIC_0100
     * @tc.name      test_functiontest_performance1_10_Static_0001
     * @tc.desc      functiontest TestInterfacePerformance1-10 interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_performance1_10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_performance1_10_Static_0001 start');
      let pass: boolean = true;
      try {
        let perf1 = ns_alltest.functiontest.get_interface_performance1();
        perf1.basePerformanceFunctionTest1();
        let r1 = perf1.basePerformanceFunctionTest2((95).toByte());
        expect(r1).assertEqual(10);
        let perf2 = ns_alltest.functiontest.get_interface_performance2();
        let r2 = perf2.basePerformanceFunctionTest2((95).toByte());
        expect(r2).assertEqual(10);
        let perf3 = ns_alltest.functiontest.get_interface_performance3();
        let r3 = perf3.basePerformanceFunctionTest2((95).toByte());
        expect(r3).assertEqual(10);
        let perf4 = ns_alltest.functiontest.get_interface_performance4();
        let r4 = perf4.basePerformanceFunctionTest2((95).toByte());
        expect(r4).assertEqual(10);
        let perf5 = ns_alltest.functiontest.get_interface_performance5();
        let r5 = perf5.basePerformanceFunctionTest2((95).toByte());
        expect(r5).assertEqual(10);
        let perf6 = ns_alltest.functiontest.get_interface_performance6();
        let r6 = perf6.basePerformanceFunctionTest2((95).toByte());
        expect(r6).assertEqual(10);
        let perf7 = ns_alltest.functiontest.get_interface_performance7();
        let r7 = perf7.basePerformanceFunctionTest2((95).toByte());
        expect(r7).assertEqual(10);
        let perf8 = ns_alltest.functiontest.get_interface_performance8();
        let r8 = perf8.basePerformanceFunctionTest2((95).toByte());
        expect(r8).assertEqual(10);
        let perf9 = ns_alltest.functiontest.get_interface_performance9();
        let r9 = perf9.basePerformanceFunctionTest2((95).toByte());
        expect(r9).assertEqual(10);
        let perf10 = ns_alltest.functiontest.get_interface_performance10();
        let r10 = perf10.basePerformanceFunctionTest2((95).toByte());
        expect(r10).assertEqual(10);
      } catch (e) {
        pass = false;
        console.log('functiontest_performance1_10 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_performance1_10_Static_0001 done');
      done();
      console.log('test_functiontest_performance1_10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC86_STATIC_0100
     * @tc.name      test_functiontest_performance11_20_Static_0001
     * @tc.desc      functiontest TestInterfacePerformance11-20 interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_performance11_20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_performance11_20_Static_0001 start');
      let pass: boolean = true;
      try {
        let perf11 = ns_alltest.functiontest.get_interface_performance11();
        let r11 = perf11.basePerformanceFunctionTest2((95).toByte());
        expect(r11).assertEqual(10);
        let perf12 = ns_alltest.functiontest.get_interface_performance12();
        let r12 = perf12.basePerformanceFunctionTest2((95).toByte());
        expect(r12).assertEqual(10);
        let perf13 = ns_alltest.functiontest.get_interface_performance13();
        let r13 = perf13.basePerformanceFunctionTest2((95).toByte());
        expect(r13).assertEqual(10);
        let perf14 = ns_alltest.functiontest.get_interface_performance14();
        let r14 = perf14.basePerformanceFunctionTest2((95).toByte());
        expect(r14).assertEqual(10);
        let perf15 = ns_alltest.functiontest.get_interface_performance15();
        let r15 = perf15.basePerformanceFunctionTest2((95).toByte());
        expect(r15).assertEqual(10);
        let perf16 = ns_alltest.functiontest.get_interface_performance16();
        let r16 = perf16.basePerformanceFunctionTest2((95).toByte());
        expect(r16).assertEqual(10);
        let perf17 = ns_alltest.functiontest.get_interface_performance17();
        let r17 = perf17.basePerformanceFunctionTest2((95).toByte());
        expect(r17).assertEqual(10);
        let perf18 = ns_alltest.functiontest.get_interface_performance18();
        let r18 = perf18.basePerformanceFunctionTest2((95).toByte());
        expect(r18).assertEqual(10);
        let perf19 = ns_alltest.functiontest.get_interface_performance19();
        let r19 = perf19.basePerformanceFunctionTest2((95).toByte());
        expect(r19).assertEqual(10);
        let perf20 = ns_alltest.functiontest.get_interface_performance20();
        let r20 = perf20.basePerformanceFunctionTest2((95).toByte());
        expect(r20).assertEqual(10);
      } catch (e) {
        pass = false;
        console.log('functiontest_performance11_20 failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_performance11_20_Static_0001 done');
      done();
      console.log('test_functiontest_performance11_20_Static_0001 end');
    });

    // ============ functiontest namespace - TestInterfacePerformance21 ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC87_STATIC_0100
     * @tc.name      test_functiontest_performance21_all_getters_Static_0001
     * @tc.desc      functiontest TestInterfacePerformance21 all getters and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_performance21_all_getters_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_performance21_all_getters_Static_0001 start');
      let pass: boolean = true;
      try {
        let perf21 = ns_alltest.functiontest.get_interface_performance21();
        let i32: int = perf21.i32_test;
        expect(i32).assertEqual(2147483647);
        let s = perf21.struct_test;
        expect(s.data1).assertEqual("testStruct");
        expect(s.data2).assertFalse();
        expect(s.data3).assertEqual(-2147483648);
        let r2 = perf21.basePerformanceFunctionTest2((10).toByte());
        expect(r2).assertEqual((110).toByte());
        let i8: byte = perf21.i8_test_attribute;
        expect(i8).assertEqual(127);
        let i16: short = perf21.i16_test_attribute;
        expect(i16).assertEqual(32767);
        let i32_attr: int = perf21.i32_test_attribute;
        expect(i32_attr).assertEqual(2147483647);
        let i64: long = perf21.i64_test_attribute;
        expect(i64).assertEqual(9223372036854775807);
        let f32: float = perf21.f32_test_attribute;
        expect(f32).assertEqual((3.14).toFloat());
        let f64: double = perf21.f64_test_attribute;
        expect(f64).assertEqual(-1.23);
        let str: string = perf21.str_test_attribute;
        expect(str).assertEqual("TESTSTR");
        let flag: boolean = perf21.bool_test_attribute;
        expect(flag).assertFalse();
        let arrbuf = perf21._ArrayBuffer_test_attribute;
        expect(arrbuf.getByteLength()).assertEqual(10);
        for (let i = 0; i < arrbuf.getByteLength(); i++) {
            expect(arrbuf.at(i)).assertEqual(10);
        }
        let opt = perf21.optional_test_attribute;
        expect(opt).assertEqual(1010);
        let rec = perf21.record_test_attribute;
        let rec100 = rec.get(100);
        expect(rec100!.data1).assertEqual("one");
        expect(rec100!.data2).assertTrue();
        expect(rec100!.data3).assertEqual(100);
        let rec101 = rec.get(101);
        expect(rec101!.data1).assertEqual("two");
        expect(rec101!.data2).assertFalse();
        expect(rec101!.data3).assertEqual(101);
        let union_val = perf21.union_test_attribute;
        expect(union_val).assertEqual(100);
        let arr_attr = perf21.array_test_attribute;
        expect(arr_attr.length).assertEqual(1);
        expect(arr_attr[0]).assertTrue();
        let en = perf21.enum_test_attribute;
        expect(en).assertEqual(ns_alltest.functiontest.Color.GREEN);
      } catch (e) {
        pass = false;
        console.log('functiontest_performance21_all_getters failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_performance21_all_getters_Static_0001 done');
      done();
      console.log('test_functiontest_performance21_all_getters_Static_0001 end');
    });

    // ============ functiontest namespace - IbaseInterface inheritance ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC88_STATIC_0100
     * @tc.name      test_functiontest_ibaseInterface_inheritance_Static_0001
     * @tc.desc      functiontest IbaseInterface2 and IbaseInterface3 inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_ibaseInterface_inheritance_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_ibaseInterface_inheritance_Static_0001 start');
      let pass: boolean = true;
      try {
        let iface2 = ns_alltest.functiontest.get_interface_IbaseInterface2();
        let bt = iface2.baseTest();
        expect(bt).assertEqual(-2147483648);
        let bt1 = iface2.baseTest1();
        expect(bt1).assertEqual("TestInterface");
        let iface3 = ns_alltest.functiontest.get_interface_IbaseInterface3();
        let bt3 = iface3.baseTest();
        expect(bt3).assertEqual(2147483647);
        let bt2 = iface3.baseTest2();
        expect(bt2).assertTrue();
      } catch (e) {
        pass = false;
        console.log('functiontest_ibaseInterface_inheritance failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_ibaseInterface_inheritance_Static_0001 done');
      done();
      console.log('test_functiontest_ibaseInterface_inheritance_Static_0001 end');
    });

    // ============ functiontest namespace - Overflow edge cases ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC89_STATIC_0100
     * @tc.name      test_functiontest_overflow_Static_0001
     * @tc.desc      functiontest overflow edge cases for baseFunctionTest16-18 and 42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_overflow_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_overflow_Static_0001 start');
      let pass: boolean = true;
      try {
        let caught16: boolean = false;
        try {
          ns_alltest.functiontest.baseFunctionTest16((127).toByte());
        } catch (e) {
          caught16 = true;
        }
        if (!caught16) {
          pass = false;
        }
        let caught17: boolean = false;
        try {
          ns_alltest.functiontest.baseFunctionTest17((32767).toShort());
        } catch (e) {
          caught17 = true;
        }
        if (!caught17) {
          pass = false;
        }
        let caught18: boolean = false;
        try {
          ns_alltest.functiontest.baseFunctionTest18(21474837);
        } catch (e) {
          caught18 = true;
        }
        if (!caught18) {
          pass = false;
        }
        let caught42: boolean = false;
        try {
          ns_alltest.functiontest.BaseFunctionTest42(2147483647, (256).toShort());
        } catch (e) {
          caught42 = true;
        }
        if (!caught42) {
          pass = false;
        }
      } catch (e) {
        pass = false;
        console.log('functiontest_overflow failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_overflow_Static_0001 done');
      done();
      console.log('test_functiontest_overflow_Static_0001 end');
    });

    // ============ functiontest namespace - String variant ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC90_STATIC_0100
     * @tc.name      test_functiontest_baseFunctionTest22_variant_Static_0001
     * @tc.desc      functiontest baseFunctionTest22 with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_baseFunctionTest22_variant_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_baseFunctionTest22_variant_Static_0001 start');
      let pass: boolean = true;
      try {
        let r22 = ns_alltest.functiontest.baseFunctionTest22("baseFunctionTest22——1");
        expect(r22).assertEqual("baseFunctionTest22——1");
        let r22s = ns_alltest.functiontest.baseFunctionTest22("baseFunctionTest22!@#$%%^&*()");
        expect(r22s).assertEqual("baseFunctionTest22!@#$%%^&*()");
      } catch (e) {
        pass = false;
        console.log('functiontest_baseFunctionTest22_variant failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_baseFunctionTest22_variant_Static_0001 done');
      done();
      console.log('test_functiontest_baseFunctionTest22_variant_Static_0001 end');
    });

    // ============ functiontest namespace - Color enum standalone ============

    /**
     * @tc.number    SUB_Taihe_Namespace_FUNC91_STATIC_0100
     * @tc.name      test_functiontest_Color_enum_Static_0001
     * @tc.desc      functiontest Color enum values should be accessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functiontest_Color_enum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_functiontest_Color_enum_Static_0001 start');
      let pass: boolean = true;
      try {
        expect(ns_alltest.functiontest.Color.RED).assertEqual("Red");
        expect(ns_alltest.functiontest.Color.GREEN).assertEqual("Green");
        expect(ns_alltest.functiontest.Color.BLUE).assertEqual("Blue");
      } catch (e) {
        pass = false;
        console.log('functiontest_Color_enum failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_functiontest_Color_enum_Static_0001 done');
      done();
      console.log('test_functiontest_Color_enum_Static_0001 end');
    });
  });
}