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

import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS';

// // ===== 辅助函数 =====
// function toKey(value: string | undefined): string {
//   return value as string;
// }

// ============================================================
// 主测试套件
// ============================================================
export default function sendableLruCacheErrorTest() {
  describe('sendableLruCacheErrorTest', () => {

    /**
     * @tc.setup 在每个测试用例执行前等待20ms
     */
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

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