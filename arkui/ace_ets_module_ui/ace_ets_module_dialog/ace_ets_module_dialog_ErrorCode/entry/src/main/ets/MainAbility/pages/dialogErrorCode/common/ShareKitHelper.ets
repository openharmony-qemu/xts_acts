/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import picker from '@ohos.file.picker';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

/** OpenHarmony CI 无 @kit.ShareKit：用 DocumentViewPicker 拉起系统面板模拟 UEC 前置态。 */
export async function showSystemShare(uiContext: UIContext): Promise<void> {
  let context: common.UIAbilityContext = uiContext.getHostContext() as common.UIAbilityContext;
  showDocumentPicker(context);
}

function showDocumentPicker(context: common.UIAbilityContext): void {
  let docPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker(context);
  docPicker.select().then(() => {
    console.info('DocumentViewPicker select finished.');
  }).catch((error: BusinessError) => {
    console.error(`DocumentViewPicker error. code: ${error.code}, message: ${error.message}`);
  });
}

export function logShareError(error: BusinessError): void {
  console.error(`UEC overlay error. code: ${error.code}, message: ${error.message}`);
}
