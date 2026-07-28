'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testNumberNoLock(holder: NumberHolder): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      holder.value = holder.value + 1;
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testNumberAtomic(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

function testNumberMutex(holder: NumberHolder, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      holder.value = holder.value + 1;
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

function testStringNoLock(holder: StringHolder): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      holder.value = holder.value + 'a';
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testStringMutex(holder: StringHolder, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      holder.value = holder.value + 'a';
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

function testBooleanNoLock(holder: BooleanHolder): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      holder.value = !holder.value;
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testBooleanAtomic(flag: AtomicBoolean): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      flag.exchange(!flag.load());
    } catch (e) {
      // 原子操作容忍
    }
  }
}

function testObjectNoLock(holder: ObjectHolder): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      holder.value = holder.value + 1;
      holder.name = holder.name + 'a';
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testObjectMutex(holder: ObjectHolder, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      holder.value = holder.value + 1;
      holder.name = holder.name + 'a';
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

function testNumberAtomicStress(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

class NumberHolder {
  value: number = 0;
}

class StringHolder {
  value: string = '';
}

class BooleanHolder {
  value: boolean = false;
}

class ObjectHolder {
  value: number = 0;
  name: string = '';
}

export default function BasicTypeConcurrentTest(): void {
  describe('BasicTypeConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_NUMBER_NOLOCK_0100
     * @tc.name   testNumberNoLockConcurrent0100
     * @tc.desc   CON-030 number无锁竞态并发递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let holder: NumberHolder = new NumberHolder();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testNumberNoLock, holder).then((): void => { count.fetchAdd(1); });
      }
      testNumberNoLock(holder);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_NUMBER_ATOMIC_0200
     * @tc.name   testNumberAtomicConcurrent0200
     * @tc.desc   CON-031 number AtomicInt保护并发递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberAtomicConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testNumberAtomic, counter, taskCounter).then((): void => { });
      }
      testNumberAtomic(counter, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_NUMBER_MUTEX_0300
     * @tc.name   testNumberMutexConcurrent0300
     * @tc.desc   CON-032 number Mutex保护并发递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberMutexConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let holder: NumberHolder = new NumberHolder();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testNumberMutex, holder, mutex, taskCounter).then((): void => { });
      }
      testNumberMutex(holder, mutex, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(holder.value).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_STRING_NOLOCK_0400
     * @tc.name   testStringNoLockConcurrent0400
     * @tc.desc   CON-033 string无锁竞态并发修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStringNoLockConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let holder: StringHolder = new StringHolder();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testStringNoLock, holder).then((): void => { count.fetchAdd(1); });
      }
      testStringNoLock(holder);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_STRING_MUTEX_0500
     * @tc.name   testStringMutexConcurrent0500
     * @tc.desc   CON-034 string Mutex保护并发修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStringMutexConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let holder: StringHolder = new StringHolder();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testStringMutex, holder, mutex, taskCounter).then((): void => { });
      }
      testStringMutex(holder, mutex, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(holder.value.length).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_BOOLEAN_NOLOCK_0600
     * @tc.name   testBooleanNoLockConcurrent0600
     * @tc.desc   CON-035 boolean无锁竞态并发修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBooleanNoLockConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let holder: BooleanHolder = new BooleanHolder();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testBooleanNoLock, holder).then((): void => { count.fetchAdd(1); });
      }
      testBooleanNoLock(holder);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_BOOLEAN_ATOMIC_0700
     * @tc.name   testBooleanAtomicConcurrent0700
     * @tc.desc   CON-036 boolean AtomicBool保护并发修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBooleanAtomicConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let flag: AtomicBoolean = new AtomicBoolean(false);
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testBooleanAtomic, flag).then((): void => { count.fetchAdd(1); });
      }
      testBooleanAtomic(flag);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_OBJECT_NOLOCK_0800
     * @tc.name   testObjectNoLockConcurrent0800
     * @tc.desc   CON-037 Object无锁竞态并发多字段属性修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectNoLockConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let holder: ObjectHolder = new ObjectHolder();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testObjectNoLock, holder).then((): void => { count.fetchAdd(1); });
      }
      testObjectNoLock(holder);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_OBJECT_MUTEX_0900
     * @tc.name   testObjectMutexConcurrent0900
     * @tc.desc   CON-038 Object Mutex保护并发多字段属性修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectMutexConcurrent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let holder: ObjectHolder = new ObjectHolder();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testObjectMutex, holder, mutex, taskCounter).then((): void => { });
      }
      testObjectMutex(holder, mutex, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(holder.value).assertEqual(totalTasks * 10 + 10);
      expect(holder.name.length).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_BASICTYPE_NUMBER_ATOMIC_STRESS_1000
     * @tc.name   testNumberAtomicStressConcurrent1000
     * @tc.desc   CON-039 number 100线程AtomicInt并发递增压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberAtomicStressConcurrent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testNumberAtomicStress, counter, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 100) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks * 100);
    });
  });
}
