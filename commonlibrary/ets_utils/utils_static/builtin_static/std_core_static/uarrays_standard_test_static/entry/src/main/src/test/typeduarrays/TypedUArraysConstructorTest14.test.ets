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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysConstructorTest14(): void {
  describe('TypedUArraysConstructorTest14', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0100
     * @tc.name testTypedUArraysConstructor050202_001
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 200;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val0 = a[8];
      expect(val0).assertEqual(200);
      const val1 = b[0];
      expect(val1).assertEqual(200);
      const val2 = c[0];
      expect(val2).assertEqual(300);
      const val3 = d[0];
      expect(val3).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0200
     * @tc.name testTypedUArraysConstructor050202_002
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 100;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val4 = a[8];
      expect(val4).assertEqual(100);
      const val5 = b[0];
      expect(val5).assertEqual(100);
      const val6 = c[0];
      expect(val6).assertEqual(300);
      const val7 = d[0];
      expect(val7).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0300
     * @tc.name testTypedUArraysConstructor050202_003
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 200;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val8 = a[8];
      expect(val8).assertEqual(200);
      const val9 = b[0];
      expect(val9).assertEqual(200);
      const val10 = c[0];
      expect(val10).assertEqual(300);
      const val11 = d[0];
      expect(val11).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0400
     * @tc.name testTypedUArraysConstructor050202_004
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 100;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val12 = a[8];
      expect(val12).assertEqual(100);
      const val13 = b[0];
      expect(val13).assertEqual(100);
      const val14 = c[0];
      expect(val14).assertEqual(300);
      const val15 = d[0];
      expect(val15).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0500
     * @tc.name testTypedUArraysConstructor050202_005
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 200;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val16 = a[8];
      expect(val16).assertEqual(200);
      const val17 = b[0];
      expect(val17).assertEqual(200);
      const val18 = c[0];
      expect(val18).assertEqual(300);
      const val19 = d[0];
      expect(val19).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0202_0600
     * @tc.name testTypedUArraysConstructor050202_006
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      new Uint16Array(buf, 8, 8)[0] = 100;
      new Uint32Array(buf, 16, 2)[0] = 300;
      new BigUint64Array(buf, 24, 1)[0] = 400n;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val20 = a[8];
      expect(val20).assertEqual(100);
      const val21 = b[0];
      expect(val21).assertEqual(100);
      const val22 = c[0];
      expect(val22).assertEqual(300);
      const val23 = d[0];
      expect(val23).assertEqual(400n);
    });

  });
}
