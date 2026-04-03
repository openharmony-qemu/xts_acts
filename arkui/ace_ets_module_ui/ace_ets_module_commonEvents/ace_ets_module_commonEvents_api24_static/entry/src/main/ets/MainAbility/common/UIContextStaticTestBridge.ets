/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { UIContext } from '@ohos.arkui.UIContext';

/** Hypium 与页面树 AppStorage 隔离时，用模块单例把主窗 UIContext 交给静态用例。 */
let mainUIContext: UIContext | undefined = undefined;

export function setMainUIContextForStaticTest(ctx: UIContext): void {
  mainUIContext = ctx;
}

export function getMainUIContextForStaticTest(): UIContext | undefined {
  return mainUIContext;
}
