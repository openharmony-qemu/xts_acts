/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function ArrayCopyWithinTest() {

  describe("ArrayCopyWithinTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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

    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0059
     * @tc.name    test_array_copy_within_0059
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with target=0 (copies entire array to beginning)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0059";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 0);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0060
     * @tc.name    test_array_copy_within_0060
     * @tc.type    FUNCTION
     * @tc.desc    Test negative target index (relative to end)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0060";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, -2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0061
     * @tc.name    test_array_copy_within_0061
     * @tc.type    FUNCTION
     * @tc.desc    Test target index beyond array length (no copy should occur)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0061";
        try {
            let self: FixedArray<boolean> = [true, false] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 5);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0062
     * @tc.name    test_array_copy_within_0062
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with exact overlapping regions
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0062";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0063
     * @tc.name    test_array_copy_within_0063
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin on single-element array
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0063";
        try {
            let self: FixedArray<boolean> = [true] as FixedArray<boolean>;
            let result = copyWithin(self, 0);
            expect(result[0]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0064
     * @tc.name    test_array_copy_within_0064
     * @tc.type    FUNCTION
     * @tc.desc    Test large negative target (treated as 0)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0064";
        try {
            let self: FixedArray<boolean> = [true, false] as FixedArray<boolean>;
            let result = copyWithin(self, -10);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0065
     * @tc.name    test_array_copy_within_0065
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with negative start and end indices
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0065";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, -3, -1);
            expect(result[0]).assertEqual(false);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0066
     * @tc.name    test_array_copy_within_0066
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin copying from middle to start
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0066";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, 1);
            expect(result[0]).assertEqual(false);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0067
     * @tc.name    test_array_copy_within_0067
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with end index exceeding array length
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0067";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, 0, 10);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0068
     * @tc.name    test_array_copy_within_0068
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin when start equals end (no copy occurs)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0068";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 0, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0069
     * @tc.name    test_array_copy_within_0069
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with zero-length copy (start equals end)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0069";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 0, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_COPY_WITHIN_0070
     * @tc.name    test_array_copy_within_0070
     * @tc.type    FUNCTION
     * @tc.desc    Test copyWithin with target <= start (forward copy)
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_copy_within_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_copy_within_0070";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 2, 4);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0071
     * @tc.name    test_copy_within_0071
     * @tc.desc    Test copyWithin with target > start (backward copy)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_copy_within_0071";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 2, 0, 2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0072
     * @tc.name    test_copy_within_0072
     * @tc.desc    Test copyWithin with negative indices normalization
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it(' test_copy_within_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0072";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, -2, -4, -1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0073
     * @tc.name    test_copy_within_0073
     * @tc.desc    Test copyWithin truncates copy length when exceeding array bounds
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it(' test_copy_within_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0073";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 0, 5);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0074
     * @tc.name    test_copy_within_0074
     * @tc.desc    Test copyWithin with start equals end (no copy occurs)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0074";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 0, 1, 1);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0075
     * @tc.name    testCopyWithin0075
     * @tc.desc    Test copyWithin copying entire array to target
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0075";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 0, self.length);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0076
     * @tc.name    test_copy_within_0076
     * @tc.desc    Test backward copy with truncation when exceeding array bounds
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it(' test_copy_within_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0076";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 3, 1, 4);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0077
     * @tc.name    testCopyWithin0077
     * @tc.desc    Test copyWithin copying a portion of elements starting from a middle index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0077";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, 1, 3);
            expect(result[0]).assertEqual(false);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0078
     * @tc.name    testCopyWithin0078
     * @tc.desc    Test copyWithin copying the entire array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0078";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, 0, 4);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0079
     * @tc.name    testCopyWithin0079
     * @tc.desc    Test copyWithin when target index is greater than start index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0079";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 2, 0);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0080
     * @tc.name    test_copy_within_0080
     * @tc.desc    Test copyWithin with an array of two elements
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0080";
        try {
            let self: FixedArray<boolean> = [true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 0);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0081
     * @tc.name    testCopyWithin0081
     * @tc.desc    Test copyWithin with an empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0081";
        try {
            let self: FixedArray<boolean> = [] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0082
     * @tc.name    testCopyWithin0082
     * @tc.desc    Test copyWithin with a negative start index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0082";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, -2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0083
     * @tc.name    testCopyWithin0083
     * @tc.desc    Test copyWithin with default end value (array length)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0083";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 0, 2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0084
     * @tc.name    testCopyWithin0084
     * @tc.desc    Test copyWithin with negative end index (relative to end)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0084";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 2, -1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0085
     * @tc.name    test_copy_within_0085
     * @tc.desc    Test copyWithin with target beyond array length (no copy occurs)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it(' test_copy_within_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0085";
        try {
            let self: FixedArray<boolean> = [true, false] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 5, 0, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0086
     * @tc.name    testCopyWithin0086_01
     * @tc.desc    Test copyWithin with large negative start (treated as 0)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0086_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0086_01";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 1, -10, 2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0087
     * @tc.name    test_copy_within_0087
     * @tc.desc    Test copyWithin with start after end (no copy occurs)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0087";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let original = [...self];
            let result = copyWithin(self, 0, 2, 1);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0088
     * @tc.name    testCopyWithin0088
     * @tc.desc    Test copyWithin copying a single element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0088";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 2, 0, 1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0089
     * @tc.name    testCopyWithin0089
     * @tc.desc    Test copyWithin overwriting elements with themselves
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0089";
        try {
            let self: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, 1, 1, 2);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0090
     * @tc.name    testCopyWithin0090
     * @tc.desc    Test copyWithin with all negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0090";
        try {
            let self: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
            let result = copyWithin(self, -3, -2, -1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(false);
            expect(result[3]).assertEqual(false);
            expect(result[4]).assertEqual(true);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0091
     * @tc.name    testcopywithin0091
     * @tc.desc    Test copyWithin with target at end of array (partial copy)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testcopywithin0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0091";
        try {
            let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
            let result = copyWithin(self, 2, 0, 3);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(false);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(false);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0092
     * @tc.name    test_copy_within_0092
     * @tc.desc    Test copyWithin with default start and end values (0 and array length)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0092";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBORARY_UTIL_ARRAY_COPY_WITHIN_0093
     * @tc.name    testCopyWithin0093_01
     * @tc.desc    Test copyWithin with target index 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0093_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "testCopyWithin0093_01";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9400
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9400
     * @tc.desc    Test copyWithin with target index in the middle of the array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9400";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 2);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(1);
            expect(result[3]).assertEqual(2);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9500
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9500
     * @tc.desc    Test copyWithin with target index at the end of the array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9500";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 3);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(1);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9600
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9600
     * @tc.desc    Test copyWithin with target index beyond the array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9600";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 10);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9700
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9700
     * @tc.desc    Test copyWithin with an empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9700";
        try {
            let self: FixedArray<byte> = [] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9800
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9800
     * @tc.desc    Test copyWithin with negative target index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9800";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, -2);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(1);
            expect(result[3]).assertEqual(2);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_9900
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_9900
     * @tc.desc    Test copyWithin with target index equal to array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_9900";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, self.length);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_10000
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_10000
     * @tc.desc    Test copyWithin on single-element array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_10000";
        try {
            let self: FixedArray<byte> = [42] as FixedArray<byte>;
            let result = copyWithin(self, 0);
            expect(result[0]).assertEqual(42);
            expect(result.length).assertEqual(1);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_10100
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_10100
     * @tc.desc    Test copyWithin with large negative target
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_10100";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, -10);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_10200
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_10200
     * @tc.desc    Test copyWithin with overlapping source and target regions
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_10200";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4, 5] as FixedArray<byte>;
            let result = copyWithin(self, 2);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(1);
            expect(result[3]).assertEqual(2);
            expect(result[4]).assertEqual(3);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_10300
     * @tc.name    test_sub_commonlibrary_util_array_copy_within_10300
     * @tc.desc    Test copyWithin with default end value (array length)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_sub_commonlibrary_util_array_copy_within_10300";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0, 1);
            expect(result[0]).assertEqual(2);
            expect(result[1]).assertEqual(3);
            expect(result[2]).assertEqual(4);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_104
     * @tc.name    sub_commonlibrary_util_array_copy_within_104
     * @tc.desc    Test copyWithin with start index in the middle of the array.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_104";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0, 2);
            expect(result[0]).assertEqual(3);
            expect(result[1]).assertEqual(4);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_105
     * @tc.name    sub_commonlibrary_util_array_copy_within_105
     * @tc.desc    Test copyWithin with overlapping start and end regions.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_105";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 2, 1);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(2);
            expect(result[3]).assertEqual(3);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_106
     * @tc.name    sub_commonlibrary_util_array_copy_within_106
     * @tc.desc    Test copyWithin with negative start index.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_106";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0, -2);
            expect(result[0]).assertEqual(3);
            expect(result[1]).assertEqual(4);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_107
     * @tc.name    sub_commonlibrary_util_array_copy_within_107
     * @tc.desc    Test copyWithin with start index beyond array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_107";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 10);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_108
     * @tc.name    sub_commonlibrary_util_array_copy_within_108
     * @tc.desc    Test copyWithin with an empty array.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_108";
        try {
            let self: FixedArray<byte> = [] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_109
     * @tc.name    sub_commonlibrary_util_array_copy_within_109
     * @tc.desc    Test copyWithin with start index equal to array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_109";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, self.length);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_110
     * @tc.name    sub_commonlibrary_util_array_copy_within_110
     * @tc.desc    Test copyWithin with target index equal to array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_110";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, self.length, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_111
     * @tc.name    sub_commonlibrary_util_array_copy_within_111
     * @tc.desc    Test copyWithin with empty target array.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_111";
        try {
            let self: FixedArray<byte> = [] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_112
     * @tc.name    sub_commonlibrary_util_array_copy_within_112
     * @tc.desc    Test copyWithin with multiple elements.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_112";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4, 5, 6] as FixedArray<byte>;
            let result = copyWithin(self, 3, 1);
            expect(result[3]).assertEqual(2);
            expect(result[4]).assertEqual(3);
            expect(result[5]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_113
     * @tc.name    sub_commonlibrary_util_array_copy_within_113
     * @tc.desc    Test copyWithin with negative start and end values.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_113";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0, -3, -1);
            expect(result[0]).assertEqual(2);
            expect(result[1]).assertEqual(3);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_114
     * @tc.name    sub_commonlibrary_util_array_copy_within_114
     * @tc.desc    Test copyWithin with same target and start index.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_114";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_115
     * @tc.name    sub_commonlibrary_util_array_copy_within_115
     * @tc.desc    Test copyWithin with overlapping regions after end.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_115";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4, 5, 6] as FixedArray<byte>;
            let result = copyWithin(self, 0, 4, 6);
            expect(result[0]).assertEqual(5);
            expect(result[1]).assertEqual(6);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
            expect(result[4]).assertEqual(5);
            expect(result[5]).assertEqual(6);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_116
     * @tc.name    sub_commonlibrary_util_array_copy_within_116
     * @tc.desc    Test copyWithin all elements.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_116";
        try {
            let self: FixedArray<byte> = [1, 2, 3, 4] as FixedArray<byte>;
            let result = copyWithin(self, 0, 0);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_117
     * @tc.name    sub_commonlibrary_util_array_copy_within_117
     * @tc.desc    Test copyWithin with normal middle target and start indices.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_117";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 2, 1);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(20);
            expect(result[3]).assertEqual(30);
            expect(result[4]).assertEqual(40);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_118
     * @tc.name    sub_commonlibrary_util_array_copy_within_118
     * @tc.desc    Test copyWithin with a negative start index.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_118";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 0, -3);
            expect(result[0]).assertEqual(30);
            expect(result[1]).assertEqual(40);
            expect(result[2]).assertEqual(50);
            expect(result[3]).assertEqual(40);
            expect(result[4]).assertEqual(50);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_119
     * @tc.name    sub_commonlibrary_util_array_copy_within_119
     * @tc.desc    Test copyWithin with start index beyond the array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_119";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 10);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_120
     * @tc.name    sub_commonlibrary_util_array_copy_within_120
     * @tc.desc    Test copyWithin with start index equal to array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_120";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, self.length);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHin_121
     * @tc.name    sub_commonlibrary_util_array_copy_within_121
     * @tc.desc    Test copyWithin with an empty array.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_121";
        try {
            let self: FixedArray<byte> = [] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_122
     * @tc.name    sub_commonlibrary_util_array_copy_within_122
     * @tc.desc    Test copyWithin with partial overlapping regions.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_122";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25] as FixedArray<byte>;
            let result = copyWithin(self, 1, 1, 4);
            expect(result[0]).assertEqual(5);
            expect(result[1]).assertEqual(10);
            expect(result[2]).assertEqual(15);
            expect(result[3]).assertEqual(20);
            expect(result[4]).assertEqual(25);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_123
     * @tc.name    sub_commonlibrary_util_array_copy_within_123
     * @tc.desc    Test copyWithin with a negative end index.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_123";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25] as FixedArray<byte>;
            let result = copyWithin(self, 0, 0, -2);
            expect(result[0]).assertEqual(5);
            expect(result[1]).assertEqual(10);
            expect(result[2]).assertEqual(15);
            expect(result[3]).assertEqual(20);
            expect(result[4]).assertEqual(25);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_124
     * @tc.name    sub_commonlibrary_util_array_copy_within_124
     * @tc.desc    Test copyWithin with end index beyond the array length.
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('sub_commonlibrary_util_array_copy_within_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "sub_commonlibrary_util_array_copy_within_124";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25] as FixedArray<byte>;
            let result = copyWithin(self, 0, 2, 10);
            expect(result[0]).assertEqual(15);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(25);
            expect(result[3]).assertEqual(20);
            expect(result[4]).assertEqual(25);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_125
     * @tc.name    test_copy_within_125
     * @tc.desc    Test copyWithin with end index equal to start index.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_125";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_126
     * @tc.name    test_copy_within_126
     * @tc.desc    Test copyWithin with overlapping regions after end.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_126";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25, 30] as FixedArray<byte>;
            let result = copyWithin(self, 0, 4, 6);
            expect(result[0]).assertEqual(25);
            expect(result[1]).assertEqual(30);
            expect(result[2]).assertEqual(15);
            expect(result[3]).assertEqual(20);
            expect(result[4]).assertEqual(25);
            expect(result[5]).assertEqual(30);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_127
     * @tc.name    test_copy_within_127
     * @tc.desc    Test copyWithin with same target, start, and end indices.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_127";
        try {
            let self: FixedArray<byte> = [5, 10, 15, 20, 25, 30] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 2, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_128
     * @tc.name    test_copy_within_128
     * @tc.desc    Test copyWithin with normal target, start, and end indices.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_128";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 0, 1, 3);
            expect(result[0]).assertEqual(20);
            expect(result[1]).assertEqual(30);
            expect(result[2]).assertEqual(30);
            expect(result[3]).assertEqual(40);
            expect(result[4]).assertEqual(50);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_129
     * @tc.name    test_copy_within_129
     * @tc.desc    Test copyWithin with negative target, start, and end indices.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_129";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, -3, -4, -1);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(20);
            expect(result[3]).assertEqual(30);
            expect(result[4]).assertEqual(40);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_130
     * @tc.name    test_copy_within_130
     * @tc.desc    Test copyWithin when start index is greater than end index.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_130";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 3, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_131
     * @tc.name    test_copy_within_131
     * @tc.desc    Test copyWithin when end index exceeds array length.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_131";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 0, 1, 10);
            expect(result[0]).assertEqual(20);
            expect(result[1]).assertEqual(30);
            expect(result[2]).assertEqual(40);
            expect(result[3]).assertEqual(50);
            expect(result[4]).assertEqual(50);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_132
     * @tc.name    test_copy_within_132
     * @tc.desc    Test copyWithin with an empty array.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_132";
        try {
            let self: FixedArray<byte> = [] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_133
     * @tc.name    test_copy_within_133
     * @tc.desc    Test copyWithin with a single-element array.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_133";
        try {
            let self: FixedArray<byte> = [42] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0, 1);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_134
     * @tc.name    test_copy_within_134
     * @tc.desc    Test copyWithin with zero-length copy (start equals end).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_134";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });
	
    /**
     * @tc.number  SUB_COMMONLIBUTIL_ARRAY_COPY_WITHIN_135
     * @tc.name    test_copy_within_135
     * @tc.desc    Test copyWithin with normal target, start, and end indices.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_copy_within_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "test_copy_within_135";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 2, 1, 4);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(20);
            expect(result[3]).assertEqual(30);
            expect(result[4]).assertEqual(40);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_UTIL_ARRAY_COPY_WITHIN_0136
     * @tc.name    ARRAY_COPY_WITHIN_NEGATIVE_INDICES_136
     * @tc.desc    Test copyWithin with negative target, start, and end indices.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('ARRAY_COPY_WITHIN_NEGATIVE_INDICES_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "ARRAY_COPY_WITHIN_NEGATIVE_INDICES_136";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, -2, -3, -1);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(30);
            expect(result[3]).assertEqual(30);
            expect(result[4]).assertEqual(40);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_UTIL_ARRAY_COPY_WITHIN_0137
     * @tc.name    ARRAY_COPY_WITHIN_END_EXCEEDS_137
     * @tc.desc    Test copyWithin when end index exceeds array length.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('ARRAY_COPY_WITHIN_END_EXCEEDS_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "ARRAY_COPY_WITHIN_END_EXCEEDS_137";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let result = copyWithin(self, 0, 1, 20);
            expect(result[0]).assertEqual(20);
            expect(result[1]).assertEqual(30);
            expect(result[2]).assertEqual(40);
            expect(result[3]).assertEqual(50);
            expect(result[4]).assertEqual(50);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_UTIL_ARRAY_COPY_WITHIN_0138
     * @tc.name    ARRAY_COPY_WITHIN_ZERO_LENGTH_138
     * @tc.desc    Test copyWithin with zero-length copy (start equals end).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('ARRAY_COPY_WITHIN_ZERO_LENGTH_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "ARRAY_COPY_WITHIN_ZERO_LENGTH_138";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_UTIL_ARRAY_COPY_WITHIN_0139
     * @tc.name    ARRAY_COPY_WITHIN_END_EQUALS_START_139
     * @tc.desc    Test copyWithin when end index equals start index.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('ARRAY_COPY_WITHIN_END_EQUALS_START_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let TAG = "ARRAY_COPY_WITHIN_END_EQUALS_START_139";
        try {
            let self: FixedArray<byte> = [10, 20, 30, 40, 50] as FixedArray<byte>;
            let original = [...self];
            let result = copyWithin(self, 0, 2, 2);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(original));
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

  });
}