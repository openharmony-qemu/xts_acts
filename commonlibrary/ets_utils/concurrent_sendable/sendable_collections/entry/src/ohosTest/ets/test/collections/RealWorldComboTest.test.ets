/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

// ===== @Concurrent Functions =====

@Concurrent
function chunkSumFunc(arr: collections.Array<number>, start: number, end: number): number {
  let sum: number = 0
  for (let i = start; i < end; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function arrayRefPassFunc(arr: collections.Array<number>): number {
  arr.push(999)
  return arr.length
}

@Concurrent
function mapRefPassFunc(map: collections.Map<string, number>): number {
  map.set('fromTask', 42)
  return map.size
}

@Concurrent
function typedArrayReadFunc(buffer: collections.ArrayBuffer): number {
  let view = new collections.Int32Array(buffer)
  return view[0]
}

@Concurrent
function processPixelsFunc(buffer: collections.ArrayBuffer, start: number, end: number): number {
  let pixels = new collections.Uint8ClampedArray(buffer)
  let count: number = 0
  for (let i = start; i < end; i += 4) {
    pixels[i] = Math.min(255, pixels[i] + 10)
    count++
  }
  return count
}

@Concurrent
function flipBitFunc(bv: collections.BitVector, index: number): void {
  bv.flipBitByIndex(index)
}

@Concurrent
function floatPrecisionFunc(buffer: collections.ArrayBuffer): number {
  let view = new collections.Float32Array(buffer)
  view[0] = 3.14
  view[1] = 2.71
  return view[0] + view[1]
}

@Concurrent
function clampedWriteFunc(buffer: collections.ArrayBuffer): number {
  let view = new collections.Uint8ClampedArray(buffer)
  view[0] = 300
  view[1] = -50
  view[2] = 128
  return view[0] + view[1] + view[2]
}

@Concurrent
function largeBufferFunc(buffer: collections.ArrayBuffer): number {
  let view = new collections.Uint8Array(buffer)
  for (let i = 0; i < view.length; i++) {
    view[i] = i % 256
  }
  return view.length
}

@Concurrent
function mapKeyExtractFunc(map: collections.Map<string, number>): collections.Array<string> {
  let keys = new collections.Array<string>()
  map.forEach((v: number, k: string) => {
    keys.push(k)
  })
  return keys
}

@Concurrent
function mapLookupFunc(map: collections.Map<string, number>, key: string): number {
  let val = map.get(key)
  if (val !== undefined) {
    return val as number
  }
  return -1
}

@Concurrent
function setDedupFunc(set: collections.Set<number>): number {
  return set.size
}

@Concurrent
function pipelineFunc(arr: collections.Array<number>): number {
  let map = new collections.Map<number, number>()
  for (let i = 0; i < arr.length; i++) {
    map.set(arr[i], arr[i] * 2)
  }
  let set = new collections.Set<number>()
  map.forEach((v: number) => {
    set.add(v)
  })
  return set.size
}

export default function RealWorldComboTest(): void {
  describe('RealWorldComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Cross-Module Combinations (0100-0400) =====

    /**
     * @tc.name   RealWorldComboTest0100
     * @tc.number SUB_REALWORLD_COMBO_TEST_0100
     * @tc.desc   Verify TaskPool chunk processing splits 10K Array into 10 segments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bigArray = new collections.Array<number>()
      for (let i = 0; i < 10000; i++) {
        bigArray.push(i)
      }
      let chunkSize: number = 1000
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(chunkSumFunc, bigArray, i * chunkSize, (i + 1) * chunkSize))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      let totalSum: number = 0
      for (let i = 0; i < results.length; i++) {
        totalSum += results[i] as number
      }
      expect(totalSum).assertEqual(49995000)
    })

    /**
     * @tc.name   RealWorldComboTest0200
     * @tc.number SUB_REALWORLD_COMBO_TEST_0200
     * @tc.desc   Verify Array cross-thread reference pass with push visible in host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3)
      let task = new taskpool.Task(arrayRefPassFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(4)
      expect(arr.length).assertEqual(4)
      expect(arr[3]).assertEqual(999)
    })

    /**
     * @tc.name   RealWorldComboTest0300
     * @tc.number SUB_REALWORLD_COMBO_TEST_0300
     * @tc.desc   Verify Map cross-thread reference pass with set visible in host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      map.set('host', 1)
      let task = new taskpool.Task(mapRefPassFunc, map)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(2)
      expect(map.has('fromTask')).assertTrue()
      expect(map.get('fromTask')).assertEqual(42)
    })

    /**
     * @tc.name   RealWorldComboTest0400
     * @tc.number SUB_REALWORLD_COMBO_TEST_0400
     * @tc.desc   Verify TypedArray cross-thread data read via shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(16)
      let view = new collections.Int32Array(buffer)
      view[0] = 12345
      let task = new taskpool.Task(typedArrayReadFunc, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(12345)
    })

    // ===== Real-World Scenarios (0500-0900) =====

    /**
     * @tc.name   RealWorldComboTest0500
     * @tc.number SUB_REALWORLD_COMBO_TEST_0500
     * @tc.desc   Verify image pixel processing with Uint8ClampedArray RGBA enhancement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let width: number = 10
      let height: number = 10
      let pixelCount: number = width * height * 4
      let imageBuffer = new collections.ArrayBuffer(pixelCount)
      let pixels = new collections.Uint8ClampedArray(imageBuffer)
      for (let i = 0; i < pixelCount; i++) {
        pixels[i] = 100
      }
      let halfPixel: number = pixelCount / 2
      let task1 = new taskpool.Task(processPixelsFunc, imageBuffer, 0, halfPixel)
      let task2 = new taskpool.Task(processPixelsFunc, imageBuffer, halfPixel, pixelCount)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results = await Promise.all([p1, p2])
      expect((results[0] as number) + (results[1] as number)).assertEqual(width * height)
      expect(pixels[0]).assertEqual(110)
    })

    /**
     * @tc.name   RealWorldComboTest0600
     * @tc.number SUB_REALWORLD_COMBO_TEST_0600
     * @tc.desc   Verify BitVector concurrent state flipBitByIndex with 20 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(100)
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 20; i++) {
          tasks.push(new taskpool.Task(flipBitFunc, bv, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        let bitCount = bv.getBitCountByRange(1, 0, 20)
        expect(bitCount).assertEqual(20)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   RealWorldComboTest0700
     * @tc.number SUB_REALWORLD_COMBO_TEST_0700
     * @tc.desc   Verify multiple TypedArray views sharing same ArrayBuffer data interpretation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RealWorldComboTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buffer = new collections.ArrayBuffer(16)
      let int8View = new collections.Int8Array(buffer)
      let uint8View = new collections.Uint8Array(buffer)
      let int16View = new collections.Int16Array(buffer)
      int8View[0] = -1
      expect(uint8View[0]).assertEqual(255)
      int16View[0] = 256
      expect(uint8View[0]).assertEqual(0)
      expect(uint8View[1]).assertEqual(1)
    })

    /**
     * @tc.name   RealWorldComboTest0800
     * @tc.number SUB_REALWORLD_COMBO_TEST_0800
     * @tc.desc   Verify Float32Array precision verification across threads via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(8)
      let task = new taskpool.Task(floatPrecisionFunc, buffer)
      let result = await taskpool.execute(task)
      let sum = result as number
      expect(sum > 5.8).assertTrue()
      expect(sum < 5.9).assertTrue()
    })

    /**
     * @tc.name   RealWorldComboTest0900
     * @tc.number SUB_REALWORLD_COMBO_TEST_0900
     * @tc.desc   Verify Uint8ClampedArray clamping behavior for overflow and underflow values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RealWorldComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(4)
      let task = new taskpool.Task(clampedWriteFunc, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(383)
      let view = new collections.Uint8ClampedArray(buffer)
      expect(view[0]).assertEqual(255)
      expect(view[1]).assertEqual(0)
      expect(view[2]).assertEqual(128)
    })

    // ===== Cross-Thread Container Operations (1000-1500) =====

    /**
     * @tc.name   RealWorldComboTest1000
     * @tc.number SUB_REALWORLD_COMBO_TEST_1000
     * @tc.desc   Verify large ArrayBuffer 100KB processing via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bufferSize: number = 100 * 1024
      let buffer = new collections.ArrayBuffer(bufferSize)
      let task = new taskpool.Task(largeBufferFunc, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(bufferSize)
      let view = new collections.Uint8Array(buffer)
      expect(view[0]).assertEqual(0)
      expect(view[255]).assertEqual(255)
    })

    /**
     * @tc.name   RealWorldComboTest1100
     * @tc.number SUB_REALWORLD_COMBO_TEST_1100
     * @tc.desc   Verify BitVector bulk state initialization and bit count verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(0)
      for (let i = 0; i < 500; i++) {
        bv.push(1)
      }
      for (let i = 0; i < 500; i++) {
        bv.push(0)
      }
      expect(bv.length).assertEqual(1000)
      let trueCount = bv.getBitCountByRange(1, 0, bv.length)
      expect(trueCount).assertEqual(500)
    })

    /**
     * @tc.name   RealWorldComboTest1200
     * @tc.number SUB_REALWORLD_COMBO_TEST_1200
     * @tc.desc   Verify Map key extraction to Array via TaskPool cross-thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      map.set('alpha', 1)
      map.set('beta', 2)
      map.set('gamma', 3)
      let task = new taskpool.Task(mapKeyExtractFunc, map)
      let result = await taskpool.execute(task)
      let keys = result as collections.Array<string>
      expect(keys.length).assertEqual(3)
    })

    /**
     * @tc.name   RealWorldComboTest1300
     * @tc.number SUB_REALWORLD_COMBO_TEST_1300
     * @tc.desc   Verify Map cross-thread lookup with pre-populated data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      map.set('target', 42)
      let task = new taskpool.Task(mapLookupFunc, map, 'target')
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   RealWorldComboTest1400
     * @tc.number SUB_REALWORLD_COMBO_TEST_1400
     * @tc.desc   Verify Set deduplication count cross-thread after bulk add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let set = new collections.Set<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i % 10)
      }
      let task = new taskpool.Task(setDedupFunc, set)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10)
    })

    /**
     * @tc.name   RealWorldComboTest1500
     * @tc.number SUB_REALWORLD_COMBO_TEST_1500
     * @tc.desc   Verify mixed container pipeline Array to Map to Set via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RealWorldComboTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      let task = new taskpool.Task(pipelineFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
    })
  })
}
