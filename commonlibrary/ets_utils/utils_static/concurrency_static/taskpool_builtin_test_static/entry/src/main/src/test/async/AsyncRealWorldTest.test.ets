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
import { afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils, { sleep } from '../Utils.test';

class User {
  public id: number = 0;
  public name: string = '';
}

class Post {
  public userId: number = 0;
  public title: string = '';
}

class MergedUser {
  public id: number = 0;
  public name: string = '';
  public posts: Post[] = [];
}

type State = 'idle' | 'loading' | 'success' | 'error';

export default function asyncRealWorldTest(): void {
  describe('asyncRealWorldTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   asyncRealWorldTest002
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0002
     * @tc.desc   Simulate data caching mechanism
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const cache = new Map<string, string>();

      const getDataWithCache = async (key: string): Promise<string> => {
        // Check cache first
        if (cache.has(key)) {
          return cache.get(key)!;
        }

        // Simulate slow data fetch
        try {
          await sleep(1);
          const data = `data-${key}`;

          // Store in cache
          cache.set(key, data);
          return data;
        } catch (e) {
          console.info(`asyncRealWorldTest002 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result1 = await getDataWithCache('user1');
        const result2 = await getDataWithCache('user1'); // Should return cached

        expect(result1).assertEqual('data-user1');
        expect(result2).assertEqual('data-user1');
        expect(cache.size).assertEqual(1);
      } catch (e) {
        console.info(`asyncRealWorldTest002 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest004
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0004
     * @tc.desc   Simulate data pipeline transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const fetch = async (): Promise<int[]> => {
        return [1, 2, 3, 4, 5];
      };

      const transform = async (data: int[]): Promise<int[]> => {
        return data.map((x: int) => x * 2);
      };

      const filter = async (data: int[]): Promise<int[]> => {
        return data.filter(x => x > 4);
      };

      const sort = async (data: int[]): Promise<int[]> => {
        return data.sort((a, b) => a - b);
      };

      // Pipeline: fetch -> transform -> filter -> sort
      try {
        const rawData = await fetch();
        const transformed = await transform(rawData);
        const filtered = await filter(transformed);
        const sorted = await sort(filtered);

        expect(sorted).assertDeepEquals([6, 8, 10]);
      } catch (e) {
        console.info(`asyncRealWorldTest004 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest005
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0005
     * @tc.desc   Simulate batch processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // 显式类型声明，避免类型推断
      const items: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        items.push(i);
      }
      const batchSize: int = 10;

      const processBatch = async (batch: number[]): Promise<number[]> => {
        return batch.map((x: number) => x * 2);
      };

      const processInBatches = async (): Promise<number[]> => {
        try {
          const results: number[] = [];

          for (let i: int = 0; i < items.length; i += batchSize) {
            const batch = items.slice(i, i + batchSize);
            const processed = await processBatch(batch);
            results.push(...processed);
          }

          return results;
        } catch (e) {
          console.info(`asyncRealWorldTest005 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await processInBatches();
        expect(result.length).assertEqual(100);
        expect(result[0]).assertEqual(0);
        expect(result[99]).assertEqual(198);
      } catch (e) {
        console.info(`asyncRealWorldTest005 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest006
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0006
     * @tc.desc   Simulate request debouncing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let lastCallTime: number = 0;
      const debounceTime: number = 50;

      const debouncedRequest = async (key: string): Promise<string> => {
        const now = Date.now();
        if (now - lastCallTime < debounceTime) {
          throw new Error('debounced');
        }
        lastCallTime = now;
        return `result-${key}`;
      };

      try {
        const result1 = await debouncedRequest('request1');
        await sleep(60); // Wait for debounce to clear
        const result2 = await debouncedRequest('request2');

        expect(result1).assertEqual('result-request1');
        expect(result2).assertEqual('result-request2');
      } catch (e) {
        console.info(`asyncRealWorldTest006 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest007
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0007
     * @tc.desc   Simulate rate limiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const maxRequestsPerSecond: int = 3;
        let requestCount: int = 0;
        let resetTime: number = (Date.now() + 1000).toDouble();

        const rateLimitedRequest = async (id: number): Promise<string> => {
          const now: number = Date.now();
          if (now > resetTime) {
            requestCount = 0;
            resetTime = now + 1000;
          }

          if (requestCount >= maxRequestsPerSecond) {
            throw new Error('rate limit exceeded');
          }

          requestCount++;
          return `response-${id}`;
        };

        const results: string[] = [];
        for (let i: int = 0; i < 3; i++) {
          results.push(await rateLimitedRequest(i));
        }

        expect(results.length).assertEqual(3);
        expect(results[0]).assertEqual('response-0');
      } catch (e) {
        console.info(`asyncRealWorldTest007 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest010
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0010
     * @tc.desc   Simulate async queue processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const queue: number[] = [];
      const results: string[] = [];

      const enqueue = (item: number): void => {
        queue.push(item);
      };

      const processQueue = async (): Promise<void> => {
        try {
          while (queue.length > 0) {
            const item = queue.shift()!;
            results.push(`processed-${item}`);
            await sleep(1);
          }
        } catch (e) {
          console.info(`asyncRealWorldTest010 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      // Add items to queue
      for (let i: int = 0; i < 5; i++) {
        enqueue(i);
      }

      try {
        await processQueue();

        expect(results.length).assertEqual(5);
        expect(results[0]).assertEqual('processed-0');
        expect(results[4]).assertEqual('processed-4');
      } catch (e) {
        console.info(`asyncRealWorldTest010 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest011
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0011
     * @tc.desc   Simulate conditional async workflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const fetchUserRole = async (userId: number): Promise<string> => {
          return userId > 100 ? 'admin' : 'user';
        };

        const fetchAdminData = async (): Promise<string> => {
          return 'admin-data';
        };

        const fetchUserData = async (): Promise<string> => {
          return 'user-data';
        };

        const userId: int = 150;
        const role = await fetchUserRole(userId);

        let data: string;
        if (role === 'admin') {
          data = await fetchAdminData();
        } else {
          data = await fetchUserData();
        }

        expect(data).assertEqual('admin-data');
      } catch (e) {
        console.info(`asyncRealWorldTest011 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest012
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0012
     * @tc.desc   Simulate async data validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const validateEmail = async (email: string): Promise<boolean> => {
        return email.includes('@');
      };

      const validatePhone = async (phone: string): Promise<boolean> => {
        return phone.length >= 10;
      };

      const validateUserData = async (
        email: string,
        phone: string
      ): Promise<boolean> => {
        // 不使用 Promise.all 的泛型，分别处理
        try {
          const isEmailValid = await validateEmail(email);
          const isPhoneValid = await validatePhone(phone);

          return isEmailValid && isPhoneValid;
        } catch (e) {
          console.info(`asyncRealWorldTest012 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result1 = await validateUserData('test@example.com', '1234567890');
        const result2 = await validateUserData('invalid', '123');

        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (e) {
        console.info(`asyncRealWorldTest012 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest013
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0013
     * @tc.desc   Simulate async data pagination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const pageSize: int = 10;
      const totalPages: int = 3;

      const fetchPage = async (page: number): Promise<number[]> => {
        const start = page * pageSize;
        const result: number[] = [];
        for (let i: int = 0; i < pageSize; i++) {
          result.push(start + i);
        }
        return result;
      };

      const fetchAllPages = async (): Promise<number[]> => {
        try {
          const allData: number[] = [];

          for (let page: int = 0; page < totalPages; page++) {
            const pageData = await fetchPage(page);
            allData.push(...pageData);
          }

          return allData;
        } catch (e) {
          console.info(`asyncRealWorldTest013 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await fetchAllPages();
        expect(result.length).assertEqual(30);
        expect(result[0]).assertEqual(0);
        expect(result[29]).assertEqual(29);
      } catch (e) {
        console.info(`asyncRealWorldTest013 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest014
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0014
     * @tc.desc   Simulate async event handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sequence: string[] = [];

      const handleEvent = async (eventName: string, data: string): Promise<void> => {
        sequence.push(`start-${eventName}`);
        try {
          await sleep(1);
          sequence.push(`process-${data}`);
          await sleep(1);
          sequence.push(`end-${eventName}`);
        } catch (e) {
          console.info(`asyncRealWorldTest014 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        await handleEvent('click', 'button1');
        await handleEvent('submit', 'form1');

        expect(sequence.length).assertEqual(6);
        expect(sequence[0]).assertEqual('start-click');
        expect(sequence[1]).assertEqual('process-button1');
      } catch (e) {
        console.info(`asyncRealWorldTest014 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest015
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0015
     * @tc.desc   Simulate async resource pool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const poolSize: int = 3;
      const available: number[] = [1, 2, 3];

      const acquireResource = async (): Promise<number> => {
        try {
          while (available.length === 0) {
            await sleep(1);
          }
          return available.shift()!;
        } catch (e) {
          console.info(`asyncRealWorldTest015 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      const releaseResource = async (resource: number): Promise<void> => {
        try {
          await sleep(1);
          available.push(resource);
        } catch (e) {
          console.info(`asyncRealWorldTest015 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      const useResource = async (): Promise<string> => {
        try {
          const resource = await acquireResource();
          const result = `used-${resource}`;
          await releaseResource(resource);
          return result;
        } catch (e) {
          console.info(`asyncRealWorldTest015 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const results = await Promise.all([
          useResource(),
          useResource(),
          useResource()
        ]);

        expect(results.length).assertEqual(3);
        expect(results).assertContain('used-1');
        expect(results).assertContain('used-2');
        expect(results).assertContain('used-3');
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest016
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0016
     * @tc.desc   Simulate async data deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const pendingRequests = new Map<string, Promise<string>>();

      const deduplicatedFetch = async (key: string): Promise<string> => {
        if (pendingRequests.has(key)) {
          return pendingRequests.get(key)!;
        }

        const promise = (async () => {
          try {
            await sleep(1);
            return `data-${key}`;
          } catch (e) {
            console.info(`asyncRealWorldTest016 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        })();

        pendingRequests.set(key, promise);

        try {
          return await promise;
        } finally {
          pendingRequests.delete(key);
        }
      };

      // 不使用 Promise.all 的泛型，分别获取结果
      try {
        const r1 = await deduplicatedFetch('key1');
        const r2 = await deduplicatedFetch('key1'); // Should use same request
        const r3 = await deduplicatedFetch('key2');

        expect(r1).assertEqual('data-key1');
        expect(r2).assertEqual('data-key1');
        expect(r3).assertEqual('data-key2');
        expect(pendingRequests.size).assertEqual(0);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest017
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0017
     * @tc.desc   Simulate async progress tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const progressUpdates: number[] = [];

      const reportProgress = async (progress: number): Promise<void> => {
        progressUpdates.push(progress);
        try {
          await sleep(1);
        } catch (e) {
          console.info(`asyncRealWorldTest017 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      const longRunningTask = async (): Promise<string> => {
        const totalSteps: number = 5;

        for (let step: number = 1; step <= totalSteps; step++) {
          try {
            await reportProgress(Math.floor((step / totalSteps) * 100));
          } catch (err) {
            expect(err).assertFail();
          }
        }

        return 'completed';
      };

      try {
        const result = await longRunningTask();
        expect(result).assertEqual('completed');
        let res: number[] = [20, 40, 60, 80, 100];
        expect(progressUpdates).assertDeepEquals(res);
      } catch (e) {
        console.info(`asyncRealWorldTest017 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest018
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0018
     * @tc.desc   Simulate async data merging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const fetchUsers = async (): Promise<User[]> => {
        const user1: User = { id: 1, name: 'Alice' };
        const user2: User = { id: 2, name: 'Bob' };
        return [user1, user2];
      };

      const fetchPosts = async (): Promise<Post[]> => {
        const post1: Post = { userId: 1, title: 'Post 1' };
        const post2: Post = { userId: 2, title: 'Post 2' };
        return [post1, post2];
      };

      // 不使用解构，使用数组索引访问
      let results: (User[] | Post[])[] = new Array<User[] | Post[]>();
      try {
        results = await Promise.all<User[] | Post[]>([
          fetchUsers(),
          fetchPosts()
        ]);
      } catch (err) {
        expect(err).assertFail();
      }
      const users = results[0] as User[];
      const posts = results[1] as Post[];

      const merged: MergedUser[] = [];
      for (let i: int = 0; i < users.length; i++) {
        const user = users[i];
        const mergedUser: MergedUser = new MergedUser();
        mergedUser.id = user.id;
        mergedUser.name = user.name;
        mergedUser.posts = posts.filter(p => p.userId === user.id);
        merged.push(mergedUser);
      }

      expect(merged.length).assertEqual(2);
      expect(merged[0].name).assertEqual('Alice');
      expect(merged[0].posts.length).assertEqual(1);
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest019
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0019
     * @tc.desc   Simulate async state machine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let currentState: State = 'idle';
      const stateHistory: State[] = [];

      const transitionTo = async (newState: State): Promise<void> => {
        stateHistory.push(currentState);
        currentState = newState;
        try {
          await sleep(1);
        } catch (e) {
          console.info(`asyncRealWorldTest019 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      const loadData = async (): Promise<string> => {
        try {
          await transitionTo('loading');

          try {
            // Simulate success
            await transitionTo('success');
            return 'data-loaded';
          } catch (err) {
            await transitionTo('error');
            // 只能抛出 Error 类型
            if (err instanceof Error) {
              throw err;
            }
            throw new Error('Unknown error');
          }
        } catch (e) {
          console.info(`asyncRealWorldTest019 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await loadData();
        expect(result).assertEqual('data-loaded');
        expect(currentState).assertEqual('success');
        expect(stateHistory).assertDeepEquals(['idle', 'loading']);
      } catch (e) {
        console.info(`asyncRealWorldTest019 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncRealWorldTest020
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_0020
     * @tc.desc   Simulate async data streaming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // 不使用生成器函数，返回数组
      const streamData = async (count: number): Promise<number[]> => {
        const results: number[] = [];
        for (let i: int = 0; i < count; i++) {
          try {
            await sleep(1);
          } catch (err) {
            expect(err).assertFail();
          }
          results.push(i);
        }
        return results;
      };

      try {
        const collectedData = await streamData(10);

        expect(collectedData.length).assertEqual(10);
        let res: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        expect(collectedData).assertDeepEquals(res);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });
  });
}
