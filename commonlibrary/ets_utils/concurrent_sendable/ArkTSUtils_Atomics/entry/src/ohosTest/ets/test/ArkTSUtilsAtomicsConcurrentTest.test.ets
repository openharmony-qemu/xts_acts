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

import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

const MATRIX_SIZE: number = 64;
const MATRIX_INNER_SIZE: number = 16;
const WORKER_COUNT: number = 4;
const MATRIX_STATE_LENGTH: number = 5;
const NEXT_ROW: number = 0;
const FINISHED_ROWS: number = 1;
const MATRIX_CHECKSUM: number = 2;
const MAX_ROW_SUM: number = 3;
const WORKER_MASK: number = 4;
const INT32_MIN: number = -2147483648;
const QUEUE_CAPACITY: number = 8;
const JOB_COUNT: number = 128;
const HASH_ROUNDS: number = 1024;
const TASK_TIMEOUT_MS: number = 8000;
const QUEUE_STATE_LENGTH: number = 7;
const WRITE_SEQUENCE: number = 0;
const READ_SEQUENCE: number = 1;
const DATA_EVENT: number = 2;
const QUEUE_CLOSED: number = 3;
const QUEUE_CANCELLED: number = 4;
const FINISHED_JOBS: number = 5;
const JOB_CHECKSUM: number = 6;

@Concurrent
async function matrixRowsTask(left: collections.Int32Array, right: collections.Int32Array,
  output: collections.Int32Array, state: collections.Int32Array, size: number, innerSize: number,
  workerId: number): Promise<number> {
  const nextRow: number = 0;
  const finishedRows: number = 1;
  const checksum: number = 2;
  const maxRowSum: number = 3;
  const workerMask: number = 4;
  let completed: number = 0;
  let row: number = workerId;
  while (row < size) {
    let rowSum: number = 0;
    for (let column: number = 0; column < size; column++) {
      let value: number = 0;
      for (let inner: number = 0; inner < innerSize; inner++) {
        value += left[row * innerSize + inner] * right[inner * size + column];
      }
      ArkTSUtils.Atomics.store(output, row * size + column, value);
      rowSum += value;
    }
    // Each unsuccessful CAS observes another row's update, so size + 1 attempts suffice.
    for (let attempt: number = 0; attempt <= size; attempt++) {
      const current: number = ArkTSUtils.Atomics.load(state, maxRowSum);
      if (rowSum <= current || ArkTSUtils.Atomics.compareExchange(state, maxRowSum, current, rowSum) === current) {
        break;
      }
      if (attempt === size) {
        return -1;
      }
    }
    ArkTSUtils.Atomics.add(state, checksum, rowSum);
    ArkTSUtils.Atomics.add(state, finishedRows, 1);
    completed++;
    row = ArkTSUtils.Atomics.add(state, nextRow, 1);
  }
  ArkTSUtils.Atomics.or(state, workerMask, 1 << workerId);
  return completed;
}

@Concurrent
async function consumeQueueTask(queue: collections.Int32Array, state: collections.Int32Array,
  results: collections.Int32Array, rounds: number, timeout: number): Promise<number> {
  const writeSequence: number = 0;
  const readSequence: number = 1;
  const dataEvent: number = 2;
  const closed: number = 3;
  const cancelled: number = 4;
  const finishedJobs: number = 5;
  const checksum: number = 6;
  const waitSlice: number = 20;
  const multiplier: number = 33;
  const hashMask: number = 0x7fffffff;
  const deadline: number = Date.now() + timeout;
  let processed: number = 0;
  while (Date.now() < deadline) {
    if (ArkTSUtils.Atomics.load(state, cancelled) !== 0) {
      return -1;
    }
    // Read the event before the predicates to avoid losing a publication or close notification.
    const version: number = ArkTSUtils.Atomics.load(state, dataEvent);
    const read: number = ArkTSUtils.Atomics.load(state, readSequence);
    if (read === ArkTSUtils.Atomics.load(state, writeSequence)) {
      if (ArkTSUtils.Atomics.load(state, closed) !== 0 &&
        read === ArkTSUtils.Atomics.load(state, writeSequence)) {
        return processed;
      }
      ArkTSUtils.Atomics.wait(state, dataEvent, version, waitSlice);
      continue;
    }
    const job: number = ArkTSUtils.Atomics.load(queue, read % queue.length);
    ArkTSUtils.Atomics.store(state, readSequence, read + 1);
    let hash: number = job + 1;
    for (let round: number = 0; round < rounds; round++) {
      hash = ((hash * multiplier) ^ round) & hashMask;
    }
    ArkTSUtils.Atomics.store(results, job, hash);
    ArkTSUtils.Atomics.xor(state, checksum, hash);
    ArkTSUtils.Atomics.add(state, finishedJobs, 1);
    processed++;
  }
  return -1;
}

function yieldProducer(): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 1);
  });
}

async function produceQueue(queue: collections.Int32Array, state: collections.Int32Array): Promise<number> {
  const deadline: number = Date.now() + TASK_TIMEOUT_MS;
  let job: number = 0;
  try {
    while (job < JOB_COUNT && Date.now() < deadline) {
      if (ArkTSUtils.Atomics.load(state, QUEUE_CANCELLED) !== 0) {
        return -1;
      }
      const write: number = ArkTSUtils.Atomics.load(state, WRITE_SEQUENCE);
      if (write - ArkTSUtils.Atomics.load(state, READ_SEQUENCE) >= queue.length) {
        await yieldProducer();
        continue;
      }
      ArkTSUtils.Atomics.store(queue, write % queue.length, job);
      ArkTSUtils.Atomics.store(state, WRITE_SEQUENCE, write + 1);
      ArkTSUtils.Atomics.add(state, DATA_EVENT, 1);
      ArkTSUtils.Atomics.notify(state, DATA_EVENT, 1);
      job++;
    }
    ArkTSUtils.Atomics.store(state, QUEUE_CLOSED, 1);
    ArkTSUtils.Atomics.add(state, DATA_EVENT, 1);
    ArkTSUtils.Atomics.notify(state, DATA_EVENT, 1);
    return job;
  } catch (error) {
    ArkTSUtils.Atomics.store(state, QUEUE_CANCELLED, 1);
    ArkTSUtils.Atomics.add(state, DATA_EVENT, 1);
    ArkTSUtils.Atomics.notify(state, DATA_EVENT, 1);
    throw new Error('Queue producer failed: ' + (error as Error).message);
  }
}

function fillMatrices(left: collections.Int32Array, right: collections.Int32Array): void {
  const leftModulus: number = 17;
  const leftOffset: number = 8;
  const rightModulus: number = 19;
  const rightOffset: number = 9;
  const rightMultiplier: number = 7;
  for (let index: number = 0; index < left.length; index++) {
    left[index] = index % leftModulus - leftOffset;
    right[index] = (index * rightMultiplier) % rightModulus - rightOffset;
  }
}

function verifyMatrix(left: collections.Int32Array, right: collections.Int32Array,
  output: collections.Int32Array, state: collections.Int32Array): void {
  let expectedChecksum: number = 0;
  let expectedMaximum: number = INT32_MIN;
  for (let row: number = 0; row < MATRIX_SIZE; row++) {
    let rowSum: number = 0;
    for (let column: number = 0; column < MATRIX_SIZE; column++) {
      let expected: number = 0;
      for (let inner: number = 0; inner < MATRIX_INNER_SIZE; inner++) {
        expected += left[row * MATRIX_INNER_SIZE + inner] * right[inner * MATRIX_SIZE + column];
      }
      expect(ArkTSUtils.Atomics.load(output, row * MATRIX_SIZE + column)).assertEqual(expected);
      rowSum += expected;
    }
    expectedChecksum += rowSum;
    expectedMaximum = Math.max(expectedMaximum, rowSum);
  }
  expect(ArkTSUtils.Atomics.load(state, MATRIX_CHECKSUM)).assertEqual(expectedChecksum);
  expect(ArkTSUtils.Atomics.load(state, MAX_ROW_SUM)).assertEqual(expectedMaximum);
}

function verifyQueue(state: collections.Int32Array, results: collections.Int32Array): void {
  const multiplier: number = 33;
  const hashMask: number = 0x7fffffff;
  let expectedChecksum: number = 0;
  for (let job: number = 0; job < JOB_COUNT; job++) {
    let expected: number = job + 1;
    for (let round: number = 0; round < HASH_ROUNDS; round++) {
      expected = ((expected * multiplier) ^ round) & hashMask;
    }
    expect(ArkTSUtils.Atomics.load(results, job)).assertEqual(expected);
    expectedChecksum ^= expected;
  }
  expect(ArkTSUtils.Atomics.load(state, WRITE_SEQUENCE)).assertEqual(JOB_COUNT);
  expect(ArkTSUtils.Atomics.load(state, READ_SEQUENCE)).assertEqual(JOB_COUNT);
  expect(ArkTSUtils.Atomics.load(state, FINISHED_JOBS)).assertEqual(JOB_COUNT);
  expect(ArkTSUtils.Atomics.load(state, JOB_CHECKSUM)).assertEqual(expectedChecksum);
}

export default function arkTSUtilsAtomicsConcurrentTest(): void {
  describe('ArkTSUtilsAtomicsConcurrentTest', (): void => {
    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_TASKPOOL_MATRIX0014_1400
     * @tc.name      testArkTSUtilsAtomicsTaskpoolMatrix0014
     * @tc.desc      Multiply 64x16 and 16x64 matrices with dynamic row scheduling and CAS maximum reduction.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsTaskpoolMatrix0014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const left: collections.Int32Array = new collections.Int32Array(MATRIX_SIZE * MATRIX_INNER_SIZE);
        const right: collections.Int32Array = new collections.Int32Array(left.length);
        const output: collections.Int32Array = new collections.Int32Array(MATRIX_SIZE * MATRIX_SIZE);
        const state: collections.Int32Array = new collections.Int32Array(MATRIX_STATE_LENGTH);
        fillMatrices(left, right);
        ArkTSUtils.Atomics.store(state, NEXT_ROW, WORKER_COUNT);
        ArkTSUtils.Atomics.store(state, MAX_ROW_SUM, INT32_MIN);
        const tasks: Promise<Object>[] = [];
        for (let worker: number = 0; worker < WORKER_COUNT; worker++) {
          tasks.push(taskpool.execute(matrixRowsTask, left, right, output, state,
            MATRIX_SIZE, MATRIX_INNER_SIZE, worker));
        }
        const counts: Object[] = await Promise.all(tasks);
        let totalRows: number = 0;
        for (let worker: number = 0; worker < counts.length; worker++) {
          expect((counts[worker] as number) > 0).assertTrue();
          totalRows += counts[worker] as number;
        }
        expect(totalRows).assertEqual(MATRIX_SIZE);
        expect(ArkTSUtils.Atomics.load(state, FINISHED_ROWS)).assertEqual(MATRIX_SIZE);
        expect(ArkTSUtils.Atomics.load(state, WORKER_MASK)).assertEqual((1 << WORKER_COUNT) - 1);
        verifyMatrix(left, right, output, state);
        done();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_TASKPOOL_BOUNDED_QUEUE0015_1500
     * @tc.name      testArkTSUtilsAtomicsTaskpoolBoundedQueue0015
     * @tc.desc      Process 128 jobs through an eight-slot queue with backpressure and wait/notify publication.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsTaskpoolBoundedQueue0015', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const queue: collections.Int32Array = new collections.Int32Array(QUEUE_CAPACITY);
        const state: collections.Int32Array = new collections.Int32Array(QUEUE_STATE_LENGTH);
        const results: collections.Int32Array = new collections.Int32Array(JOB_COUNT);
        results.fill(-1);
        try {
          const consumer: Promise<Object> = taskpool.execute(consumeQueueTask, queue, state, results,
            HASH_ROUNDS, TASK_TIMEOUT_MS);
          const counts: Object[] = await Promise.all([consumer, produceQueue(queue, state)]);
          expect(counts[0] as number).assertEqual(JOB_COUNT);
          expect(counts[1] as number).assertEqual(JOB_COUNT);
          verifyQueue(state, results);
        } finally {
          ArkTSUtils.Atomics.store(state, QUEUE_CANCELLED, 1);
          ArkTSUtils.Atomics.add(state, DATA_EVENT, 1);
          ArkTSUtils.Atomics.notify(state, DATA_EVENT, 1);
        }
        done();
      });
  });
}
