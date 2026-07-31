'use static'
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util';

class ProducerConsumerQueue {
  items: number[] = [];
}

class RingBuffer {
  buffer: number[] = [];
  writePos: number = 0;
  readPos: number = 0;
  capacity: number = 10;
}

class MultiQueueData {
  queueA: number[] = [];
  queueB: number[] = [];
}

class PriorityQueueData {
  highItems: number[] = [];
  lowItems: number[] = [];
}

class BlockingQueueData {
  items: number[] = [];
  produced: number = 0;
  consumed: number = 0;
  capacity: number = 5;
}

class LockFreeQueueData {
  items: number[] = [];
  counter: number = 0;
}

class DynamicQueueData {
  items: number[] = [];
  capacity: number = 5;
}

class PersistQueueData {
  items: number[] = [];
  persisted: number[] = [];
}

// TC_DESIGN_001: Producer task for producer-consumer queue
function pcProducerTask(mutex: Mutex, queue: ProducerConsumerQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    queue.items.push(Math.floor(Math.random() * 1000));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_001: Consumer task for producer-consumer queue
function pcConsumerTask(mutex: Mutex, queue: ProducerConsumerQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (queue.items.length > 0) {
      queue.items.shift();
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_002: Producer task for ring buffer
function ringProducerTask(mutex: Mutex, rb: RingBuffer, counter: AtomicInt): void {
  mutex.lock();
  try {
    let idx: int = Double.toInt(rb.writePos % rb.capacity);
    if (rb.buffer.length <= idx) {
      rb.buffer.push(Math.floor(Math.random() * 1000));
    } else {
      rb.buffer[idx] = Math.floor(Math.random() * 1000);
    }
    rb.writePos = rb.writePos + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_002: Consumer task for ring buffer
function ringConsumerTask(mutex: Mutex, rb: RingBuffer, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (rb.readPos < rb.writePos) {
      let idx: int = Double.toInt(rb.readPos % rb.capacity);
      let val: number = rb.buffer[idx];
      rb.readPos = rb.readPos + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_003: Task for multi-queue concurrent operation on queue A
function multiQueueTaskA(mutex: Mutex, data: MultiQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.queueA.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_003: Task for multi-queue concurrent operation on queue B
function multiQueueTaskB(mutex: Mutex, data: MultiQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.queueB.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_004: High priority task for priority queue
function priorityHighTask(mutex: Mutex, data: PriorityQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.highItems.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_004: Low priority task for priority queue
function priorityLowTask(mutex: Mutex, data: PriorityQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.lowItems.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_005: Blocking producer task
function blockingProducerTask(mutex: Mutex, data: BlockingQueueData, counter: AtomicInt): void {
  for (let i: number = 0; i < 3; i++) {
    mutex.lock();
    try {
      if (data.items.length < data.capacity) {
        data.items.push(i);
        data.produced = data.produced + 1;
        counter.fetchAdd(1);
      }
    } finally {
      mutex.unlock();
    }
  }
}

// TC_DESIGN_005: Blocking consumer task
function blockingConsumerTask(mutex: Mutex, data: BlockingQueueData, counter: AtomicInt): void {
  for (let i: number = 0; i < 3; i++) {
    mutex.lock();
    try {
      if (data.items.length > 0) {
        data.items.shift();
        data.consumed = data.consumed + 1;
        counter.fetchAdd(1);
      }
    } finally {
      mutex.unlock();
    }
  }
}

// TC_DESIGN_006: Mutex queue task for lock-free comparison
function mutexQueueTask(mutex: Mutex, data: LockFreeQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.items.push(Math.floor(Math.random() * 100));
    data.counter = data.counter + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_007: Dynamic queue expansion task
function dynamicExpandTask(mutex: Mutex, data: DynamicQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.items.push(Math.floor(Math.random() * 100));
    if (data.items.length > data.capacity) {
      data.capacity = data.capacity * 2;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_008: Queue persistence producer task
function persistProducerTask(mutex: Mutex, data: PersistQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    let val: number = Math.floor(Math.random() * 100);
    data.items.push(val);
    data.persisted.push(val);
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC_DESIGN_008: Queue persistence consumer task
function persistConsumerTask(mutex: Mutex, data: PersistQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (data.items.length > 0) {
      data.items.shift();
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

export default function LockDesignProducerConsumerTest(): void {
  describe('LockDesignProducerConsumerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0100
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0100
     * @tc.desc    Verify producer-consumer queue with 5 producers and 5 consumers concurrent access using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignProducerConsumerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const queue = new ProducerConsumerQueue();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(pcProducerTask, mutex, queue, counter));
      let p2 = taskpool.execute(new taskpool.Task(pcProducerTask, mutex, queue, counter));
      let p3 = taskpool.execute(new taskpool.Task(pcProducerTask, mutex, queue, counter));
      let p4 = taskpool.execute(new taskpool.Task(pcProducerTask, mutex, queue, counter));
      let p5 = taskpool.execute(new taskpool.Task(pcProducerTask, mutex, queue, counter));
      let c1 = taskpool.execute(new taskpool.Task(pcConsumerTask, mutex, queue, counter));
      let c2 = taskpool.execute(new taskpool.Task(pcConsumerTask, mutex, queue, counter));
      let c3 = taskpool.execute(new taskpool.Task(pcConsumerTask, mutex, queue, counter));
      let c4 = taskpool.execute(new taskpool.Task(pcConsumerTask, mutex, queue, counter));
      let c5 = taskpool.execute(new taskpool.Task(pcConsumerTask, mutex, queue, counter));
      await Promise.all([p1, p2, p3, p4, p5, c1, c2, c3, c4, c5]);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0200
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0200
     * @tc.desc    Verify ring buffer with producers writing and consumers reading using Mutex protection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignProducerConsumerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const rb = new RingBuffer();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(ringProducerTask, mutex, rb, counter));
      let p2 = taskpool.execute(new taskpool.Task(ringProducerTask, mutex, rb, counter));
      let p3 = taskpool.execute(new taskpool.Task(ringProducerTask, mutex, rb, counter));
      let p4 = taskpool.execute(new taskpool.Task(ringProducerTask, mutex, rb, counter));
      let p5 = taskpool.execute(new taskpool.Task(ringProducerTask, mutex, rb, counter));
      let c1 = taskpool.execute(new taskpool.Task(ringConsumerTask, mutex, rb, counter));
      let c2 = taskpool.execute(new taskpool.Task(ringConsumerTask, mutex, rb, counter));
      let c3 = taskpool.execute(new taskpool.Task(ringConsumerTask, mutex, rb, counter));
      let c4 = taskpool.execute(new taskpool.Task(ringConsumerTask, mutex, rb, counter));
      let c5 = taskpool.execute(new taskpool.Task(ringConsumerTask, mutex, rb, counter));
      await Promise.all([p1, p2, p3, p4, p5, c1, c2, c3, c4, c5]);
      expect(counter.load()).assertEqual(10);
      expect(rb.writePos).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0300
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0300
     * @tc.desc    Verify multiple independent queues concurrent operation with a shared Mutex lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignProducerConsumerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new MultiQueueData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(multiQueueTaskA, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(multiQueueTaskA, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(multiQueueTaskA, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(multiQueueTaskB, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(multiQueueTaskB, mutex, data, counter));
      let t6 = taskpool.execute(new taskpool.Task(multiQueueTaskB, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5, t6]);
      expect(counter.load()).assertEqual(6);
      expect(data.queueA.length).assertEqual(3);
      expect(data.queueB.length).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0400
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0400
     * @tc.desc    Verify priority queue with high and low priority tasks using Mutex lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignProducerConsumerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new PriorityQueueData();
      const counter = new AtomicInt(0);
      let h1 = taskpool.execute(new taskpool.Task(priorityHighTask, mutex, data, counter));
      let h2 = taskpool.execute(new taskpool.Task(priorityHighTask, mutex, data, counter));
      let h3 = taskpool.execute(new taskpool.Task(priorityHighTask, mutex, data, counter));
      let l1 = taskpool.execute(new taskpool.Task(priorityLowTask, mutex, data, counter));
      let l2 = taskpool.execute(new taskpool.Task(priorityLowTask, mutex, data, counter));
      await Promise.all([h1, h2, h3, l1, l2]);
      expect(counter.load()).assertEqual(5);
      expect(data.highItems.length).assertEqual(3);
      expect(data.lowItems.length).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0500
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0500
     * @tc.desc    Verify blocking queue with capacity limit where producers skip when full and consumers skip when empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignProducerConsumerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new BlockingQueueData();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(blockingProducerTask, mutex, data, counter));
      let p2 = taskpool.execute(new taskpool.Task(blockingProducerTask, mutex, data, counter));
      let c1 = taskpool.execute(new taskpool.Task(blockingConsumerTask, mutex, data, counter));
      let c2 = taskpool.execute(new taskpool.Task(blockingConsumerTask, mutex, data, counter));
      await Promise.all([p1, p2, c1, c2]);
      expect(data.produced + data.consumed).assertLarger(0);
      expect(data.produced + data.consumed).assertLessOrEqual(12);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0600
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0600
     * @tc.desc    Verify Mutex-based queue correctness with 10 concurrent tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignProducerConsumerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new LockFreeQueueData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t6 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t7 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t8 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t9 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      let t10 = taskpool.execute(new taskpool.Task(mutexQueueTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]);
      expect(counter.load()).assertEqual(10);
      expect(data.items.length).assertEqual(10);
      expect(data.counter).assertEqual(10);
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0700
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0700
     * @tc.desc    Verify dynamic queue capacity adjustment with concurrent producers expanding queue size
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignProducerConsumerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new DynamicQueueData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t6 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t7 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      let t8 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5, t6, t7, t8]);
      expect(counter.load()).assertEqual(8);
      expect(data.items.length).assertEqual(8);
      expect(data.capacity >= 8).assertTrue();
    })

    /**
     * @tc.name    LockDesignProducerConsumerTest0800
     * @tc.number  SUB_LOCK_DESIGN_PRODUCER_CONSUMER_TEST_0800
     * @tc.desc    Verify queue persistence with producers writing to both queue and persisted storage under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignProducerConsumerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new PersistQueueData();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(persistProducerTask, mutex, data, counter));
      let p2 = taskpool.execute(new taskpool.Task(persistProducerTask, mutex, data, counter));
      let p3 = taskpool.execute(new taskpool.Task(persistProducerTask, mutex, data, counter));
      let p4 = taskpool.execute(new taskpool.Task(persistProducerTask, mutex, data, counter));
      let p5 = taskpool.execute(new taskpool.Task(persistProducerTask, mutex, data, counter));
      let c1 = taskpool.execute(new taskpool.Task(persistConsumerTask, mutex, data, counter));
      let c2 = taskpool.execute(new taskpool.Task(persistConsumerTask, mutex, data, counter));
      let c3 = taskpool.execute(new taskpool.Task(persistConsumerTask, mutex, data, counter));
      await Promise.all([p1, p2, p3, p4, p5, c1, c2, c3]);
      expect(counter.load()).assertEqual(8);
      expect(data.persisted.length).assertEqual(5);
    })
  })
}
