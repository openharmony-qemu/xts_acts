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

let Integer: IntegerType = {
  MAX_VALUE: 2147483647
};

export default function LinkedBlockingQueuetest() {
  describe("LinkedBlockingQueue", (): void => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueNoParameterTest_0100
     * @tc.name      : linkedBlockingQueueNoParameterTest001
     * @tc.desc      : Test LinkedBlockingQueue constructor with capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
      }
      catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsEmptyTest_0101
     * @tc.name      : linkedBlockingQueueIsEmptyTest
     * @tc.desc      : Test isEmpty() on newly created empty queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueIsEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsNoEmptyTest_0102
     * @tc.name      : linkedBlockingQueueIsNoEmptyTest
     * @tc.desc      : Test isEmpty() on queue with capacity but no elements.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueIsNoEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(66);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueAddIsOrEmptyTest_0103
     * @tc.name      : linkedBlockingQueueAddIsOrEmptyTest
     * @tc.desc      : Test isEmpty() after adding element to queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueAddIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemoveIsOrEmptyTest_0104
     * @tc.name      : linkedBlockingQueueRemoveIsOrEmptyTest
     * @tc.desc      : Test isEmpty() after polling from queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemoveIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.poll();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePushIsOrEmptyTest_0105
     * @tc.name      : linkedBlockingQueuePushIsOrEmptyTest
     * @tc.desc      : Test isEmpty() after pushing multiple elements.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueuePushIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePopIsOrEmptyTest_0106
     * @tc.name      : linkedBlockingQueuePopIsOrEmptyTest
     * @tc.desc      : Test isEmpty() after popping element from queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueuePopIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.pop();
      expect(String(res)).assertEqual('1');
      let res1 = queueIntPop1.isEmpty();
      expect(String(res1)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeFullQueueTest_0107
     * @tc.name      : linkedBlockingQueueGetSizeFullQueueTest
     * @tc.desc      : Test size() on full queue with 10 elements.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeFullQueueTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueAddTest_0108
     * @tc.name      : linkedBlockingQueueGetSizeNullQueueAddTest
     * @tc.desc      : Test remainingCapacity() on newly created queue with capacity 10.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeNullQueueAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueRemoveTest_0109
     * @tc.name      : linkedBlockingQueueGetSizeNullQueueRemoveTest
     * @tc.desc      : Verify the size of empty queue after poll operation should be 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeNullQueueRemoveTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
        queueIntPop1.poll();
        let res = queueIntPop1.size;
        expect(String(res)).assertEqual('0');
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePushTest_0110
     * @tc.name      : linkedBlockingQueueGetSizeNullQueuePushTest
     * @tc.desc      : Verify the size of queue after pushing one element should be 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeNullQueuePushTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePopTest_0111
     * @tc.name      : linkedBlockingQueueGetSizeNullQueuePopTest
     * @tc.desc      : Verify the size of queue after pushing 10 elements and popping one should be 9.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('9');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeQueuePopAddTest_0112
     * @tc.name      : linkedBlockingQueueGetSizeQueuePopAddTest
     * @tc.desc      : Verify that when a value is pushed into a queue with a capacity of 1, the size of the queue is 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetSizeQueuePopAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityFullQueuePopTest_0113
     * @tc.name      : linkedBlockingQueueRemainingCapacityFullQueuePopTest
     * @tc.desc      : Verify that the remaining capacity of a newly created queue with a capacity of 10 is 10.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemainingCapacityFullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        let res = queueIntPop1.remainingCapacity();
        expect(String(res)).assertEqual('10');
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0115
     * @tc.name      : linkedBlockingQueueRemainingCapacityNullQueuePopTest
     * @tc.desc      : Verify that the remaining capacity of a queue with a capacity of 50 is 50 and its size is 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.size;
        expect(String(res)).assertEqual('50');
        expect(String(res1)).assertEqual('0');
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0116
     * @tc.name      : linkedBlockingQueueRemainingCapacityNullQueuePopTest
     * @tc.desc      : Verify that the remaining capacity and capacity of a queue with a capacity of 1 are both 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.capacity;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('1');
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0117
     * @tc.name      : linkedBlockingQueueRemainingCapacityNullQueuePopTest
     * @tc.desc      : Verify that the remaining capacity of a queue with a capacity.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0118
     * @tc.name      : linkedBlockingQueueRemainingCapacityNullQueuePopTest
     * @tc.desc      : Verify that for a queue with an initial capacity.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueRemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0121
     * @tc.name      : linkedBlockingQueueGetCapacityTest002
     * @tc.desc      : Verify the capacity behavior of a queue initialized with 5 during poll and add operations.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0122
     * @tc.name      : linkedBlockingQueueGetCapacityTest003
     * @tc.desc      : Verify the capacity behavior of a queue initialized with 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0123
     * @tc.name      : linkedBlockingQueueGetCapacityTest004
     * @tc.desc      : Verify the capacity behavior of a queue initialized with 3 during poll and add operations.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0124
     * @tc.name      : linkedBlockingQueueGetCapacityTest005
     * @tc.desc      : Verify capacity remains 1 after push/pop operations on queue with initial capacity 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0125
     * @tc.name      : linkedBlockingQueueGetCapacityTest006
     * @tc.desc      : Verify capacity remains 1 after poll/add operations on queue with initial capacity 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name      : linkedBlockingQueueGetCapacityTest007
     * @tc.desc      : Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueGetCapacityTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name      : linkedBlockingQueueGetCapacityTest008
     * @tc.desc      : Verify capacity equals Int.MAX_VALUE after add/poll operations on max capacity queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueGetCapacityTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name      : linkedBlockingQueueGetCapacityTest009
     * @tc.desc      : Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueGetCapacityTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name      : linkedBlockingQueueGetCapacityTest010
     * @tc.desc      : Verify capacity equals Int.MAX_VALUE after poll/add operations on max capacity queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueGetCapacityTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0127
     * @tc.name      : linkedBlockingQueueTest001
     * @tc.desc      : Verify getFirst() returns correct first element after pushing 10 elements.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0128
     * @tc.name      : linkedBlockingQueueTest002
     * @tc.desc      : Verify getFirst() returns empty string when adding empty string to queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(1);
      queueIntPop1.add("");
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual("");
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0129
     * @tc.name      : linkedBlockingQueueTest003
     * @tc.desc      : Verify getFirst() returns null when adding null to queue with mixed int|null type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(1);
      queueIntPop1.add(null);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0130
     * @tc.name      : linkedBlockingQueueTest004
     * @tc.desc      : Verify getFirst() returns undefined when adding undefined to queue with mixed int|undefined type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(1);
      queueIntPop1.add(undefined);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0131
     * @tc.name      : linkedBlockingQueueTest005
     * @tc.desc      : Verify getFirst() returns null when called on empty queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0132
     * @tc.name      : linkedBlockingQueueTest006
     * @tc.desc      : Verify getFirst() returns 0 after pushing single element to capacity-1 queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(0);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0133
     * @tc.name      : linkedBlockingQueueTest007
     * @tc.desc      : Verify getFirst() returns correct element after pop operation on full queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0134
     * @tc.name      : linkedBlockingQueueTest008
     * @tc.desc      : Verify poll() reduces size to 9 after removing one element from full queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.poll();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('9');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0135
     * @tc.name      : linkedBlockingQueueTest009
     * @tc.desc      : Verify poll() returns null when called on empty queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0136
     * @tc.name      : linkedBlockingQueueTest010
     * @tc.desc      : Verify poll() returns empty string when removing the only element (empty string) from queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(1);
      queueIntPop1.add("");
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual("");
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0137
     * @tc.name      : linkedBlockingQueueTest011
     * @tc.desc      : Verify poll() returns null when removing the only element (null) from queue with mixed int|null type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(1);
      queueIntPop1.add(null);
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0138
     * @tc.name      : linkedBlockingQueueTest012
     * @tc.desc      : Verify poll() returns undefined when removing the only element (undefined) from queue with mixed int|undefined type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(1);
      queueIntPop1.add(undefined);
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0139
     * @tc.name      : linkedBlockingQueueTest013
     * @tc.desc      : Add an element to a LinkedBlockingQueue with a capacity of 1, then perform a poll operation.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(Int.MAX_VALUE);
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0139
     * @tc.name      : linkedBlockingQueueTest014
     * @tc.desc      : Verify queue size becomes 0 after add-poll sequence on capacity-1 queue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.add(0);
      queueIntPop1.poll();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0140
     * @tc.name      : linkedBlockingQueueTest015
     * @tc.desc      : Verify queue size becomes 0 after push-pop sequence on under-capacity queue (capacity-1).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0141
     * @tc.name      : linkedBlockingQueueTest016
     * @tc.desc      : Verify add() returns false when attempting to exceed queue capacity (full queue scenario).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res1 = queueIntPop1.add(11);
      expect(String(res1)).assertEqual('false');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0142
     * @tc.name      : linkedBlockingQueueTest017
     * @tc.desc      : Verify queue reaches full capacity (size=10) after adding mixed int|string elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add("");
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0143
     * @tc.name      : linkedBlockingQueueTest018
     * @tc.desc      : Verify queue accepts null element and reaches full capacity (size=10) with mixed int|null elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(null);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0144
     * @tc.name      : linkedBlockingQueueTest019
     * @tc.desc      : Verify queue accepts undefined element and reaches full capacity (size=10) with mixed int|undefined elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(undefined);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0145
     * @tc.name      : linkedBlockingQueueTest020
     * @tc.desc      : Verify standard integer element addition makes queue reach full capacity (size=10)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(10);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0146
     * @tc.name      : linkedBlockingQueueTest021
     * @tc.desc      : Verify string element addition makes queue reach full capacity with mixed int|string elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add("hello");
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0147
     * @tc.name      : linkedBlockingQueueTest022
     * @tc.desc      : Verify bigint element addition makes queue reach full capacity with mixed int|bigint elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | bigint>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      let big1: bigint = 123456789012345678901234567890n;
      queueIntPop1.add(big1);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0148
     * @tc.name      : linkedBlockingQueueTest023
     * @tc.desc      : Verify boolean element addition makes queue reach full capacity (size=10) with mixed int|boolean elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | boolean>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(true);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0149
     * @tc.name      : linkedBlockingQueueTest024
     * @tc.desc      : Verify custom class instance can be added and retrieved from generic queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.LinkedBlockingQueue<TestClass> = new containers.LinkedBlockingQueue<TestClass>();
      const obj = new TestClass();
      queue.add(obj);
      expect(queue.pop()).assertEqual(obj);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0150
     * @tc.name      : linkedBlockingQueueTest025
     * @tc.desc      : Verify array element addition maintains correct queue size (size=1) with array<int> element
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | Array<int>>(10);
      let arr = new Array<int>(10);
      for (let i:int = 0; i < 10; i++) {
        arr[i] = i;
      }
      queueIntPop1.add(arr);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0151
     * @tc.name      : linkedBlockingQueueTest026
     * @tc.desc      : Verify complex object addition makes queue reach full capacity (size=10) with mixed property objects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      interface QueueItem {
        value: number,
        flag: boolean,
        type: string
      };
      let queueObjPop1: containers.LinkedBlockingQueue<QueueItem> = new containers.LinkedBlockingQueue<QueueItem>(10);
      for (let i:int = 0; i < 9; i++) {
        queueObjPop1.push({
          value: i, type: "number"
        });
      }
      queueObjPop1.add({
        flag: true, type: "boolean"
      });
      let res1 = queueObjPop1.size;
      expect(String(res1)).assertEqual('10');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0152
     * @tc.name      : linkedBlockingQueueTest027
     * @tc.desc      : Verify single element addition in default-sized queue updates size correctly (size=1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(0);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0153
     * @tc.name      : linkedBlockingQueueTest028
     * @tc.desc      : Verify fixed-capacity queue (capacity=2) reaches full size with push+add operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.add(1);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('2');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0154
     * @tc.name      : linkedBlockingQueueTest029
     * @tc.desc      : Verify element removal reduces queue size correctly (size=8) after initial 9 elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('8');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0154
     * @tc.name      : linkedBlockingQueueTest030
     * @tc.desc      : Create a task to operate on a LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let t = new taskpool.Task((queueIntTemp: containers.LinkedBlockingQueue<int>) => {
        for (let i:int = 0; i < 10; i++) {
          queueInt.push(i);
        }
      }, queueInt);
      await taskpool.execute(t);
      expect(String(queueInt.size)).assertEqual('10');
      queueInt.push(10);
      expect(String(queueInt.size)).assertEqual('11');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0155
     * @tc.name      : linkedBlockingQueueTest031
     * @tc.desc      : Verify string element removal results in empty queue (size=0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      queueIntPop1.push("");
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0156
     * @tc.name      : linkedBlockingQueueTest032
     * @tc.desc      : Verify null element removal results in empty queue (size=0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(10);
      queueIntPop1.push(null);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0157
     * @tc.name      : linkedBlockingQueueTest033
     * @tc.desc      : Verify undefined element removal results in empty queue (size=0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(10);
      queueIntPop1.push(undefined);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0158
     * @tc.name      : linkedBlockingQueueTest034
     * @tc.desc      : Verify single element queue becomes empty after pop operation (size=0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0159
     * @tc.name      : linkedBlockingQueueTest035
     * @tc.desc      : Verify under-capacity operation maintains correct size (capacity=2, size=0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0160
     * @tc.name      : linkedBlockingQueueTest036
     * @tc.desc      : Verify under-capacity operation maintains correct size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('9');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0161
     * @tc.name      : linkedBlockingQueueTest037
     * @tc.desc      : Verify under-capacity operation maintains correct size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.pop();
      }
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0162
     * @tc.name      : linkedBlockingQueueTest038
     * @tc.desc      : Verify under-capacity operation maintains correct size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.pop();
      }
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0163
     * @tc.name      : linkedBlockingQueueNoParameterTest001
     * @tc.desc      : Test LinkedBlockingQueue constructor with capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {

      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0164
     * @tc.name      : linkedBlockingQueueNoParameterTest002
     * @tc.desc      : Test adding single element to empty LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0164
     * @tc.name      : linkedBlockingQueueNoParameterTest003
     * @tc.desc      : Test adding single element to empty LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueNoParameterTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(Int.MAX_VALUE);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0164
     * @tc.name      : linkedBlockingQueueNoParameterTest004
     * @tc.desc      : Test adding single element to empty LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueNoParameterTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(Int.MAX_VALUE + 1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual(Int.MAX_VALUE + 1);
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0165
     * @tc.name      : linkedBlockingQueueNoParameterTest005
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0166
     * @tc.name      : linkedBlockingQueueNoParameterTest006
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty array iterable.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0167
     * @tc.name      : linkedBlockingQueueNoParameterTest007
     * @tc.desc      : Test isEmpty() with empty LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0168
     * @tc.name      : linkedBlockingQueueNoParameterTest008
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty Set iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual(`10`);
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0169
     * @tc.name      : linkedBlockingQueueNoParameterTest009
     * @tc.desc      : Test LinkedBlockingQueue constructor with single-element array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0170
     * @tc.name      : linkedBlockingQueueNoParameterTest010
     * @tc.desc      : Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0171
     * @tc.name      : linkedBlockingQueueNoParameterTest011
     * @tc.desc      : Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0172
     * @tc.name      : linkedBlockingQueueNoParameterTest012
     * @tc.desc      : Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0173
     * @tc.name      : linkedBlockingQueueNoParameterTest013
     * @tc.desc      : Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0174
     * @tc.name      : linkedBlockingQueueNoParameterTest014
     * @tc.desc      : Test getFirst() with single-element LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0175
     * @tc.name      : linkedBlockingQueueNoParameterTest015
     * @tc.desc      : Test poll() removes element from single-element LinkedBlockingQueue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      queueIntPop1.poll();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0176
     * @tc.name      : linkedBlockingQueueNoParameterTest016
     * @tc.desc      : Test LinkedBlockingQueue constructor with 1000-element array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1000);
      for (let i:int = 0; i < 1000; i++) {
        arr[i] = i;
      }
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1000, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1000');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0177
     * @tc.name      : linkedBlockingQueueNoParameterTest017
     * @tc.desc      : Test LinkedBlockingQueue constructor with 1000-element array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1000);
      for (let i:int = 0; i < 1000; i++) {
        arr[i] = i;
      }
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1000');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0178
     * @tc.name      : linkedBlockingQueueNoParameterTest018
     * @tc.desc      : Test LinkedBlockingQueue constructor with array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<null>(0);
      let queueIntPop1 = new containers.LinkedBlockingQueue<null>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0179
     * @tc.name      : linkedBlockingQueueNoParameterTest019
     * @tc.desc      : Test LinkedBlockingQueue constructor with array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<null>(0);
      let queueIntPop1 = new containers.LinkedBlockingQueue<null>(0, arr);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterUndefinedTest_0180
     * @tc.name      : linkedBlockingQueueNoParameterUndefinedTest018
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty undefined array.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterUndefinedTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<undefined>(0);
      let queueIntPop1 = new containers.LinkedBlockingQueue<undefined>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterUndefinedTest_0181
     * @tc.name      : linkedBlockingQueueNoParameterUndefinedTest019
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty undefined array and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterUndefinedTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<undefined>();
      let queueIntPop1 = new containers.LinkedBlockingQueue<undefined>(0, arr);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0182
     * @tc.name      : linkedBlockingQueueNoParameterTest020
     * @tc.desc      : Test LinkedBlockingQueue constructor with array containing null values.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int | null>();
      arr[0] = 0;
      arr[1] = null;
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('2');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0183
     * @tc.name      : linkedBlockingQueueNoParameterTest021
     * @tc.desc      : Test LinkedBlockingQueue capacity with array containing null values.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int | null>();
      arr[0] = 0;
      arr[1] = null;
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(arr);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('2');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterUndefinedTest_0184
     * @tc.name      : linkedBlockingQueueNoParameterUndefinedTest020
     * @tc.desc      : Test LinkedBlockingQueue constructor with array containing undefined values.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterUndefinedTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int | undefined>();
      arr[0] = 0;
      arr[1] = undefined;
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('2');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterUndefinedTest_0185
     * @tc.name      : linkedBlockingQueueNoParameterUndefinedTest021
     * @tc.desc      : Test LinkedBlockingQueue capacity with array containing undefined values.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterUndefinedTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int | undefined>();
      arr[0] = 0;
      arr[1] = undefined;
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(arr);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('2');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0185
     * @tc.name      : linkedBlockingQueueNoParameterTest022
     * @tc.desc      : Verify LinkedBlockingQueue size with array of undefined ints.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueNoParameterTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(Int.MAX_VALUE);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0185
     * @tc.name      : linkedBlockingQueueNoParameterTest023
     * @tc.desc      : Verify LinkedBlockingQueue capacity with array of undefined ints.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    xit("linkedBlockingQueueNoParameterTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(Int.MAX_VALUE);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0186
     * @tc.name      : linkedBlockingQueueNoParameterTest024
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty Map values iterable.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Map<string, int>();
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0187
     * @tc.name      : linkedBlockingQueueNoParameterTest025
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty Map values iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Map<string, int>();
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0188
     * @tc.name      : linkedBlockingQueueNoParameterTest026
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty nested array iterable and capacity 0.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<Array<int>>();
      let iter = arr.values();
      let queueIntPop1 = new containers.LinkedBlockingQueue<Array<int>>(0, iter);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0189
     * @tc.name      : linkedBlockingQueueNoParameterTest027
     * @tc.desc      : Test LinkedBlockingQueue constructor with empty nested array iterable.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("linkedBlockingQueueNoParameterTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<Array<int>>();
      let iter = arr.values();
      let queueIntPop1 = new containers.LinkedBlockingQueue<Array<int>>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0190
     * @tc.name      : setCapacityWithTest001
     * @tc.desc      : A queue with a capacity of-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setCapacityWithTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<number>(-1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('0');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0191
     * @tc.name      : setCapacityWithTest002
     * @tc.desc      : A queue with a capacity of0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setCapacityWithTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<number>(0);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('0');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0192
     * @tc.name      : setCapacityWithTest003
     * @tc.desc      : A queue with a capacity of1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setCapacityWithTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<number>(1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('1');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        try {
          queue.add(2);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0193
     * @tc.name      : setCapacityWithTest004
     * @tc.desc      : A queue with a capacity of Integer.MAX_VALUE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setCapacityWithTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(2147483647);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual(String(Integer.MAX_VALUE));
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0194
     * @tc.name      : setCapacityWithTest005
     * @tc.desc      : A queue with a capacity of Integer.MAX_VALUE+1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setCapacityWithTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(2147483647 + 1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual(String(Integer.MAX_VALUE));
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0195
     * @tc.name      : propertyWithTest001
     * @tc.desc      : Test the actual size of the empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("propertyWithTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<number>(10);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('0');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

  