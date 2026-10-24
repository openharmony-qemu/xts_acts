'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { GetTime, sleep as Sleep } from './arkTSUtilsCommon';

export async function sharedTaskTime(lockName: string): Promise<number[]> {
  let res: number[] = [];
  let lock: AsyncLock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
    res.push(GetTime());
  }, AsyncLockMode.SHARED)
  return res;
}

export async function exclusiveTimeTask(lockName: string): Promise<number[]> {
  let res: number[] = [];
  let lock: AsyncLock = AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(AsyncLockMode.EXCLUSIVE);
    res.push(GetTime());
    await Sleep(500);
  }, AsyncLockMode.EXCLUSIVE);
  return res;
}

export async function locksTimeTask(lock: AsyncLock,
  mode: AsyncLockMode): Promise<number[]> {
  let res: number[] = [];
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
    res.push(GetTime());
  }, mode)
  return res;
}

export async function sharedOverlapCheckTask(lockName: string): Promise<boolean> {
  let lock: AsyncLock = AsyncLock.request(lockName);
  let firstIn: boolean = false;
  let secondIn: boolean = false;
  let firstSawSecond: boolean = false;
  let secondSawFirst: boolean = false;
  const firstJob: Promise<void> = lock.lockAsync(async (): Promise<void> => {
    firstIn = true;
    const deadline: number = GetTime() + 10000;
    while (!firstSawSecond && GetTime() < deadline) {
      await Sleep(50);
      firstSawSecond = secondIn;
    }
  }, AsyncLockMode.SHARED);
  const secondJob: Promise<void> = lock.lockAsync(async (): Promise<void> => {
    secondIn = true;
    const deadline: number = GetTime() + 10000;
    while (!secondSawFirst && GetTime() < deadline) {
      await Sleep(50);
      secondSawFirst = firstIn;
    }
  }, AsyncLockMode.SHARED);
  await Promise.all([firstJob, secondJob]);
  return firstSawSecond && secondSawFirst;
}
