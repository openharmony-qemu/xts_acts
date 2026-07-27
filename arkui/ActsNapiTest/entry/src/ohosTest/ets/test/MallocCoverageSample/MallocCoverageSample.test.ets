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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import mallocCoverageSample from 'libmalloccoveragesamplendktest.so';
import type { MallocCoverageResult } from 'libmalloccoveragesamplendktest.so';

const MALLOC_CHECK_TRUE: number = 1;
const MALLOC_CHECK_FALSE: number = 0;
const MALLOC_CHECK_UNSUPPORTED: number = -1;
const MALLOPT_UNSUPPORTED_OR_NOOP_RESULT: number = 0;
const MALLOPT_SUCCESS_RESULT: number = 1;

export default function mallocCoverageSampleTest() {
  describe('MallocCoverageSampleTest', () => {
    /**
     * @tc.name   testMallocCoverage001
     * @tc.number SUB_THIRDPARTY_MALLOC_COVERAGE_0100
     * @tc.desc   Verify malloc_usable_size, mallopt, and malloc_check_from_ptr are covered by assertions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMallocCoverage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: MallocCoverageResult = mallocCoverageSample.testMallocCoverage();
      const isControlledMalloptResult: boolean = result.malloptResult === MALLOPT_UNSUPPORTED_OR_NOOP_RESULT ||
        result.malloptResult === MALLOPT_SUCCESS_RESULT;
      const isControlledAllocatedCheck: boolean = result.allocatedCheck === MALLOC_CHECK_TRUE ||
        result.allocatedCheck === MALLOC_CHECK_UNSUPPORTED;
      const isControlledStackCheck: boolean = result.stackCheck === MALLOC_CHECK_FALSE ||
        result.stackCheck === MALLOC_CHECK_UNSUPPORTED;
      expect(result.allocationSucceeded).assertTrue();
      expect(result.usableSizeAtLeastRequested).assertTrue();
      expect(isControlledMalloptResult).assertTrue();
      expect(isControlledAllocatedCheck).assertTrue();
      expect(isControlledStackCheck).assertTrue();
    });
  });
}
