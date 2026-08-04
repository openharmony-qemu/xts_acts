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

class BigIntConverter {
  public value: bigint;
  constructor(input: number) {
    if (input < 0 || !Number.isInteger(input)) {
      throw new Error('Input must be a positive integer');
    }
    this.value = BigInt(input);
  }
}
export function testBigIntPositive(): void {
  const TAG = 'testBigIntPositive';
  try {
    const caseName = 'BuiltinsConstructorTest0100';
    console.info(`${caseName} test start`);
    let input: int = 123;
    let converterInstance: BigIntConverter;
    let resultValue: boolean;


    converterInstance = new BigIntConverter(input);
    resultValue = converterInstance.value === 123n;
    console.log(`input: ${input}`);
    console.log(`resultValue: ${resultValue}`);
    if (!resultValue){
      throw new Error(`${TAG} expect 123n`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}