/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { StackTrace } from 'std/core';


export default function BuiltinsStackTraceTest(): void {
  describe("BuiltinsStackTraceTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    stackTraceTest0100
     * @tc.number  SUB_STACK_TRACE_TEST_0100
     * @tc.desc    Verify provisionStackTrace returns non-empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("stackTraceTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stackTrace = StackTrace.provisionStackTrace();

      expect(stackTrace).not().assertNull();
      expect(stackTrace.length > 0).assertTrue();
    });

    /**
     * @tc.name    stackTraceTest0200
     * @tc.number  SUB_STACK_TRACE_TEST_0200
     * @tc.desc    Verify StackTraceElement toString method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("stackTraceTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stackTrace = StackTrace.provisionStackTrace();

      expect(stackTrace.length > 0).assertTrue();

      const firstElement = stackTrace[0];
      expect(firstElement).not().assertNull();

      const toStringResult = firstElement.toString();
      expect(toStringResult).not().assertNull();
      expect(typeof toStringResult).assertEqual("string");
      expect(toStringResult.length > 0).assertTrue();
    });

    /**
     * @tc.name    stackTraceTest0300
     * @tc.number  SUB_STACK_TRACE_TEST_0300
     * @tc.desc    Verify provisionStackTrace returns array of StackTraceElement
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("stackTraceTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stackTrace = StackTrace.provisionStackTrace();

      expect(stackTrace.length > 0).assertTrue();

      for (let i = 0; i < stackTrace.length; i++) {
        const element = stackTrace[i];
        expect(element).not().assertNull();
        expect(typeof element.toString).assertEqual("function");
      }
    });

    /**
     * @tc.name    stackTraceTest0400
     * @tc.number  SUB_STACK_TRACE_TEST_0400
     * @tc.desc    Verify StackTraceElement toString format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("stackTraceTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stackTrace = StackTrace.provisionStackTrace();

      expect(stackTrace.length > 0).assertTrue();

      const firstElement = stackTrace[0];
      const toStringResult = firstElement.toString();

      // Check if the string starts with "\tat "
      expect(toStringResult.startsWith("\tat ")).assertTrue();

      // Check if the string contains "(" and ")"
      expect(toStringResult.includes("(")).assertTrue();
      expect(toStringResult.includes(")")).assertTrue();
    });
  });
}