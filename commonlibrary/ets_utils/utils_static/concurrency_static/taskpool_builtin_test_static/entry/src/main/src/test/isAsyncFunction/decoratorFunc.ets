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

export class DecoratedAsyncClass {
  async decoratedAsyncMethod(): Promise<number> {
    return 42;
  }

  async syncMethodDecorated(): Promise<number> {
    return 10;
  }

  async methodWithDecorator1(): Promise<string> {
    return 'decorator1';
  }

  async methodWithDecorator2(): Promise<boolean> {
    return true;
  }

  get decoratedGetter(): number {
    return 100;
  }

  async methodAfterAccessor(): Promise<void> {
    return;
  }
}

export class MultiDecoratorClass {
  async multiDecoratedMethod(): Promise<number> {
    return 99;
  }
}

export class ParamDecoratedClass {
  async paramDecoratedMethod(): Promise<string> {
    return 'param';
  }
}
