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

export default function recordOutputMapTest(): void {
  describe("ActsRecordOutputMapTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc26_STATIC_0100
     * @tc.name      test_Record_Mapfunc26_Static_0001
     * @tc.desc      Test Mapfunc26 returns Record<string, boolean>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc26_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc26_Static_0001 start');
      let result: Record<string, boolean> = record_test.mapfunc26();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc26_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc26_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc27_STATIC_0100
     * @tc.name      test_Record_Mapfunc27_Static_0001
     * @tc.desc      Test Mapfunc27 returns Record<string, byte>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc27_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc27_Static_0001 start');
      let result: Record<string, byte> = record_test.mapfunc27();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc27_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc27_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc28_STATIC_0100
     * @tc.name      test_Record_Mapfunc28_Static_0001
     * @tc.desc      Test Mapfunc28 returns Record<string, short>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc28_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc28_Static_0001 start');
      let result: Record<string, short> = record_test.mapfunc28();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc28_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc28_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc29_STATIC_0100
     * @tc.name      test_Record_Mapfunc29_Static_0001
     * @tc.desc      Test Mapfunc29 returns Record<string, int>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc29_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc29_Static_0001 start');
      let result: Record<string, int> = record_test.mapfunc29();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc29_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc29_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc30_STATIC_0100
     * @tc.name      test_Record_Mapfunc30_Static_0001
     * @tc.desc      Test Mapfunc30 returns Record<string, long>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc30_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc30_Static_0001 start');
      let result: Record<string, long> = record_test.mapfunc30();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc30_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc30_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc31_STATIC_0100
     * @tc.name      test_Record_Mapfunc31_Static_0001
     * @tc.desc      Test Mapfunc31 returns Record<string, float>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc31_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc31_Static_0001 start');
      let result: Record<string, float> = record_test.mapfunc31();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc31_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc31_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc32_STATIC_0100
     * @tc.name      test_Record_Mapfunc32_Static_0001
     * @tc.desc      Test Mapfunc32 returns Record<string, double>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc32_Static_0001 start');
      let result: Record<string, double> = record_test.mapfunc32();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc32_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc33_STATIC_0100
     * @tc.name      test_Record_Mapfunc33_Static_0001
     * @tc.desc      Test Mapfunc33 returns Record<string, string>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc33_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc33_Static_0001 start');
      let result: Record<string, string> = record_test.mapfunc33();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc33_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc33_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc34_STATIC_0100
     * @tc.name      test_Record_Mapfunc34_Static_0001
     * @tc.desc      Test Mapfunc34 returns Record<string, byte[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc34_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc34_Static_0001 start');
      let result: Record<string, byte[]> = record_test.mapfunc34();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc34_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc34_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc35_STATIC_0100
     * @tc.name      test_Record_Mapfunc35_Static_0001
     * @tc.desc      Test Mapfunc35 returns Record<string, short[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc35_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc35_Static_0001 start');
      let result: Record<string, short[]> = record_test.mapfunc35();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc35_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc35_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc36_STATIC_0100
     * @tc.name      test_Record_Mapfunc36_Static_0001
     * @tc.desc      Test Mapfunc36 returns Record<string, int[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc36_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc36_Static_0001 start');
      let result: Record<string, int[]> = record_test.mapfunc36();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc36_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc36_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc37_STATIC_0100
     * @tc.name      test_Record_Mapfunc37_Static_0001
     * @tc.desc      Test Mapfunc37 returns Record<string, long[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc37_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc37_Static_0001 start');
      let result: Record<string, long[]> = record_test.mapfunc37();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc37_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc37_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc38_STATIC_0100
     * @tc.name      test_Record_Mapfunc38_Static_0001
     * @tc.desc      Test Mapfunc38 returns Record<string, ArrayBuffer>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc38_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc38_Static_0001 start');
      let result: Record<string, ArrayBuffer> = record_test.mapfunc38();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc38_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc38_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc39_STATIC_0100
     * @tc.name      test_Record_Mapfunc39_Static_0001
     * @tc.desc      Test Mapfunc39 returns Record<string, boolean[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc39_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc39_Static_0001 start');
      let result: Record<string, boolean[]> = record_test.mapfunc39();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc39_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc39_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc40_STATIC_0100
     * @tc.name      test_Record_Mapfunc40_Static_0001
     * @tc.desc      Test Mapfunc40 returns Record<string, string[]>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc40_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc40_Static_0001 start');
      let result: Record<string, string[]> = record_test.mapfunc40();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc40_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc40_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc41_STATIC_0100
     * @tc.name      test_Record_Mapfunc41_Static_0001
     * @tc.desc      Test Mapfunc41 returns Record<string, TypeUnion>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc41_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc41_Static_0001 start');
      let result: Record<string, (int|boolean|string)> = record_test.mapfunc41();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc41_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc41_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc42_STATIC_0100
     * @tc.name      test_Record_Mapfunc42_Static_0001
     * @tc.desc      Test Mapfunc42 returns Record<string, record_test.Color>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc42_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc42_Static_0001 start');
      let result: Record<string, record_test.Color> = record_test.mapfunc42();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc42_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc42_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc43_STATIC_0100
     * @tc.name      test_Record_Mapfunc43_Static_0001
     * @tc.desc      Test Mapfunc43 returns Record<string, record_test.Pair>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc43_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc43_Static_0001 start');
      let result: Record<string, record_test.Pair> = record_test.mapfunc43();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc43_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc43_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc44_STATIC_0100
     * @tc.name      test_Record_Mapfunc44_Static_0001
     * @tc.desc      Test Mapfunc44 returns Record<string, record_test.ICpuZero>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc44_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc44_Static_0001 start');
      let result: Record<string, record_test.ICpuZero> = record_test.mapfunc44();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc44_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc44_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc45_STATIC_0100
     * @tc.name      test_Record_Mapfunc45_Static_0001
     * @tc.desc      Test Mapfunc45 returns Record<string, record_test.ICpuInfo>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc45_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc45_Static_0001 start');
      let result: Record<string, record_test.ICpuInfo> = record_test.mapfunc45();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc45_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc45_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc46_STATIC_0100
     * @tc.name      test_Record_Mapfunc46_Static_0001
     * @tc.desc      Test Mapfunc46 returns Record<string, Object>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc46_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc46_Static_0001 start');
      let result: Record<string, Object> = record_test.mapfunc46();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc46_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc46_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc47_STATIC_0100
     * @tc.name      test_Record_Mapfunc47_Static_0001
     * @tc.desc      Test Mapfunc47 returns nested Record<string, Record<string, boolean>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc47_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc47_Static_0001 start');
      let result: Record<string, Record<string, boolean>> = record_test.mapfunc47();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc47_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc47_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc48_STATIC_0100
     * @tc.name      test_Record_Mapfunc48_Static_0001
     * @tc.desc      Test Mapfunc48 returns nested Record<string, Record<string, int>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc48_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc48_Static_0001 start');
      let result: Record<string, Record<string, int>> = record_test.mapfunc48();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc48_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc48_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc49_STATIC_0100
     * @tc.name      test_Record_Mapfunc49_Static_0001
     * @tc.desc      Test Mapfunc49 returns nested Record<string, Record<string, int[]>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc49_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc49_Static_0001 start');
      let result: Record<string, Record<string, int[]>> = record_test.mapfunc49();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc49_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc49_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc50_STATIC_0100
     * @tc.name      test_Record_Mapfunc50_Static_0001
     * @tc.desc      Test Mapfunc50 returns nested Record<string, Record<string, string>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc50_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc50_Static_0001 start');
      let result: Record<string, Record<string, string>> = record_test.mapfunc50();
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc50_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc50_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_Mapfunc51_STATIC_0100
     * @tc.name      test_Record_Mapfunc51_Static_0001
     * @tc.desc      Test Mapfunc51 with Optional<Record<string, string>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_Mapfunc51_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_Mapfunc51_Static_0001 start');
      let testData: Record<string, string> = {"key1": "value1", "key2": "value2"};
      let result: Record<string, Record<string, string>> = record_test.mapfunc51(testData);
      expect(result.has("key1")).assertTrue();
      console.log('test_Record_Mapfunc51_Static_0001 done');
      done();
      console.log('test_Record_Mapfunc51_Static_0001 end');
    });
  });
}