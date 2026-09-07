'use static';

/*
 * Copyright (c) 2026 RKH Corp.
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
import { timeoutDemo2 } from './TimeoutFunc2';
import { periodicTaskInner } from './TimeoutFuncList';


export async function level3Task(): Promise<number> {

  let result = await taskpool.execute(new taskpool.Task(timeoutDemo2, 100.0), { timeout: 5000 }) as number;
  return result;
}


export async function nestPeriodicTaskInner(): Promise<number> {
  let innerTask = new taskpool.Task(periodicTaskInner);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 500 }).then((res) => {
    data = res as number;
    console.log('periodicTaskInner then')
  }).catch((e: Error) => {
    console.log('periodicTaskInner catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}