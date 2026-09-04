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

/** 补充辅助：返回 API 真实语义值，供新建补充用例使用；不改动原 TaskpoolMethods。 */

export function taskpoolGetUidForName(uname: string): Promise<number> {
  return new Promise<number>((resolve, reject) => {
    try {
      const processManager = new StdProcess.ProcessManager();
      const result: number = processManager.getUidForName(uname);
      console.info(`taskpoolGetUidForName success, uid: ${result}`);
      resolve(result);
    } catch (error) {
      if (error instanceof Error) {
        console.error(`taskpoolGetUidForName exception: ${error.message}`);
        reject(error);
      } else {
        console.error('taskpoolGetUidForName exception: non-Error value');
        reject(new Error('taskpoolGetUidForName failed'));
      }
    }
  });
}

export function taskpoolGetEnvironmentVar(name: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    try {
      const processManager = new StdProcess.ProcessManager();
      const result: string = processManager.getEnvironmentVar(name);
      console.info(`taskpoolGetEnvironmentVar success, length: ${result.length}`);
      resolve(result);
    } catch (error) {
      if (error instanceof Error) {
        console.error(`taskpoolGetEnvironmentVar exception: ${error.message}`);
        reject(error);
      } else {
        console.error('taskpoolGetEnvironmentVar exception: non-Error value');
        reject(new Error('taskpoolGetEnvironmentVar failed'));
      }
    }
  });
}
