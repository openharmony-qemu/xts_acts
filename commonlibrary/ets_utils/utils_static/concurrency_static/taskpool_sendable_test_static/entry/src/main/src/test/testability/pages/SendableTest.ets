'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

export class AsyncLockTest {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {
    let s: string[] = []
    throw new Error('Expected failure for callback-path validation');
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}

export class AsyncLockTestThen {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {

    await this.lock_.lockAsync((): void => {
      this.count_ = count;
    });
    let values: string[] = [];
    throw new Error('Expected failure for callback-path validation');
  }
}

export class AsyncLockTestCatch {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {

    try {
      await this.lock_.lockAsync((): void => {
        this.count_ = count;
      });
      let firstValues: string[] = [];
      throw new Error('Expected failure for callback-path validation');
    } catch (error) {
      let secondValues: string[] = [];
      throw new Error('Expected failure for callback-path validation');
    }

  }
}

export class AsyncLockTestFinally {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {

    await this.lock_.lockAsync(() => {
      this.count_ = count;
    }).finally((): void => {
      let s: string[] = [];
      throw new Error('Expected failure for callback-path validation');
    })

  }
}


export class AsyncLockTest1 {
  private count_: number = 0;
  private lock_: AsyncLock = new AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number): Promise<void> {
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}
