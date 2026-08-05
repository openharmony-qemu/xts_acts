'use static';
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

class ConnectionPool {
  connections: string[] = ['conn1', 'conn2', 'conn3', 'conn4', 'conn5'];
  activeCount: number = 0;
}

class DynamicPool {
  connections: string[] = ['conn1', 'conn2', 'conn3'];
  capacity: number = 3;
  expandCount: number = 0;
}

class TimeoutPool {
  connections: string[] = ['conn1', 'conn2'];
  acquired: number = 0;
  recycled: number = 0;
}

class HealthCheckPool {
  connections: string[] = ['conn1', 'conn2', 'conn3'];
  healthyCount: number = 0;
  checkCount: number = 0;
}

class MemoryPool {
  blocks: number[] = [0, 1, 2, 3, 4];
  allocated: number = 0;
  freed: number = 0;
}

class FragmentPool {
  blocks: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
  usedSlots: boolean[] = [true, false, true, false, true, false, true, false];
  defragCount: number = 0;
}

class PreallocPool {
  blocks: number[] = [];
  preallocSize: number = 10;
  usedCount: number = 0;
}

class MonitorPool {
  totalAlloc: number = 0;
  totalFree: number = 0;
  currentUsage: number = 0;
}

class TaskQueue {
  tasks: number[] = [];
  enqueued: number = 0;
  dequeued: number = 0;
}

class PriorityTaskQueue {
  highTasks: number[] = [];
  lowTasks: number[] = [];
  processed: number = 0;
}

class RejectQueue {
  tasks: number[] = [];
  capacity: number = 5;
  rejected: number = 0;
  accepted: number = 0;
}

class TimeoutTaskQueue {
  tasks: number[] = [];
  completed: number = 0;
  timedOut: number = 0;
}

function connAcquireReleaseTask(mutex: Mutex, pool: ConnectionPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.connections.length > 0) {
      let conn: string = pool.connections.pop() as string;
      pool.activeCount = pool.activeCount + 1;
      pool.connections.push(conn);
      pool.activeCount = pool.activeCount - 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function dynamicExpandTask(mutex: Mutex, pool: DynamicPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    pool.connections.push('conn_new_' + pool.expandCount.toString());
    if (pool.connections.length > pool.capacity) {
      pool.capacity = pool.capacity + 2;
      pool.expandCount = pool.expandCount + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function timeoutRecycleTask(mutex: Mutex, pool: TimeoutPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.connections.length > 0) {
      pool.acquired = pool.acquired + 1;
      pool.recycled = pool.recycled + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function healthCheckTask(mutex: Mutex, pool: HealthCheckPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    pool.healthyCount = pool.connections.length;
    pool.checkCount = pool.checkCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== ResourcePoolMemory task functions ====================
function memAllocTask(mutex: Mutex, pool: MemoryPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.blocks.length > 0) {
      pool.blocks.pop();
      pool.allocated = pool.allocated + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function memFreeTask(mutex: Mutex, pool: MemoryPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    pool.blocks.push(pool.allocated);
    pool.freed = pool.freed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function memDefragTask(mutex: Mutex, pool: FragmentPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    let compacted: boolean[] = [];
    let usedCount: number = 0;
    for (let i: int = 0; i < pool.usedSlots.length; i++) {
      if (pool.usedSlots[i]) {
        usedCount = usedCount + 1;
      }
    }
    for (let i: int = 0; i < usedCount; i++) {
      compacted.push(true);
    }
    for (let i: int = Double.toInt(usedCount); i < pool.usedSlots.length; i++) {
      compacted.push(false);
    }
    pool.usedSlots = compacted;
    pool.defragCount = pool.defragCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function memPreallocTask(mutex: Mutex, pool: PreallocPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.blocks.length < pool.preallocSize) {
      pool.blocks.push(pool.blocks.length);
      pool.usedCount = pool.usedCount + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function memMonitorTask(mutex: Mutex, pool: MonitorPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    pool.totalAlloc = pool.totalAlloc + 1;
    pool.currentUsage = pool.totalAlloc - pool.totalFree;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function memMonitorFreeTask(mutex: Mutex, pool: MonitorPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    pool.totalFree = pool.totalFree + 1;
    pool.currentUsage = pool.totalAlloc - pool.totalFree;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== ResourcePoolTask task functions ====================
function taskEnqueueTask(mutex: Mutex, queue: TaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    queue.tasks.push(Math.floor(Math.random() * 100));
    queue.enqueued = queue.enqueued + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function taskDequeueTask(mutex: Mutex, queue: TaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (queue.tasks.length > 0) {
      queue.tasks.shift();
      queue.dequeued = queue.dequeued + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function priorityHighEnqueueTask(mutex: Mutex, queue: PriorityTaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    queue.highTasks.push(Math.floor(Math.random() * 100));
    queue.processed = queue.processed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function priorityLowEnqueueTask(mutex: Mutex, queue: PriorityTaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    queue.lowTasks.push(Math.floor(Math.random() * 100));
    queue.processed = queue.processed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function taskSubmitRejectTask(mutex: Mutex, queue: RejectQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (queue.tasks.length < queue.capacity) {
      queue.tasks.push(Math.floor(Math.random() * 100));
      queue.accepted = queue.accepted + 1;
    } else {
      queue.rejected = queue.rejected + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function taskTimeoutProcessTask(mutex: Mutex, queue: TimeoutTaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (queue.tasks.length > 0) {
      queue.tasks.shift();
      queue.completed = queue.completed + 1;
    } else {
      queue.timedOut = queue.timedOut + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function taskTimeoutEnqueueTask(mutex: Mutex, queue: TimeoutTaskQueue, counter: AtomicInt): void {
  mutex.lock();
  try {
    queue.tasks.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

export default function LockDesignResourcePoolConnectionTest(): void {
  describe('LockDesignResourcePoolConnectionTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0100
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0100
     * @tc.desc    Verify connection acquire-release with 10 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignResourcePoolConnectionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const pool = new ConnectionPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t5 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t6 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t7 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t8 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t9 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      let t10 = taskpool.execute(new taskpool.Task(connAcquireReleaseTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]);
      expect(counter.load()).assertEqual(10);
      expect(pool.activeCount).assertEqual(0);
      expect(pool.connections.length).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0200
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0200
     * @tc.desc    Verify dynamic pool expansion with 4 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignResourcePoolConnectionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const pool = new DynamicPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(dynamicExpandTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4]);
      expect(counter.load()).assertEqual(4);
      expect(pool.connections.length).assertEqual(7);
      // Capacity grows 3 -> 5 -> 7, so expansion happens exactly twice.
      expect(pool.expandCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0300
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0300
     * @tc.desc    Verify acquire-recycle cycle with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const pool = new TimeoutPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(timeoutRecycleTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(timeoutRecycleTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(timeoutRecycleTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(timeoutRecycleTask, mutex, pool, counter));
      let t5 = taskpool.execute(new taskpool.Task(timeoutRecycleTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(pool.acquired).assertEqual(5);
      expect(pool.recycled).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0400
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0400
     * @tc.desc    Verify health check with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const pool = new HealthCheckPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(healthCheckTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(healthCheckTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(healthCheckTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(pool.healthyCount).assertEqual(3);
      expect(pool.checkCount).assertEqual(3);
    })
    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0500
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0500
     * @tc.desc    Verify memory alloc-free with 3 allocators and 2 freers using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignResourcePoolConnectionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const pool = new MemoryPool();
      const counter = new AtomicInt(0);
      let a1 = taskpool.execute(new taskpool.Task(memAllocTask, mutex, pool, counter));
      let a2 = taskpool.execute(new taskpool.Task(memAllocTask, mutex, pool, counter));
      let a3 = taskpool.execute(new taskpool.Task(memAllocTask, mutex, pool, counter));
      let f1 = taskpool.execute(new taskpool.Task(memFreeTask, mutex, pool, counter));
      let f2 = taskpool.execute(new taskpool.Task(memFreeTask, mutex, pool, counter));
      await Promise.all([a1, a2, a3, f1, f2]);
      expect(counter.load()).assertEqual(5);
      expect(pool.allocated).assertEqual(3);
      expect(pool.freed).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0600
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0600
     * @tc.desc    Verify memory defragmentation with 2 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const pool = new FragmentPool();
      const counter = new AtomicInt(0);
      let d1 = taskpool.execute(new taskpool.Task(memDefragTask, mutex, pool, counter));
      let d2 = taskpool.execute(new taskpool.Task(memDefragTask, mutex, pool, counter));
      await Promise.all([d1, d2]);
      expect(counter.load()).assertEqual(2);
      expect(pool.defragCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0700
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0700
     * @tc.desc    Verify memory pre-allocation with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const pool = new PreallocPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(memPreallocTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(memPreallocTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(memPreallocTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(memPreallocTask, mutex, pool, counter));
      let t5 = taskpool.execute(new taskpool.Task(memPreallocTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(pool.blocks.length).assertEqual(5);
      expect(pool.usedCount).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0800
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0800
     * @tc.desc    Verify memory monitor with 3 allocators and 2 freers tracking usage using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const pool = new MonitorPool();
      const counter = new AtomicInt(0);
      let a1 = taskpool.execute(new taskpool.Task(memMonitorTask, mutex, pool, counter));
      let a2 = taskpool.execute(new taskpool.Task(memMonitorTask, mutex, pool, counter));
      let a3 = taskpool.execute(new taskpool.Task(memMonitorTask, mutex, pool, counter));
      let f1 = taskpool.execute(new taskpool.Task(memMonitorFreeTask, mutex, pool, counter));
      let f2 = taskpool.execute(new taskpool.Task(memMonitorFreeTask, mutex, pool, counter));
      await Promise.all([a1, a2, a3, f1, f2]);
      expect(counter.load()).assertEqual(5);
      expect(pool.totalAlloc).assertEqual(3);
      expect(pool.totalFree).assertEqual(2);
      expect(pool.currentUsage).assertEqual(1);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest0900
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_0900
     * @tc.desc    Verify task enqueue-dequeue with 5 enqueuers and 5 dequeuers using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignResourcePoolConnectionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const queue = new TaskQueue();
      const counter = new AtomicInt(0);
      let e1 = taskpool.execute(new taskpool.Task(taskEnqueueTask, mutex, queue, counter));
      let e2 = taskpool.execute(new taskpool.Task(taskEnqueueTask, mutex, queue, counter));
      let e3 = taskpool.execute(new taskpool.Task(taskEnqueueTask, mutex, queue, counter));
      let e4 = taskpool.execute(new taskpool.Task(taskEnqueueTask, mutex, queue, counter));
      let e5 = taskpool.execute(new taskpool.Task(taskEnqueueTask, mutex, queue, counter));
      let d1 = taskpool.execute(new taskpool.Task(taskDequeueTask, mutex, queue, counter));
      let d2 = taskpool.execute(new taskpool.Task(taskDequeueTask, mutex, queue, counter));
      let d3 = taskpool.execute(new taskpool.Task(taskDequeueTask, mutex, queue, counter));
      let d4 = taskpool.execute(new taskpool.Task(taskDequeueTask, mutex, queue, counter));
      let d5 = taskpool.execute(new taskpool.Task(taskDequeueTask, mutex, queue, counter));
      await Promise.all([e1, e2, e3, e4, e5, d1, d2, d3, d4, d5]);
      expect(counter.load()).assertEqual(10);
      expect(queue.enqueued).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest1000
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_1000
     * @tc.desc    Verify priority task queue with 3 high and 2 low priority tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignResourcePoolConnectionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const queue = new PriorityTaskQueue();
      const counter = new AtomicInt(0);
      let h1 = taskpool.execute(new taskpool.Task(priorityHighEnqueueTask, mutex, queue, counter));
      let h2 = taskpool.execute(new taskpool.Task(priorityHighEnqueueTask, mutex, queue, counter));
      let h3 = taskpool.execute(new taskpool.Task(priorityHighEnqueueTask, mutex, queue, counter));
      let l1 = taskpool.execute(new taskpool.Task(priorityLowEnqueueTask, mutex, queue, counter));
      let l2 = taskpool.execute(new taskpool.Task(priorityLowEnqueueTask, mutex, queue, counter));
      await Promise.all([h1, h2, h3, l1, l2]);
      expect(counter.load()).assertEqual(5);
      expect(queue.highTasks.length).assertEqual(3);
      expect(queue.lowTasks.length).assertEqual(2);
      expect(queue.processed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest1100
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_1100
     * @tc.desc    Verify task rejection with 8 concurrent tasks exceeding capacity using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const queue = new RejectQueue();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t2 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t3 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t4 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t5 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t6 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t7 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      let t8 = taskpool.execute(new taskpool.Task(taskSubmitRejectTask, mutex, queue, counter));
      await Promise.all([t1, t2, t3, t4, t5, t6, t7, t8]);
      expect(counter.load()).assertEqual(8);
      // Serialized by the mutex: capacity 5 accepts the first 5 tasks and rejects the remaining 3.
      expect(queue.accepted).assertEqual(5);
      expect(queue.rejected).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignResourcePoolConnectionTest1200
     * @tc.number  SUB_LOCK_DESIGN_RESOURCE_POOL_CONNECTION_TEST_1200
     * @tc.desc    Verify enqueue then process phases with 3 producer and 3 consumer tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignResourcePoolConnectionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const queue = new TimeoutTaskQueue();
      const counter = new AtomicInt(0);
      let e1 = taskpool.execute(new taskpool.Task(taskTimeoutEnqueueTask, mutex, queue, counter));
      let e2 = taskpool.execute(new taskpool.Task(taskTimeoutEnqueueTask, mutex, queue, counter));
      let e3 = taskpool.execute(new taskpool.Task(taskTimeoutEnqueueTask, mutex, queue, counter));
      await Promise.all([e1, e2, e3]);
      let p1 = taskpool.execute(new taskpool.Task(taskTimeoutProcessTask, mutex, queue, counter));
      let p2 = taskpool.execute(new taskpool.Task(taskTimeoutProcessTask, mutex, queue, counter));
      let p3 = taskpool.execute(new taskpool.Task(taskTimeoutProcessTask, mutex, queue, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(6);
      expect(queue.completed).assertEqual(3);
    })
  })
}
