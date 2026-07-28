'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export interface PromiseInterface {
  promiseMethod(): Promise<string>;
}

export abstract class AbstractPromiseClass {
  abstract abstractPromiseMethod(): Promise<number>;

  concretePromiseMethod(): Promise<string> {
    return Promise.resolve<string>('abstract')
      .then((v: string): string => {
        return v + '-concrete';
      });
  }
}

export class PromiseInterfaceImpl implements PromiseInterface {
  promiseMethod(): Promise<string> {
    return Promise.resolve<string>('interface')
      .then((v: string): string => {
        return v + '-impl';
      });
  }
}

export class AbstractPromiseImpl extends AbstractPromiseClass {
  abstractPromiseMethod(): Promise<number> {
    return Promise.resolve<number>(100)
      .then((v: number): number => {
        return v * 2;
      });
  }
}
