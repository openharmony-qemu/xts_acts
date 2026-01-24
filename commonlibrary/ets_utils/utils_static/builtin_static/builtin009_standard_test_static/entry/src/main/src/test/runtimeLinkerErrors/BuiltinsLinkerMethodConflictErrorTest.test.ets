/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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



export default function builtinsLinkerMethodConflictErrorTest() {
  describe('builtinsLinkerMethodConflictErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsLinkerMethodConflictErrorTest0100
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0100
     * @tc.desc    Test constructor with no arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError();
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0200
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0200
     * @tc.desc    Test constructor with simple conflict message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError('Method signature conflict detected');
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual('Method signature conflict detected');
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0300
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0300
     * @tc.desc    Test constructor with empty message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError('');
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0400
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0400
     * @tc.desc    Test constructor with message containing special characters and method names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialMsg = 'Method "calculate()" conflicts with "calculate(int)" in class <Processor>';
      const error = new LinkerMethodConflictError(specialMsg);
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual(specialMsg);
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0500
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0500
     * @tc.desc    Test constructor with options (cause) parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cause = new Error('Duplicate method definition found');
      const error = new LinkerMethodConflictError('Method conflict error', { cause });
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual('Method conflict error');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0600
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0600
     * @tc.desc    Test constructor with both message and empty options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError('Method signature mismatch', {});
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual('Method signature mismatch');
      expect(error.cause).assertUndefined();
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0700
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0700
     * @tc.desc    Test constructor with long conflict description message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMsg = 'Method calculateTotalPriceWithTaxAndDiscountAndShippingFeeAndHandlingCharge' +
        ' in class ShoppingCartProcessor' +
        ' conflicts with inherited method calculateTotalPriceWithTaxAndDiscount' +
        ' due to parameter type mismatch in the third argument';
      const error = new LinkerMethodConflictError(longMsg);
      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual(longMsg);
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0800
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0800
     * @tc.desc    Test that error instance is throwable and catchable
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        throw new LinkerMethodConflictError('Method conflict test error');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerMethodConflictError).assertTrue();
        expect(error.name).assertEqual('LinkerMethodConflictError');
        expect(error.message).assertEqual('Method conflict test error');
      }
    });



    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest0900
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST0900
     * @tc.desc    Test error stack trace property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError('Method conflict in linking phase');
      expect(typeof error.stack).assertEqual('string');
      expect(error.stack?.includes('LinkerMethodConflictError')).assertTrue();
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1000
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1000
     * @tc.desc    Test error with nested cause chain for method conflicts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootCause = new Error('Duplicate method signature found');
      const middleError = new LinkerMethodConflictError('Intermediate method conflict', { cause: rootCause });
      const topError = new LinkerMethodConflictError('Final method conflict resolution failed', { cause: middleError });

      expect(topError.cause).assertEqual(middleError);
      expect(middleError.cause).assertEqual(rootCause);
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1100
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1100
     * @tc.desc    Test error with specific method and class names in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const methodName1 = 'processPayment';
      const methodName2 = 'processPayment';
      const className = 'PaymentGateway';
      const error = new LinkerMethodConflictError(
        `Method ${methodName1} in class ${className} conflicts with ${methodName2} from interface`
      );

      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertContain(methodName1);
      expect(error.message).assertContain(className);
      expect(error.message).assertContain('conflicts');
    });



    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1200
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1200
     * @tc.desc    Test error toString() method for method conflicts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerMethodConflictError('Method calculate() signature conflict');
      const errorString = error.toString();

      expect(errorString).assertContain('LinkerMethodConflictError');
      expect(errorString).assertContain('Method calculate() signature conflict');
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1300
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1300
     * @tc.desc    Test error with parameter type conflict message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const paramConflictMsg = 'Method process(String, int) conflicts with process(String, Integer) - parameter type mismatch';
      const error = new LinkerMethodConflictError(paramConflictMsg);

      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual(paramConflictMsg);
      expect(error.message).assertContain('parameter type mismatch');
    });



    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1400
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1400
     * @tc.desc    Test error with multiple conflicting methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const multiConflictMsg = 'Methods: calculate(), calculate(int), calculate(double) have conflicting signatures in inheritance hierarchy';
      const error = new LinkerMethodConflictError(multiConflictMsg);

      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertContain('calculate()');
      expect(error.message).assertContain('calculate(int)');
      expect(error.message).assertContain('conflicting signatures');
    });

    /**
     * @tc.name    builtinsLinkerMethodConflictErrorTest1500
     * @tc.number  BUILTINS_LINKER_METHOD_CONFLICT_ERROR_TEST1500
     * @tc.desc    Test error with access modifier conflict
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerMethodConflictErrorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const accessConflictMsg = 'Method validate() access modifier conflict: public vs protected';
      const error = new LinkerMethodConflictError(accessConflictMsg);

      expect(error.name).assertEqual('LinkerMethodConflictError');
      expect(error.message).assertEqual(accessConflictMsg);
      expect(error.message).assertContain('access modifier');
    });


  })
}