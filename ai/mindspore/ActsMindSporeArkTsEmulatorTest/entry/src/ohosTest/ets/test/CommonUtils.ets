/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';

export async function copyRawfileToSandbox(
  context: common.Context,
  sandboxDir: string,
  fileNames: string[],
): Promise<void> {
  for (let i = 0; i < fileNames.length; i++) {
    let name: string = fileNames[i];
    let targetPath: string = sandboxDir + name;
    try {
      let buffer: Uint8Array = await context.resourceManager.getRawFileContent(name);
      let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, buffer.buffer);
      fs.closeSync(file);
      console.log("[rawfile_copy_to_sandbox] " + name + " is copy success");
    } catch (e) {
      console.log("[rawfile_copy_to_sandbox] " + name + " is copy failed: " + JSON.stringify(e));
    }
  }
}
