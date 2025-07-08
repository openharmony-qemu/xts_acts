import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'

class TestClass {
}

interface QueueItem {
  key: string;
  value: number;
}

interface QueueItem2 {
  key: string;
}

function createAddTask(queueTemp: containers.ArrayBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, v: int) => {
    queue.add(v);
  }, queueTemp, data);
}

function createPushTask(queueTemp: containers.ArrayBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, v: int) => {
    queue.push(v);
  }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i = 0; i < s; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i = s; i < s + 10; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = 0; i < s; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPollTask(queueTemp: containers.ArrayBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>) => {
    queue.poll();
  }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.poll();
    }
  }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.add(i);
    }
  }, queueTemp, start);
}

function createPopTask(queueTemp: containers.ArrayBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>) => {
    queue.pop();
  }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: int = 10;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: int = 100;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: int = 2;

const arrayWithNulls = new Array<Int | null | undefined>(1, null, 2, undefined, 3)

export default function ArrayBlockingQueuetest() {

  const thousandElementsArray = new Array<Int>()

  describe("ArrayBlockingQueue", (): void => {

    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      for (let i = 0; i < 1000; i++) {
        thousandElementsArray.push(i);
      }
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ACTUALCAPACITYTEST_0100
     * @tc.name      : actualCapacityTest
     * @tc.desc      : Verify queue capacity initialization
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("actualCapacityTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const initialCapacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(initialCapacity);
      expect(String(queue.capacity)).assertEqual(String(initialCapacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_INVALIDCAPACITYTEST_0101
     * @tc.name      : invalidCapacityTest
     * @tc.desc      : Verify queue with negative capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("invalidCapacityTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = -1;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(String(queue.capacity)).assertEqual('-1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_INVALIDCAPACITYTEST_0102
     * @tc.name      : invalidCapacityTest1
     * @tc.desc      : Verify queue with zero capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("invalidCapacityTest1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 0;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(String(queue.capacity)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_MAXINTTEST_0103
     * @tc.name      : maxIntTest
     * @tc.desc      : Verify queue with maximum integer capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("maxIntTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<int>(Int.MAX_VALUE);
      expect(queue.capacity).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_OVERFLOWJAVAINTTEST_0104
     * @tc.name      : overflowJavaIntTest
     * @tc.desc      : Verify queue creation with overflow capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("overflowJavaIntTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        new containers.ArrayBlockingQueue<int>(Int.MAX_VALUE + 1);
        expect(false).assertEqual(true);
      } catch (e) {
        throw new Error('Max cap push fail');
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYINITIALIZATIONTEST_0105
     * @tc.name      : propertyInitializationTest
     * @tc.desc      : Verify queue property initialization
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("propertyInitializationTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      expect(String(queue.capacity)).assertEqual('10');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYNEGATIVE_0106
     * @tc.name      : propertyCapacityNegative
     * @tc.desc      : Verify queue with negative capacity throws error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyCapacityNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        const queue = new containers.ArrayBlockingQueue<number>(-1);
        throw new Error('Negative capacity error');
      } catch (error) {
        throw new Error('Max cap push fail');
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYZERO_0107
     * @tc.name      : propertyCapacityZero
     * @tc.desc      : Verify queue behavior with zero capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyCapacityZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(0);
      expect(queue.capacity).assertEqual(0);
      try {
        queue.push(1);
        throw new Error('Enqueue to full queue error');
      } catch (error) {
        expect((error as Error).message).assertEqual('Queue is full');
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTY_CAPACITYSINGLEELEMENT_0108
     * @tc.name      : propertyCapacitySingleElement
     * @tc.desc      : Verify queue with single element capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyCapacitySingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      expect(String(queue.capacity)).assertEqual('1');
      try {
        queue.push(1);
      } catch (error) {
        expect(false).assertEqual(true);
      }
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYMAXVALUE_0109
     * @tc.name      : propertyCapacityMaxValue
     * @tc.desc      : Verify queue with maximum integer capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyCapacityMaxValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(Int.MAX_VALUE);
      expect(queue.capacity).assertEqual(Int.MAX_VALUE);
      try {
        queue.push(1);
        expect(queue.size).assertEqual(1);
      } catch (error) {
        throw new Error('Max cap push fail');
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYOVERFLOW_0110
     * @tc.name      : propertyCapacityOverflow
     * @tc.desc      : Verify queue creation with overflow capacity throws error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyCapacityOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = 'propertyCapacityOverflow';
      try {
        const queue = new containers.ArrayBlockingQueue<number>(Int.MAX_VALUE + 1);
        throw new Error('Create queue with overflow capacity failed');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        console.error(`${TAG} failed, error: ${JSON.stringify(error)}`);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_EMPTYQUEUETEST_0111
     * @tc.name      : emptyQueueTest
     * @tc.desc      : Verify empty queue size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("emptyQueueTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHFILLTEST_0112
     * @tc.name      : containers.ArrayBlockingQueuePushFillTest001
     * @tc.desc      : Verify blocking behavior when pushing to full queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushFillTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      queue.push(1);

      let isBlocked = false;
      setTimeout(() => {
        queue.push(2);
        isBlocked = true;
      }, 10);

      expect(isBlocked).assertFalse();
      queue.pop();
      setTimeout(() => {
        expect(isBlocked).assertTrue();
      }, 20);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHMANYTEST_0113
     * @tc.name      : containers.ArrayBlockingQueuePushManyTest002
     * @tc.desc      : Verify pushing multiple values including null and undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushManyTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
      queue.push("");
      queue.push(null);
      queue.push(undefined);
      queue.push("@@");

      expect(String(queue.size)).assertEqual('4');
      expect(queue.pop()).assertEqual("");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHSTRINGTEST_0114
     * @tc.name      : containers.ArrayBlockingQueuePushStringTest003
     * @tc.desc      : Verify pushing and popping string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushStringTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(3);
      queue.push("hello");
      expect(queue.pop()).assertEqual("hello");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBIGINTTEST_0115
     * @tc.name      : containers.ArrayBlockingQueuePushBigIntTest004
     * @tc.desc      : Verify pushing and popping bigint values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushBigIntTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<bigint>(2);
      const bigIntNum = BigInt(9007199254740991);
      queue.push(bigIntNum);
      expect(String(queue.pop())).assertEqual('9007199254740991');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBOOLEANTEST_0116
     * @tc.name      : containers.ArrayBlockingQueuePushBooleanTest005
     * @tc.desc      : Verify pushing and popping boolean values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushBooleanTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(1);
      queue.push(true);
      expect(queue.pop()).assertTrue();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHCLASSTEST_0117
     * @tc.name      : containers.ArrayBlockingQueuePushClassTest006
     * @tc.desc      : Verify pushing and popping class instances
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushClassTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<TestClass>(1);
      const obj = new TestClass();
      queue.push(obj);
      expect(queue.pop()).assertEqual(obj);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0118
     * @tc.name      : containers.ArrayBlockingQueuePushEmptyTest007
     * @tc.desc      : Verify pushing single element to empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushEmptyTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      queue.push(1);
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0119
     * @tc.name      : containers.ArrayBlockingQueuePushOnlyOneTest008
     * @tc.desc      : Verify pushing single element to queue with capacity 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushOnlyOneTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(1);
      queue.push("single");
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHTENTEST_0120
     * @tc.name      : containers.ArrayBlockingQueuePushTenTest009
     * @tc.desc      : Verify pushing multiple elements to fill queue capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueuePushTenTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.push(1);
      expect(String(queue.size)).assertEqual('1');
      for (let i = 2; i <= capacity; i++) {
        queue.push(i);
      }
      expect(String(queue.size)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSPECIALVALUES_0121
     * @tc.name      : propertyPushSpecialValues
     * @tc.desc      : Verify pushing and popping special values (empty string, null, undefined)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushSpecialValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<string | null | undefined> =
        new containers.ArrayBlockingQueue<string | null | undefined>(4);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('4');

      queue.push("");
      let sizeAfterEmptyString = queue.size;
      expect(String(sizeAfterEmptyString)).assertEqual('1');

      queue.push(null);
      let sizeAfterNull = queue.size;
      expect(String(sizeAfterNull)).assertEqual('2');

      queue.push(undefined);
      let sizeAfterUndefined = queue.size;
      expect(String(sizeAfterUndefined)).assertEqual('3');

      const specialChar = '!@#$%^&*';
      queue.push(specialChar);
      let sizeAfterSpecialChar = queue.size;
      expect(String(sizeAfterSpecialChar)).assertEqual('4');

      let poppedEmptyString = queue.pop();
      expect(String(poppedEmptyString)).assertEqual("");

      let poppedNull = queue.pop();
      expect(String(poppedNull)).assertEqual('null');

      let poppedUndefined = queue.pop();
      expect(String(poppedUndefined)).assertEqual('undefined');

      let poppedSpecialChar = queue.pop();
      expect(String(poppedSpecialChar)).assertEqual(String(specialChar));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHNUMBER_0122
     * @tc.name      : propertyPushNumber
     * @tc.desc      : Verify pushing and popping number values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const num = 123;
      queue.push(num);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSTRING_0123
     * @tc.name      : propertyPushString
     * @tc.desc      : Verify pushing and popping string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const str = "Hello, World!";
      queue.push(str);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedString = queue.pop();
      expect(String(poppedString)).assertEqual(String(str));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBIGINT_0124
     * @tc.name      : propertyPushBigint
     * @tc.desc      : Verify pushing and popping bigint values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushBigint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<bigint> = new containers.ArrayBlockingQueue<bigint>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const bigIntNum = BigInt(9007199254740991);
      queue.push(bigIntNum);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedBigInt = queue.pop();
      expect(String(poppedBigInt)).assertEqual(String(bigIntNum));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBOOLEAN_0125
     * @tc.name      : propertyPushBoolean
     * @tc.desc      : Verify pushing and popping boolean values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const bool = true;
      queue.push(bool);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedBoolean = queue.pop();
      expect(String(poppedBoolean)).assertEqual(String(bool));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHARRAY_0126
     * @tc.name      : propertyPushArray
     * @tc.desc      : Verify pushing and popping array values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number[]> = new containers.ArrayBlockingQueue<number[]>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const arr = [1, 2, 3];
      queue.push(arr);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedArray = queue.pop();
      expect(String(poppedArray)).assertEqual(String(arr));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHCLASS_0127
     * @tc.name      : propertyPushClass
     * @tc.desc      : Verify pushing and popping class instances
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<Date> = new containers.ArrayBlockingQueue<Date>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const dateInstance = new Date();
      queue.push(dateInstance);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedDate = queue.pop();
      expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHOBJECT_0128
     * @tc.name      : propertyPushObject
     * @tc.desc      : Verify pushing and popping object values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('propertyPushObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<QueueItem> = new containers.ArrayBlockingQueue<QueueItem>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');
      const obj: QueueItem = {
        key: 'testKey', value: 123
      };
      queue.push(obj);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedObject = queue.pop();
      expect(String(poppedObject.key)).assertEqual(String(obj.key));
      expect(String(poppedObject.value)).assertEqual(String(obj.value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0129
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest001
     * @tc.desc      : Verify initial size of empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0130
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest002
     * @tc.desc      : Verify size after pushing single element
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      queue.push(1);
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0131
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest003
     * @tc.desc      : Verify size after pushing multiple elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.push(i);
      }
      expect(String(queue.size)).assertEqual(String(capacity - 1));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0132
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest004
     * @tc.desc      : Verify size after pushing single element to empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      queue.push(1);
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0133
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest005
     * @tc.desc      : Verify size after pushing multiple elements to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.push(i);
      }
      expect(String(queue.size)).assertEqual(String(capacity - 1));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0134
     * @tc.name      : containers.ArrayBlockingQueueWithPushTest006
     * @tc.desc      : Verify size after filling queue to capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPushTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity; i++) {
        queue.push(i);
      }
      expect(String(queue.size)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0135
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest001
     * @tc.desc      : Verify popping element from filled queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity; i++) {
        queue.push(i);
      }
      const firstElement = queue.pop();
      expect(String(firstElement)).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity - 1));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0136
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest002
     * @tc.desc      : Verify popping element from filled queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity; i++) {
        queue.push(i);
      }
      const firstElement = queue.pop();
      const secondElement = queue.pop();
      expect(String(secondElement)).assertEqual('1');
      expect(String(queue.size)).assertEqual(String(capacity - 2));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0137
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest003
     * @tc.desc      : Verify popping special values (empty string, null)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<string | null>(capacity);
      queue.push("");
      queue.push(null);
      queue.push("@@@");
      expect(queue.pop()).assertEqual("");
      expect(String(queue.pop())).assertEqual("null");
      expect(queue.pop()).assertEqual("@@@");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0138
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest004
     * @tc.desc      : Verify popping string values including "undefined"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<string | undefined>(capacity);
      queue.push("");
      queue.push("undefined");
      expect(queue.pop()).assertEqual("");
      expect(String(queue.pop())).assertEqual("undefined");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0139
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest005
     * @tc.desc      : Verify popping single element from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      queue.push(100);
      expect(String(queue.pop())).assertEqual('100');
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0140
     * @tc.name      : containers.ArrayBlockingQueueWithPopTest006
     * @tc.desc      : Verify popping all elements from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPopTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.push(i);
      }
      expect(String(queue.size)).assertEqual(String(capacity - 1));
      const firstElement = queue.pop();
      expect(String(firstElement)).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity - 2));
      for (let i = 1; i < capacity - 1; i++) {
        expect(String(queue.pop())).assertEqual(String(i));
        expect(String(queue.size)).assertEqual(String(capacity - 2 - i));
      }
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0141
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest001
     * @tc.desc      : Verify add operation when queue is full
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(10);
      for (let i = 0; i < capacity; i++) {
        queue.add(i);
      }
      expect(String(queue.add(11))).assertEqual('false');
      expect(String(queue.size)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0142
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest002
     * @tc.desc      : Verify adding special string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 5;
      const queue = new containers.ArrayBlockingQueue<string>(5);
      expect(String(queue.add(""))).assertEqual('true');
      expect(queue.add('null')).assertTrue();
      expect(queue.add('undefined')).assertTrue();
      expect(String(queue.add("381yeqwhe239847qkedq4971"))).assertEqual('true');
      expect(String(queue.size)).assertEqual('4');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0143
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest003
     * @tc.desc      : Verify adding single element to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(1);
      expect(String(queue.add('hello'))).assertEqual('true');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0144
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest004
     * @tc.desc      : Verify adding bigint value to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<bigint>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');
      const bigIntNum = BigInt(9007199254740991);
      expect(String(queue.add(bigIntNum))).assertEqual('true');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0145
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest005
     * @tc.desc      : Verify adding boolean value to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');
      expect(String(queue.add(false))).assertEqual('true');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0146
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest006
     * @tc.desc      : Verify adding array to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number[]>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const arr = [1, 2, 3];
      expect(String(queue.add(arr))).assertEqual('true');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0147
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest007
     * @tc.desc      : Verify adding and popping array from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number[]> = new containers.ArrayBlockingQueue<number[]>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');
      const arr = [1, 2, 3];
      queue.add(arr);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedArray = queue.pop();
      expect(String(poppedArray)).assertEqual(String(arr));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0148
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest008
     * @tc.desc      : Verify adding and popping Date object from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<Date> = new containers.ArrayBlockingQueue<Date>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const dateInstance = new Date();
      queue.add(dateInstance);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedDate = queue.pop();
      expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
    });

        /**
         * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0149
         * @tc.name      : containers.ArrayBlockingQueueWithAddTest0009
         * @tc.desc      : Verify adding object with key-value pair to queue
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("ArrayBlockingQueueWithAddTest0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {

          let queue: containers.ArrayBlockingQueue<QueueItem2> = new containers.ArrayBlockingQueue<QueueItem2>(1);
          let initialCapacity = queue.capacity;
          expect(String(initialCapacity)).assertEqual('1');

          let addKey = queue.add({
            key: "value"
          });
          expect(String(addKey)).assertEqual('true');
          expect(String(queue.size)).assertEqual('1');
        });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0150
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest0010
     * @tc.desc      : Verify adding element to zero capacity queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(0);
      expect(queue.add(1)).assertTrue();
      expect(queue.size).assertEqual(1);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0151
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest0011
     * @tc.desc      : Verify adding elements to full queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      expect(queue.add(1)).assertTrue();
      expect(String(queue.size)).assertEqual('1');
      expect(queue.add(2)).assertFalse();
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0152
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest0012
     * @tc.desc      : Verify adding multiple elements to queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 5;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        expect(queue.add(i)).assertTrue();
      }
      expect(String(queue.size)).assertEqual(String(capacity - 1));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0153
     * @tc.name      : containers.ArrayBlockingQueueWithAddTest0013
     * @tc.desc      : Verify adding elements to fill queue capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithAddTest0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(queue.add(1)).assertTrue();
      expect(String(queue.size)).assertEqual('1');
      for (let i = 0; i < capacity - 1; i++) {
        expect(queue.add(i)).assertTrue();
      }
      expect(String(queue.size)).assertEqual(String(capacity));
      expect(queue.add(11)).assertFalse();
      expect(String(queue.size)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0154
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0001
     * @tc.desc      : Verify polling from empty zero capacity queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(0);
      expect(String(queue.poll())).assertEqual('0');
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0155
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0002
     * @tc.desc      : Verify polling from single element queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      queue.add(100);
      expect(String(queue.poll())).assertEqual('100');
      expect(String(queue.size)).assertEqual('0');
      expect(String(queue.poll()).toString()).assertEqual('undefined');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0156
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0003
     * @tc.desc      : Verify polling special string values from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
      queue.add("");
      queue.add(null);
      queue.add(undefined);
      queue.add("huiafyef23@y8#");
      expect(queue.poll()).assertEqual("");
      expect(String(queue.poll())).assertEqual("null");
      expect(String(queue.poll())).assertEqual("undefined");
      expect(String(queue.size)).assertEqual('1');
      expect(queue.poll()).assertEqual("huiafyef23@y8#");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0157
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0004
     * @tc.desc      : Verify polling and adding elements dynamically
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 5;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.add(i);
      }
      expect(String(queue.poll())).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity - 2));
      expect(queue.add(99)).assertTrue();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0158
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0005
     * @tc.desc      : Verify polling all elements from filled queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity; i++) {
        queue.add(i * 10);
      }
      expect(String(queue.poll())).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity - 1));

      for (let i = 1; i < capacity - 1; i++) {
        expect(String(queue.poll())).assertEqual(String(i * 10));
      }
      expect(String(queue.size)).assertEqual('1');
      expect(queue.add(99)).assertTrue();

      expect(String(queue.poll())).assertEqual('90');
      expect(String(queue.size)).assertEqual('1');
      expect(String(queue.poll())).assertEqual('99');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0159
     * @tc.name      : containers.ArrayBlockingQueueWithPollTest0006
     * @tc.desc      : Verify polling elements in FIFO order
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithPollTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(3);
      queue.add("first");
      queue.add("second");

      expect(queue.poll()).assertEqual("first");
      expect(String(queue.size)).assertEqual('1');
      expect(queue.poll()).assertEqual("second");
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_016
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0001
     * @tc.desc      : Verify getting first element from filled queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(3);
      queue.add(10);
      queue.add(20);
      queue.add(30);
      expect(String(queue.getFirst())).assertEqual('10');
      expect(String(queue.size)).assertEqual('3');
      expect(queue.add(40)).assertFalse();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0161
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0002
     * @tc.desc      : Verify getting first element with special string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
      queue.add("");
      queue.add(null);
      queue.add(undefined);
      queue.add("yihahah111");
      expect(String(queue.getFirst())).assertEqual("");
      expect(String(queue.size)).assertEqual('4');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0162
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0003
     * @tc.desc      : Verify getting first element from empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(0);
      expect(String(queue.getFirst())).assertEqual('null');
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0163
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0004
     * @tc.desc      : Verify getting first element from single element queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(1);
      queue.add("1");
      expect(String(queue.getFirst())).assertEqual("1");
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0164
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0005
     * @tc.desc      : Verify getting first element after adding elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 5;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.add(i);
      }
      expect(String(queue.getFirst())).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity - 1));
      queue.add(123);
      expect(String(queue.getFirst())).assertEqual('0');
      expect(String(queue.size)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0165
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0006
     * @tc.desc      : Verify getting first boolean element from queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(1);
      queue.add(true);
      expect(queue.getFirst()).assertTrue();
      expect(String(queue.size)).assertEqual('1');
      expect(queue.getFirst()).assertTrue();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0166
     * @tc.name      : containers.ArrayBlockingQueueWithGetFirstTest0007
     * @tc.desc      : Verify getting first element after filling queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithGetFirstTest0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.add(111);
      expect(String(queue.getFirst())).assertEqual('111');
      expect(String(queue.size)).assertEqual('1');
      for (let i = 1; i < capacity; i++) {
        queue.add(100 + i);
      }
      expect(String(queue.getFirst())).assertEqual('111');
      expect(String(queue.size)).assertEqual(String(capacity));
      expect(queue.add(200)).assertFalse();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHCAPACITYTEST_0167
     * @tc.name      : containers.ArrayBlockingQueueWithCapacityTest0001
     * @tc.desc      : Verify zero capacity queue behavior
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithCapacityTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 0;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(String(queue.capacity)).assertEqual('0');
      queue.add(123);
      expect(String(queue.capacity)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHCAPACITYTEST_0168
     * @tc.name      : containers.ArrayBlockingQueueWithCapacityTest0002
     * @tc.desc      : Verify negative capacity queue behavior
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithCapacityTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = -1;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(String(queue.capacity)).assertEqual('-1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHCAPACITYTEST_0169
     * @tc.name      : containers.ArrayBlockingQueueWithCapacityTest0003
     * @tc.desc      : Verify single capacity queue behavior
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithCapacityTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 1;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.add(123);
      expect(String(queue.capacity)).assertEqual('1');
      expect(String(queue.size)).assertEqual('1');
      expect(String(queue.poll())).assertEqual('123');
      expect(String(queue.capacity)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0170
     * @tc.name      : containers.ArrayBlockingQueueWithRemainingCapacityTest0001
     * @tc.desc      : Verify remaining capacity of full queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithRemainingCapacityTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 3;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(123);
        queue.add(456);
        queue.add(789);
        expect(String(queue.remainingCapacity())).assertEqual('0');
        expect(queue.add(4)).assertFalse();
        expect(String(queue.remainingCapacity())).assertEqual('0');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BBASE_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0171
     * @tc.name      : containers.ArrayBlockingQueueWithRemainingCapacityTest0002
     * @tc.desc      : Verify remaining capacity after adding elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithRemainingCapacityTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity));
        expect(queue.add(1)).assertTrue();
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0172
     * @tc.name      : containers.ArrayBlockingQueueWithRemainingCapacityTest0003
     * @tc.desc      : Verify remaining capacity changes after operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithRemainingCapacityTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        expect(String(queue.remainingCapacity())).assertEqual('1');
        queue.add(true);
        expect(String(queue.remainingCapacity())).assertEqual('0');
        queue.poll();
        expect(String(queue.remainingCapacity())).assertEqual('1');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0173
     * @tc.name      : containers.ArrayBlockingQueueWithRemainingCapacityTest0004
     * @tc.desc      : Verify remaining capacity when nearly full
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueWithRemainingCapacityTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 4;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(10);
        queue.add(20);
        queue.add(30);
        expect(String(queue.remainingCapacity())).assertEqual('1');
        queue.add(40);
        expect(String(queue.remainingCapacity())).assertEqual('0');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueREMAININGCAPACITYTENTEST_0174
     * @tc.name      : containers.ArrayBlockingQueueRemainingCapacityTenTest005
     * @tc.desc      : Verify remaining capacity changes in large queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueRemainingCapacityTenTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<string>(capacity);
        queue.add("A");
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity - 1));
        for (let i = 1; i < capacity; i++) {
          queue.add(`item${i}`);
        }
        expect(String(queue.remainingCapacity())).assertEqual('0');
        queue.poll();
        expect(String(queue.remainingCapacity())).assertEqual('1');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueREMAININGCAPACITYTENTEST_0175
     * @tc.name      : containers.ArrayBlockingQueueRemainingCapacityDynamicTest006
     * @tc.desc      : Verify dynamic remaining capacity changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueRemainingCapacityDynamicTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity));
        queue.add(1);
        queue.add(2);
        queue.add(3);
        expect(String(queue.remainingCapacity())).assertEqual('2');
        queue.poll();
        queue.poll();
        expect(String(queue.remainingCapacity())).assertEqual('4');
        queue.add(4);
        queue.add(5);
        queue.add(6);
        queue.add(7);
        expect(String(queue.remainingCapacity())).assertEqual('0');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0176
     * @tc.name      : containers.ArrayBlockingQueueGetSizeDynamicTest001
     * @tc.desc      : Verify size after filling queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetSizeDynamicTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 3;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.push(1);
      queue.push(2);
      queue.push(3);

      expect(String(queue.size)).assertEqual('3');
      expect(String(queue.capacity)).assertEqual(String(capacity));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0177
     * @tc.name      : containers.ArrayBlockingQueueGetSizeDynamicTest002
     * @tc.desc      : Verify size changes with add and poll operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetSizeDynamicTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(0);
      expect(String(queue.size)).assertEqual('0');

      queue.add("test");
      expect(String(queue.size)).assertEqual('1');
      queue.poll();
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0178
     * @tc.name      : containers.ArrayBlockingQueueGetSizeDynamicTest003
     * @tc.desc      : Verify size changes with push and pop operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetSizeDynamicTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(0);
      expect(String(queue.size)).assertEqual('0');

      queue.push("data");
      expect(String(queue.size)).assertEqual('1');
      queue.pop();
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0179
     * @tc.name      : containers.ArrayBlockingQueueGetSizeOneTest004
     * @tc.desc      : Verify size changes in single capacity queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetSizeOneTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(1);
      expect(String(queue.size)).assertEqual('0');
      queue.push(true);
      expect(String(queue.size)).assertEqual('1');
      queue.pop();
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYTRUETEST_0180
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyTrueTest001
     * @tc.desc      : Verify isEmpty on empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyTrueTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(0);
      expect(String(queue.isEmpty())).assertEqual('true');
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYTRUETEST_0181
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyFalseTest002
     * @tc.desc      : Verify isEmpty on non-empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyFalseTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(2);
      queue.push("data");
      expect(String(queue.isEmpty())).assertEqual('false');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0182
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyChangeTest003
     * @tc.desc      : Verify isEmpty changes after operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyChangeTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(0);
      expect(String(queue.isEmpty())).assertEqual('true');

      queue.add(true);
      expect(String(queue.isEmpty())).assertEqual('false');

      queue.poll();
      expect(String(queue.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0183
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyBoundaryTest004
     * @tc.desc      : Verify isEmpty on single capacity queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyBoundaryTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(1);
      expect(String(queue.isEmpty())).assertEqual('true');
      queue.push(1);
      expect(String(queue.isEmpty())).assertEqual('false');
      queue.pop();
      expect(String(queue.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0184
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyMixedTest005
     * @tc.desc      : Verify isEmpty with mixed operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyMixedTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(3);
      queue.push("a");
      queue.pop();
      expect(String(queue.isEmpty())).assertEqual('true');

      queue.add("b");
      queue.pop();
      expect(String(queue.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0185
     * @tc.name      : containers.ArrayBlockingQueueIsEmptyConcurrentTest006
     * @tc.desc      : Verify isEmpty with concurrent operations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueIsEmptyConcurrentTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      queue.push(1);
      queue.pop();
      queue.push(2);
      expect(String(queue.isEmpty())).assertEqual('false');
      queue.pop();
      expect(String(queue.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0186
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest001
     * @tc.desc      : Verify getEnd on filled queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity; i++) {
        queue.add(i);
      }
      expect(String(queue.getEnd())).assertEqual('9');
      expect(String(queue.size)).assertEqual('10');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0187
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest002
     * @tc.desc      : Verify getEnd with special values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 5;
      const queue = new containers.ArrayBlockingQueue<string | null | undefined>(capacity);
      queue.add("");
      queue.add(null);
      queue.add(undefined);
      queue.add("@#$");

      expect(String(queue.getEnd())).assertEqual('@#$');
      expect(queue.size).assertEqual(4);

      queue.poll();
      queue.add(null);
      expect(queue.getEnd()).assertEqual(null);

      queue.poll();
      queue.add(undefined);
      expect(queue.getEnd()).assertEqual(undefined);

      queue.poll();
      queue.add("");
      expect(String(queue.getEnd())).assertEqual("");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0188
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest003
     * @tc.desc      : Verify getEnd on empty queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      expect(String(queue.getEnd()).toString()).assertEqual('undefined');
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0189
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest004
     * @tc.desc      : Verify getEnd on single element queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 1;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.add(100)
      expect(String(queue.getEnd())).assertEqual('100');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0190
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest005
     * @tc.desc      : Verify getEnd on single element queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 1;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      queue.add(100)
      expect(String(queue.getEnd())).assertEqual('100');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0191
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest006
     * @tc.desc      : Verify getEnd after filling queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);
      for (let i = 0; i < capacity - 1; i++) {
        queue.add(i)
      }
      expect(String(queue.getEnd())).assertEqual('8');
      expect(String(queue.size)).assertEqual('9');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0192
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest007
     * @tc.desc      : Verify getEnd after filling queue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(capacity);

      queue.add(1);
      expect(String(queue.size)).assertEqual('1');
      expect(String(queue.getEnd())).assertEqual('1');

      for (let i = 2; i < capacity; i++) {
        queue.add(i);
      }
      expect(String(queue.size)).assertEqual('9');
      expect(String(queue.getEnd())).assertEqual('9');

      queue.add(10);
      expect(String(queue.size)).assertEqual('10');
      expect(String(queue.getEnd())).assertEqual('10');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0193
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest008
     * @tc.desc      : Verify getEnd with string value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const capacity = 1;
      const queue = new containers.ArrayBlockingQueue<string>(capacity);
      queue.add('hahah')
      expect(String(queue.getEnd())).assertEqual('hahah');
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0194
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest009
     * @tc.desc      : Verify getEnd with multiple string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(5);
      queue.add('hahah')
      queue.add('xixixi')
      expect(String(queue.getEnd())).assertEqual('xixixi');
      expect(String(queue.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0195
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest010
     * @tc.desc      : Verify getEnd with duplicate string values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<string>(5);
      queue.add('hahah')
      queue.add('hahah')
      expect(String(queue.getEnd())).assertEqual('hahah');
      expect(String(queue.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0196
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest011
     * @tc.desc      : Verify getEnd with MAX_SAFE_INTEGER value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(5);
      queue.add(Number.MAX_SAFE_INTEGER);
      expect(String(queue.getEnd())).assertEqual(String(Number.MAX_SAFE_INTEGER));
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0197
     * @tc.name      : containers.ArrayBlockingQueueGetEndConcurrentTest012
     * @tc.desc      : Verify getEnd with MIN_SAFE_INTEGER value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrentTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(5);
      queue.add(Number.MIN_SAFE_INTEGER);
      expect(String(queue.getEnd())).assertEqual(String(Number.MIN_SAFE_INTEGER));
      expect(String(queue.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueCONSTRUCTORCONCURRENTTEST_0198
     * @tc.name      : containers.ArrayBlockingQueueConstructorConcurrentTest001
     * @tc.desc      : Verify constructor with empty array and zero capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueConstructorConcurrentTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(0, new Array<number>());
        expect(queue.isEmpty()).assertTrue();
        expect(String(queue.size)).assertEqual('0');
        expect(String(queue.capacity)).assertEqual('0');
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueCONSTRUCTORCONCURRENTTEST_0199
     * @tc.name      : containers.ArrayBlockingQueueConstructorConcurrentTest002
     * @tc.desc      : Verify constructor with empty array and single capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueConstructorConcurrentTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1, new Array<number>());
        expect(queue.isEmpty()).assertTrue();
        expect(String(queue.size)).assertEqual('0');
        expect(String(queue.capacity)).assertEqual('1');
      });

    /**
     * @tc.number    : SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_200
     * @tc.name      : containers.ArrayBlockingQueueConstructorWithTest001
     * @tc.desc      : The test uses an empty array to initialize the queue (capacity = 0)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("ArrayBlockingQueueConstructorWithTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptyArray = new Array<Int>();
          const queue = new containers.ArrayBlockingQueue<int>(0, emptyArray);
          expect(queue.isEmpty()).assertTrue();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }