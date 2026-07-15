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

/**
 * 历史：曾用 DocumentViewPicker 模拟系统 UEC 前置态。
 * 门禁机上 FilePickerUIExtAbility 退出后 UiTest FindWidgets 永久失联，污染后续全部 Suite。
 * 自动化路径禁止再拉系统 FilePicker / UIExtension；103306 系统 UEC 改为手工场景说明。
 */
export function noteUecAutomationPolicy(): void {
  console.info('[ARKUI_DYN] UEC automation: no DocumentViewPicker / system UIExtension');
}
