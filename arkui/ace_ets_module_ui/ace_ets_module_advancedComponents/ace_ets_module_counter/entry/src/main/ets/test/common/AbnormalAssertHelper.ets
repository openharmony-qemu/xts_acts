/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { expect } from '@ohos/hypium';
import {
  parseInspector,
  readAttr,
  countChildren,
} from '../../MainAbility/common/AbnormalInspectorHelper';

type InspectorNode = Record<string, ESObject>;

function attrsAt(id: string, attr: string, level: 'root' | 'inner'): InspectorNode {
  return readAttr(id, attr, level);
}

export function assertPropSame(uId: string, dId: string, attr: string, level: 'root' | 'inner'): void {
  let uAttrs: InspectorNode = attrsAt(uId, attr, level);
  let dAttrs: InspectorNode = attrsAt(dId, attr, level);
  expect(uAttrs[attr]).not().assertUndefined();
  expect(JSON.stringify(uAttrs[attr])).assertEqual(JSON.stringify(dAttrs[attr]));
}

export function assertChildrenSame(uId: string, dId: string): void {
  expect(countChildren(uId)).assertEqual(countChildren(dId));
}

export function assertSmoke(uId: string, dId: string): void {
  expect(JSON.stringify(parseInspector(uId))).assertContain('$attrs');
  expect(JSON.stringify(parseInspector(dId))).assertContain('$attrs');
}
