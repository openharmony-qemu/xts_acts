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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';


export default function IteratorResultConstructor1Test(): void {
  describe('IteratorResultConstructor1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async():Promise<void> =>{
      await Utils.msSleep(30);
    });
    afterEach(():void =>{
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0100
     * @tc.name testIteratorResultConstructor1001
     * @tc.desc Verify no-arg constructor creates done state without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: IteratorResult<string> = new IteratorResult<string>();
      expect(result.done).assertTrue();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0200
     * @tc.name testIteratorResultConstructor1002
     * @tc.desc Verify no-arg constructor with generic T=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: IteratorResult<string> = new IteratorResult<string>();
      expect(result === null).assertFalse();
      expect(result instanceof IteratorResult).assertTrue();
      expect(result.done).assertTrue();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0300
     * @tc.name testIteratorResultConstructor1003
     * @tc.desc Verify value property is undefined after no-arg construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: IteratorResult<string> = new IteratorResult<string>();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0400
     * @tc.name testIteratorResultConstructor1004
     * @tc.desc Verify type constraint for different generic T types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strResult: IteratorResult<string> = new IteratorResult<string>();
      let numResult: IteratorResult<number> = new IteratorResult<number>();
      let boolResult: IteratorResult<boolean> = new IteratorResult<boolean>();
      expect(strResult instanceof IteratorResult).assertTrue();
      expect(numResult instanceof IteratorResult).assertTrue();
      expect(boolResult instanceof IteratorResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0500
     * @tc.name testIteratorResultConstructor1005
     * @tc.desc Verify multiple instances created by no-arg constructor are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: IteratorResult<string> = new IteratorResult<string>();
      let result2: IteratorResult<string> = new IteratorResult<string>();
      expect(result1 === result2).assertFalse();
      expect(result1.done).assertTrue();
      expect(result2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0600
     * @tc.name testIteratorResultConstructor1006
     * @tc.desc Verify stability when creating large number of instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstResult: IteratorResult<number> = new IteratorResult<number>();
      let lastResult: IteratorResult<number> = new IteratorResult<number>();
      for (let i: number = 0; i < 1000; i++) {
        let result: IteratorResult<number> = new IteratorResult<number>();
        if (i === 0) firstResult = result;
        if (i === 999) lastResult = result;
        expect(result.done).assertTrue();
      }
      expect(firstResult === lastResult).assertFalse();
      expect(firstResult.done).assertTrue();
      expect(lastResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0700
     * @tc.name testIteratorResultConstructor1007
     * @tc.desc Verify no-arg constructor keeps done as boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: IteratorResult<string> = new IteratorResult<string>();
      expect(result.done).assertTrue();
      expect(typeof result.done === "boolean").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR1_0800
     * @tc.name testIteratorResultConstructor1008
     * @tc.desc Verify done property type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: IteratorResult<string> = new IteratorResult<string>();
      expect(typeof result.done === "boolean").assertTrue();
    });
  });
}
