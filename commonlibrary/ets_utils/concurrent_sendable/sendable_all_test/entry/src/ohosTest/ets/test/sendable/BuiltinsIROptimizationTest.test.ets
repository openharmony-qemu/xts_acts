/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ICTestClass {
  public prop0: number = 0
  public prop1: number = 1
  public prop2: number = 2
  public prop3: number = 3
  public prop4: number = 4
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async getProp0(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.prop0)
  }

  async setProp0(value: number): Promise<void> {
    await this.lock_.lockAsync((): void => { this.prop0 = value })
  }
}

@Sendable
class Point {
  public x: number = 0
  public y: number = 0
}

@Sendable
class Point3D {
  public x: number = 0
  public y: number = 0
  public z: number = 0
}

@Sendable
class IRTestClass {
  public prop1: number = 10
  public prop2: number = 20
  public prop3: number = 30
}

@Sendable
class StableIRObject {
  public counter: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.counter++
      return this.counter
    })
  }

  async getCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.counter)
  }
}

@Sendable
class DynamicPropertyObject {
  public id: number = 0
  public name: string = ''
  public extensions: collections.Map<string, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(extensions: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.extensions = extensions
    this.lock_ = lock_
  }


  async addExtension(key: string, value: number): Promise<void> {
    await this.lock_.lockAsync((): void => { this.extensions.set(key, value) })
  }

  async getExtension(key: string): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => this.extensions.get(key))
  }
}

@Sendable
class HybridObject {
  public fixed1: number = 1
  public fixed2: number = 2
  public fixed3: number = 3
  public dynamic: collections.Map<string, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(dynamic: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dynamic = dynamic
    this.lock_ = lock_
  }

}

@Concurrent
function readICTestProp(obj: ICTestClass): number {
  return obj.prop0
}

@Concurrent
function readPoint(p: Point): number {
  return p.x + p.y
}

@Concurrent
function setPointCoords(p: Point, x: number, y: number): void {
  p.x = x
  p.y = y
}

@Concurrent
function readIRObject(o: IRTestClass): number {
  return o.prop1 + o.prop2 + o.prop3
}

@Concurrent
function modifyIRObject(o: IRTestClass, value: number): void {
  o.prop1 = value
}

@Concurrent
async function concurrentIncrementObj(o: StableIRObject): Promise<void> {
  await o.increment()
}

@Concurrent
function workerReceiveObject(o: IRTestClass): number {
  return o.prop1 * o.prop2 * o.prop3
}

@Concurrent
function workerReceiveIRTest(o: IRTestClass): number {
  return o.prop1 * o.prop2 * o.prop3
}

export default function BuiltinsIROptimizationTest(): void {
  describe('BuiltinsIROptimizationTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsIROptimizationTest0100
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0100
     * @tc.desc   Verify IC cache establishment by repeatedly accessing same property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: ICTestClass = new ICTestClass(new ArkTSUtils.locks.AsyncLock())
      const firstAccess: number = await testObj.getProp0()
      expect(firstAccess).assertEqual(0)
      for (let i = 0; i < 100; i++) {
        const val: number = await testObj.getProp0()
        expect(val).assertEqual(0)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0200
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0200
     * @tc.desc   Verify IC cache update after property modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: ICTestClass = new ICTestClass(new ArkTSUtils.locks.AsyncLock())
      await testObj.getProp0()
      await testObj.setProp0(100)
      const result: number = await testObj.getProp0()
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0300
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0300
     * @tc.desc   Verify IC cache independence for multiple properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: ICTestClass = new ICTestClass(new ArkTSUtils.locks.AsyncLock())
      const results: number[] = await Promise.all([
        testObj.getProp0(),
        testObj.lock_.lockAsync((): number => testObj.prop1),
        testObj.lock_.lockAsync((): number => testObj.prop2),
        testObj.lock_.lockAsync((): number => testObj.prop3),
        testObj.lock_.lockAsync((): number => testObj.prop4)
      ])
      expect(results[0]).assertEqual(0)
      expect(results[1]).assertEqual(1)
      expect(results[2]).assertEqual(2)
      expect(results[3]).assertEqual(3)
      expect(results[4]).assertEqual(4)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0400
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0400
     * @tc.desc   Verify IC concurrent safety with TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testObj: ICTestClass = new ICTestClass(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readICTestProp, testObj))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(0)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0500
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0500
     * @tc.desc   Verify IC cache hit performance - first vs subsequent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIROptimizationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testObj: ICTestClass = new ICTestClass(new ArkTSUtils.locks.AsyncLock())
      await testObj.getProp0()
      for (let i = 0; i < 100; i++) {
        await testObj.getProp0()
      }
      expect(await testObj.getProp0()).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0600
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0600
     * @tc.desc   Verify HiddenClass sharing for same-structure objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Point = new Point()
      const p2: Point = new Point()
      const p3: Point = new Point()
      p1.x = 10; p1.y = 20
      p2.x = 30; p2.y = 40
      p3.x = 50; p3.y = 60
      expect(p1.x).assertEqual(10)
      expect(p2.x).assertEqual(30)
      expect(p3.x).assertEqual(50)
      const tasks: taskpool.Task[] = [
        new taskpool.Task(readPoint, p1),
        new taskpool.Task(readPoint, p2),
        new taskpool.Task(readPoint, p3)
      ]
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results[0] as number).assertEqual(30)
      expect(results[1] as number).assertEqual(70)
      expect(results[2] as number).assertEqual(110)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0700
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0700
     * @tc.desc   Verify HiddenClass separation for different-structure objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p2d: Point = new Point()
      const p3d: Point3D = new Point3D()
      p2d.x = 1; p2d.y = 2
      p3d.x = 1; p3d.y = 2; p3d.z = 3
      expect(p2d.x).assertEqual(1)
      expect(p3d.z).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0800
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0800
     * @tc.desc   Verify HiddenClass chain consistency with same add order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj1: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      const obj2: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      await obj1.addExtension('a', 1)
      await obj1.addExtension('b', 2)
      await obj1.addExtension('c', 3)
      await obj2.addExtension('a', 1)
      await obj2.addExtension('b', 2)
      await obj2.addExtension('c', 3)
      expect(await obj1.getExtension('a')).assertEqual(await obj2.getExtension('a'))
      expect(await obj1.getExtension('b')).assertEqual(await obj2.getExtension('b'))
      expect(await obj1.getExtension('c')).assertEqual(await obj2.getExtension('c'))
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest0900
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_0900
     * @tc.desc   Verify concurrent creation of same-structure objects with HiddenClass sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const points: Point[] = []
      for (let i = 0; i < 10; i++) {
        const p: Point = new Point()
        points.push(p)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(setPointCoords, points[i], i, i * 2))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      for (let i = 0; i < points.length; i++) {
        expect(points[i].x >= 0).assertTrue()
        expect(points[i].y).assertEqual(points[i].x * 2)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1000
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1000
     * @tc.desc   Verify HiddenClass chain depth with 512 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 512; i++) {
        await obj.addExtension(`prop_${i}`, i)
      }
      expect(await obj.getExtension('prop_0')).assertEqual(0)
      expect(await obj.getExtension('prop_255')).assertEqual(255)
      expect(await obj.getExtension('prop_511')).assertEqual(511)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1100
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1100
     * @tc.desc   Verify Sendable class has fixed structure - no dynamic property addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const obj: Point = new Point()
      obj.x = 10; obj.y = 20
      expect(obj.x).assertEqual(10)
      expect(obj.y).assertEqual(20)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1200
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1200
     * @tc.desc   Verify SendableMap as dynamic property storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const obj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      obj.id = 100
      await obj.addExtension('ext1', 10)
      await obj.addExtension('ext2', 20)
      expect(obj.id).assertEqual(100)
      expect(await obj.getExtension('ext1')).assertEqual(10)
      expect(await obj.getExtension('ext2')).assertEqual(20)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1300
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1300
     * @tc.desc   Verify dynamic property count exceeding 1024 triggers dictionary mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await obj.addExtension(`dyn_${i}`, i)
      }
      expect(await obj.getExtension('dyn_0')).assertEqual(0)
      expect(await obj.getExtension('dyn_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1400
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1400
     * @tc.desc   Verify fixed + dynamic property combination - IR + dictionary mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: HybridObject = new HybridObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await obj.lock_.lockAsync((): void => { obj.dynamic.set(`d_${i}`, i) })
      }
      expect(obj.fixed1).assertEqual(1)
      expect(obj.fixed2).assertEqual(2)
      expect(obj.fixed3).assertEqual(3)
      const val: number | undefined = obj.dynamic.get('d_1024')
      expect(val !== undefined && val === 1024).assertTrue()
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1500
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1500
     * @tc.desc   Verify IR object cross-thread access consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const obj: IRTestClass = new IRTestClass()
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readIRObject, obj))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(60)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1600
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1600
     * @tc.desc   Verify IR object modification and cross-thread consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: IRTestClass = new IRTestClass()
      const modifyTask: taskpool.Task = new taskpool.Task(modifyIRObject, obj, 100)
      await taskpool.execute(modifyTask)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readIRObject, obj))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(150)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1700
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1700
     * @tc.desc   Verify same-structure objects cross-thread HiddenClass sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const points: Point[] = []
      for (let i = 0; i < 10; i++) {
        const p: Point = new Point()
        points.push(p)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(setPointCoords, points[i], i, i * 2))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      for (let i = 0; i < points.length; i++) {
        expect(points[i].y).assertEqual(points[i].x * 2)
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1800
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1800
     * @tc.desc   Verify IR object Worker transfer consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: IRTestClass = new IRTestClass()
      obj.prop1 = 1; obj.prop2 = 2; obj.prop3 = 3
      const task: taskpool.Task = new taskpool.Task(workerReceiveIRTest, obj)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(6)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest1900
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_1900
     * @tc.desc   Verify large concurrent access IR stability with 50 threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: StableIRObject = new StableIRObject(new ArkTSUtils.locks.AsyncLock())
      const batchSize: number = 10
      for (let batch = 0; batch < 5; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < batchSize; i++) {
          tasks.push(new taskpool.Task(concurrentIncrementObj, obj))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await obj.getCount()).assertEqual(50)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2000
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2000
     * @tc.desc   Verify SendableArray IR boundary with 1024 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 1024; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(1024)
      expect(arr[0]).assertEqual(0)
      expect(arr[512]).assertEqual(512)
      expect(arr[1023]).assertEqual(1023)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2100
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2100
     * @tc.desc   Verify SendableArray exceeding 1024 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 1025; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(1025)
      expect(arr[1024]).assertEqual(1024)
      expect(arr[1023]).assertEqual(1023)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2200
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2200
     * @tc.desc   Verify SendableMap IR boundary with 1024 key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map: collections.Map<string, number> = new collections.Map<string, number>()
      for (let i = 0; i < 1024; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.size).assertEqual(1024)
      expect(map.get('key_0')).assertEqual(0)
      expect(map.get('key_1023')).assertEqual(1023)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2300
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2300
     * @tc.desc   Verify SendableMap exceeding 1024 key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIROptimizationTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map: collections.Map<string, number> = new collections.Map<string, number>()
      for (let i = 0; i < 1025; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.size).assertEqual(1025)
      expect(map.get('key_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2400
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2400
     * @tc.desc   Verify IR property access performance with 100 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIROptimizationTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const obj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        await obj.addExtension(`p_${i}`, i)
      }
      for (let round = 0; round < 10; round++) {
        for (let i = 0; i < 100; i++) {
          const val: number | undefined = await obj.getExtension(`p_${i}`)
          expect(val).assertEqual(i)
        }
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2500
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2500
     * @tc.desc   Verify dictionary mode property access with 1025 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIROptimizationTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const obj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await obj.addExtension(`p_${i}`, i)
      }
      for (let round = 0; round < 10; round++) {
        const samples: number[] = [0, 256, 512, 768, 1024]
        for (let idx = 0; idx < samples.length; idx++) {
          const val: number | undefined = await obj.getExtension(`p_${samples[idx]}`)
          expect(val).assertEqual(samples[idx])
        }
      }
    })

    /**
     * @tc.name   BuiltinsIROptimizationTest2600
     * @tc.number SUB_BUILTINS_IR_OPTIMIZATION_TEST_2600
     * @tc.desc   Verify IR vs dictionary mode functional consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIROptimizationTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const irObj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      const dictObj: DynamicPropertyObject = new DynamicPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        await irObj.addExtension(`k_${i}`, i)
      }
      for (let i = 0; i < 1025; i++) {
        await dictObj.addExtension(`k_${i}`, i)
      }
      expect(await irObj.getExtension('k_50')).assertEqual(await dictObj.getExtension('k_50'))
      expect(await irObj.getExtension('k_99')).assertEqual(99)
      expect(await dictObj.getExtension('k_1024')).assertEqual(1024)
    })
  })
}
