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

export class Event {
  constructor() {
    this.promise = new Promise<boolean>((resolve: (val: boolean) => void) => {
      this.resolveFn = resolve;
    })
  }

  public Wait(): boolean {
    return waitForCompletion<boolean>(() => {
      return this.promise;
    });
  }

  public Fire(val: boolean = true): void {
    this.resolveFn!(val);
  }

  private promise: Promise<boolean>;
  private resolveFn: ((val: boolean) => void) | null = null;
}

export class BaseClass {
  private count: number = 0;
  public lock_: AsyncLock = new AsyncLock()

  public async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count;
    })
  }

  public async increaseCount(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.count++;
    })
  }
}


export class CountClass {
  public count: int = 0

  public setCount(value: int): void {
    this.count = value
  }

  public getCount(): int {
    return this.count;
  }
}

export class SharedJob<T extends Job<void>> {
  private jobs: Array<T>;

  constructor(jobs: Array<T>) {
    this.jobs = jobs;
  }

  public Await(): void {
    for (let job of this.jobs) {
      job.Await();
    }
  }
}

export async function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
