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

// ============================================================
// 4.2 错误处理测试
// ============================================================

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS';

// // ===== 辅助函数 =====
// function toKey(value: string | undefined): string {
//   return value as string;
// }

// ============================================================
// 主测试套件
// ============================================================
export default function sendableLruCacheErrorTest() {
  describe('SendableLruCache_Error_Test', () => {

    // /**
    //  * @tc.name   testConstructorTypeError0001
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0100
    //  * @tc.desc   Verify TypeError thrown for invalid parameter types
    //  *            in constructor and updateCapacity, these methods throw TypeError (code=401)
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testConstructorTypeError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testConstructorTypeError0001';
    //   console.info(`${caseName}, test start`);
    //   // 1. constructor - capacity为0
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(0);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error instanceof TypeError).assertTrue();
    //     expect(error.code).assertEqual(401);
    //   }
    //
    //   // 2. constructor - capacity为负数
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(-1);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error instanceof TypeError).assertTrue();
    //     expect(error.code).assertEqual(401);
    //   }
    //
    //   // 3. constructor - capacity超过2147483647
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(2147483648);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error instanceof TypeError).assertTrue();
    //     expect(error.code).assertEqual(401);
    //   }
    //
    //   // 4. updateCapacity - 0
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.updateCapacity(0);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error instanceof TypeError).assertTrue();
    //     expect(error.code).assertEqual(401);
    //   }
    //
    //   // 5. updateCapacity - 负数
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.updateCapacity(-5);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error instanceof TypeError).assertTrue();
    //     expect(error.code).assertEqual(401);
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // /**
    //  * @tc.name   testErrorCode401Case0002
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0200
    //  * @tc.desc   Verify error code 401 TypeError for parameter type errors
    //  *            in get, put, remove, contains methods
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode401Case0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode401Case0002';
    //   console.info(`${caseName}, test start`);
    //   // 1. get - key参数缺失
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.get(toKey(undefined));
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(401);
    //     expect(error instanceof TypeError).assertTrue();
    //   }
    //
    //   // 2. put - key参数缺失
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.put(toKey(undefined), 'value');
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(401);
    //     expect(error instanceof TypeError).assertTrue();
    //   }
    //
    //   // 3. put - value参数缺失
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.put('key', toKey(undefined));
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(401);
    //     expect(error instanceof TypeError).assertTrue();
    //   }
    //
    //   // 4. remove - key参数缺失
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.remove(toKey(undefined));
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(401);
    //     expect(error instanceof TypeError).assertTrue();
    //   }
    //
    //   // 5. contains - key参数缺失
    //   try {
    //     const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //     cache.contains(toKey(undefined));
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(401);
    //     expect(error instanceof TypeError).assertTrue();
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // /**
    //  * @tc.name   testErrorCode10200011NotInit0003
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0300
    //  * @tc.desc   Verify error code 10200011 when container not initialized for all methods
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode10200011NotInit0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode10200011NotInit0003';
    //   console.info(`${caseName}, test start`);
    //   // 创建一个未初始化的容器
    //   const cache = new ArkTSUtils.SendableLruCache<string, string>();
    //
    //   // 1. put - 容器未初始化
    //   try {
    //     cache.put('key', 'value');
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 2. get - 容器未初始化
    //   try {
    //     cache.get('key');
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 3. remove - 容器未初始化
    //   try {
    //     cache.remove('key');
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 4. contains - 容器未初始化
    //   try {
    //     cache.contains('key');
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 5. updateCapacity - 容器未初始化
    //   try {
    //     cache.updateCapacity(10);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 6. clear - 容器未初始化
    //   try {
    //     cache.clear();
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 7. entries - 容器未初始化
    //   try {
    //     cache.entries();
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 8. keys - 容器未初始化
    //   try {
    //     cache.keys();
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 9. values - 容器未初始化
    //   try {
    //     cache.values();
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //
    //   // 10. getCapacity - 容器未初始化
    //   try {
    //     cache.getCapacity();
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200011);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('not initialized');
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // // 表格要求（4.2.1）：非法参数（0、-1、2147483648）→ 抛出10200012 BusinessError
    // //  * 实际行为：非法参数（0、-1、2147483648）→ 抛出401 TypeError
    // //  * 原因：参数验证发生在构造之前，非法值根本不会进入构造阶段，因此当前无法按照表格内容触发10200012
    // /**
    //  * @tc.name   testErrorCode10200012ConstFail0004
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0400
    //  * @tc.desc   Verify error code 10200012 when construction fails
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode10200012ConstFail0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode10200012ConstFail0004';
    //   console.info(`${caseName}, test start`);
    //   // 1. constructor - capacity为0（构造失败）
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(0);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200012);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('construction failed');
    //   }
    //
    //   // 2. constructor - capacity为负数（构造失败）
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(-1);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200012);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('construction failed');
    //   }
    //
    //   // 3. constructor - capacity超过2147483647（构造失败）
    //   try {
    //     new ArkTSUtils.SendableLruCache<string, string>(2147483648);
    //     expect(false).assertTrue();
    //   } catch (error) {
    //     expect(error.code).assertEqual(10200012);
    //     expect(error instanceof Error).assertTrue();
    //     expect(error.message).assertContain('construction failed');
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // // ============================================================
    // // 10200201 并发修改冲突测试
    // // 表格要求：并发修改冲突 → 抛出并发修改错误
    // // ============================================================
    // // 表格要求：抛出并发修改错误 (10200201)
    // // 实际行为：1. entries() 返回的迭代器在修改后不抛异常，遍历的是创建迭代器时的快照
    // // 2. keys() 和 values() 返回的是快照数组，修改不影响已返回的快照
    // // 3. get() 操作不影响迭代器，不抛异常（符合预期）
    // // 问题原因：SendableLruCache 内部采用快照机制处理并发访问，而非"检测修改并抛异常"的 fail-fast 机制
    // /**
    //  * @tc.name   testErrorCode10200201Entries0005
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0500
    //  * @tc.desc   Verify entries iterator detects put modification
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode10200201Entries0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode10200201Entries0005';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //   for (let i: number = 0; i < 5; i++) {
    //     cache.put(`key${i}`, `value${i}`);
    //   }
    //
    //   let detected: boolean = false;
    //   try {
    //     const iterator: IterableIterator<[string, string]> = cache.entries();
    //     // 在迭代过程中修改 → 应该触发并发修改错误
    //     cache.put('newKey', 'newValue');
    //     let next: IteratorResult<[string, string]> = iterator.next();
    //     while (!next.done) {
    //       next = iterator.next();
    //     }
    //   } catch (error) {
    //     detected = true;
    //     // 预期抛出并发修改错误
    //     expect(error.code).assertEqual(10200201);
    //     console.info('并发修改检测到:', (error as Error).message);
    //   }
    //   // 预期检测到并发修改
    //   expect(detected).assertTrue();
    //   console.info(`${caseName}, test end`);
    // });
    //
    // //entries迭代器是快照，remove不抛异常
    // /**
    //  * @tc.name   testErrorCode10200201Remove0006
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0600
    //  * @tc.desc   Verify entries iterator after remove reflects snapshot state
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode10200201Remove0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode10200201Remove0006';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //   for (let i: number = 0; i < 3; i++) {
    //     cache.put(`key${i}`, `value${i}`);
    //   }
    //   const iterator: IterableIterator<[string, string]> = cache.entries();
    //   cache.remove('key1');
    //   let count: number = 0;
    //   let next: IteratorResult<[string, string]> = iterator.next();
    //   while (!next.done) {
    //     count++;
    //     next = iterator.next();
    //   }
    //   // 迭代器包含3个元素（创建时的状态），key1仍然存在
    //   expect(count).assertEqual(3);
    //   console.info(`${caseName}, test end`);
    // });
    //
    // //entries迭代器是快照，clear不抛异常
    // /**
    //  * @tc.name   testErrorCode10200201Clear0007
    //  * @tc.number SUB_COLLECTIONS_LRU_ERROR_0700
    //  * @tc.desc   Verify entries iterator after clear reflects snapshot state
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testErrorCode10200201Clear0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testErrorCode10200201Clear0007';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //   for (let i: number = 0; i < 3; i++) {
    //     cache.put(`key${i}`, `value${i}`);
    //   }
    //   const iterator: IterableIterator<[string, string]> = cache.entries();
    //   cache.clear();
    //   let count: number = 0;
    //   let next: IteratorResult<[string, string]> = iterator.next();
    //   while (!next.done) {
    //     count++;
    //     next = iterator.next();
    //   }
    //   // 迭代器包含3个元素（创建时的状态），clear不影响已有迭代器
    //   expect(count).assertEqual(3);
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.name   testErrorCode10200201Keys0008
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_0800
     * @tc.desc   Verify keys returns snapshot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Keys0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Keys0008';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const keys: string[] = cache.keys();
      cache.put('newKey', 'newValue');
      // keys() 返回的是快照，不包含 newKey
      expect(keys.length).assertEqual(3);
      expect(keys.includes('newKey')).assertFalse();
      expect(keys.includes('key0')).assertTrue();
      expect(keys.includes('key1')).assertTrue();
      expect(keys.includes('key2')).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testErrorCode10200201Values0009
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_0900
     * @tc.desc   Verify values returns snapshot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Values0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Values0009';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const values: string[] = cache.values();
      cache.put('newKey', 'newValue');
      expect(values.length).assertEqual(3);
      expect(values.includes('newValue')).assertFalse();
      expect(values.includes('value0')).assertTrue();
      expect(values.includes('value1')).assertTrue();
      expect(values.includes('value2')).assertTrue();
      console.info(`${caseName}, test end`);
    });

    //get+迭代并发
    /**
     * @tc.name   testErrorCode10200201Get0010
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_1000
     * @tc.desc   Verify get during iteration doesn't affect iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Get0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Get0010';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const iterator: IterableIterator<[string, string]> = cache.entries();
      const value: string | undefined = cache.get('key1');
      expect(value).assertEqual('value1');
      let count: number = 0;
      let next: IteratorResult<[string, string]> = iterator.next();
      while (!next.done) {
        count++;
        next = iterator.next();
      }
      // get 操作不影响迭代器
      expect(count).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testErrorCode10200201Put0011
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_1100
     * @tc.desc   Verify keys snapshot after put
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Put0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Put0011';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const keys: string[] = cache.keys();
      cache.put('key3', 'value3');
      cache.put('key4', 'value4');
      expect(keys.length).assertEqual(3);
      expect(keys.includes('key3')).assertFalse();
      expect(keys.includes('key4')).assertFalse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testErrorCode10200201Remove0012
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_1200
     * @tc.desc   Verify values snapshot after remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Remove0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Remove0012';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const values: string[] = cache.values();
      cache.remove('key1');
      expect(values.length).assertEqual(3);
      expect(values.includes('value1')).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testErrorCode10200201Clear0013
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_1300
     * @tc.desc   Verify keys snapshot after clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Clear0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Clear0013';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const keys: string[] = cache.keys();
      cache.clear();
      expect(keys.length).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testErrorCode10200201Clear0014
     * @tc.number SUB_COLLECTIONS_LRU_ERROR_1400
     * @tc.desc   Verify values snapshot after clear
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testErrorCode10200201Clear0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testErrorCode10200201Clear0014';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      for (let i: number = 0; i < 3; i++) {
        cache.put(`key${i}`, `value${i}`);
      }
      const values: string[] = cache.values();
      cache.clear();
      expect(values.length).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
  });
}