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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArrayPropertiesPart04Test(): void {
  describe('Int8ArrayPropertiesPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART04_TEST_0100
     * @tc.name int8ArrayPropertiesPart04Test001
     * @tc.desc Verify an array built over a buffer exposes that very buffer, unchanged in size, for whole-buffer and offset views alike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const whole: Int8Array = new Int8Array(buf);
      const sameWhole: boolean = whole.buffer === buf;
      expect(sameWhole).assertTrue();
      expect(whole.buffer.byteLength).assertEqual(4);
      const offsetView: Int8Array = new Int8Array(buf, 1, 2);
      const sameOffset: boolean = offsetView.buffer === buf;
      expect(sameOffset).assertTrue();
      expect(offsetView.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART04_TEST_0200
     * @tc.name int8ArrayPropertiesPart04Test002
     * @tc.desc Verify subarray shares the source buffer, so a write inside the view range is visible through the source and vice versa
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = source.subarray(1, 3);
      const sameBuffer: boolean = view.buffer === source.buffer;
      expect(sameBuffer).assertTrue();
      expect(view.buffer.byteLength).assertEqual(4);
      expect(view.length).assertEqual(2);
      expect(view.byteOffset).assertEqual(1);
      view.$_set(0, 99);
      expect(source.$_get(1)).assertEqual(99);
      source.$_set(2, -7);
      expect(view.$_get(1)).assertEqual(-7);
      expect(source.$_get(0)).assertEqual(10);
      expect(source.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART04_TEST_0300
     * @tc.name int8ArrayPropertiesPart04Test003
     * @tc.desc Verify slice allocates an independent buffer so a write to the copy never reaches the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([10, 20, 30, 40]);
      const copy: Int8Array = source.slice(1, 3);
      const distinctBuffer: boolean = copy.buffer !== source.buffer;
      expect(distinctBuffer).assertTrue();
      expect(copy.buffer.byteLength).assertEqual(2);
      expect(copy.byteOffset).assertEqual(0);
      copy.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(99);
      expect(source.$_get(1)).assertEqual(20);
      expect(source.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART04_TEST_0400
     * @tc.name int8ArrayPropertiesPart04Test004
     * @tc.desc Verify of and from each allocate their own buffer, distinct from the source array and from one another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([1, 2, 3]);
      const fromSource: Int8Array = Int8Array.from(source);
      const fromDistinct: boolean = fromSource.buffer !== source.buffer;
      expect(fromDistinct).assertTrue();
      fromSource.$_set(0, 99);
      expect(source.$_get(0)).assertEqual(1);
      const fromOf: Int8Array = Int8Array.of(1, 2, 3);
      const ofDistinct: boolean = fromOf.buffer !== source.buffer;
      expect(ofDistinct).assertTrue();
      const bothDistinct: boolean = fromOf.buffer !== fromSource.buffer;
      expect(bothDistinct).assertTrue();
      const first: Int8Array = new Int8Array([1, 2]);
      const second: Int8Array = new Int8Array([1, 2]);
      const independentBuffers: boolean = first.buffer !== second.buffer;
      expect(independentBuffers).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART04_TEST_0500
     * @tc.name int8ArrayPropertiesPart04Test005
     * @tc.desc Verify writes through a view leave the buffer identity and its byteLength untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2, 4);
      const bufferRef: ArrayBuffer = view.buffer;
      view.$_set(0, 99);
      view.$_set(3, -99);
      const sameBuffer: boolean = view.buffer === bufferRef;
      expect(sameBuffer).assertTrue();
      expect(view.buffer.byteLength).assertEqual(8);
      expect(view.byteOffset).assertEqual(2);
      expect(view.byteLength).assertEqual(4);
      expect(view.$_get(0)).assertEqual(99);
      expect(view.$_get(3)).assertEqual(-99);
    });
  });
}
