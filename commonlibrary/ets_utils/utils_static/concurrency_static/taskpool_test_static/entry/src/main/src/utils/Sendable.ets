'use static';

/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export class SendableClass {
  public num: number;
  public para: undefined;
  constructor(num: number) {
    this.num = num;
  }
  public GetNum(): number {
    return this.num;
  }
}


export class SimpleSendable {
  public digit: number;

  constructor(value: number) {
    this.digit = value;
  }
}


class SendableArrayClass {
  public arr : number[]  = Array.create<number>(100, 0);
}


function sendableArrayFunc() : number {
  let arr : number[] = Array.create<number>(100, 0);
  return arr[0];
}


export async function sendableAsyncFunc() : Promise<number> {
  return 100.0;
}


type FuncType = () => number;


export class SendableClassTest {
  constructor(func: FuncType) {
    this.func = func;
  }
  public func: FuncType;
  public foo(): number {
    let num : number = sendableArrayFunc();
    return num;
  }
}

function sendableFunctionTop() {
  let num: int = 100;
  return num;
}


class SendableClassTop {
  public num :number = 200;
  public say(): number {
    return this.num;
  }
}


export function sendableFunc() : number{
  let num : number = sendableFunctionTop();
  const class1 = new SendableClassTop();
  num += class1.say();
  num += sendableArrayFunc();
  let arr = new SendableArrayClass().arr;
  num += arr[0]
  return num;
}


export class TaskInfoClass {
  private count: number = 0;
  private errCount: number = 0;
  private enqueue: number = 0;
  private onReceicve: number = 0;
  private startExecute: number = 0;
  private executeFailed: number = 0;
  private executeSuccess: number = 0;

  public lock_: AsyncLock = new AsyncLock();

  public async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count;
    })
  }

  public async increaseCount() {
    await this.lock_.lockAsync(() => {
      this.count++;
    })
  }

  public async getErrCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.errCount;
    })
  }

  public async increaseErrCount() {
    await this.lock_.lockAsync(() => {
      this.errCount++;
    })
  }

  public async getEnqueue(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.enqueue;
    })
  }

  public async increaseEnqueue() {
    await this.lock_.lockAsync(() => {
      this.enqueue++;
    })
  }

  public async getOnReceicve(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.onReceicve;
    })
  }

  public async increaseOnReceicve() {
    await this.lock_.lockAsync(() => {
      this.onReceicve++;
    })
  }

  public async getStartExecute(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.startExecute;
    })
  }

  public async increaseStartExecute() {
    await this.lock_.lockAsync(() => {
      this.startExecute++;
    })
  }

  public async getExecuteFailed(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.executeFailed;
    })
  }

  public async increaseExecuteFailed() {
    await this.lock_.lockAsync(() => {
      this.executeFailed++;
    })
  }

  public async getExecuteSuccess(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.executeSuccess;
    })
  }

  public async increaseExecuteSuccess() {
    await this.lock_.lockAsync(() => {
      this.executeSuccess++;
    })
  }
}