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

type InspectorNode = Record<string, ESObject>;

export function parseInspector(id: string): InspectorNode {
  return JSON.parse(getInspectorByKey(id)) as InspectorNode;
}

export function counterRootAttrs(id: string): InspectorNode {
  return parseInspector(id)['$attrs'] as InspectorNode;
}

export function counterInnerLeafAttrs(id: string): InspectorNode {
  let cur: InspectorNode = parseInspector(id);
  for (let i = 0; i < 8; i++) {
    let kids: InspectorNode[] = cur['$children'] as InspectorNode[];
    if (kids === undefined || kids.length === 0) {
      break;
    }
    cur = kids[0];
  }
  return cur['$attrs'] as InspectorNode;
}

export function findAttrsWithKey(id: string, attr: string): InspectorNode | null {
  let root: InspectorNode = parseInspector(id);
  let queue: InspectorNode[] = [root];
  let head: number = 0;
  while (head < queue.length) {
    let node: InspectorNode = queue[head];
    head++;
    let attrs: InspectorNode = node['$attrs'] as InspectorNode;
    if (attrs !== undefined && attrs[attr] !== undefined) {
      return attrs;
    }
    let kids: InspectorNode[] = node['$children'] as InspectorNode[];
    if (kids !== undefined) {
      for (let i = 0; i < kids.length; i++) {
        queue.push(kids[i]);
      }
    }
  }
  return null;
}

export function readAttr(id: string, attr: string, level: 'root' | 'inner'): InspectorNode {
  if (level === 'root') {
    return counterRootAttrs(id);
  }
  let found: InspectorNode | null = findAttrsWithKey(id, attr);
  if (found !== null) {
    return found;
  }
  return counterInnerLeafAttrs(id);
}

export function countChildren(id: string): number {
  let kids: InspectorNode[] = parseInspector(id)['$children'] as InspectorNode[];
  return kids !== undefined ? kids.length : 0;
}
