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
declare function provisionStackTrace(): FixedArray<StackTraceElement>;
export default function BuiltinsStackTraceTest(): void {
  describe("BuiltinsStackTraceTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    builtinsStackTraceTest0100
     * @tc.number  SUB_BUILTINS_STACKTRACE_BASIC_0100
     * @tc.desc    Verify provisionStackTrace returns non-empty FixedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStackTraceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Call provisionStackTrace to get current call stack
      const stackTrace = provisionStackTrace();
      
      // Verify the result is not null
      expect(stackTrace).not().assertNull();
      
      // Verify the result is a FixedArray with length > 0
      expect(stackTrace.length > 0).assertTrue();
    });

    /**
     * @tc.name    builtinsStackTraceTest0200
     * @tc.number  SUB_BUILTINS_STACKTRACE_BASIC_0200
     * @tc.desc    Verify provisionStackTrace returns StackTraceElement instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStackTraceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stackTrace = provisionStackTrace();
      
      expect(stackTrace.length > 0).assertTrue();
      
      // Get the first element and verify it has toString method
      const firstElement = stackTrace[0];
      expect(firstElement).not().assertNull();
      
      // Verify toString method exists and returns string
      const toStringResult = firstElement.toString();
      expect(toStringResult).not().assertNull();
      expect(typeof toStringResult).assertEqual("string");
      expect(toStringResult.length > 0).assertTrue();
    });

    /**
     * @tc.name    builtinsStackTraceTest0300
     * @tc.number  SUB_BUILTINS_STACKTRACE_BASIC_0300
     * @tc.desc    Verify StackTraceElement toString format contains expected patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStackTraceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stackTrace = provisionStackTrace();
      
      expect(stackTrace.length > 0).assertTrue();
      
      const firstElement = stackTrace[0];
      const toStringResult = firstElement.toString();
      
      // Verify the string format contains expected patterns
      // Stack trace format should start with "\tat "
      expect(toStringResult.startsWith("\tat ")).assertTrue();
      
      // Should contain method name indicators
      expect(toStringResult.includes("(")).assertTrue();
      expect(toStringResult.includes(")")).assertTrue();
    });

    /**
     * @tc.name    builtinsStackTraceTest0400
     * @tc.number  SUB_BUILTINS_STACKTRACE_BASIC_0400
     * @tc.desc    Verify all StackTraceElement instances have toString method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStackTraceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stackTrace = provisionStackTrace();
      
      expect(stackTrace.length > 0).assertTrue();
      
      // Verify all elements in the stack trace have toString method
      for (let i: int = 0; i < stackTrace.length; i++) {
        const element = stackTrace[i];
        expect(element).not().assertNull();
        
        // Verify toString method exists and is callable
        const toStringResult = element.toString();
        expect(toStringResult).not().assertNull();
        expect(typeof toStringResult).assertEqual("string");
      }
    });

    /**
     * @tc.name    builtinsStackTraceTest0500
     * @tc.number  SUB_BUILTINS_STACKTRACE_CONSISTENCY_0500
     * @tc.desc    Verify provisionStackTrace consistency across multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStackTraceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Call provisionStackTrace multiple times
      const stackTrace1 = provisionStackTrace();
      const stackTrace2 = provisionStackTrace();
      
      // Verify both calls return valid results
      expect(stackTrace1).not().assertNull();
      expect(stackTrace2).not().assertNull();
      expect(stackTrace1.length > 0).assertTrue();
      expect(stackTrace2.length > 0).assertTrue();
      
      // Verify consistency in structure (same number of elements)
      expect(stackTrace1.length).assertEqual(stackTrace2.length);
    });

    /**
     * @tc.name    builtinsStackTraceTest0600
     * @tc.number  SUB_BUILTINS_STACKTRACE_EDGE_0600
     * @tc.desc    Verify StackTraceElement toString format consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsStackTraceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const stackTrace = provisionStackTrace();
      
      expect(stackTrace.length > 0).assertTrue();
      
      // Verify all elements have consistent toString format
      for (let i: int = 0; i < stackTrace.length; i++) {
        const element = stackTrace[i];
        const toStringResult = element.toString();
        
        // Verify consistent format patterns
        expect(toStringResult.startsWith("\tat ")).assertTrue();
        expect(toStringResult.includes("(")).assertTrue();
        expect(toStringResult.includes(")")).assertTrue();
        
        // Verify the string contains meaningful content
        expect(toStringResult.length > 10).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsStackTraceTest0700
     * @tc.number  SUB_BUILTINS_STACKTRACE_OPER_0700
     * @tc.desc    Verify provisionStackTrace after array operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStackTraceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Perform some operations that might affect the call stack
      const testArray = new Array<number>(1, 2, 3);
      testArray.pushArray(4, 5);
      
      // Get stack trace after operations
      const stackTrace = provisionStackTrace();
      
      // Verify stack trace is still valid
      expect(stackTrace).not().assertNull();
      expect(stackTrace.length > 0).assertTrue();
      
      // Verify first element
      const firstElement = stackTrace[0];
      expect(firstElement).not().assertNull();
      expect(firstElement.toString().length > 0).assertTrue();
    });

    /**
     * @tc.name    builtinsStackTraceTest0800
     * @tc.number  SUB_BUILTINS_STACKTRACE_CONSISTENCY_0800
     * @tc.desc    Verify StackTraceElement toString method consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStackTraceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stackTrace = provisionStackTrace();
      
      expect(stackTrace.length > 0).assertTrue();
      
      const firstElement = stackTrace[0];
      
      // Call toString multiple times and verify consistency
      const result1 = firstElement.toString();
      const result2 = firstElement.toString();
      const result3 = firstElement.toString();
      
      // All calls should return the same result
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(result3);
      
      // Verify the result is a valid string
      expect(result1.length > 0).assertTrue();
      expect(typeof result1).assertEqual("string");
    });
  });
}