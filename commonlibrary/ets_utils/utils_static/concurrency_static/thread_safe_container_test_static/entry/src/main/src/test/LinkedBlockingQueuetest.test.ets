import { describe, it, xit, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let domain: number = 0x0000;
let tag: string = 'testTag';

class TestClass {
}

function createAddTask(queueTemp: containers.LinkedBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, v: int) => {
    queue.add(v);
  }, queueTemp, data);
}

function createPushTask(queueTemp: containers.LinkedBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, v: int) => {
    queue.push(v);
  }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = 0; i < s; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = s; i < s + 10; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = 0; i < s; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPollTask(queueTemp: containers.LinkedBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>) => {
    queue.poll();
  }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.poll();
    }
  }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.add(i);
    }
  }, queueTemp, start);
}

function createPopTask(queueTemp: containers.LinkedBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>) => {
    queue.pop();
  }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createLinkedBlockingQueueFromIterTask(iterTemp: IterableIterator<int>): taskpool.Task {
  return new taskpool.Task(async (iter: IterableIterator<int>): Promise<containers.LinkedBlockingQueue<int>> => {
    return new containers.LinkedBlockingQueue<int>(iter)
  }, iterTemp);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: int = 10;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: int = 100;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: int = 2;

class CustomClass1 {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

interface IntegerType {
  MAX_VALUE: number
}

interface QueueItem {
  value?: number,
  flag?: boolean,
  type: string
};

interface objectValueType {
  key: string;
}

let Integer: IntegerType = {
  MAX_VALUE: 2147483647
};

export default function LinkedBlockingQueuetest() {
  describe("linked_Blocking_Queue_", (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueNoParameterTest_0100
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_001
     * @tc.desc Test LinkedBlockingQueue constructor with capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
      }
      catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsEmptyTest_0101
     * @tc.name linked_Blocking_Queue_IsEmptyTest
     * @tc.desc Test isEmpty() on newly created empty queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_IsEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsNoEmptyTest_0102
     * @tc.name linked_Blocking_Queue_IsNoEmptyTest
     * @tc.desc Test isEmpty() on queue with capacity but no elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_IsNoEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(66);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueAddIsOrEmptyTest_0103
     * @tc.name linked_Blocking_Queue_AddIsOrEmptyTest
     * @tc.desc Test isEmpty() after adding element to queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AddIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemoveIsOrEmptyTest_0104
     * @tc.name linked_Blocking_Queue_RemoveIsOrEmptyTest
     * @tc.desc Test isEmpty() after polling from queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemoveIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.poll();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePushIsOrEmptyTest_0105
     * @tc.name linked_Blocking_Queue_PushIsOrEmptyTest
     * @tc.desc Test isEmpty() after pushing multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PushIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePopIsOrEmptyTest_0106
     * @tc.name linked_Blocking_Queue_PopIsOrEmptyTest
     * @tc.desc Test isEmpty() after popping element from queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PopIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.pop();
      expect(String(res)).assertEqual('1');
      let res1 = queueIntPop1.isEmpty();
      expect(String(res1)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeFullQueueTest_0107
     * @tc.name linked_Blocking_Queue_GetSizeFullQueueTest
     * @tc.desc Test size() on full queue with 10 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeFullQueueTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueAddTest_0108
     * @tc.name linked_Blocking_Queue_GetSizeNullQueueAddTest
     * @tc.desc Test remainingCapacity() on newly created queue with capacity 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueueAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueRemoveTest_0109
     * @tc.name linked_Blocking_Queue_GetSizeNullQueueRemoveTest
     * @tc.desc Verify the size of empty queue after poll operation should be 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueueRemoveTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
        queueIntPop1.poll();
        let res = queueIntPop1.size;
        expect(String(res)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePushTest_0110
     * @tc.name linked_Blocking_Queue_GetSizeNullQueuePushTest
     * @tc.desc Verify the size of queue after pushing one element should be 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueuePushTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePopTest_0111
     * @tc.name linked_Blocking_Queue_GetSizeNullQueuePopTest
     * @tc.desc Verify the size of queue after pushing 10 elements and popping one should be 9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('9');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeQueuePopAddTest_0112
     * @tc.name linked_Blocking_Queue_GetSizeQueuePopAddTest
     * @tc.desc Verify that when a value is pushed into a queue with a capacity of 1, the size of the queue is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeQueuePopAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityFullQueuePopTest_0113
     * @tc.name linked_Blocking_Queue_RemainingCapacityFullQueuePopTest
     * @tc.desc Verify that the remaining capacity of a newly created queue with a capacity of 10 is 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityFullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        let res = queueIntPop1.remainingCapacity();
        expect(String(res)).assertEqual('10');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0115
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest
     * @tc.desc Verify that the remaining capacity of a queue with a capacity of 50 is 50 and its size is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.size;
        expect(String(res)).assertEqual('50');
        expect(String(res1)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0116
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest001
     * @tc.desc Verify that the remaining capacity and capacity of a queue with a capacity of 1 are both 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.capacity;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('1');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0117
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest01
     * @tc.desc Verify that the remaining capacity of a queue with a capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.size;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('0');
        queueIntPop1.poll();
        expect(String(queueIntPop1.size)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0118
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest0001
     * @tc.desc Verify that for a queue with an initial capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
        for (let i:int = 0; i < 2; i++) {
          queueIntPop1.push(i);
        }
        queueIntPop1.pop();
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.capacity;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('2');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0121
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_002
     * @tc.desc Verify the capacity behavior of a queue initialized with 5 during poll and add operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('5');
      queueIntPop1.poll();
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('5');
      queueIntPop1.add(0);
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('5');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0122
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_003
     * @tc.desc Verify the capacity behavior of a queue initialized with 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('1');
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1');
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0123
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_004
     * @tc.desc Verify the capacity behavior of a queue initialized with 3 during poll and add operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('3');
      queueIntPop1.poll();
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('3');
      queueIntPop1.add(0);
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('3');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0124
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_005
     * @tc.desc Verify capacity remains 1 after push/pop operations on queue with initial capacity 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('1');
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1');
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0125
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_006
     * @tc.desc Verify capacity remains 1 after poll/add operations on queue with initial capacity 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('1');
      queueIntPop1.poll();
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1');
      queueIntPop1.add(1);
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_00126
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_007
     * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0001260
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_008
     * @tc.desc Verify capacity equals Int.MAX_VALUE after add/poll operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);

      queueIntPop1.poll();
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);

      queueIntPop1.add(1);
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_009
     * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);

      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);

      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_000126
     * @tc.name linkedBlockingQueueGetCapacityTest_000126
     * @tc.desc Verify capacity equals Int.MAX_VALUE after poll/add operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linkedBlockingQueueGetCapacityTest_000126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);

      queueIntPop1.poll();
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);

      queueIntPop1.add(1);
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0127
     * @tc.name linked_Blocking_Queue_Test_static_001
     * @tc.desc Verify getFirst() returns correct first element after pushing 10 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })
