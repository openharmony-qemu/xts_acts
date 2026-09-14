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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as record_test from '../ets/record_test';

export default function recordInputMapTest(): void {
  describe("ActsRecordInputMapTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc01_STATIC_0100
     * @tc.name      test_Record_Mapfunc01_Static_0001
     * @tc.desc      Test Mapfunc01 with Record<string, boolean>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc01_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc01_Static_0001 start');
      let testData: Record<string, boolean> = {"key1": true, "key2": false};
      let result: boolean = record_test.mapfunc01(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc01_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc01_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc02_STATIC_0100
     * @tc.name      test_Record_Mapfunc02_Static_0001
     * @tc.desc      Test Mapfunc02 with Record<string, byte>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc02_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc02_Static_0001 start');
      let testData: Record<string, byte> = {"key1": (123).toByte(), "key2": (45).toByte()};
      let result: boolean = record_test.mapfunc02(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc02_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc02_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc03_STATIC_0100
     * @tc.name      test_Record_Mapfunc03_Static_0001
     * @tc.desc      Test Mapfunc03 with Record<string, short>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc03_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc03_Static_0001 start');
      let testData: Record<string, short> = {
        "key1": (1234).toShort(),
        "key2": (5678).toShort(),
      };
      let result: boolean = record_test.mapfunc03(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc03_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc03_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc04_STATIC_0100
     * @tc.name      test_Record_Mapfunc04_Static_0001
     * @tc.desc      Test Mapfunc04 with Record<string, int>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc04_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc04_Static_0001 start');
      let testData: Record<string, int> = {
        "key1": (12345).toInt(),
        "key2": (67890).toInt(),
      };
      let result: boolean = record_test.mapfunc04(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc04_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc04_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc05_STATIC_0100
     * @tc.name      test_Record_Mapfunc05_Static_0001
     * @tc.desc      Test Mapfunc05 with Record<string, long>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc05_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc05_Static_0001 start');
      let testData: Record<string, long> = {
        "key1": (123456).toLong(),
        "key2": (789012).toLong(),
      };
      let result: boolean = record_test.mapfunc05(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc05_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc05_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc06_STATIC_0100
     * @tc.name      test_Record_Mapfunc06_Static_0001
     * @tc.desc      Test Mapfunc06 with Record<string, float>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc06_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc06_Static_0001 start');
      let testData: Record<string, float> = {"key1": 123.45f, "key2": 67.89f};
      let result: boolean = record_test.mapfunc06(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc06_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc06_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc07_STATIC_0100
     * @tc.name      test_Record_Mapfunc07_Static_0001
     * @tc.desc      Test Mapfunc07 with Record<string, double>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc07_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc07_Static_0001 start');
      let testData: Record<string, double> = {
        "key1": (123.456).toDouble(),
        "key2": (789.012).toDouble(),
      };
      let result: boolean = record_test.mapfunc07(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc07_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc07_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc08_STATIC_0100
     * @tc.name      test_Record_Mapfunc08_Static_0001
     * @tc.desc      Test Mapfunc08 with Record<string, string>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc08_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc08_Static_0001 start');
      let testData: Record<string, string> = {"key1": "value1", "key2": "value2"};
      let result: boolean = record_test.mapfunc08(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc08_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc08_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc09_STATIC_0100
     * @tc.name      test_Record_Mapfunc09_Static_0001
     * @tc.desc      Test Mapfunc09 with Record<string, byte[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc09_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc09_Static_0001 start');
      let testData: Record<string, byte[]> = {
        "key1": [(1).toByte(), (2).toByte(), (3).toByte()],
        "key2": [(4).toByte(), (5).toByte(), (6).toByte()],
      };
      let result: boolean = record_test.mapfunc09(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc09_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc09_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc10_STATIC_0100
     * @tc.name      test_Record_Mapfunc10_Static_0001
     * @tc.desc      Test Mapfunc10 with Record<string, short[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc10_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc10_Static_0001 start');
      let testData: Record<string, short[]> = {
        "key1": [(123).toShort(), (456).toShort()],
        "key2": [(789).toShort(), (1011).toShort()],
      };
      let result: boolean = record_test.mapfunc10(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc10_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc10_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc11_STATIC_0100
     * @tc.name      test_Record_Mapfunc11_Static_0001
     * @tc.desc      Test Mapfunc11 with Record<string, int[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc11_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc11_Static_0001 start');
      let testData: Record<string, int[]> = {
        "key1": [(1234).toInt(), (5678).toInt()],
        "key2": [(9012).toInt(), (3456).toInt()],
      };
      let result: boolean = record_test.mapfunc11(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc11_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc11_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc12_STATIC_0100
     * @tc.name      test_Record_Mapfunc12_Static_0001
     * @tc.desc      Test Mapfunc12 with Record<string, long[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc12_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc12_Static_0001 start');
      let testData: Record<string, long[]> = {
        "key1": [(12345).toLong(), (67890).toLong()],
        "key2": [(11111).toLong(), (22222).toLong()],
      };
      let result: boolean = record_test.mapfunc12(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc12_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc12_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc13_STATIC_0100
     * @tc.name      test_Record_Mapfunc13_Static_0001
     * @tc.desc      Test Mapfunc13 with Record<string, ArrayBuffer[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc13_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc13_Static_0001 start');
      let testData: Record<string, ArrayBuffer[]> = {
        "key1": [new ArrayBuffer(8), new ArrayBuffer(8)],
        "key2": [new ArrayBuffer(8), new ArrayBuffer(8)],
      };
      let result: boolean = record_test.mapfunc13(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc13_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc13_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc14_STATIC_0100
     * @tc.name      test_Record_Mapfunc14_Static_0001
     * @tc.desc      Test Mapfunc14 with Record<string, boolean[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc14_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc14_Static_0001 start');
      let testData: Record<string, boolean[]> = {
        "key1": [true, false],
        "key2": [false, true],
      };
      let result: boolean = record_test.mapfunc14(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc14_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc14_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc15_STATIC_0100
     * @tc.name      test_Record_Mapfunc15_Static_0001
     * @tc.desc      Test Mapfunc15 with Record<string, string[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc15_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc15_Static_0001 start');
      let testData: Record<string, string[]> = {
        "key1": ["value1", "value2"],
        "key2": ["value3", "value4"],
      };
      let result: boolean = record_test.mapfunc15(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc15_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc15_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc16_STATIC_0100
     * @tc.name      test_Record_Mapfunc16_Static_0001
     * @tc.desc      Test Mapfunc16 with Record<string, TypeUnion>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc16_Static_0001 start');
      let testData: Record<string, (int|boolean|string)> = {
        "key1": 123,
        "key2": true,
        "key3": "value",
      };
      let result: boolean = record_test.mapfunc16(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc16_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc17_STATIC_0100
     * @tc.name      test_Record_Mapfunc17_Static_0001
     * @tc.desc      Test Mapfunc17 with Record<string, record_test.Color>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc17_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc17_Static_0001 start');
      let testData: Record<string, record_test.Color> = {"key1": record_test.Color.RED, "key2": record_test.Color.GREEN};
      let result: boolean = record_test.mapfunc17(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc17_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc17_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc18_STATIC_0100
     * @tc.name      test_Record_Mapfunc18_Static_0001
     * @tc.desc      Test Mapfunc18 with Record<string, record_test.Pair>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc18_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc18_Static_0001 start');
      let pair1: record_test.Pair = {a: "one", b: true};
      let pair2: record_test.Pair = {a: "two", b: false};
      let testData: Record<string, record_test.Pair> = {"key1": pair1, "key2": pair2};
      let result: boolean = record_test.mapfunc18(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc18_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc18_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc19_STATIC_0100
     * @tc.name      test_Record_Mapfunc19_Static_0001
     * @tc.desc      Test Mapfunc19 with Record<string, record_test.ICpuZero>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc19_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc19_Static_0001 start');
      let a: record_test.ICpuZero = record_test.makeICpuZero();
      let b: record_test.ICpuZero = record_test.makeICpuZero();
      let testData: Record<string, record_test.ICpuZero> = {"key1": a, "key2": b};
      let result: boolean = record_test.mapfunc19(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc19_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc19_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc20_STATIC_0100
     * @tc.name      test_Record_Mapfunc20_Static_0001
     * @tc.desc      Test Mapfunc20 with Record<string, record_test.ICpuInfo>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc20_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc20_Static_0001 start');
      let a: record_test.ICpuInfo = record_test.makeICpuInfo();
      let b: record_test.ICpuInfo = record_test.makeICpuInfo();
      let testData: Record<string, record_test.ICpuInfo> = {"key1": a, "key2": b};
      let result: boolean = record_test.mapfunc20(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc20_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc20_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc21_STATIC_0100
     * @tc.name      test_Record_Mapfunc21_Static_0001
     * @tc.desc      Test Mapfunc21 with Record<string, Object>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc21_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc21_Static_0001 start');
      let testData: Record<string, Object> = {"key1": "val1", "key2": "val2"};
      let result: boolean = record_test.mapfunc21(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc21_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc21_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc22_STATIC_0100
     * @tc.name      test_Record_Mapfunc22_Static_0001
     * @tc.desc      Test Mapfunc22 with nested Record<string, Record<string, boolean>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc22_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc22_Static_0001 start');
      let testData: Record<string, Record<string, boolean>> = {
        "key1": {"subkey1": true, "subkey2": false},
        "key2": {"subkey3": true, "subkey4": false},
      };
      let result: boolean = record_test.mapfunc22(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc22_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc22_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc23_STATIC_0100
     * @tc.name      test_Record_Mapfunc23_Static_0001
     * @tc.desc      Test Mapfunc23 with nested Record<string, Record<string, int>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc23_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc23_Static_0001 start');
      let testData: Record<string, Record<string, int>> = {
        "key1": {"subkey1": 100, "subkey2": 200},
        "key2": {"subkey3": 300, "subkey4": 400},
      };
      let result: boolean = record_test.mapfunc23(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc23_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc23_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc24_STATIC_0100
     * @tc.name      test_Record_Mapfunc24_Static_0001
     * @tc.desc      Test Mapfunc24 with nested Record<string, Record<string, int[]>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc24_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc24_Static_0001 start');
      let testData: Record<string, Record<string, int[]>> = {
        "key1": {"subkey1": [1, 2, 3], "subkey2": [4, 5, 6]},
        "key2": {"subkey3": [7, 8, 9], "subkey4": [10, 11, 12]},
      };
      let result: boolean = record_test.mapfunc24(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc24_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc24_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc25_STATIC_0100
     * @tc.name      test_Record_Mapfunc25_Static_0001
     * @tc.desc      Test Mapfunc25 with nested Record<string, Record<string, string>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc25_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc25_Static_0001 start');
      let testData: Record<string, Record<string, string>> = {
        "key1": {"subkey1": "value1", "subkey2": "value2"},
        "key2": {"subkey3": "value3", "subkey4": "value4"},
      };
      let result: boolean = record_test.mapfunc25(testData);
      expect(result).assertTrue();
      console.log('test_Record_Mapfunc25_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc25_Static_0001 end');
    });
  });
}