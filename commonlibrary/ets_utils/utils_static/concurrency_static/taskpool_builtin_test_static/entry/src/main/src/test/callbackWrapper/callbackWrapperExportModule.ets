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
export async function exportedAsyncFunc(): Promise<string> {
  return 'exported-async';
}

export const exportedAsyncArrowFunc: () => Promise<number> = async (): Promise<number> => {
  return 1000;
};

export class ExportedTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this._value + 100;
  }

  async asyncMethodBeforeGetter(): Promise<string> {
    return 'exported-before-getter';
  }
}

export interface ExportedAsyncFuncReturnObject {
  name: string;
  value: number;
}

export async function exportedAsyncFuncReturnObject(): Promise<ExportedAsyncFuncReturnObject> {
  const result: ExportedAsyncFuncReturnObject = { name: 'exported-object', value: 789 };
  return result;
}

export default async function defaultExportedAsyncFunc(): Promise<string> {
  return 'default-exported';
}

export class ExportedTestClassMultiple {
  private _a: number = 0;
  private _b: string = '';
  private _c: boolean = false;

  get a(): number {
    return this._a;
  }

  set a(val: number) {
    this._a = val;
  }

  async asyncMethodA(): Promise<number> {
    return this._a;
  }

  get b(): string {
    return this._b;
  }

  set b(val: string) {
    this._b = val;
  }

  async asyncMethodB(): Promise<string> {
    return this._b;
  }

  get c(): boolean {
    return this._c;
  }

  set c(val: boolean) {
    this._c = val;
  }

  async asyncMethodC(): Promise<boolean> {
    return this._c;
  }
}

export async function exportedAsyncFuncMultiParams(a: number, b: string, c: boolean): Promise<string> {
  return `${a}-${b}-${c}`;
}
