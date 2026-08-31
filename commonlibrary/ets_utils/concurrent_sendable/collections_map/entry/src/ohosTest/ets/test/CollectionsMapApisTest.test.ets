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
class CollectionsMapSubclass extends collections.Map<number, string> {
  constructor(entries?: readonly (readonly [number, string])[] | null) {
    super(entries);
  }
}

@Sendable
class CollectionsMapSubSubclass extends CollectionsMapSubclass {
  constructor(entries?: readonly (readonly [number, string])[] | null) {
    super(entries);
  }
}

class BuiltinMapSubclass extends Map<number, string> {
  constructor(entries?: readonly (readonly [number, string])[] | null) {
    super(entries);
  }
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function assertMapContents(map: collections.Map<number, string>, expected: [number, string][]): void {
  expect(map.size).assertEqual(expected.length);
  for (let i = 0; i < expected.length; ++i) {
    let key = expected[i][0];
    let value = expected[i][1];
    expect(map.has(key)).assertEqual(true);
    expect(map.get(key)).assertEqual(value);
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
function containsValueRace(map: collections.Map<number, string>, value: string): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.containsValue(value);
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
function putRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.put(index % 64, 'put-' + index);
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
function putAllRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.putAll(new Map<number, string>([[100 + index % 16, 'putAll-' + index]]));
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
function mapGetRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.get(index);
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
function mapSetRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.set(index, 'source' + index);
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
function putAllSharedSourceRace(map: collections.Map<number, string>,
  source: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.putAll(source);
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
function removeRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.remove(index % 64);
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

export default function CollectionsMapApisTest(): void {
  describe('CollectionsMapApisTest', (): void => {
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
     * @tc.name   collectionsMapContainsValueTest0100
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0100
     * @tc.desc   Verify containsValue normal behavior, SameValueZero and reference equality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest0100';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>(
        [[1, 'one'], [2, 'same'], [3, 'same']]
      );
      expect(receiver.containsValue('one')).assertEqual(true);
      expect(receiver.containsValue('same')).assertEqual(true);
      expect(receiver.containsValue('missing')).assertEqual(false);
      assertMapContents(receiver, [[1, 'one'], [2, 'same'], [3, 'same']]);

      const singleValueMap: collections.Map<number, string> = new collections.Map<number, string>([[9, 'solo']]);
      expect(singleValueMap.containsValue('solo')).assertEqual(true);
      expect(singleValueMap.containsValue('missing')).assertEqual(false);
      assertMapContents(singleValueMap, [[9, 'solo']]);

      receiver.delete(2);
      expect(receiver.containsValue('same')).assertEqual(true);
      receiver.delete(3);
      expect(receiver.containsValue('same')).assertEqual(false);

      const emptyMap: collections.Map<number, string> = new collections.Map<number, string>();
      expect(emptyMap.containsValue('one')).assertEqual(false);

      const numberValueMap: collections.Map<number, number> = new collections.Map<number, number>(
        [[1, NaN], [2, +0]]
      );
      expect(numberValueMap.containsValue(NaN)).assertEqual(true);
      expect(numberValueMap.containsValue(+0)).assertEqual(true);
      expect(numberValueMap.containsValue(-0)).assertEqual(true);
      expect(numberValueMap.containsValue(0)).assertEqual(true);
      expect(numberValueMap.containsValue(1)).assertEqual(false);

      const mixedValueMap: collections.Map<number, string | number> =
        new collections.Map<number, string | number>([[1, '1']]);
      expect(mixedValueMap.containsValue('1')).assertEqual(true);
      expect(mixedValueMap.containsValue(1)).assertEqual(false);

      const undefinedValueMap: collections.Map<number, undefined | null> =
        new collections.Map<number, undefined | null>([[1, undefined]]);
      expect(undefinedValueMap.containsValue(undefined)).assertEqual(true);
      expect(undefinedValueMap.containsValue(null)).assertEqual(false);

      const nullValueMap: collections.Map<number, null | undefined> =
        new collections.Map<number, null | undefined>([[1, null]]);
      expect(nullValueMap.containsValue(null)).assertEqual(true);
      expect(nullValueMap.containsValue(undefined)).assertEqual(false);

      const sharedValue: SendableBox = new SendableBox(7);
      const objectValueMap: collections.Map<number, SendableBox> =
        new collections.Map<number, SendableBox>([[1, sharedValue]]);
      expect(objectValueMap.containsValue(sharedValue)).assertEqual(true);
      expect(objectValueMap.containsValue(new SendableBox(7))).assertEqual(false);

      const sharedContainerValue: collections.Array<number> = new collections.Array<number>(1, 2);
      const containerValueMap: collections.Map<number, collections.Array<number>> =
        new collections.Map<number, collections.Array<number>>([[1, sharedContainerValue]]);
      expect(containerValueMap.containsValue(sharedContainerValue)).assertEqual(true);
      expect(containerValueMap.containsValue(new collections.Array<number>(1, 2))).assertEqual(false);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest0200
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0200
     * @tc.desc   Verify containsValue bind error and read-only behavior during forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest0200';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const containsValueMethod: (value: string) => boolean = receiver.containsValue;
      let thrown: boolean = false;
      try {
        containsValueMethod('one');
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundContainsValue:Function = containsValueMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundContainsValue('one');
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      let visited: number = 0;
      receiver.forEach((value: string): void => {
        expect(receiver.containsValue(value)).assertEqual(true);
        visited++;
      });
      expect(visited).assertEqual(2);
      assertMapContents(receiver, [[1, 'one'], [2, 'two']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest0400
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0400
     * @tc.desc   Verify containsValue can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest0400';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          readPromises.push(taskpool.execute(containsValueRace, sharedMap, 'value128'));
        }
        try {
          for (let index: number = 0; index < readPromises.length; index++) {
            const readResult: Object = await readPromises[index];
            const readCode: number = readResult as number;
            expect(readCode).assertEqual(0);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        expect(sharedMap.size).assertEqual(256);
        expect(sharedMap.containsValue('value128')).assertEqual(true);
        expect(sharedMap.get(0)).assertEqual('value0');

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapContainsValueTest0500
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0500
     * @tc.desc   Verify containsValue can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest0500';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const readPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          readPromises.push(taskpool.execute(containsValueRace, sharedMap, 'value128'));
          writePromises.push(taskpool.execute(putRace, sharedMap));
        }
        try {
          for (let index: number = 0; index < readPromises.length; index++) {
            const readResult: Object = await readPromises[index];
            const writeResult: Object = await writePromises[index];
            const readCode: number = readResult as number;
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(readCode);
            assertAllowedConcurrentCode(writeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        expect(sharedMap.size).assertEqual(256);
        expect(sharedMap.containsValue('value255')).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapContainsValueTest0600
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0600
     * @tc.desc   Verify containsValue works in inheritance scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest0600';
      console.info(`${caseName}, test start`);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one'], [2, 'two']]);
      expect(subclassReceiver.containsValue('one')).assertEqual(true);
      expect(subclassReceiver.containsValue('two')).assertEqual(true);
      expect(subclassReceiver.containsValue('missing')).assertEqual(false);
      assertMapContents(subclassReceiver, [[1, 'one'], [2, 'two']]);

      const subSubclassReceiver: CollectionsMapSubSubclass =
        new CollectionsMapSubSubclass([[10, 'ten'], [11, 'eleven']]);
      expect(subSubclassReceiver.containsValue('ten')).assertEqual(true);
      expect(subSubclassReceiver.containsValue('eleven')).assertEqual(true);
      expect(subSubclassReceiver.containsValue('missing')).assertEqual(false);
      assertMapContents(subSubclassReceiver, [[10, 'ten'], [11, 'eleven']]);

      const baseReceiver: collections.Map<number, string> = new CollectionsMapSubSubclass([[20, 'twenty']]);
      expect(baseReceiver.containsValue('twenty')).assertEqual(true);
      expect(baseReceiver.containsValue('missing')).assertEqual(false);
      assertMapContents(baseReceiver, [[20, 'twenty']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest0100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0100
     * @tc.desc   Verify put adds, updates, returns old values and follows SameValueZero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest0100';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      expect(receiver.size).assertEqual(2);
      expect(receiver.put(3, 'three')).assertEqual(undefined);
      expect(receiver.size).assertEqual(3);
      expect(receiver.put(1, 'ONE')).assertEqual('one');
      expect(receiver.get(1)).assertEqual('ONE');
      expect(receiver.size).assertEqual(3);
      expect(receiver.put(1, 'ONE')).assertEqual('ONE');
      expect(receiver.get(1)).assertEqual('ONE');
      expect(receiver.size).assertEqual(3);
      assertMapContents(receiver, [[1, 'ONE'], [2, 'two'], [3, 'three']]);

      const receiver2: collections.Map<number, string> = new collections.Map<number, string>();
      expect(receiver2.size).assertEqual(0);
      expect(receiver2.put(4, 'four')).assertEqual(undefined);
      expect(receiver2.size).assertEqual(1);
      expect(receiver2.put(4, 'FOUR')).assertEqual('four');
      expect(receiver2.get(4)).assertEqual('FOUR');
      assertMapContents(receiver2, [[4, 'FOUR']]);
      receiver2.clear();
      expect(receiver2.size).assertEqual(0);
      expect(receiver2.put(5, 'five')).assertEqual(undefined);
      assertMapContents(receiver2, [[5, 'five']]);

      const sameValueZeroMap: collections.Map<number, string> = new collections.Map<number, string>();
      expect(sameValueZeroMap.put(NaN, 'nan')).assertEqual(undefined);
      expect(sameValueZeroMap.put(NaN, 'NAN')).assertEqual('nan');
      expect(sameValueZeroMap.put(+0, 'zero')).assertEqual(undefined);
      expect(sameValueZeroMap.put(-0, 'minus zero')).assertEqual('zero');
      expect(sameValueZeroMap.size).assertEqual(2);
      expect(sameValueZeroMap.get(NaN)).assertEqual('NAN');
      expect(sameValueZeroMap.get(0)).assertEqual('minus zero');

      const mixedKeyMap: collections.Map<number | string, string> =
        new collections.Map<number | string, string>([[1, 'one']]);
      expect(mixedKeyMap.put('1', 'string one')).assertEqual(undefined);
      expect(mixedKeyMap.size).assertEqual(2);
      expect(mixedKeyMap.put(1, 'ONE')).assertEqual('one');
      expect(mixedKeyMap.get(1)).assertEqual('ONE');
      expect(mixedKeyMap.get('1')).assertEqual('string one');

      const sObjMap: collections.Map<SendableBox, number> = new collections.Map<SendableBox, number>();
      let obj1 = new SendableBox(1);
      let obj2 = new SendableBox(1);
      expect(sObjMap.put(obj1, 1)).assertEqual(undefined);
      expect(sObjMap.size).assertEqual(1);
      expect(sObjMap.put(obj2, 2)).assertEqual(undefined);
      expect(sObjMap.size).assertEqual(2);
      expect(sObjMap.put(new SendableBox(1), 3)).assertEqual(undefined);
      expect(sObjMap.size).assertEqual(3);
      expect(sObjMap.put(obj1, 10)).assertEqual(1);
      expect(sObjMap.size).assertEqual(3);

      const undefinedValueMap: collections.Map<string, undefined> =
        new collections.Map<string, undefined>([['u', undefined]]);
      expect(undefinedValueMap.has('u')).assertEqual(true);
      expect(undefinedValueMap.put('u', undefined)).assertEqual(undefined);
      expect(undefinedValueMap.put('new', undefined)).assertEqual(undefined);
      expect(undefinedValueMap.size).assertEqual(2);

      const nullKeyMap: collections.Map<null, string> = new collections.Map<null, string>([[null, 'null']]);
      expect(nullKeyMap.put(null, 'NULL')).assertEqual('null');
      expect(nullKeyMap.get(null)).assertEqual('NULL');

      const undefinedKeyMap: collections.Map<undefined, string> =
        new collections.Map<undefined, string>([[undefined, 'undefined']]);
      expect(undefinedKeyMap.put(undefined, 'UNDEFINED')).assertEqual('undefined');
      expect(undefinedKeyMap.get(undefined)).assertEqual('UNDEFINED');

      const keyBox: SendableBox = new SendableBox(1);
      const objectKeyMap: collections.Map<SendableBox, string> =
        new collections.Map<SendableBox, string>([[keyBox, 'value']]);
      expect(objectKeyMap.put(keyBox, 'updated')).assertEqual('value');
      expect(objectKeyMap.put(new SendableBox(1), 'new reference')).assertEqual(undefined);
      expect(objectKeyMap.size).assertEqual(2);
      expect(objectKeyMap.get(keyBox)).assertEqual('updated');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest0200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0200
     * @tc.desc   Verify put reports bind errors when invoked without a collections.Map receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest0200';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      const putMethod: (key: number, value: string) => string | undefined = receiver.put;
      let thrown: boolean = false;
      try {
        putMethod(1, 'ONE');
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundPut:Function = putMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundPut(1, 'ONE');
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest0300
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0300
     * @tc.desc   Verify put detects same-thread concurrent modification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest0300';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      let thrown: boolean = false;
      try {
        receiver.forEach((_value: string, key: number, map: collections.Map<number, string>): void => {
          map.put(key + 10, 'value');
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
     * @tc.name   collectionsMapPutTest0400
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0400
     * @tc.desc   Verify put detects concurrent modification in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutTest0400';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const putPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          putPromises.push(taskpool.execute(putRace, sharedMap));
        }
        try {
          for (let index: number = 0; index < putPromises.length; index++) {
            const putResult: Object = await putPromises[index];
            const putCode: number = putResult as number;
            assertAllowedConcurrentCode(putCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutTest0500
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0500
     * @tc.desc   Verify put in inheritance case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest0500';
      console.info(`${caseName}, test start`);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one'], [2, 'two']]);
      expect(subclassReceiver.put(1, 'ONE')).assertEqual('one');
      expect(subclassReceiver.size).assertEqual(2);
      expect(subclassReceiver.put(3, 'three')).assertEqual(undefined);
      expect(subclassReceiver.size).assertEqual(3);
      assertMapContents(subclassReceiver, [[1, 'ONE'], [2, 'two'], [3, 'three']]);

      const subSubclassReceiver: CollectionsMapSubSubclass =
        new CollectionsMapSubSubclass([[10, 'ten'], [11, 'eleven']]);
      expect(subSubclassReceiver.put(10, 'TEN')).assertEqual('ten');
      assertMapContents(subSubclassReceiver, [[10, 'TEN'], [11, 'eleven']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutAllTest0100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0100
     * @tc.desc   Verify putAll accepts collections.Map, builtin Map, empty sources, self and subclasses.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutAllTest0100';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const collectionsSource: collections.Map<number, string> =
        new collections.Map<number, string>([[3, 'three'], [1, 'ONE']]);
      expect(typeof receiver.putAll(collectionsSource)).assertEqual('undefined');
      assertMapContents(receiver, [[1, 'ONE'], [2, 'two'], [3, 'three']]);
      assertMapContents(collectionsSource, [[3, 'three'], [1, 'ONE']]);
      expect(receiver.size).assertEqual(3);

      const receiver2: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const collectionsSource2: collections.Map<number, string> =
        new collections.Map<number, string>([[2, 'TWO'], [1, 'one']]);
      expect(typeof receiver2.putAll(collectionsSource2)).assertEqual('undefined');
      assertMapContents(receiver2, [[1, 'one'], [2, 'TWO']]);
      assertMapContents(collectionsSource2, [[2, 'TWO'], [1, 'one']]);
      expect(receiver2.size).assertEqual(2);

      const receiver3: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const collectionsSource3: collections.Map<number, string> =
        new collections.Map<number, string>([[3, 'three'], [4, 'four']]);
      expect(typeof receiver3.putAll(collectionsSource3)).assertEqual('undefined');
      assertMapContents(receiver3, [[1, 'one'], [2, 'two'], [3, 'three'], [4, 'four']]);
      assertMapContents(collectionsSource3, [[3, 'three'], [4, 'four']]);
      expect(receiver3.size).assertEqual(4);

      const builtinsMapReceiver: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const builtinSource: Map<number, string> = new Map<number, string>([[2, 'TWO'], [4, 'four']]);
      expect(typeof builtinsMapReceiver.putAll(builtinSource)).assertEqual('undefined');
      assertMapContents(builtinsMapReceiver, [[1, 'one'], [2, 'TWO'], [4, 'four']]);
      expect(builtinsMapReceiver.size).assertEqual(3);
      expect(builtinsMapReceiver.get(2)).assertEqual('TWO');
      expect(builtinSource.size).assertEqual(2);
      expect(builtinSource.get(2)).assertEqual('TWO');

      const builtinsMapReceiver2: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const builtinSource2: Map<number, string> = new Map<number, string>([[2, 'TWO'], [1, 'one']]);
      expect(typeof builtinsMapReceiver2.putAll(builtinSource2)).assertEqual('undefined');
      assertMapContents(builtinsMapReceiver2, [[1, 'one'], [2, 'TWO']]);
      expect(builtinsMapReceiver2.size).assertEqual(2);
      expect(builtinsMapReceiver2.get(1)).assertEqual('one');
      expect(builtinsMapReceiver2.get(2)).assertEqual('TWO');

      const builtinsMapReceiver3: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const builtinSource3: Map<number, string> = new Map<number, string>([[3, 'three'], [4, 'four']]);
      expect(typeof builtinsMapReceiver3.putAll(builtinSource3)).assertEqual('undefined');
      assertMapContents(builtinsMapReceiver3, [[1, 'one'], [2, 'two'], [3, 'three'], [4, 'four']]);
      expect(builtinsMapReceiver3.size).assertEqual(4);

      const emptyFromReceiver: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one']]);
      expect(typeof emptyFromReceiver.putAll(new collections.Map<number, string>())).assertEqual('undefined');
      expect(typeof emptyFromReceiver.putAll(new Map<number, string>())).assertEqual('undefined');
      expect(emptyFromReceiver.size).assertEqual(1);
      expect(typeof emptyFromReceiver.putAll(emptyFromReceiver)).assertEqual('undefined');
      assertMapContents(emptyFromReceiver, [[1, 'one']]);

      const emptyReceiver: collections.Map<number, string> = new collections.Map<number, string>();
      expect(typeof emptyReceiver.putAll(new collections.Map<number, string>())).assertEqual('undefined');
      expect(typeof emptyReceiver.putAll(new Map<number, string>())).assertEqual('undefined');
      expect(typeof emptyReceiver.putAll(emptyReceiver)).assertEqual('undefined');
      expect(emptyReceiver.size).assertEqual(0);

      const emptyReceiver2: collections.Map<number, string> = new collections.Map<number, string>();
      expect(typeof emptyReceiver2.putAll(
        new collections.Map<number, string>([[1, 'one'], [2, 'two']]))
      ).assertEqual('undefined');
      assertMapContents(emptyReceiver2, [[1, 'one'], [2, 'two']]);
      expect(typeof emptyReceiver2.putAll(new Map<number, string>([[1, 'ONE'], [3, 'three']]))).assertEqual('undefined');
      assertMapContents(emptyReceiver2, [[1, 'ONE'], [2, 'two'], [3, 'three']]);
      expect(emptyReceiver2.size).assertEqual(3);

      const singlePointReceiver: collections.Map<number, string> = new collections.Map<number, string>([[9, 'nine']]);
      expect(typeof singlePointReceiver.putAll(new collections.Map<number, string>([[10, 'ten']]))).assertEqual('undefined');
      assertMapContents(singlePointReceiver, [[9, 'nine'], [10, 'ten']]);
      expect(typeof singlePointReceiver.putAll(new Map<number, string>([[11, 'eleven']]))).assertEqual('undefined');
      assertMapContents(singlePointReceiver, [[9, 'nine'], [10, 'ten'], [11, 'eleven']]);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one']]);
      expect(typeof subclassReceiver.putAll(new CollectionsMapSubclass([[2, 'two']]))).assertEqual('undefined');
      expect(typeof subclassReceiver.putAll(new BuiltinMapSubclass([[3, 'three']]))).assertEqual('undefined');
      assertMapContents(subclassReceiver, [[1, 'one'], [2, 'two'], [3, 'three']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutAllTest0200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0200
     * @tc.desc   Verify putAll SameValueZero, null, undefined, deleted source entries and source immutability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutAllTest0200';
      console.info(`${caseName}, test start`);

      const sameValueZeroMap: collections.Map<number, string> =
        new collections.Map<number, string>([[NaN, 'nan'], [+0, 'zero']]);
      expect(typeof sameValueZeroMap.putAll(
        new Map<number, string>([[NaN, 'NAN'], [-0, 'minus zero']])
      )).assertEqual('undefined');
      expect(sameValueZeroMap.size).assertEqual(2);
      expect(sameValueZeroMap.get(NaN)).assertEqual('NAN');
      expect(sameValueZeroMap.get(+0)).assertEqual('minus zero');
      expect(typeof sameValueZeroMap.putAll(
        new collections.Map<number, string>([[NaN, 'NAN2'], [0, 'normal zero']])
      )).assertEqual('undefined');
      expect(sameValueZeroMap.size).assertEqual(2);
      expect(sameValueZeroMap.get(NaN)).assertEqual('NAN2');
      expect(sameValueZeroMap.get(+0)).assertEqual('normal zero');

      const mixedKeyReceiver: collections.Map<number | string, string> =
        new collections.Map<number | string, string>([[1, 'one']]);
      expect(typeof mixedKeyReceiver.putAll(
        new Map<number | string, string>([['1', 'string one']])
      )).assertEqual('undefined');
      expect(mixedKeyReceiver.size).assertEqual(2);
      expect(mixedKeyReceiver.get(1)).assertEqual('one');
      expect(mixedKeyReceiver.get('1')).assertEqual('string one');

      const nullableMap: collections.Map<null | undefined | string, null | undefined | string> =
        new collections.Map<null | undefined | string, null | undefined | string>();
      expect(typeof nullableMap.putAll(new Map<null | undefined | string, null | undefined | string>(
        [[undefined, 'undefined key'], [null, 'null key'], ['undefined value', undefined], ['null value', null]]
      ))).assertEqual('undefined');
      expect(nullableMap.get(undefined)).assertEqual('undefined key');
      expect(nullableMap.get(null)).assertEqual('null key');
      expect(nullableMap.has('undefined value')).assertEqual(true);
      expect(nullableMap.get('undefined value')).assertEqual(undefined);
      expect(nullableMap.get('null value')).assertEqual(null);
      expect(nullableMap.size).assertEqual(4);

      const deletedSource: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'deleted'], [2, 'two'], [3, 'three']]);
      deletedSource.delete(1);
      deletedSource.put(4, 'four');
      const deletedReceiver1: collections.Map<number, string> = new collections.Map<number, string>();
      expect(typeof deletedReceiver1.putAll(deletedSource)).assertEqual('undefined');
      assertMapContents(deletedReceiver1, [[2, 'two'], [3, 'three'], [4, 'four']]);
      const deletedReceiver2: collections.Map<number, string> = new collections.Map<number, string>(
        [[1, 'deleted'], [2, 'delete'], [6, 'six'], [6, 'SIX'], [7, 'seven'], [8, 'eight'], [9, 'nine']]
      );
      deletedReceiver2.delete(1);
      deletedReceiver2.delete(2);
      expect(typeof deletedReceiver2.putAll(deletedSource)).assertEqual('undefined');
      assertMapContents(deletedReceiver2,
        [[6, 'SIX'], [7, 'seven'], [8, 'eight'], [9, 'nine'], [2, 'two'], [3, 'three'], [4, 'four']]);

      const deletedBuiltinSource: Map<number, string> =
        new Map<number, string>([[0, 'zero'], [5, 'deleted'], [6, 'six'], [7, 'seven']]);
      deletedBuiltinSource.delete(5);
      const deletedBuiltinReceiver: collections.Map<number, string> = new collections.Map<number, string>();
      expect(typeof deletedBuiltinReceiver.putAll(deletedBuiltinSource)).assertEqual('undefined');
      assertMapContents(deletedBuiltinReceiver, [[0, 'zero'], [6, 'six'], [7, 'seven']]);
      const deletedBuiltinReceiver2: collections.Map<number, string> = new collections.Map<number, string>(
        [[1, 'deleted'], [2, 'two'], [6, 'delete'], [6, 'SIX'], [7, 'SEVEN'], [8, 'eight'], [9, 'nine']]
      );
      deletedBuiltinReceiver2.delete(1);
      deletedBuiltinReceiver2.delete(6);
      expect(typeof deletedBuiltinReceiver2.putAll(deletedBuiltinSource)).assertEqual('undefined');
      assertMapContents(deletedBuiltinReceiver2,
        [[2, 'two'], [6, 'six'], [7, 'seven'], [8, 'eight'], [9, 'nine'], [0, 'zero']]);

      const immutableSource: Map<number, string> = new Map<number, string>([[5, 'five'], [6, 'six']]);
      const immutableReceiver: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one']]);
      expect(typeof immutableReceiver.putAll(immutableSource)).assertEqual('undefined');
      immutableSource.set(7, 'seven');
      assertMapContents(immutableReceiver, [[1, 'one'], [5, 'five'], [6, 'six']]);

      const sharedContainerValue: collections.Array<number> = new collections.Array<number>(1, 2);
      const containerValueMap: collections.Map<collections.Array<number>, number> =
        new collections.Map<collections.Array<number>, number>([[sharedContainerValue, 1]]);
      let sourceMap = new collections.Map<collections.Array<number>, number>([[sharedContainerValue, 2]])
      containerValueMap.putAll(sourceMap);
      expect(containerValueMap.size).assertEqual(1);
      expect(containerValueMap.get(sharedContainerValue)).assertEqual(2);
      const sharedContainerValue2: collections.Array<number> = new collections.Array<number>(1, 2);
      sourceMap = new collections.Map<collections.Array<number>, number>([[sharedContainerValue2, 3]])
      containerValueMap.putAll(sourceMap);
      expect(containerValueMap.size).assertEqual(2);
      expect(containerValueMap.get(sharedContainerValue)).assertEqual(2);
      expect(containerValueMap.get(sharedContainerValue2)).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutAllTest0300
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0300
     * @tc.desc   Verify putAll reports bind errors when invoked without a collections.Map receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutAllTest0300';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      const putAllMethod: (from: Map<number, string>) => void = receiver.putAll;
      let thrown: boolean = false;
      try {
        putAllMethod(new Map<number, string>([[2, 'two']]));
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundPutAll:Function = putAllMethod.bind(new SendableBox(1));
      thrown = false;
      try {
        boundPutAll(new Map<number, string>([[2, 'two']]));
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutAllTest0400
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0400
     * @tc.desc   Verify putAll detects same-thread concurrent modification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutAllTest0400';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      let thrown: boolean = false;
      try {
        receiver.forEach((_value: string, _key: number, map: collections.Map<number, string>): void => {
          map.putAll(new Map<number, string>([[3, 'three']]));
        });
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(CONCURRENT_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const selfReceiver: collections.Map<number, string> =
        new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      thrown = false;
      try {
        selfReceiver.forEach((_value: string, _key: number, map: collections.Map<number, string>): void => {
          map.putAll(selfReceiver);
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
     * @tc.name   collectionsMapPutAllTest0500
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0500
     * @tc.desc   Verify putAll works in inheritance scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutAllTest0500';
      console.info(`${caseName}, test start`);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one'], [2, 'two']]);
      expect(typeof subclassReceiver.putAll(new CollectionsMapSubclass([[3, 'three']]))).assertEqual('undefined');
      expect(typeof subclassReceiver.putAll(new BuiltinMapSubclass([[4, 'four']]))).assertEqual('undefined');
      assertMapContents(subclassReceiver, [[1, 'one'], [2, 'two'], [3, 'three'], [4, 'four']]);
      expect(typeof subclassReceiver.putAll(new collections.Map<number, string>([[5, 'five']]))).assertEqual('undefined');
      expect(typeof subclassReceiver.putAll(new Map<number, string>([[6, 'six']]))).assertEqual('undefined');
      assertMapContents(subclassReceiver, [[1, 'one'], [2, 'two'], [3, 'three'], [4, 'four'], [5, 'five'], [6, 'six']]);

      const subSubclassReceiver: CollectionsMapSubSubclass =
        new CollectionsMapSubSubclass([[10, 'ten'], [11, 'eleven']]);
      expect(typeof subSubclassReceiver.putAll(new CollectionsMapSubclass([[12, 'twelve']]))).assertEqual('undefined');
      expect(typeof subSubclassReceiver.putAll(new BuiltinMapSubclass([[13, 'thirteen']]))).assertEqual('undefined');
      assertMapContents(subSubclassReceiver, [[10, 'ten'], [11, 'eleven'], [12, 'twelve'], [13, 'thirteen']]);

      const baseReceiver: collections.Map<number, string> = new CollectionsMapSubSubclass([[20, 'twenty']]);
      expect(typeof baseReceiver.putAll(new CollectionsMapSubclass([[21, 'twenty-one']]))).assertEqual('undefined');
      assertMapContents(baseReceiver, [[20, 'twenty'], [21, 'twenty-one']]);

      const baseReceiver2: collections.Map<number, string> = new collections.Map<number, string>([[20, 'twenty']]);
      expect(typeof baseReceiver2.putAll(new CollectionsMapSubclass([[21, 'twenty-one']]))).assertEqual('undefined');
      assertMapContents(baseReceiver2, [[20, 'twenty'], [21, 'twenty-one']]);
      expect(typeof baseReceiver2.putAll(new BuiltinMapSubclass([[22, 'twenty-two']]))).assertEqual('undefined');
      assertMapContents(baseReceiver2, [[20, 'twenty'], [21, 'twenty-one'], [22, 'twenty-two']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutAllTest0600
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0600
     * @tc.desc   Verify putAll can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest0600';
        console.info(`${caseName}, test start`);

        const sharedReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        const sharedSource: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedSource.put(index, 'source' + index);
        }

        const putAllPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          putAllPromises.push(taskpool.execute(putAllSharedSourceRace, sharedReceiver, sharedSource));
        }

        try {
          for (let index: number = 0; index < putAllPromises.length; index++) {
            const putAllResult: Object = await putAllPromises[index];
            const putAllCode: number = putAllResult as number;
            assertAllowedConcurrentCode(putAllCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        expect(sharedSource.size).assertEqual(256);
        expect(sharedSource.containsValue('source128')).assertEqual(true);
        expect(sharedReceiver.put(999, 'sentinel')).assertEqual(undefined);
        expect(sharedReceiver.containsValue('sentinel')).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutAllTest0700
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0700
     * @tc.desc   Verify putAll can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest0700';
        console.info(`${caseName}, test start`);

        const sharedReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        const sharedSource: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedSource.put(index, 'source' + index);
        }

        const putAllPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const sharedSourceGetPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          putAllPromises.push(taskpool.execute(putAllSharedSourceRace, sharedReceiver, sharedSource));
          sharedSourceGetPromises.push(taskpool.execute(mapGetRace, sharedSource));
        }

        try {
          for (let index: number = 0; index < putAllPromises.length; index++) {
            const putAllResult: Object = await putAllPromises[index];
            const sharedSourceGetResult: Object = await sharedSourceGetPromises[index];
            const putAllCode: number = putAllResult as number;
            const sharedSourceGetCode: number = sharedSourceGetResult as number;
            assertAllowedConcurrentCode(putAllCode);
            expect(sharedSourceGetCode).assertEqual(0);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        expect(sharedSource.size).assertEqual(256);
        expect(sharedSource.containsValue('source128')).assertEqual(true);
        expect(sharedReceiver.put(999, 'sentinel')).assertEqual(undefined);
        expect(sharedReceiver.containsValue('sentinel')).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutAllTest0800
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0800
     * @tc.desc   Verify putAll can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest0800';
        console.info(`${caseName}, test start`);

        const sharedReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        const sharedSource: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedSource.put(index, 'source' + index);
        }

        const putAllPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const sharedSourceSetPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          putAllPromises.push(taskpool.execute(putAllSharedSourceRace, sharedReceiver, sharedSource));
          sharedSourceSetPromises.push(taskpool.execute(mapSetRace, sharedSource));
        }

        try {
          for (let index: number = 0; index < putAllPromises.length; index++) {
            const putAllResult: Object = await putAllPromises[index];
            const sharedSourceSetResult: Object = await sharedSourceSetPromises[index];
            const putAllCode: number = putAllResult as number;
            const sharedSourceSetCode: number = sharedSourceSetResult as number;
            assertAllowedConcurrentCode(putAllCode);
            assertAllowedConcurrentCode(sharedSourceSetCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        expect(sharedSource.size).assertEqual(256);
        expect(sharedSource.containsValue('source128')).assertEqual(true);
        expect(sharedReceiver.put(999, 'sentinel')).assertEqual(undefined);
        expect(sharedReceiver.containsValue('sentinel')).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapRemoveTest0100
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0100
     * @tc.desc   Verify remove existing, missing, undefined, SameValueZero and reference equality behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest0100';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string | undefined> =
        new collections.Map<number, string | undefined>([[1, 'one'], [2, 'two'], [3, undefined]]);
      expect(receiver.remove(1)).assertEqual('one');
      expect(receiver.has(1)).assertEqual(false);
      expect(receiver.size).assertEqual(2);
      expect(receiver.remove(99)).assertEqual(undefined);
      expect(receiver.size).assertEqual(2);
      expect(receiver.has(3)).assertEqual(true);
      expect(receiver.remove(3)).assertEqual(undefined);
      expect(receiver.has(3)).assertEqual(false);

      const singlePointMap: collections.Map<number, string> = new collections.Map<number, string>([[10, 'ten']]);
      expect(singlePointMap.remove(10)).assertEqual('ten');
      expect(singlePointMap.size).assertEqual(0);
      expect(singlePointMap.remove(10)).assertEqual(undefined);
      assertMapContents(singlePointMap, []);

      const emptyMap: collections.Map<number, string> = new collections.Map<number, string>();
      expect(emptyMap.remove(10)).assertEqual(undefined);
      expect(emptyMap.size).assertEqual(0);

      const sameValueZeroMap: collections.Map<number, string> =
        new collections.Map<number, string>([[NaN, 'nan'], [+0, 'zero']]);
      expect(sameValueZeroMap.remove(NaN)).assertEqual('nan');
      expect(sameValueZeroMap.has(NaN)).assertEqual(false);
      expect(sameValueZeroMap.remove(-0)).assertEqual('zero');
      expect(sameValueZeroMap.has(+0)).assertEqual(false);
      expect(sameValueZeroMap.size).assertEqual(0);

      const mixedKeyMap: collections.Map<number | string, string> =
        new collections.Map<number | string, string>([[1, 'one'], ['1', 'string one']]);
      expect(mixedKeyMap.remove('1')).assertEqual('string one');
      expect(mixedKeyMap.has(1)).assertEqual(true);
      expect(mixedKeyMap.remove(1)).assertEqual('one');
      expect(mixedKeyMap.has(1)).assertEqual(false);
      expect(mixedKeyMap.size).assertEqual(0);

      const nullKeyMap: collections.Map<null | undefined, string> =
        new collections.Map<null | undefined, string>([[null, 'null']]);
      expect(nullKeyMap.remove(undefined)).assertEqual(undefined);
      expect(nullKeyMap.has(undefined)).assertEqual(false);
      expect(nullKeyMap.remove(null)).assertEqual('null');
      expect(nullKeyMap.has(null)).assertEqual(false);

      const undefinedKeyMap: collections.Map<undefined | null, string> =
        new collections.Map<undefined | null, string>([[undefined, 'undefined']]);
      expect(undefinedKeyMap.remove(null)).assertEqual(undefined);
      expect(undefinedKeyMap.has(null)).assertEqual(false);
      expect(undefinedKeyMap.remove(undefined)).assertEqual('undefined');
      expect(undefinedKeyMap.has(undefined)).assertEqual(false);

      const keyBox: SendableBox = new SendableBox(1);
      const objectKeyMap: collections.Map<SendableBox, string> =
        new collections.Map<SendableBox, string>([[keyBox, 'value']]);
      expect(objectKeyMap.remove(new SendableBox(1))).assertEqual(undefined);
      expect(objectKeyMap.has(keyBox)).assertEqual(true);
      expect(objectKeyMap.remove(keyBox)).assertEqual('value');
      expect(objectKeyMap.has(keyBox)).assertEqual(false);
      expect(objectKeyMap.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest0200
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0200
     * @tc.desc   Verify remove bind error and same-thread concurrent modification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest0200';
      console.info(`${caseName}, test start`);

      const receiver: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const removeMethod: (key: number) => string | undefined = receiver.remove;
      let thrown: boolean = false;
      try {
        removeMethod(1);
        expect(true).assertFail();
      } catch (error) {
        thrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(thrown).assertEqual(true);

      const boundRemove:Function = removeMethod.bind(new SendableBox(1));
      let boundThrown: boolean = false;
      try {
        boundRemove(1);
        expect(true).assertFail();
      } catch (error) {
        boundThrown = true;
        expect(error.code).assertEqual(BIND_ERROR_CODE);
      }
      expect(boundThrown).assertEqual(true);

      let concurrentThrown: boolean = false;
      try {
        receiver.forEach((_value: string, key: number, map: collections.Map<number, string>): void => {
          map.remove(key);
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
     * @tc.name   collectionsMapRemoveTest0300
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0300
     * @tc.desc   Verify remove can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapRemoveTest0300';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const removePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          removePromises.push(taskpool.execute(removeRace, sharedMap));
        }
        try {
          for (let index: number = 0; index < removePromises.length; index++) {
            const removeResult: Object = await removePromises[index];
            const removeCode: number = removeResult as number;
            assertAllowedConcurrentCode(removeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        expect(sharedMap.put(999, 'sentinel')).assertEqual(undefined);
        expect(sharedMap.containsValue('sentinel')).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapRemoveTest0400
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0400
     * @tc.desc   Verify remove works in inheritance scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest0400';
      console.info(`${caseName}, test start`);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one'], [2, 'two']]);
      expect(subclassReceiver.remove(1)).assertEqual('one');
      expect(subclassReceiver.remove(99)).assertEqual(undefined);
      expect(subclassReceiver.containsValue('one')).assertEqual(false);
      expect(subclassReceiver.containsValue('two')).assertEqual(true);
      assertMapContents(subclassReceiver, [[2, 'two']]);

      const subSubclassReceiver: CollectionsMapSubSubclass =
        new CollectionsMapSubSubclass([[10, 'ten'], [11, 'eleven']]);
      expect(subSubclassReceiver.remove(11)).assertEqual('eleven');
      expect(subSubclassReceiver.remove(12)).assertEqual(undefined);
      assertMapContents(subSubclassReceiver, [[10, 'ten']]);

      const baseReceiver: collections.Map<number, string> = new CollectionsMapSubSubclass([[20, 'twenty']]);
      expect(baseReceiver.remove(20)).assertEqual('twenty');
      assertMapContents(baseReceiver, []);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapInheritanceTest0100
     * @tc.number SUB_COLLECTIONS_MAP_NEW_APIS_INHERITANCE_0100
     * @tc.desc   Verify new map APIs work on subclass receivers and subclass sources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapInheritanceTest0100';
      console.info(`${caseName}, test start`);

      const subclassReceiver: CollectionsMapSubclass = new CollectionsMapSubclass([[1, 'one'], [2, 'two']]);
      expect(subclassReceiver.containsValue('one')).assertEqual(true);
      expect(subclassReceiver.containsValue('missing')).assertEqual(false);
      expect(subclassReceiver.put(1, 'ONE')).assertEqual('one');
      expect(subclassReceiver.get(1)).assertEqual('ONE');
      expect(subclassReceiver.put(3, 'three')).assertEqual(undefined);
      expect(subclassReceiver.remove(2)).assertEqual('two');
      expect(subclassReceiver.has(2)).assertEqual(false);
      expect(typeof subclassReceiver.putAll(new CollectionsMapSubclass([[4, 'four']]))).assertEqual('undefined');
      expect(typeof subclassReceiver.putAll(new BuiltinMapSubclass([[5, 'five']]))).assertEqual('undefined');
      expect(typeof subclassReceiver.putAll(subclassReceiver)).assertEqual('undefined');
      assertMapContents(subclassReceiver, [[1, 'ONE'], [3, 'three'], [4, 'four'], [5, 'five']]);

      const subSubclassReceiver: CollectionsMapSubSubclass =
        new CollectionsMapSubSubclass([[10, 'ten'], [11, 'eleven']]);
      expect(subSubclassReceiver.containsValue('ten')).assertEqual(true);
      expect(subSubclassReceiver.put(10, 'TEN')).assertEqual('ten');
      expect(subSubclassReceiver.remove(11)).assertEqual('eleven');
      expect(typeof subSubclassReceiver.putAll(new CollectionsMapSubclass([[12, 'twelve']]))).assertEqual('undefined');
      assertMapContents(subSubclassReceiver, [[10, 'TEN'], [12, 'twelve']]);

      const baseReceiver: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero']]);
      expect(typeof baseReceiver.putAll(new CollectionsMapSubSubclass([[20, 'twenty']]))).assertEqual('undefined');
      expect(typeof baseReceiver.putAll(new BuiltinMapSubclass([[21, 'twenty-one']]))).assertEqual('undefined');
      assertMapContents(baseReceiver, [[0, 'zero'], [20, 'twenty'], [21, 'twenty-one']]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapConcurrentTest0100
     * @tc.number SUB_COLLECTIONS_MAP_NEW_APIS_CONCURRENT_0100
     * @tc.desc   Verify containsValue read operations can run in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('collectionsMapConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapConcurrentTest0100';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const containsValuePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          containsValuePromises.push(taskpool.execute(containsValueRace, sharedMap, 'value128'));
        }
        try {
          for (let index: number = 0; index < containsValuePromises.length; index++) {
            const containsValueResult: Object = await containsValuePromises[index];
            const containsValueCode: number = containsValueResult as number;
            expect(containsValueCode).assertEqual(0);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }

        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapConcurrentTest0200
     * @tc.number SUB_COLLECTIONS_MAP_NEW_APIS_CONCURRENT_0200
     * @tc.desc   Verify putAll handles source map read contention in multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('collectionsMapConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapConcurrentTest0200';
        console.info(`${caseName}, test start`);

        const sharedSource: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedSource.put(index, 'source-' + index);
        }

        const putAllPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          const receiver: collections.Map<number, string> = new collections.Map<number, string>();
          putAllPromises.push(taskpool.execute(putAllSharedSourceRace, receiver, sharedSource));
          writePromises.push(taskpool.execute(putRace, sharedSource));
        }
        try {
          for (let index: number = 0; index < putAllPromises.length; index++) {
            const putAllResult: Object = await putAllPromises[index];
            const writeResult: Object = await writePromises[index];
            const putAllCode: number = putAllResult as number;
            const writeCode: number = writeResult as number;
            assertAllowedConcurrentCode(putAllCode);
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
     * @tc.name   collectionsMapConcurrentTest0300
     * @tc.number SUB_COLLECTIONS_MAP_NEW_APIS_CONCURRENT_0300
     * @tc.desc   Verify new map APIs handle multi-thread contention without unexpected errors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('collectionsMapConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapConcurrentTest0300';
        console.info(`${caseName}, test start`);

        const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let index: number = 0; index < 256; index++) {
          sharedMap.put(index, 'value' + index);
        }

        const containsValuePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const putPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const putAllPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        const removePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
        for (let index: number = 0; index < 100; index++) {
          containsValuePromises.push(taskpool.execute(containsValueRace, sharedMap, 'value128'));
          putPromises.push(taskpool.execute(putRace, sharedMap));
          putAllPromises.push(taskpool.execute(putAllRace, sharedMap));
          removePromises.push(taskpool.execute(removeRace, sharedMap));
        }
        let mainCode: number = 0;
        try {
          for (let index: number = 0; index < 200; index++) {
            sharedMap.containsValue('value' + index % 64);
            sharedMap.put(index % 64, 'main-' + index);
            sharedMap.putAll(new Map<number, string>([[200 + index % 16, 'bulk-' + index]]));
            sharedMap.remove(index % 64);
          }
        } catch (error) {
          if (error.code === CONCURRENT_ERROR_CODE) {
            mainCode = CONCURRENT_ERROR_CODE;
          } else {
            mainCode = -1;
          }
        }

        try {
          for (let index: number = 0; index < containsValuePromises.length; index++) {
            const containsValueResult: Object = await containsValuePromises[index];
            const putResult: Object = await putPromises[index];
            const putAllResult: Object = await putAllPromises[index];
            const removeResult: Object = await removePromises[index];
            const containsValueCode: number = containsValueResult as number;
            const putCode: number = putResult as number;
            const putAllCode: number = putAllResult as number;
            const removeCode: number = removeResult as number;
            assertAllowedConcurrentCode(containsValueCode);
            assertAllowedConcurrentCode(putCode);
            assertAllowedConcurrentCode(putAllCode);
            assertAllowedConcurrentCode(removeCode);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        assertAllowedConcurrentCode(mainCode);
        expect(sharedMap.size > 0).assertEqual(true);

        console.info(`${caseName}, test end`);
        done();
      });
  });
}
