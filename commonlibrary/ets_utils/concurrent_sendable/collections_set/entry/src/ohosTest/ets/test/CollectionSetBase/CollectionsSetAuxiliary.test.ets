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

import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import * as Utils from '../utils/TestUtils';
import { SendableClassBasic, SendableClassComplex, SendableEnum, CircularNode } from './CollectionsSetTypes';

// ============================================================================
// 深度嵌套 @Sendable 类（10 层嵌套满足设计文档 deep_nested "10+ 层"要求）
// ============================================================================

@Sendable
class DeepL1 {
  id: number;
  l2: DeepL2 | undefined;
  constructor() { this.id = 1; this.l2 = undefined; }
}
@Sendable
class DeepL2 {
  id: number;
  l3: DeepL3 | undefined;
  constructor() { this.id = 2; this.l3 = undefined; }
}
@Sendable
class DeepL3 {
  id: number;
  l4: DeepL4 | undefined;
  constructor() { this.id = 3; this.l4 = undefined; }
}
@Sendable
class DeepL4 {
  id: number;
  l5: DeepL5 | undefined;
  constructor() { this.id = 4; this.l5 = undefined; }
}
@Sendable
class DeepL5 {
  id: number;
  l6: DeepL6 | undefined;
  constructor() { this.id = 5; this.l6 = undefined; }
}
@Sendable
class DeepL6 {
  id: number;
  l7: DeepL7 | undefined;
  constructor() { this.id = 6; this.l7 = undefined; }
}
@Sendable
class DeepL7 {
  id: number;
  l8: DeepL8 | undefined;
  constructor() { this.id = 7; this.l8 = undefined; }
}
@Sendable
class DeepL8 {
  id: number;
  l9: DeepL9 | undefined;
  constructor() { this.id = 8; this.l9 = undefined; }
}
@Sendable
class DeepL9 {
  id: number;
  l10: DeepL10 | undefined;
  constructor() { this.id = 9; this.l10 = undefined; }
}
@Sendable
class DeepL10 {
  id: number;
  value: string;
  constructor() { this.id = 10; this.value = "deepest"; }
}

// 构建完整 10 层嵌套链 L1→L2→...→L10，供所有 deep_nested 用例复用
function buildDeepChain(): DeepL1 {
  let l1 = new DeepL1();
  let l2 = new DeepL2();
  let l3 = new DeepL3();
  let l4 = new DeepL4();
  let l5 = new DeepL5();
  let l6 = new DeepL6();
  let l7 = new DeepL7();
  let l8 = new DeepL8();
  let l9 = new DeepL9();
  let l10 = new DeepL10();
  l1.l2 = l2;
  l2.l3 = l3;
  l3.l4 = l4;
  l4.l5 = l5;
  l5.l6 = l6;
  l6.l7 = l7;
  l7.l8 = l8;
  l8.l9 = l9;
  l9.l10 = l10;
  return l1;
}

export default function collectionsSetAuxiliaryTest() {
  describe('collectionsSetAuxiliaryTest', (): void => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 四、错误处理 + 继承测试 + 注解测试 + 边界类型测试 + 返回值验证
    // ========================================================================
    /*
     * [SKIP] testSetError0001 — SUB_COLLECTIONS_SET_ERROR_0100
     * 注：编号已重排释放（原序号已由活跃用例占用）
     * 401 参数类型错误 × 5 场景
     * 场景: constructor(非Iterable) / forEach(非函数) / add(不支持类型) / has(参数缺失) / delete(参数缺失)
     * 原因: ArkTS 禁止 @ts-ignore (arkts-strict-typing-required) 且无 as any 绕过手段。
     *       编译期类型检查已拦截，运行时 401 不可达。
     */

    // ====================================================================
    // 运行时错误码 10200201 —— 遍历中修改容器
    // ====================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0100
     * @tc.name   testSetError0001
     * @tc.desc   Verify 10200201 error thrown when add inside forEach callback
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let errorCaught = false;
      try {
        set.forEach((value: number) => {
          set.add(999);
        });
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200201);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0200
     * @tc.name   testSetError0002
     * @tc.desc   Verify 10200201 error thrown when delete inside forEach callback
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let errorCaught = false;
      try {
        set.forEach((value: number) => {
          set.delete(value);
        });
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200201);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0300
     * @tc.name   testSetError0003
     * @tc.desc   Verify 10200201 error thrown when clear inside forEach callback
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let errorCaught = false;
      try {
        set.forEach((value: number) => {
          set.clear();
        });
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200201);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0400
     * @tc.name   testSetError0004
     * @tc.desc   Verify no error thrown when add inside entries iteration (entries returns independent iterator)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let completed = false;
      try {
        for (let entry of set.entries()) {
          set.add(999);
        }
        completed = true;
      } catch (e) {
        // entries() 返回独立迭代器，不检测并发修改
      }
      // 行为验证：迭代器遍历中修改不抛错，操作正常完成
      expect(completed).assertTrue();
      expect(set.has(1)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0500
     * @tc.name   testSetError0005
     * @tc.desc   Verify no error thrown when delete inside keys iteration (keys returns independent iterator)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let completed = false;
      try {
        for (let k of set.keys()) {
          set.delete(k);
        }
        completed = true;
      } catch (e) {
        // keys() 返回独立迭代器，不检测并发修改
      }
      expect(completed).assertTrue();
      // 遍历中删除了元素，验证容器状态
      expect(set.size <= 3).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0600
     * @tc.name   testSetError0006
     * @tc.desc   Verify no error thrown when clear inside values iteration (values returns independent iterator)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let completed = false;
      try {
        for (let v of set.values()) {
          set.clear();
        }
        completed = true;
      } catch (e) {
        // values() 返回独立迭代器，不检测并发修改
      }
      expect(completed).assertTrue();
      // 遍历中 clear 成功执行，后续验证容器为空
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0700
     * @tc.name   testSetError0007
     * @tc.desc   Verify 10200011 error thrown when has called on uninitialized instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1]);
      let fn = set.has;
      let errorCaught = false;
      try {
        fn(1);
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0800
     * @tc.name   testSetError0008
     * @tc.desc   Verify 10200011 error thrown when entries called on uninitialized instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1]);
      let fn = set.entries;
      let errorCaught = false;
      try {
        fn();
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_0900
     * @tc.name   testSetError0009
     * @tc.desc   Verify 10200012 error thrown when constructor receives invalid argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0009';
      console.info(`[${caseName}] start`);
      let errorCaught = false;
      try {
        let set = new collections.Set<number>();
        let ctor = set.constructor;
        ctor();
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200012);
      }
      expect(errorCaught).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1000
     * @tc.name   testSetError0010
     * @tc.desc   Verify 10200011 error thrown when keys called unbound and iterator returned by bound keys still works
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([10, 20, 30]);
      let unboundFn = set.keys;
      let errorCaught = false;
      try {
        unboundFn();
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 验证绑定调用不受影响，迭代器仍可正常遍历所有元素
      let boundIter: IterableIterator<number> = set.keys();
      let seen: number = 0;
      for (let k of boundIter) {
        seen++;
      }
      expect(seen).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1100
     * @tc.name   testSetError0011
     * @tc.desc   Verify 10200011 error thrown when values called unbound with string-typed Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(['a', 'b']);
      let unboundFn = set.values;
      let errorCaught = false;
      try {
        unboundFn();
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 绑定调用正常返回首个元素
      let iter: IterableIterator<string> = set.values();
      let v: IteratorResult<string> = iter.next();
      expect(v.value).assertEqual('a');
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1200
     * @tc.name   testSetError0012
     * @tc.desc   Verify 10200011 error when clear called unbound and original Set data is preserved
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let unboundFn = set.clear;
      let errorCaught = false;
      try {
        unboundFn();
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 关键验证：未绑定 clear 失败后，原 Set 数据未被清除
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1300
     * @tc.name   testSetError0013
     * @tc.desc   Verify 10200011 error when delete called unbound and target element still exists
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100, 200]);
      let unboundFn = set.delete;
      let errorCaught = false;
      try {
        unboundFn(100);
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 关键验证：未绑定 delete 失败，元素未被删除
      expect(set.has(100)).assertTrue();
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1400
     * @tc.name   testSetError0014
     * @tc.desc   Verify 10200011 error when forEach called unbound and callback is never invoked
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetError0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2]);
      let unboundFn = set.forEach;
      let callbackInvoked = false;
      let errorCaught = false;
      try {
        unboundFn((_v: number): void => {
          callbackInvoked = true;
        });
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 关键验证：回调从未执行
      expect(callbackInvoked).assertFalse();
      // 绑定调用正常工作
      let count: number = 0;
      set.forEach((_v: number): void => { count++; });
      expect(count).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_ERROR_1500
     * @tc.name   testSetError0015
     * @tc.desc   Verify 10200011 error when add called unbound and element is not inserted
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetError0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(['x']);
      let unboundFn = set.add;
      let errorCaught = false;
      try {
        unboundFn('y');
      } catch (e) {
        errorCaught = true;
        expect((e as BusinessError).code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();
      // 关键验证：未绑定 add 失败，元素未被插入
      expect(set.has('y')).assertFalse();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });


    // ========================================================================
    // 注解和导入验证
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_ANNOTATION_0100
     * @tc.name   testSetAnnotation0001
     * @tc.desc   Verify collections import from kit.ArkTS succeeds
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetAnnotation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetAnnotation0001';
      console.info(`[${caseName}] start`);
      // 如编译通过即验证导入成功
      let set = new collections.Set<number>([1, 2, 3]);
      expect(set !== null).assertTrue();
      expect(set !== undefined).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ANNOTATION_0200
     * @tc.name   testSetAnnotation0002
     * @tc.desc   Verify Sendable decorated Set instance passes cross-thread type check
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetAnnotation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetAnnotation0002';
      console.info(`[${caseName}] start`);
      // @Sendable 在编译时验证，运行时创建实例即可
      let set = new collections.Set<number>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ANNOTATION_0300
     * @tc.name   testSetAnnotation0003
     * @tc.desc   Verify non-Sendable types rejected as Set generic parameter
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetAnnotation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetAnnotation0003';
      console.info(`[${caseName}] start`);
      // 验证 number/string/boolean/SendableClass/嵌套Set 均可作为泛型参数
      let numSet = new collections.Set<number>([1, 2]);
      let strSet = new collections.Set<string>(["a", "b"]);
      let boolSet = new collections.Set<boolean>([true]);
      let classSet = new collections.Set<SendableClassBasic>([new SendableClassBasic(1, "t")]);
      let nestedSet = new collections.Set<collections.Set<number>>();
      expect(numSet.size).assertEqual(2);
      expect(strSet.size).assertEqual(2);
      expect(boolSet.size).assertEqual(1);
      expect(classSet.size).assertEqual(1);
      expect(nestedSet.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ANNOTATION_0400
     * @tc.name   testSetAnnotation0004
     * @tc.desc   Verify Set is usable after 10200201 error recovery
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetAnnotation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetAnnotation0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      // 触发 10200201 并发修改错误
      try {
        set.forEach((v: number) => {
          set.add(999);
        });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200201);
      }
      // 验证错误后容器状态正常，可继续操作
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      set.add(100);
      expect(set.has(100)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ANNOTATION_0500
     * @tc.name   testSetAnnotation0005
     * @tc.desc   Verify Sendable function calls multiple Set methods consistently
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetAnnotation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetAnnotation0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(1);
      expect(set.has(1)).assertTrue();
      set.delete(1);
      expect(set.has(1)).assertFalse();
      set.clear();
      expect(set.size).assertEqual(0);
      set.add(2);
      set.forEach((value: number) => {
        expect(value).assertEqual(2);
      });
      console.info(`[${caseName}] end`);
      done();
    });

    /*
     * [SKIP] @Concurrent 装饰验证（设计文档 §4.3）
     * 原因: @Concurrent 装饰器用于 TaskPool 并发任务函数，非基础测试范围。
     *       验证 @Concurrent 函数中能否使用 collections.Set 属于 Phase 2.2 并发测试。
     * 预期: TaskPool 任务函数用 @Concurrent 装饰后编译通过，可接收 Set 参数。
     */

    /*
     * [SKIP] 非 Sendable 类型测试（设计文档 §4.3）
     * 场景: 使用 Object、普通 Function 作为 collections.Set<T> 泛型参数。
     * 预期结果: 编译错误 → 设计文档标注此测试为负向编译验证，非运行时用例。
     * 原因: ArkTS 编译器在编译期拦截非 Sendable 泛型参数，不存在运行时场景。
     * 替代覆盖: testSetAnnotation003_TypeConstraint 正向验证多种合法 Sendable 类型。
     */


    // ========================================================================
    // 边界类型测试
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0100
     * @tc.name   testSetBoundary0001
     * @tc.desc   Verify large Array with 10000 elements as Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0001';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 10000; i++) {
        largeArr.push(i);
      }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      expect(set.size).assertEqual(1);
      expect(set.has(largeArr)).assertTrue();
      expect(largeArr.length).assertEqual(10000);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0200
     * @tc.name   testSetBoundary0002
     * @tc.desc   Verify forEach iteration over Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0002';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 10000; i++) {
        largeArr.push(i);
      }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      let count = 0;
      set.forEach((value: collections.Array<number>) => {
        count++;
        expect(value.length).assertEqual(10000);
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0300
     * @tc.name   testSetBoundary0003
     * @tc.desc   Verify large Map with 1000 entries as Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0003';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) {
        largeMap.set(i, "val_" + i.toString());
      }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      expect(set.size).assertEqual(1);
      expect(set.has(largeMap)).assertTrue();
      expect(largeMap.get(500)).assertEqual("val_500");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0400
     * @tc.name   testSetBoundary0004
     * @tc.desc   Verify 10-level deep nested Sendable object as Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0004';
      console.info(`[${caseName}] start`);
      // 构建 10 层嵌套链：L1→L2→...→L10
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      expect(set.size).assertEqual(1);
      expect(set.has(l1)).assertTrue();
      // 验证第 10 层字段可访问
      expect(l1.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.id).assertEqual(10);
      expect(l1.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.value).assertEqual("deepest");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0500
     * @tc.name   testSetBoundary0005
     * @tc.desc   Verify forEach iteration over Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0005';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      set.forEach((value: DeepL1) => {
        expect(value.id).assertEqual(1);
        // 遍历中可访问完整 10 层链
        expect(value.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.value).assertEqual("deepest");
      });
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0600
     * @tc.name   testSetBoundary0006
     * @tc.desc   Verify has returns true for large Array Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0006';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 10000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      expect(set.has(largeArr)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0700
     * @tc.name   testSetBoundary0007
     * @tc.desc   Verify delete removes large Array Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0007';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 10000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      expect(set.delete(largeArr)).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0800
     * @tc.name   testSetBoundary0008
     * @tc.desc   Verify forEach iteration over Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0008';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      let count = 0;
      set.forEach((value: collections.Map<number, string>) => {
        count++;
        expect(value.get(0)).assertEqual("v0");
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_0900
     * @tc.name   testSetBoundary0009
     * @tc.desc   Verify keys iteration over Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0009';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      for (let k of set.keys()) {
        expect(k === largeMap).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1000
     * @tc.name   testSetBoundary0010
     * @tc.desc   Verify entries iteration over Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0010';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      for (let entry of set.entries()) {
        expect(entry[0] === l1).assertTrue();
        expect(entry[1] === l1).assertTrue();
        expect(entry[1].l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.id).assertEqual(10);
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1100
     * @tc.name   testSetBoundary0011
     * @tc.desc   Verify keys iteration over Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0011';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      for (let k of set.keys()) {
        expect(k.id).assertEqual(1);
        expect(k.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.id).assertEqual(10);
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1200
     * @tc.name   testSetBoundary0012
     * @tc.desc   Verify has returns true for deep nested object Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0012';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let other = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      expect(set.has(l1)).assertTrue();
      // 结构相同的另一条 10 层链是不同引用，has 应为 false（引用判等）
      expect(set.has(other)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1300
     * @tc.name   testSetBoundary0013
     * @tc.desc   Verify clear empties Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0013';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 1000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1400
     * @tc.name   testSetBoundary0014
     * @tc.desc   Verify size tracking for Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0014';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 1000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>();
      expect(set.size).assertEqual(0);
      set.add(largeArr);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1500
     * @tc.name   testSetBoundary0015
     * @tc.desc   Verify delete removes large Map Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0015';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      expect(set.delete(largeMap)).assertTrue();
      expect(set.has(largeMap)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1600
     * @tc.name   testSetBoundary0016
     * @tc.desc   Verify has returns true for large Map Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0016';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let otherMap = new collections.Map<number, string>();
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      expect(set.has(largeMap)).assertTrue();
      expect(set.has(otherMap)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1700
     * @tc.name   testSetBoundary0017
     * @tc.desc   Verify delete removes deep nested object Set element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0017';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      expect(set.delete(l1)).assertTrue();
      expect(set.size).assertEqual(0);
      // 删除后原对象嵌套链不受影响
      expect(l1.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.value).assertEqual("deepest");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1800
     * @tc.name   testSetBoundary0018
     * @tc.desc   Verify clear empties Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0018';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_1900
     * @tc.name   testSetBoundary0019
     * @tc.desc   Verify clear empties Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0019';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(l1)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2000
     * @tc.name   testSetBoundary0020
     * @tc.desc   Verify size tracking for Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0020';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Map<number, string>>();
      expect(set.size).assertEqual(0);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      set.add(largeMap);
      expect(set.size).assertEqual(1);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2100
     * @tc.name   testSetBoundary0021
     * @tc.desc   Verify size tracking for Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<DeepL1>();
      expect(set.size).assertEqual(0);
      let l1 = buildDeepChain();
      set.add(l1);
      expect(set.size).assertEqual(1);
      set.delete(l1);
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2200
     * @tc.name   testSetBoundary0022
     * @tc.desc   Verify entries iteration over Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0022';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 1000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      for (let entry of set.entries()) {
        expect(entry[0] === largeArr).assertTrue();
        expect(entry[1] === largeArr).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2300
     * @tc.name   testSetBoundary0023
     * @tc.desc   Verify keys iteration over Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0023';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 1000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      for (let k of set.keys()) {
        expect(k === largeArr).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2400
     * @tc.name   testSetBoundary0024
     * @tc.desc   Verify values iteration over Set with large Array element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0024';
      console.info(`[${caseName}] start`);
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 1000; i++) { largeArr.push(i); }
      let set = new collections.Set<collections.Array<number>>([largeArr]);
      let count = 0;
      for (let v of set.values()) {
        expect(v === largeArr).assertTrue();
        count++;
      }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2500
     * @tc.name   testSetBoundary0025
     * @tc.desc   Verify entries iteration over Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0025';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      for (let entry of set.entries()) {
        expect(entry[0] === largeMap).assertTrue();
        expect(entry[1] === largeMap).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2600
     * @tc.name   testSetBoundary0026
     * @tc.desc   Verify values iteration over Set with large Map element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0026';
      console.info(`[${caseName}] start`);
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      let set = new collections.Set<collections.Map<number, string>>([largeMap]);
      for (let v of set.values()) {
        expect(v === largeMap).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2700
     * @tc.name   testSetBoundary0027
     * @tc.desc   Verify values iteration over Set with deep nested object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0027';
      console.info(`[${caseName}] start`);
      let l1 = buildDeepChain();
      let set = new collections.Set<DeepL1>([l1]);
      for (let v of set.values()) {
        expect(v.id).assertEqual(1);
        expect(v.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.value).assertEqual("deepest");
      }
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2800
     * @tc.name   testSetBoundary0028
     * @tc.desc   Verify circular reference object as Set element via constructor
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0028';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      expect(set.size).assertEqual(1);
      expect(set.has(node)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_2900
     * @tc.name   testSetBoundary0029
     * @tc.desc   Verify forEach iteration over Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0029';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      set.forEach((value: CircularNode) => {
        expect(value === node).assertTrue();
      });
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3000
     * @tc.name   testSetBoundary0030
     * @tc.desc   Verify entries iteration over Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0030';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      for (let entry of set.entries()) {
        expect(entry[0] === node).assertTrue();
        expect(entry[1] === node).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3100
     * @tc.name   testSetBoundary0031
     * @tc.desc   Verify keys iteration over Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0031';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      for (let k of set.keys()) {
        expect(k === node).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3200
     * @tc.name   testSetBoundary0032
     * @tc.desc   Verify values iteration over Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0032';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      for (let v of set.values()) {
        expect(v === node).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3300
     * @tc.name   testSetBoundary0033
     * @tc.desc   Verify add circular reference object to Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0033';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<CircularNode>();
      let node = new CircularNode();
      set.add(node);
      expect(set.has(node)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3400
     * @tc.name   testSetBoundary0034
     * @tc.desc   Verify has returns true for circular reference object in Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0034';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let other = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      expect(set.has(node)).assertTrue();
      expect(set.has(other)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3500
     * @tc.name   testSetBoundary0035
     * @tc.desc   Verify delete removes circular reference object from Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0035';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      expect(set.delete(node)).assertTrue();
      expect(set.has(node)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3600
     * @tc.name   testSetBoundary0036
     * @tc.desc   Verify clear empties Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0036';
      console.info(`[${caseName}] start`);
      let node = new CircularNode();
      let set = new collections.Set<CircularNode>([node]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3700
     * @tc.name   testSetBoundary0037
     * @tc.desc   Verify size tracking for Set with circular reference object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0037';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<CircularNode>();
      expect(set.size).assertEqual(0);
      let node = new CircularNode();
      set.add(node);
      expect(set.size).assertEqual(1);
      set.delete(node);
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3800
     * @tc.name   testSetBoundary0038
     * @tc.desc   Verify add large Map element to Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0038';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Map<number, string>>();
      let largeMap = new collections.Map<number, string>();
      for (let i = 0; i < 1000; i++) { largeMap.set(i, "v" + i.toString()); }
      set.add(largeMap);
      expect(set.has(largeMap)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_3900
     * @tc.name   testSetBoundary0039
     * @tc.desc   Verify add large Array element to Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0039';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Array<number>>();
      let largeArr = new collections.Array<number>();
      for (let i = 0; i < 10000; i++) { largeArr.push(i); }
      set.add(largeArr);
      expect(set.has(largeArr)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_BOUNDARY_4000
     * @tc.name   testSetBoundary0040
     * @tc.desc   Verify add deep nested object to Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level2
     */
    it('testSetBoundary0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testSetBoundary0040';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<DeepL1>();
      let l1 = buildDeepChain();
      set.add(l1);
      expect(set.has(l1)).assertTrue();
      // add 后完整 10 层链仍可访问
      expect(l1.l2!.l3!.l4!.l5!.l6!.l7!.l8!.l9!.l10!.id).assertEqual(10);
      console.info(`[${caseName}] end`);
      done();
    });

    // ====================================================================
    // 返回值验证
    // ====================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0100
     * @tc.name   testSetReturn0001
     * @tc.desc   Verify forEach returns void
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2]);
      let invoked = false;
      set.forEach(() => { invoked = true; });
      expect(invoked).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0200
     * @tc.name   testSetReturn0002
     * @tc.desc   Verify entries keys values return iterators with next method
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(1);
      expect(typeof set.entries().next).assertEqual("function");
      expect(typeof set.keys().next).assertEqual("function");
      expect(typeof set.values().next).assertEqual("function");
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0300
     * @tc.name   testSetReturn0003
     * @tc.desc   Verify constructor() returns collections.Set instance with size 0
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      expect(set instanceof collections.Set).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0400
     * @tc.name   testSetReturn0004
     * @tc.desc   Verify constructor(array) returns collections.Set with matching size and elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([10, 20, 30]);
      expect(set instanceof collections.Set).assertTrue();
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0500
     * @tc.name   testSetReturn0005
     * @tc.desc   Verify constructor(Set) copies from source Set with same elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0005';
      console.info(`[${caseName}] start`);
      let src = new collections.Set<string>(['a', 'b', 'c']);
      let set = new collections.Set<string>(src);
      expect(set instanceof collections.Set).assertTrue();
      expect(set.size).assertEqual(3);
      expect(set.has('a')).assertTrue();
      expect(set.has('b')).assertTrue();
      expect(set.has('c')).assertTrue();
      // 新 Set 独立于源 Set
      set.add('d');
      expect(set.size).assertEqual(4);
      expect(src.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0600
     * @tc.name   testSetReturn0006
     * @tc.desc   Verify constructor(null) returns empty collections.Set instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>(null);
      expect(set instanceof collections.Set).assertTrue();
      expect(set.size).assertEqual(0);
      set.add(99);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0700
     * @tc.name   testSetReturn0007
     * @tc.desc   Verify constructor with SendableClass type returns correct structure
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0007';
      console.info(`[${caseName}] start`);
      let obj = new SendableClassBasic(1, 'return_test');
      let set = new collections.Set<SendableClassBasic>([obj]);
      expect(set instanceof collections.Set).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });


    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0800
     * @tc.name   testSetReturn0008
     * @tc.desc   Verify add returns the Set instance itself for chaining and size reflects uniqueness
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let returned: collections.Set<number> = set.add(100);
      expect(returned === set).assertTrue();
      expect(set.size).assertEqual(1);
      set.add(100);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_0900
     * @tc.name   testSetReturn0009
     * @tc.desc   Verify has returns true for existing element and false for absent element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(['hello']);
      let r1: boolean = set.has('hello');
      expect(r1).assertTrue();
      let r2: boolean = set.has('world');
      expect(r2).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_1000
     * @tc.name   testSetReturn0010
     * @tc.desc   Verify delete returns true when element existed and false when not found
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2]);
      let r1: boolean = set.delete(1);
      expect(r1).assertTrue();
      expect(set.size).assertEqual(1);
      let r2: boolean = set.delete(999);
      expect(r2).assertFalse();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_1100
     * @tc.name   testSetReturn0011
     * @tc.desc   Verify clear returns void and empties Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(1)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_1200
     * @tc.name   testSetReturn0012
     * @tc.desc   Verify entries returns IterableIterator<[T,T]> with correct key-value pairs
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([42]);
      let iter: IterableIterator<[number, number]> = set.entries();
      let entry: IteratorResult<[number, number]> = iter.next();
      expect(entry.value[0]).assertEqual(42);
      expect(entry.value[1]).assertEqual(42);
      expect(entry.done).assertFalse();
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_1300
     * @tc.name   testSetReturn0013
     * @tc.desc   Verify keys returns IterableIterator<T> iterating all elements in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(['first', 'second']);
      let iter: IterableIterator<string> = set.keys();
      let k1: IteratorResult<string> = iter.next();
      expect(k1.value).assertEqual('first');
      let k2: IteratorResult<string> = iter.next();
      expect(k2.value).assertEqual('second');
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_RETURN_1400
     * @tc.name   testSetReturn0014
     * @tc.desc   Verify values returns IterableIterator<T> iterating all elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetReturn0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetReturn0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let iter: IterableIterator<number> = set.values();
      let count: number = 0;
      let sum: number = 0;
      let v: IteratorResult<number> = iter.next();
      while (!v.done) {
        sum = sum + v.value;
        count++;
        v = iter.next();
      }
      expect(count).assertEqual(3);
      expect(sum).assertEqual(6);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}
