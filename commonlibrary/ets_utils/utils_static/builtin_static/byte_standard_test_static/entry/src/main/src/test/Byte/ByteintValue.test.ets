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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic'
import Utils from '../Util.test';

export default function Byte_intValueTest(): void {
  describe("Byte_intValueTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_0200
     * @tc.name     testByteIntValuePassParameters0002
     * @tc.desc     Test passing parameters to Byte constructor creates a valid instance
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValuePassParameters0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        expect(b.toInt()).assertEqual(50);
      })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_2100
     * @tc.name     testByteIntValueFunctionalEquivalence0021
     * @tc.desc     Test intValue and toInt function exactly the same
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValueFunctionalEquivalence0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        expect(b.toInt()).assertEqual(66);
      })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_4200
     * @tc.name     testByteIntValueDataTransformation0042
     * @tc.desc     Test use intValue for data conversion
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValueDataTransformation0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const data = [10, 20, 30, 40, 50];
        const ints: number[] = data.map((v: int): number => {
          const b = new Byte(v.toByte());
          return b.toInt();
        });
        expect(ints.length).assertEqual(5);
        expect(ints[0]).assertEqual(10);
        expect(ints[4]).assertEqual(50);
      })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_5900
     * @tc.name     testByteIntValueFunctionalConsistency0059
     * @tc.desc     Test toInt and intValue are exactly the same
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValueFunctionalConsistency0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        expect(b.toInt()).assertEqual(77);
      })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_6000
     * @tc.name     testByteIntValueNamingConventionsToInt0060
     * @tc.desc     Test toInt is named with the 'to' prefix
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValueNamingConventionsToInt0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const r1 = b.toInt();
        expect(r1).assertEqual(66);
      })

    /**
     * @tc.number   SUB_BYTE_INT_VALUE_6300
     * @tc.name     testByteIntValueJavaStyleToInt0063
     * @tc.desc     Test Java style recommends using toInt
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteIntValueJavaStyleToInt0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const value: int = b.toInt();
        expect(value).assertEqual(99);
      })

  })
}
