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

export interface AsyncInterface {
  asyncMethod: () => Promise<number>;
}

export class InterfaceAsyncImpl implements AsyncInterface {
  get id(): number {
    return 0;
  }

  asyncMethod: () => Promise<number> = async (): Promise<number> => {
    return 42;
  };
}

export interface AsyncMethodInterface {
  asyncMethodWithParams(x: number, y: number): Promise<number>;
}

export class AsyncMethodInterfaceImpl implements AsyncMethodInterface {
  async asyncMethodWithParams(x: number, y: number): Promise<number> {
    return x + y;
  }
}

export abstract class AbstractAsyncClass {
  abstract asyncAbstractMethod(): Promise<number>;

  get id(): number {
    return 0;
  }

  async concreteAsyncMethod(): Promise<string> {
    return 'concrete';
  }
}

export class AbstractAsyncImpl extends AbstractAsyncClass {
  async asyncAbstractMethod(): Promise<number> {
    return 99;
  }
}
