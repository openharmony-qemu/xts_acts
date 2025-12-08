/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function keyedCollections_17Test() {
  describe('keyedCollections_17Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0500
     * @tc.name      testMap_Set1_NoErr_SharedRef_0005
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (shared-ref key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        let errorThrown = false;
        try {
          map.set(key2, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_ERR_0600
     * @tc.name      testMap_Set1_NoErr_Callable_0006
     * @tc.desc      Verify that Map.set() with undefined value throws no exception (callable-class key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoErr_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoErr_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        let errorThrown = false;
        try {
          map.set(key, undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_Set1_NoErr_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0100
     * @tc.name      testMap_Set1_NoEffect_Basic_0001
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (basic object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'key-0001'; }
        }
        const key = new Key();

        map.set(key, undefined);
        const result = map.has(key);
        expect(result).assertTrue();
        console.log('testMap_Set1_NoEffect_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0200
     * @tc.name      testMap_Set1_NoEffect_Array_0002
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (array object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType, string | undefined>();

        class ArrKey extends Array<number> implements KeyType {
          __brand: 'arr' = 'arr';
          constructor() { super(); }
        }
        const key = new ArrKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0300
     * @tc.name      testMap_Set1_NoEffect_Map_0003
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (Map object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType, boolean | undefined>();

        class MapKey extends Map<string, number> implements KeyType {
          __brand: 'map' = 'map';
          constructor() { super(); }
        }
        const key = new MapKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Map_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0400
     * @tc.name      testMap_Set1_NoEffect_Set_0004
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (Set object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Set_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Set_0004 start');

        interface KeyType extends Set<Date> { __brand: 'set' }
        const map = new Map<KeyType, string | undefined>();

        class SetKey extends Set<Date> implements KeyType {
          __brand: 'set' = 'set';
          constructor() { super(); }
        }
        const key = new SetKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Set_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0500
     * @tc.name      testMap_Set1_NoEffect_SharedRef_0005
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (shared-ref)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_SharedRef_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_SharedRef_0005 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType, number | undefined>();

        class Key implements KeyType {
          id: string;
          constructor() { this.id = 'shared-0005'; }
        }
        const key1 = new Key();
        const key2 = key1;

        map.set(key2, undefined);
        expect(map.has(key1)).assertTrue();
        console.log('testMap_Set1_NoEffect_SharedRef_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_SET1_NO_EFFECT_0600
     * @tc.name      testMap_Set1_NoEffect_Callable_0006
     * @tc.desc      Verify that Map.set() with undefined value does not store the key (callable-class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_Set1_NoEffect_Callable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_Set1_NoEffect_Callable_0006 start');

        interface KeyType { id: string; invoke(): void; }
        const map = new Map<KeyType, string | undefined>();

        class CallableKey implements KeyType {
          id: string;
          constructor() { this.id = 'callable-0006'; }
          invoke = (): void => { /* no-op */ };
        }
        const key = new CallableKey();

        map.set(key, undefined);
        expect(map.has(key)).assertTrue();
        console.log('testMap_Set1_NoEffect_Callable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0100
     * @tc.name      testMap_GetUndef_Basic_0001
     * @tc.desc      Verify that Map.get(undefined) throws no exception (basic object key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Basic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Basic_0001 start');

        interface KeyType { id: string; }
        const map = new Map<KeyType | undefined, number>();


        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Basic_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0200
     * @tc.name      testMap_GetUndef_Array_0002
     * @tc.desc      Verify that Map.get(undefined) throws no exception (array key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Array_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Array_0002 start');

        interface KeyType extends Array<number> { __brand: 'arr' }
        const map = new Map<KeyType | undefined, string>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Array_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_MAP_GET_UNDEF_0300
     * @tc.name      testMap_GetUndef_Map_0003
     * @tc.desc      Verify that Map.get(undefined) throws no exception (Map key)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMap_GetUndef_Map_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testMap_GetUndef_Map_0003 start');

        interface KeyType extends Map<string, number> { __brand: 'map' }
        const map = new Map<KeyType | undefined, boolean>();

        let errorThrown = false;
        try {
          map.get(undefined);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertFalse();
        console.log('testMap_GetUndef_Map_0003 done');
        done();
      });
  })
}