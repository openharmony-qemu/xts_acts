/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level, afterAll } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

/**
 * Sendable class exercised by the stability stress tests. It carries two number
 * fields so that Object.keys / getOwnPropertyNames return a stable key set and
 * concurrent readers always observe the same values.
 */
@Sendable
class StressPoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

/**
 * Stress worker: runs `rounds` iterations, each invoking 16 builtin interfaces
 * on a freshly constructed StressPoint. Returns a deterministic checksum so all
 * concurrent workers can be compared for consistency.
 *
 * The 16 interfaces exercised per round:
 *  1.  hasOwnProperty('x')
 *  2.  hasOwnProperty('y')
 *  3.  hasOwnProperty('nonexistent')
 *  4.  toString()
 *  5.  toLocaleString()
 *  6.  valueOf()
 *  7.  propertyIsEnumerable('x')
 *  8.  Object.keys(obj)
 *  9.  Object.getPrototypeOf(obj)
 *  10. Object.is(obj, obj)
 *  11. Object.getOwnPropertyNames(obj)
 *  12. obj instanceof StressPoint
 *  13. typeof obj
 *  14. obj.constructor
 *  15. JSON.stringify(obj)   (wrapped; may throw on sendable)
 *  16. obj.x + obj.y         (field read)
 *
 * Each call is individually guarded so one unsupported builtin never aborts the
 * round; the checksum only advances on success, keeping it deterministic across
 * workers. All builtin accesses go through an ESObject view so that Object
 * prototype members are reachable regardless of the typed interface of the
 * @Sendable class in strict ArkTS.
 */
@Concurrent
function stressInterfaces(rounds: number): number {
  let checksum: number = 0;
  for (let i = 0; i < rounds; i++) {
    let obj: StressPoint = new StressPoint(10, 20);
    let dyn: ESObject = obj;
    let step: number = 0;

    // Each builtin is invoked as a call statement and counts as +1 when it does
    // not throw. This keeps the checksum deterministic across workers (identical
    // code, identical object state) and directly verifies the "no crash" goal.
    // Instance prototype members are reached through the ESObject view so they
    // are resolvable regardless of the typed interface of the @Sendable class.

    // 1. hasOwnProperty('x')
    try { dyn.hasOwnProperty('x'); step += 1; } catch (e) { }
    // 2. hasOwnProperty('y')
    try { dyn.hasOwnProperty('y'); step += 1; } catch (e) { }
    // 3. hasOwnProperty('nonexistent')
    try { dyn.hasOwnProperty('nonexistent'); step += 1; } catch (e) { }
    // 4. toString()
    try { dyn.toString(); step += 1; } catch (e) { }
    // 5. toLocaleString()
    try { dyn.toLocaleString(); step += 1; } catch (e) { }
    // 6. valueOf()
    try { dyn.valueOf(); step += 1; } catch (e) { }
    // 7. propertyIsEnumerable('x')
    try { dyn.propertyIsEnumerable('x'); step += 1; } catch (e) { }
    // 8. Object.keys(obj)
    try { Object.keys(obj); step += 1; } catch (e) { }
    // 9. Object.getPrototypeOf(obj)
    try { Object.getPrototypeOf(obj); step += 1; } catch (e) { }
    // 10. Object.is(obj, obj)
    try { Object.is(obj, obj); step += 1; } catch (e) { }
    // 11. Object.getOwnPropertyNames(obj)
    try { Object.getOwnPropertyNames(obj); step += 1; } catch (e) { }
    // 12. obj instanceof StressPoint
    try { let r: boolean = obj instanceof StressPoint; step += r ? 1 : 0; } catch (e) { }
    // 13. typeof obj
    try { let r: string = typeof obj; step += r === 'object' ? 1 : 0; } catch (e) { }
    // 14. obj.constructor
    try { let r: ESObject = dyn.constructor; step += (r !== null && r !== undefined) ? 1 : 0; } catch (e) { }
    // 15. JSON.stringify(obj) (may throw on sendable)
    try { JSON.stringify(obj); step += 1; } catch (e) { }
    // 16. field read
    try { let r: number = obj.x + obj.y; step += r === 30 ? 1 : 0; } catch (e) { }

    checksum += step;
  }
  return checksum;
}

/**
 * Stress worker for concurrent-read verification: reads the SAME shared sendable
 * object `rounds` times and returns the accumulated sum. Read-only access is
 * race-free, so every concurrent worker must observe the identical total.
 */
@Concurrent
function readSharedRounds(obj: StressPoint, rounds: number): number {
  let sum: number = 0;
  for (let i = 0; i < rounds; i++) {
    sum += obj.x + obj.y;
  }
  return sum;
}

export default function SendableBuiltinsStressTest() {
  describe('SendableBuiltinsStressTest', () => {
    afterAll(async () => {
      console.info('SendableBuiltinsStressTest afterAll called');
      await new Promise<void>((resolve) => { setTimeout(resolve, 100); });
    });

    /**
     * @tc.name   testStressInterfaces4Workers1000Rounds
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0063
     * @tc.desc   Stability: 4 workers x 1000 rounds calling 16 builtin interfaces
     *            (hasOwnProperty, toString, Object.keys, etc.) on a @Sendable object.
     *            No crash, all workers complete, and results are consistent.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it('testStressInterfaces4Workers1000Rounds', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testStressInterfaces4Workers1000Rounds';
        console.info(`${caseName} start`);
        try {
          const ROUNDS: number = 1000;

          // Launch 4 concurrent workers, each running 1000 rounds of 16 builtins.
          let p1 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS));
          let p2 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS));
          let p3 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS));
          let p4 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS));

          let results = await Promise.all([p1, p2, p3, p4]);

          // No crash: all workers completed. Verify consistency: every worker
          // ran identical code so all checksums must be equal.
          let first: number = results[0] as number;
          expect(first > 0).assertTrue();
          console.info(`${caseName} worker checksums = [${results[0]}, ${results[1]}, ${results[2]}, ${results[3]}]`);
          expect(results[1] as number).assertEqual(first);
          expect(results[2] as number).assertEqual(first);
          expect(results[3] as number).assertEqual(first);
          console.info(`${caseName} consistent checksum across 4 workers: ${first}`);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testStressConcurrentReadSharedSendable
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0064
     * @tc.desc   Stability: 4 workers x 1000 rounds concurrent read of a single shared
     *            @Sendable object. No data races: all workers observe the same total.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it('testStressConcurrentReadSharedSendable', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testStressConcurrentReadSharedSendable';
        console.info(`${caseName} start`);
        try {
          const ROUNDS: number = 1000;
          const X: number = 10;
          const Y: number = 20;
          const EXPECTED_PER_WORKER: number = (X + Y) * ROUNDS;

          // One shared sendable object referenced by all concurrent workers.
          let shared: StressPoint = new StressPoint(X, Y);
          let p1 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS));
          let p2 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS));
          let p3 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS));
          let p4 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS));

          let results = await Promise.all([p1, p2, p3, p4]);

          // No data races: read-only access means every worker must observe the
          // identical total (X + Y) * ROUNDS.
          console.info(`${caseName} worker read sums = [${results[0]}, ${results[1]}, ${results[2]}, ${results[3]}]`);
          expect(results[0] as number).assertEqual(EXPECTED_PER_WORKER);
          expect(results[1] as number).assertEqual(EXPECTED_PER_WORKER);
          expect(results[2] as number).assertEqual(EXPECTED_PER_WORKER);
          expect(results[3] as number).assertEqual(EXPECTED_PER_WORKER);

          // Sanity: the shared object is unchanged after concurrent reads.
          expect(shared.x).assertEqual(X);
          expect(shared.y).assertEqual(Y);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });
  });
}
