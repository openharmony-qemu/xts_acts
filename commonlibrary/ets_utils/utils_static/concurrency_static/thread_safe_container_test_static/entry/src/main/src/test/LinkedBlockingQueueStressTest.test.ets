import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

export default function LinkedBlockingQueueStressTest() {
  describe('LinkedBlockingQueueStressTest', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LINKED_BLOCKING_QUEUE_STRESS_CONCURRENT_0400
     * @tc.name Linked_Blocking_Queue_Stress_Concurrent_Operations_static_0400
     * @tc.desc Verify multi-thread concurrent add/poll operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Linked_Blocking_Queue_Stress_Concurrent_Operations_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(100);
      let threadCount: number = 10;
      let operationsPerThread: number = 100;

      let tasks: Job<void>[] = [];
      let workers: EAWorker[] = [];
      for (let i: number = 0; i < threadCount; i++) {
        let eaw = new EAWorker()
        eaw.start()
        workers.push(eaw)
        let task: Job<void> = eaw.run<void>((q: containers.LinkedBlockingQueue<number>): void => {
          for (let j: number = 0; j < operationsPerThread; j++) {
            q.add(j);
            q.poll();
          }
        }, queue);
        tasks.push(task);
      }
      tasks.forEach((jb) => {
        jb.Await();
      })
      workers.forEach((eaw) => {
        eaw.join().Await();
      })

      expect(queue.size >= 0).assertTrue();
      expect(queue.size <= 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LINKED_BLOCKING_QUEUE_PRODUCER_CONSUMER_0500
     * @tc.name Linked_Blocking_Queue_Stress_Producer_Consumer_static_0500
     * @tc.desc Test LinkedBlockingQueue correctness in producer-consumer pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Linked_Blocking_Queue_Stress_Producer_Consumer_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(1000);
      let producerCount: number = 10;
      let consumerCount: number = 10;
      let itemsPerProducer: number = 100;

      let tasks: Job<void>[] = [];
      let workers: EAWorker[] = [];

      for (let i: number = 0; i < producerCount; i++) {
        let eaw = new EAWorker()
        eaw.start()
        workers.push(eaw)
        let task: Job<void> = eaw.run<void>((q: containers.LinkedBlockingQueue<number>, id: number, count: number): void => {
          for (let j: number = 0; j < count; j++) {
            q.push(id * count + j);
          }
        }, queue, i, itemsPerProducer);
        tasks.push(task);
      }

      for (let i: number = 0; i < consumerCount; i++) {
        let eaw = new EAWorker()
        eaw.start()
        workers.push(eaw)
        let task: Job<void> = eaw.run<void>((q: containers.LinkedBlockingQueue<number>, count: number): void => {
          for (let j: number = 0; j < count; j++) {
            q.pop();
          }
        }, queue, Math.floor(itemsPerProducer * producerCount / consumerCount));
        tasks.push(task);
      }

      tasks.forEach((jb) => {
        jb.Await();
      })
      workers.forEach((eaw) => {
        eaw.join().Await();
      })

      expect(queue.size).assertEqual(0);
    });

    /**
      * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LINKED_BLOCKING_QUEUE_STRESS_ADD_POLL_1100
      * @tc.name Linked_Blocking_Queue_Stress_Add_Poll_Mix_static_1100
      * @tc.desc Verify alternating add and poll operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
      */
    it("Linked_Blocking_Queue_Stress_Add_Poll_Mix_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(1000);
      let threadCount: number = 10;

      let tasks: Job<void>[] = [];
      let workers: EAWorker[] = [];
      for (let i: number = 0; i < threadCount; i++) {
        let eaw = new EAWorker()
        eaw.start()
        workers.push(eaw)
        let task: Job<void> = eaw.run<void>((q: containers.LinkedBlockingQueue<number>, id: number): void => {
          for (let j: number = 0; j < 20; j++) {
            q.add(id * 50 + j);
            if (j % 2 === 0) {
              q.poll();
            }
          }
        }, queue, i);
        tasks.push(task);
      }
      tasks.forEach((jb) => {
        jb.Await();
      })
      workers.forEach((eaw) => {
        eaw.join().Await();
      })

      expect(queue.size == 100).assertTrue();
    });

    /**
      * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LINKED_BLOCKING_QUEUE_ITERATOR_INITIALIZATION_1700
      * @tc.name Linked_Blocking_Queue_Initialize_From_Iterator_static_1700
      * @tc.desc Verify LinkedBlockingQueue initialization from IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
      */
    it("Linked_Blocking_Queue_Initialize_From_Iterator_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sourceArray: number[] = [];
      for (let i: number = 0; i < 100; i++) {
        sourceArray.push(i);
      }

      let iter: IterableIterator<number> = sourceArray.values();
      let queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(iter);

      expect(queue.size).assertEqual(100);

      for (let i: number = 0; i < 100; i++) {
        let value: number | undefined = queue.poll();
        expect(value).assertEqual(i);
      }

      expect(queue.size).assertEqual(0);
    });
  });
}
