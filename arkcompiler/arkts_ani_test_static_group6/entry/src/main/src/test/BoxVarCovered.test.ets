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
import hilog from '@ohos.hilog'
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function extendedTestsPart3(): void {

  describe("ActsExtendedTestsPart3", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_MULTITHREAD_0100
     * @tc.name      test_ThrowError_MultiThread
     * @tc.desc      Verify test_ThrowError_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_EXISTUNHANDLEDERROR_NORMAL_0200
     * @tc.name      test_ExistUnhandledError_Normal
     * @tc.desc      Verify test_ExistUnhandledError_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ExistUnhandledError_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ExistUnhandledError_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_EXISTUNHANDLEDERROR_ABNORMAL_0300
     * @tc.name      test_ExistUnhandledError_Abnormal
     * @tc.desc      Verify test_ExistUnhandledError_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ExistUnhandledError_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ExistUnhandledError_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_EXISTUNHANDLEDERROR_MULTITHREAD_0400
     * @tc.name      test_ExistUnhandledError_MultiThread
     * @tc.desc      Verify test_ExistUnhandledError_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ExistUnhandledError_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ExistUnhandledError_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_GETUNHANDLEDERROR_NORMAL_0500
     * @tc.name      test_GetUnhandledError_Normal
     * @tc.desc      Verify test_GetUnhandledError_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUnhandledError_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUnhandledError_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_GETUNHANDLEDERROR_ABNORMAL_0600
     * @tc.name      test_GetUnhandledError_Abnormal
     * @tc.desc      Verify test_GetUnhandledError_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUnhandledError_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUnhandledError_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_GETUNHANDLEDERROR_MULTITHREAD_0700
     * @tc.name      test_GetUnhandledError_MultiThread
     * @tc.desc      Verify test_GetUnhandledError_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUnhandledError_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUnhandledError_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_RESETERROR_NORMAL_0800
     * @tc.name      test_ResetError_Normal
     * @tc.desc      Verify test_ResetError_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ResetError_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ResetError_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_RESETERROR_ABNORMAL_0900
     * @tc.name      test_ResetError_Abnormal
     * @tc.desc      Verify test_ResetError_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ResetError_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ResetError_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_RESETERROR_MULTITHREAD_1000
     * @tc.name      test_ResetError_MultiThread
     * @tc.desc      Verify test_ResetError_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ResetError_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ResetError_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_DESCRIBEERROR_NORMAL_1100
     * @tc.name      test_DescribeError_Normal
     * @tc.desc      Verify test_DescribeError_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DescribeError_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DescribeError_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_DESCRIBEERROR_NOERROR_1200
     * @tc.name      test_DescribeError_NoError
     * @tc.desc      Verify test_DescribeError_NoError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DescribeError_NoError", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DescribeError_NoError();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_DESCRIBEERROR_MULTITHREAD_1300
     * @tc.name      test_DescribeError_MultiThread
     * @tc.desc      Verify test_DescribeError_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DescribeError_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DescribeError_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_THROWGETRESET_COMBO_1400
     * @tc.name      test_ThrowGetReset_Combo
     * @tc.desc      Verify test_ThrowGetReset_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowGetReset_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowGetReset_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_THROWTWICE_1500
     * @tc.name      test_ThrowError_ThrowTwice
     * @tc.desc      Verify test_ThrowError_ThrowTwice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_ThrowTwice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_ThrowTwice();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_RESETERROR_TWICE_1600
     * @tc.name      test_ResetError_Twice
     * @tc.desc      Verify test_ResetError_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ResetError_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ResetError_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_GETUNHANDLEDERROR_NOERROR_1700
     * @tc.name      test_GetUnhandledError_NoError
     * @tc.desc      Verify test_GetUnhandledError_NoError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUnhandledError_NoError", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUnhandledError_NoError();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_BOUNDARY_EMPTYMSG_1800
     * @tc.name      test_ThrowError_Boundary_EmptyMsg
     * @tc.desc      Verify test_ThrowError_Boundary_EmptyMsg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_Boundary_EmptyMsg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_Boundary_EmptyMsg();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_BOUNDARY_LONGMSG_1900
     * @tc.name      test_ThrowError_Boundary_LongMsg
     * @tc.desc      Verify test_ThrowError_Boundary_LongMsg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_Boundary_LongMsg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_Boundary_LongMsg();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_EXISTUNHANDLEDERROR_AFTERRESET_2000
     * @tc.name      test_ExistUnhandledError_AfterReset
     * @tc.desc      Verify test_ExistUnhandledError_AfterReset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ExistUnhandledError_AfterReset", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ExistUnhandledError_AfterReset();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_DESCRIBEERROR_AFTERRESET_2100
     * @tc.name      test_DescribeError_AfterReset
     * @tc.desc      Verify test_DescribeError_AfterReset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DescribeError_AfterReset", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DescribeError_AfterReset();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXBOOLEAN_MULTITHREAD_2200
     * @tc.name      test_BoxBoolean_MultiThread
     * @tc.desc      Verify test_BoxBoolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxBoolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxBoolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXBYTE_MULTITHREAD_2300
     * @tc.name      test_BoxByte_MultiThread
     * @tc.desc      Verify test_BoxByte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxByte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxByte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXCHAR_MULTITHREAD_2400
     * @tc.name      test_BoxChar_MultiThread
     * @tc.desc      Verify test_BoxChar_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxChar_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxChar_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXDOUBLE_MULTITHREAD_2500
     * @tc.name      test_BoxDouble_MultiThread
     * @tc.desc      Verify test_BoxDouble_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxDouble_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxDouble_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXFLOAT_MULTITHREAD_2600
     * @tc.name      test_BoxFloat_MultiThread
     * @tc.desc      Verify test_BoxFloat_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxFloat_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxFloat_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXINT_MULTITHREAD_2700
     * @tc.name      test_BoxInt_MultiThread
     * @tc.desc      Verify test_BoxInt_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxInt_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxInt_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXLONG_MULTITHREAD_2800
     * @tc.name      test_BoxLong_MultiThread
     * @tc.desc      Verify test_BoxLong_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxLong_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxLong_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXSHORT_MULTITHREAD_2900
     * @tc.name      test_BoxShort_MultiThread
     * @tc.desc      Verify test_BoxShort_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxShort_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxShort_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXBOOLEAN_MULTITHREAD_3000
     * @tc.name      test_UnboxBoolean_MultiThread
     * @tc.desc      Verify test_UnboxBoolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxBoolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxBoolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXBYTE_MULTITHREAD_3100
     * @tc.name      test_UnboxByte_MultiThread
     * @tc.desc      Verify test_UnboxByte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxByte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxByte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXCHAR_MULTITHREAD_3200
     * @tc.name      test_UnboxChar_MultiThread
     * @tc.desc      Verify test_UnboxChar_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxChar_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxChar_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXDOUBLE_MULTITHREAD_3300
     * @tc.name      test_UnboxDouble_MultiThread
     * @tc.desc      Verify test_UnboxDouble_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxDouble_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxDouble_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXFLOAT_MULTITHREAD_3400
     * @tc.name      test_UnboxFloat_MultiThread
     * @tc.desc      Verify test_UnboxFloat_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxFloat_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxFloat_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXINT_MULTITHREAD_3500
     * @tc.name      test_UnboxInt_MultiThread
     * @tc.desc      Verify test_UnboxInt_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxInt_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxInt_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXLONG_MULTITHREAD_3600
     * @tc.name      test_UnboxLong_MultiThread
     * @tc.desc      Verify test_UnboxLong_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxLong_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxLong_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXSHORT_MULTITHREAD_3700
     * @tc.name      test_UnboxShort_MultiThread
     * @tc.desc      Verify test_UnboxShort_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxShort_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxShort_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXINT_BOUNDARY_MIN_3800
     * @tc.name      test_BoxInt_Boundary_Min
     * @tc.desc      Verify test_BoxInt_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxInt_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxInt_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXINT_BOUNDARY_MAX_3900
     * @tc.name      test_BoxInt_Boundary_Max
     * @tc.desc      Verify test_BoxInt_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxInt_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxInt_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXDOUBLE_BOUNDARY_NAN_4000
     * @tc.name      test_BoxDouble_Boundary_NaN
     * @tc.desc      Verify test_BoxDouble_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxDouble_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxDouble_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXDOUBLE_BOUNDARY_INFINITY_4100
     * @tc.name      test_BoxDouble_Boundary_Infinity
     * @tc.desc      Verify test_BoxDouble_Boundary_Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxDouble_Boundary_Infinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxDouble_Boundary_Infinity();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXBOOLEAN_BOUNDARY_FALSE_4200
     * @tc.name      test_BoxBoolean_Boundary_False
     * @tc.desc      Verify test_BoxBoolean_Boundary_False
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxBoolean_Boundary_False", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxBoolean_Boundary_False();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXINT_BOUNDARY_MIN_4300
     * @tc.name      test_UnboxInt_Boundary_Min
     * @tc.desc      Verify test_UnboxInt_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxInt_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxInt_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_UNBOXDOUBLE_BOUNDARY_NAN_4400
     * @tc.name      test_UnboxDouble_Boundary_NaN
     * @tc.desc      Verify test_UnboxDouble_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnboxDouble_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_UnboxDouble_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_BOXUNBOX_ROUNDTRIP_4500
     * @tc.name      test_BoxUnbox_RoundTrip
     * @tc.desc      Verify test_BoxUnbox_RoundTrip
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_BoxUnbox_RoundTrip", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_BoxUnbox_RoundTrip();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_BOOLEAN_NORMAL_4600
     * @tc.name      test_Var_SetValue_Boolean_Normal
     * @tc.desc      Verify test_Var_SetValue_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_INT_NORMAL_4700
     * @tc.name      test_Var_SetValue_Int_Normal
     * @tc.desc      Verify test_Var_SetValue_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_DOUBLE_NORMAL_4800
     * @tc.name      test_Var_SetValue_Double_Normal
     * @tc.desc      Verify test_Var_SetValue_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_REF_NORMAL_4900
     * @tc.name      test_Var_SetValue_Ref_Normal
     * @tc.desc      Verify test_Var_SetValue_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_BOOLEAN_MULTITHREAD_5000
     * @tc.name      test_Var_SetValue_Boolean_MultiThread
     * @tc.desc      Verify test_Var_SetValue_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_INT_MULTITHREAD_5100
     * @tc.name      test_Var_SetValue_Int_MultiThread
     * @tc.desc      Verify test_Var_SetValue_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_DOUBLE_MULTITHREAD_5200
     * @tc.name      test_Var_SetValue_Double_MultiThread
     * @tc.desc      Verify test_Var_SetValue_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_BOOLEAN_NORMAL_5300
     * @tc.name      test_Var_GetValue_Boolean_Normal
     * @tc.desc      Verify test_Var_GetValue_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_INT_NORMAL_5400
     * @tc.name      test_Var_GetValue_Int_Normal
     * @tc.desc      Verify test_Var_GetValue_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_DOUBLE_NORMAL_5500
     * @tc.name      test_Var_GetValue_Double_Normal
     * @tc.desc      Verify test_Var_GetValue_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_REF_NORMAL_5600
     * @tc.name      test_Var_GetValue_Ref_Normal
     * @tc.desc      Verify test_Var_GetValue_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_BOOLEAN_MULTITHREAD_5700
     * @tc.name      test_Var_GetValue_Boolean_MultiThread
     * @tc.desc      Verify test_Var_GetValue_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_INT_MULTITHREAD_5800
     * @tc.name      test_Var_GetValue_Int_MultiThread
     * @tc.desc      Verify test_Var_GetValue_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_DOUBLE_MULTITHREAD_5900
     * @tc.name      test_Var_GetValue_Double_MultiThread
     * @tc.desc      Verify test_Var_GetValue_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_INT_ABNORMAL_6000
     * @tc.name      test_Var_SetValue_Int_Abnormal
     * @tc.desc      Verify test_Var_SetValue_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_INT_ABNORMAL_6100
     * @tc.name      test_Var_GetValue_Int_Abnormal
     * @tc.desc      Verify test_Var_GetValue_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_BOOLEAN_ABNORMAL_6200
     * @tc.name      test_Var_SetValue_Boolean_Abnormal
     * @tc.desc      Verify test_Var_SetValue_Boolean_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Boolean_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Boolean_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_BOOLEAN_ABNORMAL_6300
     * @tc.name      test_Var_GetValue_Boolean_Abnormal
     * @tc.desc      Verify test_Var_GetValue_Boolean_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Boolean_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Boolean_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_DOUBLE_ABNORMAL_6400
     * @tc.name      test_Var_SetValue_Double_Abnormal
     * @tc.desc      Verify test_Var_SetValue_Double_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Double_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Double_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_DOUBLE_ABNORMAL_6500
     * @tc.name      test_Var_GetValue_Double_Abnormal
     * @tc.desc      Verify test_Var_GetValue_Double_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Double_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Double_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_INT_BOUNDARY_MIN_6600
     * @tc.name      test_Var_SetValue_Int_Boundary_Min
     * @tc.desc      Verify test_Var_SetValue_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_SETVALUE_INT_BOUNDARY_MAX_6700
     * @tc.name      test_Var_SetValue_Int_Boundary_Max
     * @tc.desc      Verify test_Var_SetValue_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_SetValue_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_SetValue_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_INT_BOUNDARY_MIN_6800
     * @tc.name      test_Var_GetValue_Int_Boundary_Min
     * @tc.desc      Verify test_Var_GetValue_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_VAR_GETVALUE_INT_BOUNDARY_MAX_6900
     * @tc.name      test_Var_GetValue_Int_Boundary_Max
     * @tc.desc      Verify test_Var_GetValue_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Var_GetValue_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Var_GetValue_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
  })
}
