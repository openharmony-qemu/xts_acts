/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Nested, NestedWithNullable } from './Nested'
import { myValue } from './NumberInitializer';

export class StringContainer {
  data: string = 'Hello String in container';
}

/*
  Sendable class can extend from other sendable class
 */

export class ExtendedFromNested extends Nested {

  constructor() {
    super()
  }
}

/*
  Sendable class can contain field of other sendable class
 */
export class NestedSendableContainer {
  public data: Nested = new Nested();
}

export class NullableNestedSendableContainer {
  public data: NestedWithNullable = new NestedWithNullable();
}


export class NumberContainer {
  public data: number = 12345678;
}

export class ValuedNumberContainer {
  public data: number;
  constructor(val: number) {
    this.data = val;
  }
}

export class NullAndStringContainer {
  public data: string| null = 'Hello nullable string';
}

export class UndefinedAndStringContainer {
  public data: string| undefined = 'Hello undefined string';
}

type StringDef = string;


export class StringDefContainer {
   public data: StringDef = 'Hello World';
}


/*
  Create instance of sendable generic class, passing a sendable type as generic type
 */
export class GenericSendable<T> {
  public field: T|undefined = undefined;
}


export class CollectionHolder {
  public e: Array<number> = [];
}


export class ArrayContainer {
 public data: Uint32Array;

  constructor(size: int) {
    this.data = new Uint32Array(new ArrayBuffer(size * 4));
  }
}


/**/
export class NumberContainerArray {
  public data: Array<NumberContainer> = new Array<NumberContainer>(20);
}
/*
*/
export class OuterInitializerContainer {
  public value: number = myValue;
}
