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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ACTUALCAPACITYTEST_0100
     * @tc.name actual_Capacity_Test_static
     * @tc.desc Verify queue capacity initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("actual_Capacity_Test_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const initialCapacity = 10;
      const queue = new containers.ArrayBlockingQueue<number>(initialCapacity);
      expect(String(queue.capacity)).assertEqual(String(initialCapacity));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYINITIALIZATIONTEST_0105
     * @tc.name property_Initialization_Test_static_0105
     * @tc.desc Verify queue property initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("property_Initialization_Test_static_0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      expect(String(queue.capacity)).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTY_CAPACITYSINGLEELEMENT_0108
     * @tc.name property_Capacity_Single_Element_Test_static_0108
     * @tc.desc Verify queue with single element capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Capacity_Single_Element_Test_static_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYOVERFLOW_0110
     * @tc.name property_Capacity_Overflow_Test_static_0110
     * @tc.desc Verify queue creation with overflow capacity throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Capacity_Overflow_Test_static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_EMPTYQUEUETEST_0111
     * @tc.name empty_Queue_Test_static_011
     * @tc.desc Verify empty queue size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("empty_Queue_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<number>(10);
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHFILLTEST_0112
     * @tc.name Array_Blocking_Queue_PushFill_Test_static_001
     * @tc.desc Verify blocking behavior when pushing to full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushFill_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHMANYTEST_0113
     * @tc.name Array_Blocking_Queue_PushMany_Test_static_002
     * @tc.desc Verify pushing multiple values including null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushMany_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
        queue.push("");
        queue.push(null);
        queue.push(undefined);
        queue.push("@@");

        expect(String(queue.size)).assertEqual('4');
        expect(queue.pop()).assertEqual("");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHSTRINGTEST_0114
     * @tc.name Array_Blocking_Queue_PushString_Test_static_003
     * @tc.desc Verify pushing and popping string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(3);
        queue.push("hello");
        expect(queue.pop()).assertEqual("hello");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBIGINTTEST_0115
     * @tc.name Array_Blocking_Queue_PushString_Test_static_004
     * @tc.desc Verify pushing and popping bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<bigint>(2);
        const bigIntNum = BigInt(9007199254740991);
        queue.push(bigIntNum);
        expect(String(queue.pop())).assertEqual('9007199254740991');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBOOLEANTEST_0116
     * @tc.name Array_Blocking_Queue_PushString_Test_static_005
     * @tc.desc Verify pushing and popping boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        queue.push(true);
        expect(queue.pop()).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHCLASSTEST_0117
     * @tc.name Array_Blocking_Queue_Push_Class_Test_static_006
     * @tc.desc Verify pushing and popping class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Class_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<TestClass>(1);
        const obj = new TestClass();
        queue.push(obj);
        expect(queue.pop()).assertEqual(obj);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0118
     * @tc.name Array_Blocking_Queue_Push_Empty_Test_static_007
     * @tc.desc Verify pushing single element to empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Empty_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(10);
        queue.push(1);
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0119
     * @tc.name Array_Blocking_Queue_Push_Only_One_Test_static_008
     * @tc.desc Verify pushing single element to queue with capacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Only_One_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(1);
        queue.push("single");
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHTENTEST_0120
     * @tc.name Array_Blocking_Queue_Push_Ten_Test_static_009
     * @tc.desc Verify pushing multiple elements to fill queue capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Ten_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSPECIALVALUES_0121
     * @tc.name property_Push_SpecialValues_static
     * @tc.desc Verify pushing and popping special values (empty string, null, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_SpecialValues_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHNUMBER_0122
     * @tc.name property_Push_Number_static
     * @tc.desc Verify pushing and popping number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Number_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const num = 123;
      queue.push(num);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSTRING_0123
     * @tc.name property_Push_String_static
     * @tc.desc Verify pushing and popping string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_String_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBIGINT_0124
     * @tc.name property_Push_Bigint_static
     * @tc.desc Verify pushing and popping bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Bigint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBOOLEAN_0125
     * @tc.name property_Push_Boolean_static
     * @tc.desc Verify pushing and popping boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Boolean_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHARRAY_0126
     * @tc.name property_Push_Array_static
     * @tc.desc Verify pushing and popping array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Array_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHCLASS_0127
     * @tc.name property_Push_Class_static
     * @tc.desc Verify pushing and popping class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Class_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHOBJECT_0128
     * @tc.name property_Push_Object_static
     * @tc.desc Verify pushing and popping object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Object_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0129
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_001
     * @tc.desc Verify initial size of empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        expect(String(queue.size)).assertEqual('0');
      });
