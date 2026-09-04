'use static';
/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from './Util.test';

type targetType = string | int | boolean | null | undefined;

export default async function waitForAssert<T extends targetType>(
  stateGetter: () => T,
  testsuite: string,
  expectValue: T,
  eventId: Long,
  interval: int = 300,
  tryTime: int = 20
): Promise<Awaited<T>> {
  let nums = 0;
  let isSuccess = false;
  while (nums < tryTime) {
    const tempValue = await new Promise<T>((resolve) => {
      setTimeout(() => resolve(stateGetter()), interval);
    })
    let currentValue = tempValue;
    console.log(testsuite + ' waitForAssert ' + nums + ' times, currentValue:' + currentValue
      + ', expectValue:' + expectValue);
    if (currentValue == expectValue) {
      console.log(testsuite + ' waitForAssert success');
      isSuccess = true;
      await Utils.emitEvent(expectValue as boolean | string | number | object, eventId);
      return currentValue;
    }
    nums++;
  }
  if (!isSuccess) {
    console.log(testsuite + ' waitForAssert failed');
  }
  const currentValue = await new Promise<T>((result) => {
    setTimeout(() => result(stateGetter()), interval);
  });
  console.log(testsuite + ' waitForAssert final, currentValue:' + currentValue);
  await Utils.emitEvent(currentValue as boolean | string | number | object, eventId);
  return currentValue;
}
