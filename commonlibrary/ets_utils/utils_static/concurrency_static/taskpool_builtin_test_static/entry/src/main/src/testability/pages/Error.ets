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

export function testError(): void {
  const TAG = 'testError';
  try {
    throw new Error('Whoops!');
  } catch (err) {
    if (err.message !== 'Whoops!'){
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'Error') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testRangeError(): void {
  const TAG = 'testRangeError';
  try {
    throw new RangeError('It is a RangeError');
  } catch (err) {
    if (err.message !== 'It is a RangeError') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'RangeError') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testReferenceError(): void {
  const TAG = 'testReferenceError';
  try {
    throw new ReferenceError('message err');
  } catch (err) {
    if (err.message !== 'message err') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'ReferenceError'){
      throw new Error(`${TAG} name`);
    }
  }
}


export function testTypeError(): void {
  const TAG = 'testTypeError';
  try {
    throw new TypeError('message err');
  } catch (err) {
    if (err.message !== 'message err') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'TypeError') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testAggregateError(): void {
  const TAG = 'testAggregateError';
  try {
    throw new AggregateError([new Error('some error')], 'Hello');
  } catch (err) {
    if (err.message !== 'Hello') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'AggregateError') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testURIError(): void {
  const TAG = 'testURIError';
  try {
    throw new URIError('abc');
  } catch (err) {
    if (err.message !== 'abc') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'URIError') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testSyntaxError(): void {
  const TAG = 'testSyntaxError';
  try {
    throw new SyntaxError('test');
  } catch (err) {
    if (err.message !== 'test') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'SyntaxError') {
      throw new Error(`${TAG} name`);
    }
  }
}


export function testEvalError(): void {
  const TAG = 'testEvalError';
  try {
    throw new EvalError('test');
  } catch (err) {
    if (err.message !== 'test') {
      throw new Error(`${TAG} message`);
    }
    if (err.name !== 'EvalError') {
      throw new Error(`${TAG} name`);
    }
  }
}