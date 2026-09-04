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

import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import testNapi from 'libnapiCovString.so';

export default function napiCovStringTest() {
  describe('ActsNapiCovStringTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateStringUtf8Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0001
     * @tc.desc   Verify napi_create_string_utf8 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf8Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf8Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf8Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf8MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0002
     * @tc.desc   Verify napi_create_string_utf8 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf8MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf8MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf8MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf8MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0003
     * @tc.desc   Verify napi_create_string_utf8 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf8MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf8MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf8MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf8Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0004
     * @tc.desc   Verify napi_create_string_utf8 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf8Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf8Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf8Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf8Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0005
     * @tc.desc   Verify napi_create_string_utf8 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf8Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf8Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf8Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16Abnormal
     * @tc.number SUB_NAPI_NOCOV_STR_0006
     * @tc.desc   Verify napi_create_string_utf16 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0007
     * @tc.desc   Verify napi_create_string_utf16 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0008
     * @tc.desc   Verify napi_create_string_utf16 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0009
     * @tc.desc   Verify napi_create_string_utf16 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0010
     * @tc.desc   Verify napi_create_string_utf16 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringUtf16Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0011
     * @tc.desc   Verify napi_create_string_utf16 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringUtf16Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringUtf16Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringUtf16Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1Abnormal
     * @tc.number SUB_NAPI_NOCOV_STR_0012
     * @tc.desc   Verify napi_create_string_latin1 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1RetVal
     * @tc.number SUB_NAPI_NOCOV_STR_0013
     * @tc.desc   Verify napi_create_string_latin1 with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1RetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1RetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1RetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0014
     * @tc.desc   Verify napi_create_string_latin1 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0015
     * @tc.desc   Verify napi_create_string_latin1 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0016
     * @tc.desc   Verify napi_create_string_latin1 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0017
     * @tc.desc   Verify napi_create_string_latin1 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStringLatin1Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0018
     * @tc.desc   Verify napi_create_string_latin1 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStringLatin1Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStringLatin1Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStringLatin1Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8Abnormal
     * @tc.number SUB_NAPI_NOCOV_STR_0019
     * @tc.desc   Verify napi_get_value_string_utf8 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8RetVal
     * @tc.number SUB_NAPI_NOCOV_STR_0020
     * @tc.desc   Verify napi_get_value_string_utf8 with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8RetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8RetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8RetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0021
     * @tc.desc   Verify napi_get_value_string_utf8 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0022
     * @tc.desc   Verify napi_get_value_string_utf8 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0023
     * @tc.desc   Verify napi_get_value_string_utf8 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0024
     * @tc.desc   Verify napi_get_value_string_utf8 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf8Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0025
     * @tc.desc   Verify napi_get_value_string_utf8 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf8Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf8Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf8Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16Abnormal
     * @tc.number SUB_NAPI_NOCOV_STR_0026
     * @tc.desc   Verify napi_get_value_string_utf16 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0027
     * @tc.desc   Verify napi_get_value_string_utf16 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0028
     * @tc.desc   Verify napi_get_value_string_utf16 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0029
     * @tc.desc   Verify napi_get_value_string_utf16 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0030
     * @tc.desc   Verify napi_get_value_string_utf16 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringUtf16Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0031
     * @tc.desc   Verify napi_get_value_string_utf16 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringUtf16Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringUtf16Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringUtf16Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringLatin1Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0032
     * @tc.desc   Verify napi_get_value_string_latin1 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringLatin1Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringLatin1Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringLatin1Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringLatin1MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0033
     * @tc.desc   Verify napi_get_value_string_latin1 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringLatin1MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringLatin1MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringLatin1MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringLatin1MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0034
     * @tc.desc   Verify napi_get_value_string_latin1 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringLatin1MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringLatin1MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringLatin1MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringLatin1Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0035
     * @tc.desc   Verify napi_get_value_string_latin1 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringLatin1Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringLatin1Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringLatin1Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueStringLatin1Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0036
     * @tc.desc   Verify napi_get_value_string_latin1 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueStringLatin1Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueStringLatin1Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueStringLatin1Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringUtf16Stable
     * @tc.number SUB_NAPI_NOCOV_STR_0037
     * @tc.desc   Verify napi_create_external_string_utf16 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringUtf16Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringUtf16Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringUtf16Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringUtf16MultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0038
     * @tc.desc   Verify napi_create_external_string_utf16 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringUtf16MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringUtf16MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringUtf16MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringUtf16MultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0039
     * @tc.desc   Verify napi_create_external_string_utf16 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringUtf16MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringUtf16MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringUtf16MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringUtf16Runtime
     * @tc.number SUB_NAPI_NOCOV_STR_0040
     * @tc.desc   Verify napi_create_external_string_utf16 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringUtf16Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringUtf16Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringUtf16Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringUtf16Worker
     * @tc.number SUB_NAPI_NOCOV_STR_0041
     * @tc.desc   Verify napi_create_external_string_utf16 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringUtf16Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringUtf16Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringUtf16Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringAsciiStable
     * @tc.number SUB_NAPI_NOCOV_STR_0042
     * @tc.desc   Verify napi_create_external_string_ascii with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringAsciiStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringAsciiStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringAsciiStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringAsciiMultiThread
     * @tc.number SUB_NAPI_NOCOV_STR_0043
     * @tc.desc   Verify napi_create_external_string_ascii with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringAsciiMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringAsciiMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringAsciiMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringAsciiMultiCtx
     * @tc.number SUB_NAPI_NOCOV_STR_0044
     * @tc.desc   Verify napi_create_external_string_ascii with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringAsciiMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringAsciiMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringAsciiMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringAsciiRuntime
     * @tc.number SUB_NAPI_NOCOV_STR_0045
     * @tc.desc   Verify napi_create_external_string_ascii with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringAsciiRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringAsciiRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringAsciiRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStringAsciiWorker
     * @tc.number SUB_NAPI_NOCOV_STR_0046
     * @tc.desc   Verify napi_create_external_string_ascii with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStringAsciiWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStringAsciiWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStringAsciiWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}