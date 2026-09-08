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
import * as opt from '../ets/opt';

export default function optInterfaceTest(): void {
  describe("ActsOptInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalStringWithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalStringWithValue_Static_0001
     * @tc.desc      showOptionalString with a value should return the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalStringWithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalStringWithValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let str = "this is string data";
      let result = instance.showOptionalString(str);
      expect(result).assertEqual("this is string data");
      console.log('test_Opt_ShowOptionalStringWithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalStringWithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalStringWithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalStringWithoutValue_Static_0001
     * @tc.desc      showOptionalString with undefined should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalStringWithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalStringWithoutValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let result = instance.showOptionalString(undefined);
      expect(result).assertUndefined();
      console.log('test_Opt_ShowOptionalStringWithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalStringWithoutValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_SetIntData_STATIC_0100
     * @tc.name      test_Opt_SetIntData_Static_0001
     * @tc.desc      setIntData should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_SetIntData_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_SetIntData_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let caught: boolean = true;
      try {
        instance.setIntData("this is str");
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_Opt_SetIntData_Static_0001 done');
      done();
      console.log('test_Opt_SetIntData_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MemberStrPropertySetGet_STATIC_0100
     * @tc.name      test_Opt_MemberStrPropertySetGet_Static_0001
     * @tc.desc      set memberStr and get it should return the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MemberStrPropertySetGet_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MemberStrPropertySetGet_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      instance.memberStr = "this is string value";
      let res = instance.memberStr;
      expect(res).assertEqual("this is string value");
      console.log('test_Opt_MemberStrPropertySetGet_Static_0001 done');
      done();
      console.log('test_Opt_MemberStrPropertySetGet_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_MemberStrPropertySetUndefined_STATIC_0100
     * @tc.name      test_Opt_MemberStrPropertySetUndefined_Static_0001
     * @tc.desc      set memberStr to undefined and get it should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_MemberStrPropertySetUndefined_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_MemberStrPropertySetUndefined_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      instance.memberStr = undefined;
      let res = instance.memberStr;
      expect(res).assertUndefined();
      console.log('test_Opt_MemberStrPropertySetUndefined_Static_0001 done');
      done();
      console.log('test_Opt_MemberStrPropertySetUndefined_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalInt32WithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalInt32WithValue_Static_0001
     * @tc.desc      showOptionalInt32 with a value should return the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalInt32WithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalInt32WithValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalInt32(12);
      expect(res).assertEqual(12);
      console.log('test_Opt_ShowOptionalInt32WithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalInt32WithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalInt32WithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalInt32WithoutValue_Static_0001
     * @tc.desc      showOptionalInt32 with undefined should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalInt32WithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalInt32WithoutValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalInt32(undefined);
      expect(res).assertUndefined();
      console.log('test_Opt_ShowOptionalInt32WithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalInt32WithoutValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalBoolWithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalBoolWithValue_Static_0001
     * @tc.desc      showOptionalBool with a value should return the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalBoolWithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalBoolWithValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalBool(true);
      expect(res).assertTrue();
      console.log('test_Opt_ShowOptionalBoolWithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalBoolWithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalBoolWithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalBoolWithoutValue_Static_0001
     * @tc.desc      showOptionalBool with undefined should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalBoolWithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalBoolWithoutValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalBool(undefined);
      expect(res).assertUndefined();
      console.log('test_Opt_ShowOptionalBoolWithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalBoolWithoutValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalRecordWithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalRecordWithValue_Static_0001
     * @tc.desc      showOptionalRecord with a value should return the same record
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalRecordWithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalRecordWithValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let data: Record<string, boolean> = {"key1": false};
      let res = instance.showOptionalRecord(data);
      expect(res!["key1"]).assertFalse();
      console.log('test_Opt_ShowOptionalRecordWithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalRecordWithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalRecordWithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalRecordWithoutValue_Static_0001
     * @tc.desc      showOptionalRecord with undefined should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalRecordWithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalRecordWithoutValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalRecord(undefined);
      expect(res).assertUndefined();
      console.log('test_Opt_ShowOptionalRecordWithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalRecordWithoutValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalStructWithValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalStructWithValue_Static_0001
     * @tc.desc      showOptionalStruct with a value should return the same struct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalStructWithValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalStructWithValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let data: opt.MyStruct = {param1: 12, param2: "string data"};
      let res = instance.showOptionalStruct(data);
      expect(res!.param1).assertEqual(12);
      expect(res!.param2).assertEqual("string data");
      console.log('test_Opt_ShowOptionalStructWithValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalStructWithValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Opt_ShowOptionalStructWithoutValue_STATIC_0100
     * @tc.name      test_Opt_ShowOptionalStructWithoutValue_Static_0001
     * @tc.desc      showOptionalStruct with undefined should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Opt_ShowOptionalStructWithoutValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Opt_ShowOptionalStructWithoutValue_Static_0001 start');
      let instance: opt.Test = opt.getTest();
      let res = instance.showOptionalStruct(undefined);
      expect(res).assertUndefined();
      console.log('test_Opt_ShowOptionalStructWithoutValue_Static_0001 done');
      done();
      console.log('test_Opt_ShowOptionalStructWithoutValue_Static_0001 end');
    });
  })
}