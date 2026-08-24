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

import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, time)
  })
}

function emitEvent<T>(actualValue: T, eventId: Long): void {
  try {
    let backData: events_emitter.EventData = {
      data: {
        'ACTION': actualValue as RecordData
      }
    };
    let backEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info('waitForAssert emit err: ' + JSON.stringify(err));
  }
}

export async function waitForAssert<T, U>(
  stateGetter: () => T,
  check: (v1: T, v2: U) => boolean,
  expectValue: U,
  eventId: Long,
  testsuite: string,
  interval: int = 300,
  tryTime: int = 20): Promise<T> {
  let nums = 0;
  let isSuccess = false;
  while (nums < tryTime) {
    const currentValue = stateGetter();
    console.log(testsuite + ' waitForAssert ' + nums + ' times, currentValue:' + currentValue
      + ', expectValue:' + expectValue);
    if (check(currentValue, expectValue)) {
      console.log(testsuite + ' waitForAssert success ' + nums + ' times');
      isSuccess = true;
      emitEvent(expectValue, eventId);
      return currentValue;
    }
    nums++;
    await sleep(interval);
  }
  if (!isSuccess) {
    console.log(testsuite + ' waitForAssert failed');
  }
  const currentValue = stateGetter();
  console.log(testsuite + ' waitForAssert final, currentValue:' + currentValue + ', expectValue:' + expectValue);
  emitEvent(currentValue, eventId);
  return currentValue;
}
