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

import { BusinessError } from '@kit.BasicServicesKit';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor as utd } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

/** 仅在被 UEC 用例动态 import 时加载，避免 ShareKit 拖垮整页路由。 */
export async function showSystemShare(uiContext: UIContext): Promise<void> {
  let shareData: systemShare.SharedData = new systemShare.SharedData({
    utd: utd.UniformDataType.TEXT,
    content: '这是一段文本内容'
  });
  let controller: systemShare.ShareController = new systemShare.ShareController(shareData);
  let context: common.UIAbilityContext = uiContext.getHostContext() as common.UIAbilityContext;
  await controller.show(context, {
    selectionMode: systemShare.SelectionMode.SINGLE,
    previewMode: systemShare.SharePreviewMode.DETAIL,
  });
}

export function logShareError(error: BusinessError): void {
  console.error(`ShareController show error. code: ${error.code}, message: ${error.message}`);
}
