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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import {BusinessError} from '@ohos.base';
import * as record_test from '../ets/record_test';

export default function recordGlobalTest(): void {
  describe("ActsRecordGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Record_GetCpuSize_STATIC_0100
     * @tc.name      test_Record_GetCpuSize_Static_0001
     * @tc.desc      Test getCpuSize with Record<string, ICpu>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_GetCpuSize_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_GetCpuSize_Static_0001 start');
      let cpu0: record_test.ICpu = record_test.makeCpu();
      let cpu1: record_test.ICpu = record_test.makeCpu();
      let cpus: Record<string, record_test.ICpu> = {
        "cpu0": cpu0,
        "cpu1": cpu1,
      };
      let ret: int = record_test.getCpuSize(cpus);
      expect(ret).assertEqual(2);
      console.log('test_Record_GetCpuSize_Static_0001 done');
      done();
      console.log('test_Record_GetCpuSize_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_GetASize_STATIC_0100
     * @tc.name      test_Record_GetASize_Static_0001
     * @tc.desc      Test getASize with Record<int, Object>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_GetASize_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_GetASize_Static_0001 start');
      let a: Object = new Object();
      let b: Object = new Object();
      let c: Object = new Object();
      let abc: Record<int, Object> = {
        0: a,
        1: b,
        2: c,
      };
      let ret: int = record_test.getASize(abc);
      expect(ret).assertEqual(3);
      console.log('test_Record_GetASize_Static_0001 done');
      done();
      console.log('test_Record_GetASize_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_GetStringIntSize_STATIC_0100
     * @tc.name      test_Record_GetStringIntSize_Static_0001
     * @tc.desc      Test getStringIntSize with Record<string, int>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_GetStringIntSize_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_GetStringIntSize_Static_0001 start');
      let record: Record<string, int> = {
        "aaa": 0,
        "bbb": 1,
        "ccc": 2,
        "ddd": 3,
      };
      let ret: int = record_test.getStringIntSize(record);
      expect(ret).assertEqual(4);
      console.log('test_Record_GetStringIntSize_Static_0001 done');
      done();
      console.log('test_Record_GetStringIntSize_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_CreateStringString_STATIC_0100
     * @tc.name      test_Record_CreateStringString_Static_0001
     * @tc.desc      Test createStringString returns correct values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_CreateStringString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_CreateStringString_Static_0001 start');
      let strRecord: Record<string, string> = record_test.createStringString(5);
      expect(strRecord["0"]).assertEqual("abc");
      console.log('test_Record_CreateStringString_Static_0001 done');
      done();
      console.log('test_Record_CreateStringString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_GetMapFromArray_STATIC_0100
     * @tc.name      test_Record_GetMapFromArray_Static_0001
     * @tc.desc      Test getMapfromArray with Data array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_GetMapFromArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_GetMapFromArray_Static_0001 start');
      let d0: record_test.Data = {a: "a", b: 1};
      let d1: record_test.Data = {a: "b", b: 2};
      let d2: record_test.Data = {a: "c", b: 3};
      let data: record_test.Data[] = [d0, d1, d2];
      let dataRecord: Record<string, int> = record_test.getMapfromArray(data);
      expect(dataRecord["b"]).assertEqual(2);
      console.log('test_Record_GetMapFromArray_Static_0001 done');
      done();
      console.log('test_Record_GetMapFromArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_GetDataFromMap_STATIC_0100
     * @tc.name      test_Record_GetDataFromMap_Static_0001
     * @tc.desc      Test getDatafromMap with Record<string, Data>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_GetDataFromMap_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_GetDataFromMap_Static_0001 start');
      let data1: record_test.Data = {a: "aaa", b: 1};
      let data2: record_test.Data = {a: "bbb", b: 2};
      let data3: record_test.Data = {a: "ccc", b: 3};
      let drecord: Record<string, record_test.Data> = {
        "aa": data1,
        "bb": data2,
        "cc": data3,
      };
      let d: record_test.Data = record_test.getDatafromMap(drecord, "bb");
      expect(d.a).assertEqual("bbb");
      console.log('test_Record_GetDataFromMap_Static_0001 done');
      done();
      console.log('test_Record_GetDataFromMap_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Record_ForeachMap_STATIC_0100
     * @tc.name      test_Record_ForeachMap_Static_0001
     * @tc.desc      Test ForeachMap with Record<string, string>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Record_ForeachMap_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Record_ForeachMap_Static_0001 start');
      let recordStrForeach: Record<string, string> = {
        "key1": "v1",
        "key2": "v2",
        "key3": "v3",
        "key4": "v4",
      };
      expect(record_test.foreachMap(recordStrForeach)).assertUndefined();
      console.log('test_Record_ForeachMap_Static_0001 done');
      done();
      console.log('test_Record_ForeachMap_Static_0001 end');
    });
  });
}