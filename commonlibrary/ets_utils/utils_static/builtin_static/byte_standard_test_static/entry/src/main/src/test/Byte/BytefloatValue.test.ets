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
} from '../../../../hypium/index'
import Utils from '../Util.test';

export default function Byte_floatValueTest(): void {
  describe('Byte_floatValueTest', () => {
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
     * @tc.number   SUB_BYTE_FLOAT_VALUE_4100
     * @tc.name     testByteFloatValueDataTransformation0041
     * @tc.desc     Test use floatValue for data conversion
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteFloatValueDataTransformation0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const data = [10, 20, 30, 40, 50];
        const floats: number[] = data.map((v: int): number => {
          const b = new Byte(v.toByte());
          return b.toFloat();
        });
        expect(floats.length).assertEqual(5);
        expect(floats[0]).assertEqual(10);
        expect(floats[4]).assertEqual(50);
      })

    /**
     * @tc.number   SUB_BYTE_FLOAT_VALUE_5900
     * @tc.name     testByteFloatValueFunctionalConsistency0059
     * @tc.desc     Test floatValue and toFloat are exactly the same
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteFloatValueFunctionalConsistency0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        expect(b.toFloat()).assertEqual(77);
      })

    /**
     * @tc.number   SUB_BYTE_FLOAT_VALUE_6000
     * @tc.name     testByteFloatValueNamingConventions0060
     * @tc.desc     Test toFloat is named with the 'to' prefix
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteFloatValueNamingConventions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const r1 = b.toFloat();
        expect(r1).assertEqual(66);
      })

    /**
     * @tc.number   SUB_BYTE_FLOAT_VALUE_6300
     * @tc.name     testByteFloatJavaStyleRecommendationsToFloat0063
     * @tc.desc     Test Java style recommends using toFloat
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testByteFloatJavaStyleRecommendationsToFloat0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const value: float = b.toFloat();
        expect(value).assertEqual(99);
      })
  })
}
