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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferIsViewTest(): void {
  describe('ArrayBufferIsViewTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferIsView0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0100
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0200
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0300
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0400
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0500
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0600
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0700
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0800
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0900
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Float64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1000
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(ArrayBuffer.isView(buffer)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1100
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(Utils.plainObject())).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1200
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(Utils.plainObject())).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1300
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      expect(ArrayBuffer.isView(s)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1400
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      expect(ArrayBuffer.isView(s)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1500
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 123;
      expect(ArrayBuffer.isView(n)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1600
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 0;
      expect(ArrayBuffer.isView(n)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1700
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(Double.NaN)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1800
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(true)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1900
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(false)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2000
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(new Array<int>())).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2100
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView([1, 2, 3])).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2200
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2300
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Int8Array(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2400
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2500
     * @tc.desc Verify kind === 'boolean' || kind === 'Boolean' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let kind: string = typeof ArrayBuffer.isView(view);
      expect(kind === 'boolean' || kind === 'Boolean').assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2600
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(typeof ArrayBuffer.isView(view) !== 'number').assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2700
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(typeof ArrayBuffer.isView(view) !== 'string').assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2800
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(typeof ArrayBuffer.isView(view) !== 'object').assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_2900
     * @tc.desc Verify kind === 'boolean' || kind === 'Boolean' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let kind: string = typeof ArrayBuffer.isView(Utils.plainObject());
      expect(kind === 'boolean' || kind === 'Boolean').assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3000
     * @tc.desc Verify ArrayBuffer.isView(Utils.nullAsObject()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.isView(Utils.nullAsObject());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferIsView0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3100
     * @tc.desc Verify ArrayBuffer.isView(Utils.undefinedAsObject()) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.isView(Utils.undefinedAsObject());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferIsView0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3200
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = -1;
      expect(ArrayBuffer.isView(n)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3300
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = Double.POSITIVE_INFINITY;
      expect(ArrayBuffer.isView(n)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3400
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = Double.NEGATIVE_INFINITY;
      expect(ArrayBuffer.isView(n)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3500
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3600
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Int8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_3700
     * @tc.desc Verify ArrayBuffer.isView returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(ArrayBuffer.isView(buffer)).assertFalse();
    });
  });
}
