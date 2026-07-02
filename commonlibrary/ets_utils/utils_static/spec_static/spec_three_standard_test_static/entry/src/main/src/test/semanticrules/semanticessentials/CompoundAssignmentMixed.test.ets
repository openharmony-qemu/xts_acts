'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function CompoundAssignmentMixed(): void {
  describe('CompoundAssignmentMixed', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0100
     * @tc.name      testCompoundAssignmentMixed0001
     * @tc.desc      Compound assignment with mixed types - Byte += int literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 100;
      a += 1000;
      expect(a | 0).assertEqual(76);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0200
     * @tc.name      testCompoundAssignmentMixed0002
     * @tc.desc      Compound assignment with mixed types - Byte += int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 50;
      let b: int = 1000;
      a += b;
      expect(a | 0).assertEqual(26);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0300
     * @tc.name      testCompoundAssignmentMixed0003
     * @tc.desc      Compound assignment with mixed types - Short += int literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1000;
      a += 100000;
      expect(a | 0).assertEqual(-30072);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0400
     * @tc.name      testCompoundAssignmentMixed0004
     * @tc.desc      Compound assignment with mixed types - Short += int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1000;
      let b: int = 100000;
      a += b;
      expect(a | 0).assertEqual(-30072);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0500
     * @tc.name      testCompoundAssignmentMixed0005
     * @tc.desc      Compound assignment with mixed types - Byte *= int with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10;
      let b: int = 100;
      a *= b;
      expect(a | 0).assertEqual(-24);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_MIXED_0600
     * @tc.name      testCompoundAssignmentMixed0006
     * @tc.desc      Compound assignment with mixed types - Short *= int with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentMixed0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 100;
      let b: int = 1000;
      a *= b;
      expect(a | 0).assertEqual(-31072);
    });

  })
}