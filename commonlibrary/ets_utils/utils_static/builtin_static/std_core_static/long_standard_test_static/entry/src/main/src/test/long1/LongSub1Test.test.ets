'use static';

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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longSub1Test(): void {
  describe('LongSub1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB1_0100
     * @tc.name testLongSub1_001
     * @tc.desc Verify sub of large positive Long minus negative Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongSub1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Long = new Long(10000000000).sub(new Long(-10000000000));
      expect(r.toLong()).assertEqual(20000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB1_0200
     * @tc.name testLongSub1_002
     * @tc.desc Verify sub of large negative Long minus small positive Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongSub1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Long = new Long(-10000000000).sub(new Long(1));
      expect(r.toLong()).assertEqual(-10000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB1_0300
     * @tc.name testLongSub1_003
     * @tc.desc Verify sub overflows int32 when Long.MAX_VALUE minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongSub1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Long = new Long(9223372036854775807).sub(new Long(1));
      expect(r.toInt()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB1_0400
     * @tc.name testLongSub1_004
     * @tc.desc Verify sub overflows int32 when Long.MIN_VALUE minus -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongSub1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Long = new Long(Long.MIN_VALUE).sub(new Long(-1));
      expect(r.toInt()).assertEqual(1);
    });
  });
}
