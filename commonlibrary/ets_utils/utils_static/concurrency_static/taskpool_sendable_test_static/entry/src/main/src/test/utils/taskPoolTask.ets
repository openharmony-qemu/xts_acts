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

async function testFailed(args: number): Promise<Map<string, number>> {
  await new Promise<void>((resolve, reject): void => { setTimeout((): void => { resolve(undefined) }, 100) });
  throw new Error('This is a deliberate failure for testing purposes');
  let hashMap1: Map<string, number> = new Map<string, number>();
  hashMap1.set('a', args);
  return hashMap1;
}

function inspectStatus(arg: number): number {
  if (taskpool.Task.isCanceled()) {
    return arg + 2;
  }
  return arg + 1;
}

function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

function waitForRunner(finalString: string): string {
  return finalString;
}

function printArgs(args: number): number {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  console.info('printArgs: ' + args);
  return args;
}

export {
  testFailed, inspectStatus, additionDelay, waitForRunner, printArgs, }
