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
import { allocateAndBypassFunction, BypassFunctionType } from './BypassFunction';
import { check, compareBuffers } from './utils';
import { StringContainer, NestedSendableContainer, NullableNestedSendableContainer,
  NumberContainer, NullAndStringContainer, UndefinedAndStringContainer, GenericSendable,
  OuterInitializerContainer
} from './Containers'
import { Nested } from './Nested'
import { CombinedType } from './SendablesTestImport'

// TESTS IMPLEMENTATION //
export function testSendableSimpleDate(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleDateImpl)
  return check('testSendableSimpleDate', p);
}

async function testSendableSimpleDateImpl(): Promise<string> {
  let input: Date = new Date();
  let job: BypassFunctionType<Date> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
  let res: Date = temp as Date;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleString(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleStringImpl)
  return check('testSendableSimpleString', p);
}

async function testSendableSimpleStringImpl(): Promise<string> {
  let input: String = 'Hello World';
  let job: BypassFunctionType<String> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: String = temp as String;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleNumber(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleNumberImpl)
  return check('testSendableSimpleNumber', p);
}


async function testSendableSimpleNumberImpl(): Promise<string> {
  let input: Number = 12345678;
  let job: BypassFunctionType<Number> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: Number = temp as Number;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleBoolean(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleBooleanImpl)
  return check('testSendableSimpleBoolean', p);
}


async function testSendableSimpleBooleanImpl(): Promise<string> {
  let input: Boolean = true;
  let job: BypassFunctionType<Boolean> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: Boolean = temp as Boolean;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleSharedArrayBuffer(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferImpl)
  return check('testSendableSimpleSharedArrayBuffer', p);
}


async function testSendableSimpleSharedArrayBufferImpl(): Promise<string> {
  let input: ArrayBuffer = new ArrayBuffer(5);
  let srcView = new DataView(input);
  for(let i = 0; i < 5; i++){
    srcView.setInt8(i, i);
  }

  let job: BypassFunctionType<ArrayBuffer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableSimpleSharedArrayBufferAndUndefined(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferAndUndefinedImpl)
  return check('testSendableSimpleSharedArrayBufferAndUndefined', p);
}


async function testSendableSimpleSharedArrayBufferAndUndefinedImpl(): Promise<string> {
  let input: ArrayBuffer = new ArrayBuffer(5);
  let job: BypassFunctionType<ArrayBuffer|undefined> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableSimpleSharedArrayBufferAndNull(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferAndNullImpl)
  return check('testSendableSimpleSharedArrayBufferAndNull', p);
}


async function testSendableSimpleSharedArrayBufferAndNullImpl(): Promise<string> {
  let input: ArrayBuffer = new ArrayBuffer(5);
  let job: BypassFunctionType<ArrayBuffer|null> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableSimpleCombined0(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined0Impl)
  return check('testSendableSimpleCombined0', p);
}


async function testSendableSimpleCombined0Impl(): Promise<string> {
  let input: ArrayBuffer = new ArrayBuffer(5);
  let job: BypassFunctionType<ArrayBuffer|null|undefined> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableSimpleCombined1(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined1Impl)
  return check('testSendableSimpleCombined1', p);
}


async function testSendableSimpleCombined1Impl(): Promise<string> {
  let input: ArrayBuffer = new ArrayBuffer(5);
  let job: BypassFunctionType<ArrayBuffer|String> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableSimpleCombined2(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined2Impl)
  return check('testSendableSimpleCombined2', p);
}


async function testSendableSimpleCombined2Impl(): Promise<string> {
  let input: String = 'Hello World'
  let job: BypassFunctionType<ArrayBuffer|String> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: String = temp as String;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleCombinedAsType1(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombinedAsType1Impl)
  return check('testSendableSimpleCombinedAsType1', p);
}


async function testSendableSimpleCombinedAsType1Impl(): Promise<string> {
  let input: CombinedType = 'Hello World'
  let job: BypassFunctionType<CombinedType> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: String = temp as String;
  if (res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + res);
}

export function testSendableSimpleCombinedAsType2(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombinedAsType2Impl)
  return check('testSendableSimpleCombinedAsType2', p);
}


async function testSendableSimpleCombinedAsType2Impl(): Promise<string> {
  let input: CombinedType = new ArrayBuffer(5);
  let job: BypassFunctionType<CombinedType> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: ArrayBuffer = temp as ArrayBuffer;
  if (compareBuffers(input, res)) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

/*
@Sendable
class SharedArrayBufferContainer { // Not compilable now
  data: ArrayBuffer = new ArrayBuffer(5);
}

export function testSendableSharedArrayBufferInContainer(): Promise<string> {
  let p = taskpool.execute(testSendableSharedArrayBufferInContainerImpl)
  return check('testSendableSharedArrayBufferInContainer', p);
}


async function testSendableSharedArrayBufferInContainerImpl(): Promise<string> {
  let input: SharedArrayBufferContainer = new SharedArrayBufferContainer();
  let job: BypassFunctionType<SharedArrayBufferContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res:  = temp as ;
   if (promised == input) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + promised);
}

*/

export function testSendableContainerWithString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithStringImpl)
  return check('testSendableContainerWithString', p);
}


async function testSendableContainerWithStringImpl(): Promise<string> {
  let input: StringContainer = new StringContainer();
  let job: BypassFunctionType<StringContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: StringContainer = temp as StringContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableContainerWithNumber(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNumberImpl)
  return check('testSendableContainerWithNumber', p);
}


async function testSendableContainerWithNumberImpl(): Promise<string> {
  let input: NumberContainer = new NumberContainer();
  let job: BypassFunctionType<NumberContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: NumberContainer = temp as NumberContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableContainerWithNested(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNestedImpl)
  return check('testSendableContainerWithNested', p);
}


async function testSendableContainerWithNestedImpl(): Promise<string> {
  let input: NestedSendableContainer = new NestedSendableContainer();
  let job: BypassFunctionType<NestedSendableContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: NestedSendableContainer = temp as NestedSendableContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableContainerWithNullableNested(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNullableNestedImpl)
  return check('testSendableContainerWithNullableNested', p);
}


async function testSendableContainerWithNullableNestedImpl(): Promise<string> {
  let input: NullableNestedSendableContainer = new NullableNestedSendableContainer();
  let job: BypassFunctionType<NullableNestedSendableContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: NullableNestedSendableContainer = temp as NullableNestedSendableContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

/*
export function testSendableContainerWithStringType(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithStringTypeImpl)
  return check('testSendableContainerWithStringType', p);
}


async function testSendableContainerWithStringTypeImpl(): Promise<string> {
  let input: StringDefContainer = new StringDefContainer();
  let job: BypassFunctionType<sc.StringDefContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)).then((promised) =>  {
    if (promised == input) {
      return 'Test passed';
    }
    throw new Error('Test failed Expected ' + input + ', but was ' + promised);
  });
  await p;
  return p;
}
*/

export function testSendableContainerWithNullableString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNullableStringImpl)
  return check('testSendableContainerWithNullableString', p);
}


async function testSendableContainerWithNullableStringImpl(): Promise<string> {
  let input: NullAndStringContainer = new NullAndStringContainer();
  let job: BypassFunctionType<NullAndStringContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: NullAndStringContainer = temp as NullAndStringContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableContainerWithUndefinedString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithUndefinedStringImpl)
  return check('testSendableContainerWithUndefinedString', p);
}


async function testSendableContainerWithUndefinedStringImpl(): Promise<string> {
  let input: UndefinedAndStringContainer = new UndefinedAndStringContainer();
  let job: BypassFunctionType<UndefinedAndStringContainer> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: UndefinedAndStringContainer = temp as UndefinedAndStringContainer;
  if (res.data == input.data) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

export function testSendableWithGenericSendableField(): Promise<string> {
  let p = taskpool.execute(testSendableWithGenericSendableFieldImpl)
  return check('testSendableWithGenericSendableField', p);
}


async function testSendableWithGenericSendableFieldImpl(): Promise<string> {
  let input: GenericSendable<Nested> = new GenericSendable<Nested>();
  let job: BypassFunctionType<GenericSendable<Nested>> = allocateAndBypassFunction;

  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: GenericSendable<Nested> = temp as GenericSendable<Nested>;
  if (res.field == input.field) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}

/*
export function testSendableWithSendableCollectionHolder(): Promise<string> {
  let p = taskpool.execute(testSendableWithSendableCollectionHolderImpl)
  return check('testSendableWithSendableCollectionHolder', p);
}


async function testSendableWithSendableCollectionHolderImpl(): Promise<string> {
  let input: CollectionHolder = new CollectionHolder();
  let job: BypassFunctionType<CollectionHolder> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as  as Promise<Object>;
  let temp: Any = await (p);
 let res:  = temp as ;
  if(res == input) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input + ', but was ' + promised);
}

*/

export function testSendableImportedInitializer(): Promise<string> {
  let p = taskpool.execute(testSendableImportedInitializerImpl)
  return check('testSendableImportedInitializer', p);
}


async function testSendableImportedInitializerImpl(): Promise<string> {
  let input: OuterInitializerContainer = new OuterInitializerContainer();
  let job: BypassFunctionType<OuterInitializerContainer> = allocateAndBypassFunction;
  let p: Promise<Any> = taskpool.execute(new taskpool.Task(job, input));
  let temp: Any = await (p);
 let res: OuterInitializerContainer = temp as OuterInitializerContainer;
  if (res.value == input.value) {
    return 'TEST PASSED'
  }
  throw new Error('Test failed Expected ' + input.toString() + ', but was ' + res.toString());
}