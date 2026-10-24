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

export class SendableClass {
  num: number = 0.0;
  para: undefined;

  constructor(num: number) {
    this.num = num;
  }

  GetNum(): number {
    return this.num;
  }
}

export class SimpleSendable  {
  digit: number = 0.0;

  constructor(value: number) {
    this.digit = value;
  }
}

class sendableArrayClass {
  arr: Array<number> = new Array<number>(100.0);
}

function sendableArrayFunc(): number {
  let arr: Array<number> = new Array<number>(100.0);
  return arr[0];
}

type FuncType = () => number;

export class SendableClassTest {
  func: FuncType;

  constructor(func: FuncType) {
    this.func = func;
  }

  foo(): number {
    let num: number = sendableArrayFunc();
    return num;
  }
}

function SendableFunctionTop(): number {
  let num: number = 100.0;
  return num;
}

class SendableClassTop {
  num: number = 200.0;

  say(): number {
    return this.num;
  }
}

export function sendableFunc(): number {
  let num: number = SendableFunctionTop();
  const class1: SendableClassTop = new SendableClassTop();
  num += class1.say();
  num += sendableArrayFunc();
  let arr: Array<number> = new sendableArrayClass().arr;
  num += arr[0];
  return num;
}
