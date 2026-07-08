'use static';
/*
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

import { expect } from '@ohos/hypium-binary/src/main/indexStatic';
import {
  readAttrString,
  countChildren,
  systemMaterialStyle,
  hasInspectorTree,
} from './AbnormalInspectorHelper';

/** §2.1：读取目标属性，断言 undefined 实例与默认实例该属性值一致 */
export function assertPropSame(uId: string, dId: string, attr: string, level: 'root' | 'inner'): void {
  let uVal: string = readAttrString(uId, attr, level);
  let dVal: string = readAttrString(dId, attr, level);
  expect(uVal).assertEqual(dVal);
}

export function assertChildrenSame(uId: string, dId: string): void {
  expect(countChildren(uId)).assertEqual(countChildren(dId));
}

export function assertSystemMaterialSame(uId: string, dId: string): void {
  expect(systemMaterialStyle(uId)).assertEqual(systemMaterialStyle(dId));
}

export function assertSmoke(uId: string, dId: string): void {
  expect(hasInspectorTree(uId)).assertTrue();
  expect(hasInspectorTree(dId)).assertTrue();
}
