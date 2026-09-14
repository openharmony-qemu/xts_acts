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

export default function extendedTestsPart4(): void {

  describe("ActsExtendedTestsPart4", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_NEWUTF16_MULTITHREAD_0100
     * @tc.name      test_Str_NewUTF16_MultiThread
     * @tc.desc      Verify test_Str_NewUTF16_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_NewUTF16_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_NewUTF16_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16SIZE_MULTITHREAD_0200
     * @tc.name      test_Str_GetUTF16Size_MultiThread
     * @tc.desc      Verify test_Str_GetUTF16Size_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16Size_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16Size_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16_MULTITHREAD_0300
     * @tc.name      test_Str_GetUTF16_MultiThread
     * @tc.desc      Verify test_Str_GetUTF16_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16SUBSTRING_MULTITHREAD_0400
     * @tc.name      test_Str_GetUTF16SubString_MultiThread
     * @tc.desc      Verify test_Str_GetUTF16SubString_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16SubString_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16SubString_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8SIZE_MULTITHREAD_0500
     * @tc.name      test_Str_GetUTF8Size_MultiThread
     * @tc.desc      Verify test_Str_GetUTF8Size_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8Size_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8Size_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8_MULTITHREAD_0600
     * @tc.name      test_Str_GetUTF8_MultiThread
     * @tc.desc      Verify test_Str_GetUTF8_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8SUBSTRING_MULTITHREAD_0700
     * @tc.name      test_Str_GetUTF8SubString_MultiThread
     * @tc.desc      Verify test_Str_GetUTF8SubString_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8SubString_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8SubString_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_NEWUTF8_SIZEZERO_0800
     * @tc.name      test_Str_NewUTF8_SizeZero
     * @tc.desc      Verify test_Str_NewUTF8_SizeZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_NewUTF8_SizeZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_NewUTF8_SizeZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_NEWUTF16_SIZEZERO_0900
     * @tc.name      test_Str_NewUTF16_SizeZero
     * @tc.desc      Verify test_Str_NewUTF16_SizeZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_NewUTF16_SizeZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_NewUTF16_SizeZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8_BUFFERZERO_1000
     * @tc.name      test_Str_GetUTF8_BufferZero
     * @tc.desc      Verify test_Str_GetUTF8_BufferZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8_BufferZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8_BufferZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8_BUFFERSMALL_1100
     * @tc.name      test_Str_GetUTF8_BufferSmall
     * @tc.desc      Verify test_Str_GetUTF8_BufferSmall
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8_BufferSmall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8_BufferSmall();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16_BUFFERZERO_1200
     * @tc.name      test_Str_GetUTF16_BufferZero
     * @tc.desc      Verify test_Str_GetUTF16_BufferZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16_BufferZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16_BufferZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16_BUFFERSMALL_1300
     * @tc.name      test_Str_GetUTF16_BufferSmall
     * @tc.desc      Verify test_Str_GetUTF16_BufferSmall
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16_BufferSmall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16_BufferSmall();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8SUBSTRING_OFFSETATEND_1400
     * @tc.name      test_Str_GetUTF8SubString_OffsetAtEnd
     * @tc.desc      Verify test_Str_GetUTF8SubString_OffsetAtEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8SubString_OffsetAtEnd", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8SubString_OffsetAtEnd();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8SUBSTRING_OFFSETSIZEOVERFLOW_1500
     * @tc.name      test_Str_GetUTF8SubString_OffsetSizeOverflow
     * @tc.desc      Verify test_Str_GetUTF8SubString_OffsetSizeOverflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8SubString_OffsetSizeOverflow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8SubString_OffsetSizeOverflow();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF8SUBSTRING_SIZEZERO_1600
     * @tc.name      test_Str_GetUTF8SubString_SizeZero
     * @tc.desc      Verify test_Str_GetUTF8SubString_SizeZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF8SubString_SizeZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF8SubString_SizeZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16SUBSTRING_OFFSETATEND_1700
     * @tc.name      test_Str_GetUTF16SubString_OffsetAtEnd
     * @tc.desc      Verify test_Str_GetUTF16SubString_OffsetAtEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16SubString_OffsetAtEnd", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16SubString_OffsetAtEnd();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16SUBSTRING_OFFSETSIZEOVERFLOW_1800
     * @tc.name      test_Str_GetUTF16SubString_OffsetSizeOverflow
     * @tc.desc      Verify test_Str_GetUTF16SubString_OffsetSizeOverflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16SubString_OffsetSizeOverflow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16SubString_OffsetSizeOverflow();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_STR_GETUTF16SUBSTRING_SIZEZERO_1900
     * @tc.name      test_Str_GetUTF16SubString_SizeZero
     * @tc.desc      Verify test_Str_GetUTF16SubString_SizeZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Str_GetUTF16SubString_SizeZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Str_GetUTF16SubString_SizeZero();
      expect(result).assertEqual(1);
      done();
    });
  })
}
