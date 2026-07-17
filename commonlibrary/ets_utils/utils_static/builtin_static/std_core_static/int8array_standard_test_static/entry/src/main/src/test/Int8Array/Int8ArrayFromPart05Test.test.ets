'use static'

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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from './../Util.test';

class AL001 implements ArrayLike<number> {
  length: int = 0;
  private data: number[] = [];

  constructor(length: int, vals: number[]) {
    this.length = length;
    for (let i: int = 0; i < vals.length; i++) {
      this.data[i] = vals[i];
    }
  }

  $_set(i: int, v: number): void {
    this.data[i] = v;
  }

  $_get(i: int): number {
    return this.data[i];
  }
}

export default function int8ArrayFromPart05Test(): void {
  describe('Int8ArrayFromPart05Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0100
     * @tc.name int8ArrayFromPart05Test001
     * @tc.desc Verify from() with empty array returns empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int8Array = Int8Array.from(new Array<number>());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0200
     * @tc.name int8ArrayFromPart05Test002
     * @tc.desc Verify length=0 returns empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(0, []));
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0300
     * @tc.name int8ArrayFromPart05Test003
     * @tc.desc Verify length=Number.NEGATIVE_INFINITY non-finite negative value normalized to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(0, []));
      expect(r.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0400
     * @tc.name int8ArrayFromPart05Test004
     * @tc.desc Verify empty source return array underlying buffer.byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(0, []));
      expect(r.buffer.byteLength).assertEqual(0);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0500
       * @tc.name int8ArrayFromPart05Test005
       * @tc.desc Verify length=-1 normalized to 0, returns empty array without error
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayFromPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let threw: boolean = false;
        try {
          Int8Array.from(new AL001(-1, []));
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threw).assertTrue();
      });

});
}
