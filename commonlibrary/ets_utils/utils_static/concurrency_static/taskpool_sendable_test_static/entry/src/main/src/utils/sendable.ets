/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  GetNum() {
    return this.num;
  }
}

export class SimpleSendable {//implements lang.ISendable
  public digit: number;

  constructor(value: number) {
    this.digit = value;
  }
}

class SendableArrayClass {
  arr : number[]  = new Array<number>(100);
}

function sendableArrayFunc() : number {
  let arr : number[] = new Array<number>(100);
  return arr[0];
}

export async function sendableAsyncFunc() : Promise<number> {
  return 100 as number;
}

type FuncType = () => number;

export class SendableClassTest {
  constructor(func: FuncType) {
    this.func = func;
  }
  func: FuncType;
  foo() {
    let num : number = sendableArrayFunc();
    return num;
  }
}

function sendableFunctionTop(): number {
  let num = 100;
  return num;
}

class SendableClassTop {
  public num :number = 200;
  say() {
    return this.num;
  }
}

export function sendableFunc(): number {
  let num : number = sendableFunctionTop();
  const class1 = new SendableClassTop();
  num += class1.say();
  num += sendableArrayFunc();
  let arr = new SendableArrayClass().arr;
  num += arr[0]
  return num;
}