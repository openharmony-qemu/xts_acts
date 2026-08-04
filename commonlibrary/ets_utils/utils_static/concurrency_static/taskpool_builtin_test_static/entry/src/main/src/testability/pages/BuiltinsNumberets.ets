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

export function builtinsNumberConstructorTest0200(): void {
  let TAG='builtinsNumberConstructorTest0200'
  try {
    let numObj = new Number();
    console.log(`${numObj}`);
    if(JSON.stringify(0) !== JSON.stringify(numObj)){
      throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(0)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function builtinsNumberIsFiniteTest0100(): void {
  let TAG='builtinsNumberIsFiniteTest0100'
  try {
    const num = Number.isFinite(0);
    console.log(`${num}`)
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function builtinsNumberIsIntegerTest0100(): void {
  let TAG='builtinsNumberIsIntegerTest0100'
  try {
    const num = Number.isInteger(0);
    console.log(`${num}`);
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

export function builtinsNumberIsSafeIntegerTest0100(): void {
  let TAG='builtinsNumberIsSafeIntegerTest0100'
  try {
    const num = Number.isSafeInteger(3);
    console.log(`${num}`);
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

export function builtinsNumberParseTest0100(): void {
  let TAG='builtinsNumberParseTest0100'
  try {
    const num = Number.parseFloat('3');
    console.log(`${num}`);
    if(num.toString() !== '3'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function builtinsNumberPropertyTest0100(): void {
  let TAG='builtinsNumberPropertyTest0100'
  try {
    const num1 = Number.EPSILON;
    console.log(`${num1}`);
    if(num1.toString() !== '2.220446049250313e-16'){
      throw new Error(`${TAG} value.toString() invalid: ${num1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function builtinsNumberPrototypeTest0100(): void {
  let TAG='builtinsNumberPrototypeTest0100'
  try {
    const num = 77.1234;
    const exponentialStr1 = num.toExponential();
    if(exponentialStr1.toString() !== '7.71234e+1'){
      throw new Error(`${TAG} value.toString() invalid: ${exponentialStr1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
