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

import { collections } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {BIND_ERROR_CODE, CONCURRENT_ERROR_CODE} from './common'

@Sendable
class SendableBox {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

@Sendable
class SubSendableArray extends collections.Array<number> {
  constructor() {
    super();
  }
}

class SubNormalArray extends Array {
  constructor() {
    super();
  }
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function assertArrayValues<T>(array: collections.Array<T>, expected: T[]): void {
  expect(array.length).assertEqual(expected.length);
  for (let index: number = 0; index < expected.length; index++) {
    let arrayElement: T|undefined = array.at(index);
    let expectedElement: T|undefined = expected[index];
    expect(arrayElement === expectedElement).assertEqual(true);
  }
}

function assertAllowedConcurrentCode(code: number): void {
  if (code === 0) {
    expect(code).assertEqual(0);
  } else {
    expect(code).assertEqual(CONCURRENT_ERROR_CODE);
  }
}

@Concurrent
function containsAllRace(array: collections.Array<number>, elements: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.containsAll(elements);
    } catch (error) {
      if (error.code === CONCURRENT_ERROR_CODE) {
        errorCode = CONCURRENT_ERROR_CODE;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function retainAllElementRace(array: collections.Array<number>, elements: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.retainAll(elements);
    } catch (error) {
      if (error.code === CONCURRENT_ERROR_CODE) {
        errorCode = CONCURRENT_ERROR_CODE;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function retainAllPredicateRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.retainAll((value: number): boolean => value >= 0);
    } catch (error) {
      if (error.code === CONCURRENT_ERROR_CODE) {
        errorCode = CONCURRENT_ERROR_CODE;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function WriteRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.push(666);
    } catch (error) {
      if (error.code === CONCURRENT_ERROR_CODE) {
        errorCode = CONCURRENT_ERROR_CODE;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function ReadRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.at(index);
    } catch (error) {
      if (error.code === CONCURRENT_ERROR_CODE) {
        errorCode = CONCURRENT_ERROR_CODE;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

export default function CollectionsArrayApisTest(): void {
  describe('CollectionsArrayApisTest', (): void => {
    beforeAll((done: Function): void => {
      done();
    });
    beforeEach((done: Function): void => {
      done();
    });
    afterEach((done: Function): void => {
      done();
    });
    afterAll(async (done: Function): Promise<void> => {
      await sleep(20);
      done();
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0100
     * @tc.desc   Verify containsAll normal behavior, empty input, duplicate input and self input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0100';
      console.info(`${caseName}, test start`);

      const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 3);
      let normalArr = [1, 3];
      expect(receiver.containsAll(normalArr)).assertEqual(true);
      expect(receiver.containsAll(new collections.Array<number>(1, 3))).assertEqual(true);
      normalArr = [3, 1];
      expect(receiver.containsAll(normalArr)).assertEqual(true);
      normalArr = [1, 1, 3]
      expect(receiver.containsAll(normalArr)).assertEqual(true);
      normalArr = [4]
      expect(receiver.containsAll(normalArr)).assertEqual(false);
      expect(receiver.containsAll(new collections.Array<number>(1, 2, 3))).assertEqual(true);
      expect(receiver.containsAll(new collections.Array<number>(3, 2, 2, 1))).assertEqual(true);
      normalArr = [];
      expect(receiver.containsAll(normalArr)).assertEqual(true);
      expect(receiver.containsAll(new Array<number>(0))).assertEqual(true);
      expect(receiver.containsAll(new collections.Array<number>())).assertEqual(true);
      expect(receiver.containsAll(receiver)).assertEqual(true);
      assertArrayValues(receiver, [1, 2, 3, 3]);

      const emptyReceiver: collections.Array<number> = new collections.Array<number>();
      normalArr = [1];
      expect(emptyReceiver.containsAll(normalArr)).assertEqual(false);
      normalArr = [];
      expect(emptyReceiver.containsAll(normalArr)).assertEqual(true);
      expect(emptyReceiver.containsAll(new Array<number>(0))).assertEqual(true);
      expect(emptyReceiver.containsAll(new collections.Array<number>(0))).assertEqual(false);
      expect(emptyReceiver.containsAll(new collections.Array<number>())).assertEqual(true);
      expect(emptyReceiver.containsAll(emptyReceiver)).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0200
     * @tc.desc   Verify containsAll SameValueZero behavior and reference equality behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0200';
      console.info(`${caseName}, test start`);

      const nanReceiver: collections.Array<number> = new collections.Array<number>(NaN, 0);
      let normalArr = [NaN];
      expect(nanReceiver.containsAll(normalArr)).assertEqual(true);
      normalArr = [-0];
      expect(nanReceiver.containsAll(normalArr)).assertEqual(true);
      normalArr = [+0];
      expect(nanReceiver.containsAll(normalArr)).assertEqual(true);

      const nullableReceiver: collections.Array<null | undefined> =
        new collections.Array<null | undefined>(null, undefined);
      let nullArr = [null];
      expect(nullableReceiver.containsAll(nullArr)).assertEqual(true);
      let undefinedArr = [undefined];
      expect(nullableReceiver.containsAll(undefinedArr)).assertEqual(true);

      const undefinedReceiver: collections.Array<null | undefined> =
        new collections.Array<null | undefined>(undefined, undefined);
      expect(undefinedReceiver.containsAll(nullArr)).assertEqual(false);
      expect(undefinedReceiver.containsAll(undefinedArr)).assertEqual(true);

      const sharedBox: SendableBox = new SendableBox(1);
      const objectReceiver: collections.Array<SendableBox> = new collections.Array<SendableBox>(sharedBox);
      let objArr = [sharedBox];
      expect(objectReceiver.containsAll(objArr)).assertEqual(true);
      objArr = [new SendableBox(1)];
      expect(objectReceiver.containsAll(objArr)).assertEqual(false);

      const sharedContainer: collections.Array<number> = new collections.Array<number>(1, 2);
      const containerReceiver: collections.Array<collections.Array<number>> =
        new collections.Array<collections.Array<number>>(sharedContainer);
      let containerArr = [sharedContainer];
      expect(containerReceiver.containsAll(containerArr)).assertEqual(true);
      containerArr = [new collections.Array<number>(1, 2)];
      expect(containerReceiver.containsAll(containerArr)).assertEqual(false);

      const stringReceiver: collections.Array<string | number> = new collections.Array<string | number>('1');
      let stringArr = ['1'];
      expect(stringReceiver.containsAll(stringArr)).assertEqual(true);
      normalArr = [1];
      expect(stringReceiver.containsAll(normalArr)).assertEqual(false);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0300
     * @tc.desc   Verify containsAll ignores sparse holes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0300';
      console.info(`${caseName}, test start`);

      const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      const sparseElements: number[] = new Array<number>(2);
      sparseElements[1] = 1;
      expect(receiver.containsAll(sparseElements)).assertEqual(true);

      const emptySparseElements: number[] = new Array<number>(3);
      expect(receiver.containsAll(emptySparseElements)).assertEqual(true);

      let sparseArray = new Array<number>(0x4000);
      sparseArray[1050] = 3;
      sparseArray[2050] = 3;
      sparseArray[3050] = 1;
      expect(receiver.containsAll(sparseArray)).assertEqual(true);

      let sparseArray2 = [3, ,];
      let receiver2: collections.Array<number | undefined> = new collections.Array<number>(1, 2, 3);
      expect(receiver2.containsAll(sparseArray2)).assertEqual(true);
      sparseArray2 = [, ,];
      expect(receiver2.containsAll(sparseArray2)).assertEqual(true);
      sparseArray2 = [, , 1];
      expect(receiver2.containsAll(sparseArray2)).assertEqual(true);
      sparseArray2 = [2, , 1];
      expect(receiver2.containsAll(sparseArray2)).assertEqual(true);
      sparseArray2 = [2, , 1, , , 2, , 3, , 1];
      expect(receiver2.containsAll(sparseArray2)).assertEqual(true);
      sparseArray2 = [, , , 100];
      expect(receiver2.containsAll(sparseArray2)).assertEqual(false);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0400
     * @tc.desc   Verify containsAll distinguishes real undefined elements from sparse array holes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0400';
      console.info(`${caseName}, test start`);

      const undefinedReceiver: collections.Array<undefined> = new collections.Array<undefined>(undefined);
      const sparseUndefinedElements: undefined[] = new Array<undefined>(1);
      expect(undefinedReceiver.containsAll(sparseUndefinedElements)).assertEqual(true);
      expect(undefinedReceiver.containsAll(new collections.Array<undefined>(undefined))).assertEqual(true);
      let undefinedArr = [undefined];
      expect(undefinedReceiver.containsAll(undefinedArr)).assertEqual(true);
      let sparseArray: Array<undefined> = [];
      expect(undefinedReceiver.containsAll(sparseArray)).assertEqual(true);
      sparseArray = [, , , ];
      expect(undefinedReceiver.containsAll(sparseArray)).assertEqual(true);
      sparseArray = [, undefined, , ];
      expect(undefinedReceiver.containsAll(sparseArray)).assertEqual(true);
      sparseArray = [, , , undefined, , , , undefined, ];
      expect(undefinedReceiver.containsAll(sparseArray)).assertEqual(true);

      const numberReceiver: collections.Array<number | undefined> =
        new collections.Array<number>(1, 2);
      expect(numberReceiver.containsAll(undefinedArr)).assertEqual(false);
      expect(numberReceiver.containsAll(new Array<number | undefined>(4))).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0500
     * @tc.desc   Verify containsAll reports bind errors when invoked without a collections.Array receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0500';
      console.info(`${caseName}, test start`);

      const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      const containsAllMethod: (elements: number[]) => boolean = receiver.containsAll;
      let thrown: boolean = false;
      try {
        let numberArr = [1];
        containsAllMethod(numberArr);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundContainsAll:Function = containsAllMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundContainsAll([1]);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0600
     * @tc.desc   Verify containsAll inherit behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0600';
      console.info(`${caseName}, test start`);

      const subSharedReceiver = new SubSendableArray();
      subSharedReceiver.push(1);
      subSharedReceiver.push(2);
      subSharedReceiver.push(3);
      const subSharedElements = new SubSendableArray();
      subSharedElements.push(1);
      subSharedElements.push(3);
      const subNormalArray = new SubNormalArray();
      subNormalArray.push(1);
      subNormalArray.push(3);
      let numberArr = [1, 3];
      expect(subSharedReceiver.containsAll(numberArr)).assertEqual(true);
      expect(subSharedReceiver.containsAll(new collections.Array<number>(1, 3))).assertEqual(true);
      expect(subSharedReceiver.containsAll(subNormalArray)).assertEqual(true);
      expect(subSharedReceiver.containsAll(subSharedElements)).assertEqual(true);

      const array1 = new collections.Array<number>(1, 2, 3);
      expect(array1.containsAll(subSharedElements)).assertEqual(true);
      expect(array1.containsAll(subNormalArray)).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0700
     * @tc.desc   Verify containsAll concurrent modify error in one-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayContainsAllTest0700';
      console.info(`${caseName}, test start`);

      let array = new collections.Array<string>('a', 'b', 'c');
      array.forEach((value, index, array) => { // hold Read-mode lock
        let valueArr = [value];
        expect(array.containsAll(valueArr)).assertEqual(true); // try hold Read-mode lock, no exception
        expect(array.containsAll(new collections.Array<string>(value))).assertEqual(true);
      });

      let thrown: boolean = false;
      try {
        array.retainAll((value) => { // hold Write-mode lock
          let valueArr = [value];
          array.containsAll(valueArr); // try hold Read-mode lock, throw exception
          expect(false).assertEqual(true); // unreachable branch
          return true;
        })
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayContainsAllTest0800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0800
     * @tc.desc   Verify containsAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest0800';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);

        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          readPromises.push(taskpool.execute(containsAllRace, sharedArray, sharedElements));
        }
        try {
          for (let i = 0; i < readPromises.length; i++) {
            const readResult: Object = await readPromises[i];
            const readCode: number = readResult as number;
            expect(readCode).assertEqual(0); // only read, no exception
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest0900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_0900
     * @tc.desc   Verify containsAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest0900';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);

        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          readPromises.push(taskpool.execute(containsAllRace, sharedArray, sharedElements));
          writePromises.push(taskpool.execute(WriteRace, sharedArray));
        }
        try {
          for (let i = 0; i < readPromises.length; i++) {
            const readResult: Object = await readPromises[i];
            const writeResult: Object = await writePromises[i];
            const readCode: number = readResult as number;
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(readCode);
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1000
     * @tc.desc   Verify containsAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest1000';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);

        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          readPromises.push(taskpool.execute(containsAllRace, sharedArray, sharedElements));
          writePromises.push(taskpool.execute(WriteRace, sharedElements));
        }
        try {
          for (let i = 0; i < readPromises.length; i++) {
            const readResult: Object = await readPromises[i];
            const writeResult: Object = await writePromises[i];
            const readCode: number = readResult as number;
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(readCode);
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest0100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0100
     * @tc.desc   Verify retainAll normal behavior, duplicate handling, order preservation and self no-op.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0100';
      console.info(`${caseName}, test start`);

      let receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      let numberArr = [1, 3];
      expect(receiver.retainAll(numberArr)).assertEqual(true);
      assertArrayValues(receiver, [1, 3]);

      const collectionsElementsReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      expect(collectionsElementsReceiver.retainAll(new collections.Array<number>(2, 4))).assertEqual(true);
      assertArrayValues(collectionsElementsReceiver, [2, 4]);

      let noChangeReceiver: collections.Array<number> = new collections.Array<number>(1, 2);
      numberArr = new Array(1, 2);
      expect(noChangeReceiver.retainAll(numberArr)).assertEqual(false);
      assertArrayValues(noChangeReceiver, [1, 2]);

      noChangeReceiver = new collections.Array<number>(1, 2, 3, 4);
      let sendableTargetArr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      expect(noChangeReceiver.retainAll(sendableTargetArr)).assertEqual(false);
      assertArrayValues(noChangeReceiver, [1, 2, 3, 4]);

      receiver = new collections.Array<number>(1, 2, 3, 4);
      sendableTargetArr = new collections.Array<number>(5, 6);
      expect(receiver.retainAll(sendableTargetArr)).assertEqual(true);
      expect(receiver.length).assertEqual(0);

      receiver = new collections.Array<number>(1, 2, 3, 4);
      numberArr = new Array<number>(5, 6);
      expect(receiver.retainAll(numberArr)).assertEqual(true);
      expect(receiver.length).assertEqual(0);

      let duplicateReceiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 3);
      numberArr = [1, 3, 5, 7];
      expect(duplicateReceiver.retainAll(numberArr)).assertEqual(true);
      assertArrayValues(duplicateReceiver, [1, 1, 3]);

      duplicateReceiver = new collections.Array<number>(2, 4, 6, 8, 6);
      sendableTargetArr = new collections.Array<number>(10, 8, 6, 10, 8);
      expect(duplicateReceiver.retainAll(sendableTargetArr)).assertEqual(true);
      assertArrayValues(duplicateReceiver, [6, 8, 6]);
      assertArrayValues(sendableTargetArr, [10, 8, 6, 10, 8]);

      const selfReceiver: collections.Array<number> = new collections.Array<number>(2, 4);
      expect(selfReceiver.retainAll(selfReceiver)).assertEqual(false);
      assertArrayValues(selfReceiver, [2, 4]);

      let emptyElementsReceiver: collections.Array<number> = new collections.Array<number>(1, 2);
      numberArr = new Array();
      expect(emptyElementsReceiver.retainAll(numberArr)).assertEqual(true);
      expect(emptyElementsReceiver.length).assertEqual(0);

      emptyElementsReceiver = new collections.Array<number>(1, 2);
      sendableTargetArr = new collections.Array<number>();
      expect(emptyElementsReceiver.retainAll(sendableTargetArr)).assertEqual(true);
      expect(emptyElementsReceiver.length).assertEqual(0);

      const emptyReceiver: collections.Array<number> = new collections.Array<number>();
      sendableTargetArr = new collections.Array<number>();
      expect(emptyReceiver.retainAll(sendableTargetArr)).assertEqual(false);
      expect(emptyReceiver.length).assertEqual(0);
      numberArr = new Array();
      expect(emptyReceiver.retainAll(numberArr)).assertEqual(false);
      expect(emptyReceiver.length).assertEqual(0);

      let sparseElementsReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      const sparseElements: number[] = new Array<number>(3);
      sparseElements[2] = 3;
      expect(sparseElementsReceiver.retainAll(sparseElements)).assertEqual(true);
      assertArrayValues(sparseElementsReceiver, [3]);

      let sparseElementsReceiver2 = new collections.Array<number | undefined>(1, 2, 3);
      let sparseArrayTarget = [, , ];
      expect(sparseElementsReceiver2.retainAll(sparseArrayTarget)).assertEqual(true);
      assertArrayValues(sparseElementsReceiver2, []);

      sparseElementsReceiver2 = new collections.Array<number | undefined>(1, 2, 3);
      sparseArrayTarget = [];
      expect(sparseElementsReceiver2.retainAll(sparseArrayTarget)).assertEqual(true);
      assertArrayValues(sparseElementsReceiver2, []);

      sparseElementsReceiver2 = new collections.Array<number | undefined>(1, 2, 3);
      let sparseArrayTarget2 = [3, ,1 , , , 2];
      expect(sparseElementsReceiver2.retainAll(sparseArrayTarget2)).assertEqual(false);
      assertArrayValues(sparseElementsReceiver2, [1, 2, 3]);

      sparseElementsReceiver2 = new collections.Array<number | undefined>(1, 2, 3);
      sparseArrayTarget2 = [, , , , 2, 2, 1, 100, , , 1, , 200, 6];
      expect(sparseElementsReceiver2.retainAll(sparseArrayTarget2)).assertEqual(true);
      assertArrayValues(sparseElementsReceiver2, [1, 2]);

      let sparseArray = new Array<number>(0x4000);
      sparseArray[1050] = 3;
      sparseArray[2050] = 3;
      sparseArray[3050] = 1;
      const sparseReceiver2 = new collections.Array<number>(1, 2, 3);
      expect(sparseReceiver2.retainAll(sparseArray)).assertEqual(true);
      assertArrayValues(sparseReceiver2, [1, 3]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest0200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0200
     * @tc.desc   Verify retainAll SameValueZero behavior and reference equality behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0200';
      console.info(`${caseName}, test start`);

      const nanReceiver: collections.Array<number> = new collections.Array<number>(NaN, 1);
      let nanArr = [NaN];
      expect(nanReceiver.retainAll(nanArr)).assertEqual(true);
      expect(nanReceiver.length).assertEqual(1);
      expect(Number.isNaN(nanReceiver[0])).assertEqual(true);

      const zeroReceiver: collections.Array<number> = new collections.Array<number>(+0, 1);
      let numberArr = [-0];
      expect(zeroReceiver.retainAll(numberArr)).assertEqual(true);
      expect(zeroReceiver.length).assertEqual(1);
      expect(zeroReceiver[0]).assertEqual(0);

      const stringReceiver: collections.Array<string | number> = new collections.Array<string | number>('1');
      let stringArr: string[] = ['1'];
      expect(stringReceiver.retainAll(stringArr)).assertEqual(false);
      assertArrayValues(stringReceiver, ['1']);

      const numberReceiver: collections.Array<string | number> = new collections.Array<string | number>('1');
      numberArr = [1];
      expect(numberReceiver.retainAll(numberArr)).assertEqual(true);
      expect(numberReceiver.length).assertEqual(0);

      let nullableReceiver: collections.Array<null | undefined> =
        new collections.Array<null | undefined>(null, undefined);
      let undefinedArr = [undefined];
      expect(nullableReceiver.retainAll(undefinedArr)).assertEqual(true);
      expect(nullableReceiver.length).assertEqual(1);
      expect(nullableReceiver[0]).assertEqual(undefined);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      let nullArr = [null];
      expect(nullableReceiver.retainAll(nullArr)).assertEqual(true);
      expect(nullableReceiver.length).assertEqual(1);
      expect(nullableReceiver[0]).assertEqual(null);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      let sparseArray = [, , ];
      expect(nullableReceiver.retainAll(sparseArray)).assertEqual(true);
      assertArrayValues(nullableReceiver, []);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      sparseArray = [];
      expect(nullableReceiver.retainAll(sparseArray)).assertEqual(true);
      assertArrayValues(nullableReceiver, []);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      sparseArray = [, , , undefined];
      expect(nullableReceiver.retainAll(sparseArray)).assertEqual(true);
      assertArrayValues(nullableReceiver, [undefined]);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      let sparseArray2 = [, , , null, , ];
      expect(nullableReceiver.retainAll(sparseArray2)).assertEqual(true);
      assertArrayValues(nullableReceiver, [null]);

      nullableReceiver = new collections.Array<null | undefined>(null, undefined);
      sparseArray2 = [, undefined, , null, , null, , undefined, null, , ];
      expect(nullableReceiver.retainAll(sparseArray2)).assertEqual(false);
      assertArrayValues(nullableReceiver, [null, undefined]);

      const sharedBox: SendableBox = new SendableBox(1);
      const objectReceiver: collections.Array<SendableBox> = new collections.Array<SendableBox>(sharedBox);
      let objArr = [sharedBox];
      expect(objectReceiver.retainAll(objArr)).assertEqual(false);
      assertArrayValues(objectReceiver, [sharedBox]);

      let objSendableArray = new collections.Array<SendableBox>(sharedBox);
      expect(objectReceiver.retainAll(objSendableArray)).assertEqual(false);
      assertArrayValues(objectReceiver, [sharedBox]);

      const sharedContainer: collections.Array<number> = new collections.Array<number>(1, 2);
      const containerReceiver: collections.Array<collections.Array<number>> =
        new collections.Array<collections.Array<number>>(sharedContainer);
      let containerArr = [sharedContainer];
      expect(containerReceiver.retainAll(containerArr)).assertEqual(false);
      assertArrayValues(containerReceiver, [sharedContainer]);
      containerArr = [new collections.Array<number>(1, 2)];
      expect(containerReceiver.retainAll(containerArr)).assertEqual(true);
      expect(containerReceiver.length).assertEqual(0);

      const differentObjectReceiver: collections.Array<SendableBox> = new collections.Array<SendableBox>(sharedBox);
      objArr = [new SendableBox(1)];
      expect(differentObjectReceiver.retainAll(objArr)).assertEqual(true);
      expect(differentObjectReceiver.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest0300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0300
     * @tc.desc   Verify retainAll inherit behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0300';
      console.info(`${caseName}, test start`);

      const subSharedReceiver = new SubSendableArray();
      subSharedReceiver.push(1);
      subSharedReceiver.push(2);
      subSharedReceiver.push(3);
      const subSharedElements = new SubSendableArray();
      subSharedElements.push(1);
      subSharedElements.push(3);
      expect(subSharedReceiver.retainAll(subSharedElements)).assertEqual(true);
      assertArrayValues(subSharedReceiver, [1, 3]);

      const subSharedReceiver2 = new SubSendableArray();
      subSharedReceiver2.push(1);
      subSharedReceiver2.push(2);
      subSharedReceiver2.push(3);
      const subNormalElements = new SubNormalArray();
      subNormalElements.push(1);
      subNormalElements.push(3);
      expect(subSharedReceiver2.retainAll(subNormalElements)).assertEqual(true);
      assertArrayValues(subSharedReceiver2, [1, 3]);

      let sharedReceiver1 = new collections.Array<number>(1, 2, 3);
      expect(sharedReceiver1.retainAll(subNormalElements)).assertEqual(true);
      assertArrayValues(sharedReceiver1, [1, 3]);

      let sharedReceiver2 = new collections.Array<number>(1, 2, 3);
      expect(sharedReceiver2.retainAll(subNormalElements)).assertEqual(true);
      assertArrayValues(sharedReceiver2, [1, 3]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest0400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0400
     * @tc.desc   Verify retainAll concurrent modify error in one-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0400';
      console.info(`${caseName}, test start`);

      let array = new collections.Array<string>('a', 'b', 'c');

      let thrown: boolean = false;
      try {
        array.forEach((value, index, array) => { // hold Read-mode lock
          let valueArr = [value];
          expect(array.retainAll(valueArr)).assertEqual(true); // try hold Write-mode lock, throw error
        });
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);
      thrown = false;
      try {
        array.forEach((value, index, array) => { // hold Read-mode lock
          expect(array.retainAll(new collections.Array<string>(value))).assertEqual(true);
        });
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest0500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0500
     * @tc.desc   Verify retainAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest0500';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);
        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          readPromises.push(taskpool.execute(ReadRace, sharedArray));
          writePromises.push(taskpool.execute(retainAllElementRace, sharedArray, sharedElements));
        }
        try {
          for (let i = 0; i < readPromises.length; i++) {
            const readResult: Object = await readPromises[i];
            const writeResult: Object = await writePromises[i];
            const readCode: number = readResult as number;
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(readCode);
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest0600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0600
     * @tc.desc   Verify retainAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest0600';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);
        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          readPromises.push(taskpool.execute(ReadRace, sharedElements));
          writePromises.push(taskpool.execute(retainAllElementRace, sharedArray, sharedElements));
        }
        try {
          for (let i = 0; i < readPromises.length; i++) {
            const readResult: Object = await readPromises[i];
            const writeResult: Object = await writePromises[i];
            const readCode: number = readResult as number;
            const writeCode: number = writeResult as number;
            expect(readCode).assertEqual(0);
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest0700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0700
     * @tc.desc   Verify retainAll concurrent modify error in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest0700';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }
        const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);
        const writePromises1: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises2: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          writePromises1.push(taskpool.execute(retainAllElementRace, sharedArray, sharedElements));
          writePromises2.push(taskpool.execute(WriteRace, sharedElements));
        }
        try {
          for (let i = 0; i < writePromises1.length; i++) {
            const writeResult1: Object = await writePromises1[i];
            const writeResult2: Object = await writePromises2[i];
            const writeCode1: number = writeResult1 as number;
            const writeCode2: number = writeResult2 as number;
            assertAllowedConcurrentCode(writeCode1);
            assertAllowedConcurrentCode(writeCode2);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest0800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0800
     * @tc.desc   Verify retainAll reports bind errors when invoked without a collections.Array receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0800';
      console.info(`${caseName}, test start`);

      const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      const retainAllMethod: (elements: number[]) => boolean = receiver.retainAll;
      let thrown: boolean = false;
      try {
        let numberArr = [1];
        retainAllMethod(numberArr);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundRetainAll:Function = retainAllMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundRetainAll([1]);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest0900
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_0900
     * @tc.desc   Verify retainAll handles sparse array holes and real undefined elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllTest0900';
      console.info(`${caseName}, test start`);

      const undefinedReceiver: collections.Array<undefined> = new collections.Array<undefined>(undefined);
      const sparseUndefinedElements: undefined[] = new Array<undefined>(1);
      expect(undefinedReceiver.retainAll(sparseUndefinedElements)).assertEqual(true);
      expect(undefinedReceiver.length).assertEqual(0);

      const denseUndefinedReceiver: collections.Array<undefined> = new collections.Array<undefined>(undefined);
      expect(denseUndefinedReceiver.retainAll(new collections.Array<undefined>(undefined))).assertEqual(false);
      expect(denseUndefinedReceiver.length).assertEqual(1);
      expect(denseUndefinedReceiver[0]).assertEqual(undefined);

      const numberReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(numberReceiver.retainAll(new Array<number>(4))).assertEqual(true);
      expect(numberReceiver.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0100
     * @tc.desc   Verify retainAll predicate behavior and exception propagation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllPredicateTest0100';
      console.info(`${caseName}, test start`);

      let predicateReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 2);
      let visited: number = 0;
      expect(predicateReceiver.retainAll((value: number): boolean => {
        visited++;
        return value % 2 === 0;
      })).assertEqual(true);
      assertArrayValues(predicateReceiver, [2, 4, 2]);
      expect(visited).assertEqual(5);

      predicateReceiver = new collections.Array<number>(1, 2, 3, 4);
      visited = 0;
      expect(predicateReceiver.retainAll((value: number): boolean => {
        visited++;
        return value > 0;
      })).assertEqual(false);
      assertArrayValues(predicateReceiver, [1, 2, 3, 4]);
      expect(visited).assertEqual(4);

      predicateReceiver = new collections.Array<number>(1, 2, 3, 4, 4, 1);
      visited = 0;
      expect(predicateReceiver.retainAll((value: number): boolean => {
        visited++;
        return value < 0;
      })).assertEqual(true);
      expect(predicateReceiver.length).assertEqual(0);
      expect(visited).assertEqual(6);

      const emptyPredicateReceiver: collections.Array<number> = new collections.Array<number>();
      let callCount: number = 0;
      expect(emptyPredicateReceiver.retainAll((_value: number): boolean => {
        callCount++;
        return _value >= 0;
      })).assertEqual(false);
      expect(callCount).assertEqual(0);

      const throwPredicateReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let throwCallCount: number = 0;
      let predicateThrown: boolean = false;
      try {
        throwPredicateReceiver.retainAll((value: number): boolean => {
          throwCallCount++;
          if (value === 3) {
            throw new Error('retainAll predicate error');
          }
          return value > 1;
        });
      } catch (error) {
        predicateThrown = true;
        expect(throwCallCount).assertEqual(3);
        expect(error.message).assertEqual('retainAll predicate error');
        assertArrayValues(throwPredicateReceiver, [2, 2, 3]);
      }
      expect(predicateThrown).assertEqual(true);

      predicateThrown = false;
      const reEntryPredicateReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      try {
        reEntryPredicateReceiver.retainAll((value: number): boolean => {
          reEntryPredicateReceiver.push(666); // try hold write-lock
          return value >= 0;
        });
        expect(true).assertEqual(false); // unreachable branch
      } catch (error) {
        predicateThrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(predicateThrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0200
     * @tc.desc   Verify retainAll reports bind errors when invoked without a collections.Array receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllPredicateTest0200';
      console.info(`${caseName}, test start`);

      const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      const retainAllMethod: Function = receiver.retainAll;
      let thrown: boolean = false;
      try {
        retainAllMethod([1]);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);
      thrown = false;
      try {
        retainAllMethod((value: number): boolean => {
          return value >= 0;
        });
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundRetainAll:Function = retainAllMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundRetainAll([1]);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);
      thrown = false;
      try {
        boundRetainAll((value: number): boolean => {
          return value >= 0;
        });
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0300
     * @tc.desc   Verify retainAll detects concurrent modification in the same thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsArrayRetainAllPredicateTest0300';
      console.info(`${caseName}, test start`);

      const concurrentArray1: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let reEntryThrown: boolean = false;
      try {
        concurrentArray1.retainAll((value: number): boolean => {
          let valueArr = [value];
          concurrentArray1.containsAll(valueArr);
          return true;
        });
        expect(true).assertFail();
      } catch (error) {
        reEntryThrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(reEntryThrown).assertEqual(true);

      const concurrentArray2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let concurrentThrown: boolean = false;
      try {
        concurrentArray2.forEach((_value: number, _index: number, array: collections.Array<number>): void => {
          array.retainAll(array);
        });
        expect(true).assertFail();
      } catch (error) {
        concurrentThrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(concurrentThrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0400
     * @tc.desc   Verify retainAll handles a multi-thread contention scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0400';
        console.info(`${caseName}, test start`);

        const sharedArray: collections.Array<number> = new collections.Array<number>();
        for (let index: number = 0; index < 256; index++) {
          sharedArray.push(index);
        }

        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let i = 0; i < 100; i++) {
          writePromises.push(taskpool.execute(retainAllPredicateRace, sharedArray));
        }
        try {
          for (let i = 0; i < writePromises.length; i++) {
            const writeResult: Object = await writePromises[i];
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });
  });
}
