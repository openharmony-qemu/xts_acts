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



export default function builtinsLinkerVerificationErrorTest() {
  describe('builtinsLinkerVerificationErrorTest', () => {
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
     * @tc.name    builtinsLinkerVerificationErrorTest0100
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0100
     * @tc.desc    Test constructor with default parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new LinkerVerificationError();
      expect(error1.name).assertEqual('LinkerVerificationError');
      expect(error1.message).assertEqual('');

      const error2 = new LinkerVerificationError('');
      expect(error2.name).assertEqual('LinkerVerificationError');
      expect(error2.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0101
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0101
     * @tc.desc    Test constructor with normal message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const message = 'Verification failed: Module signature is invalid';
      const error = new LinkerVerificationError(message);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(message);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0102
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0102
     * @tc.desc    Test constructor with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const error = new LinkerVerificationError(specialChars);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(specialChars);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0103
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0103
     * @tc.desc    Test constructor with escape characters in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const escapeMessage = 'Error: \\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0';
      const error = new LinkerVerificationError(escapeMessage);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(escapeMessage);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0104
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0104
     * @tc.desc    Test constructor with emoji and Unicode in message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emojiMessage = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const error = new LinkerVerificationError(emojiMessage);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(emojiMessage);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0105
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0105
     * @tc.desc    Test constructor with very long message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsLinkerVerificationErrorTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longMessage = 'A'.repeat(10000) + 'VerificationFailed' + 'B'.repeat(10000);
      const error = new LinkerVerificationError(longMessage);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(longMessage);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0106
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0106
     * @tc.desc    Test constructor with options parameter (cause)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cause = new Error('Root cause error');
      const error = new LinkerVerificationError('Verification failed with cause', { cause: cause });

      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual('Verification failed with cause');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0107
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0107
     * @tc.desc    Test constructor with empty options object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerVerificationError('Test error', {});

      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual('Test error');
      expect(error.cause).assertUndefined();
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0108
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0108
     * @tc.desc    Test constructor with numeric string message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const messages = ['0', '123', '-1', '3.14', 'NaN', 'Infinity'];

      messages.forEach((msg) => {
        const error = new LinkerVerificationError(msg);
        expect(error.name).assertEqual('LinkerVerificationError');
        expect(error.message).assertEqual(msg);
      });
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0109
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0109
     * @tc.desc    Test constructor with boolean-like string message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const messages = ['true', 'false', 'TRUE', 'FALSE'];

      messages.forEach((msg) => {
        const error = new LinkerVerificationError(msg);
        expect(error.name).assertEqual('LinkerVerificationError');
        expect(error.message).assertEqual(msg);
      });
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0110
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0110
     * @tc.desc    Test constructor with JSON string message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const jsonMessage = '{"error": "verification_failed", "code": 1001, "details": {"module": "test.abc"}}';
      const error = new LinkerVerificationError(jsonMessage);

      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(jsonMessage);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0111
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0111
     * @tc.desc    Test constructor with multiline message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const multilineMessage = `Line 1: Verification failed
          Line 2: Module signature mismatch
          Line 3: Expected: 0xCAFEBABE
          Line 4: Actual: 0xDEADBEEF`;

      const error = new LinkerVerificationError(multilineMessage);
      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual(multilineMessage);
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0112
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0112
     * @tc.desc    Test constructor with custom fields in options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const error = new LinkerVerificationError('Error message');

      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual('Error message');
    });



    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0113
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0113
     * @tc.desc    Test constructor with null/undefined in options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsLinkerVerificationErrorTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const error1 = new LinkerVerificationError('Error message');

      expect(error1.name).assertEqual('LinkerVerificationError');
      expect(error1.message).assertEqual('Error message');

      const error2 = new LinkerVerificationError('Another error', {});

      expect(error2.name).assertEqual('LinkerVerificationError');
      expect(error2.message).assertEqual('Another error');
    });
    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0114
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0114
     * @tc.desc    Test constructor with various error types as cause
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsLinkerVerificationErrorTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const causes = [
        new Error('Standard Error'),
        new TypeError('Type Error'),
        new RangeError('Range Error'),
        new SyntaxError('Syntax Error'),
        new URIError('URI Error'),
        new EvalError('Eval Error'),
        new ReferenceError('Reference Error'),
        new AggregateError([new Error('Error 1'), new Error('Error 2')], 'Aggregate Error')
      ];

      causes.forEach((cause, index) => {
        const error = new LinkerVerificationError(`Error ${index}`, { cause: cause });
        expect(error.name).assertEqual('LinkerVerificationError');
        expect(error.message).assertEqual(`Error ${index}`);
        expect(error.cause).assertEqual(cause);
      });
    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0115
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0115
     * @tc.desc    Test stack trace preservation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsLinkerVerificationErrorTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const error = new LinkerVerificationError('Stack trace test');

      expect(error.name).assertEqual('LinkerVerificationError');
      expect(error.message).assertEqual('Stack trace test');
      expect(typeof error.stack).assertEqual('string');

    });

    /**
     * @tc.name    builtinsLinkerVerificationErrorTest0116
     * @tc.number  BUILTINS_LINKER_VERIFICATION_ERROR_TEST0116
     * @tc.desc    Test toString method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerVerificationErrorTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerVerificationError('Test message');
      const str = error.toString();

      expect(str).assertEqual('LinkerVerificationError: Test message');
    });



  })
}