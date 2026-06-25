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

export function parseInspector(id: string): ESObject {
  return JSON.parse(getInspectorByKey(id)) as ESObject;
}

export function chipRootAttrs(id: string): ESObject {
  return parseInspector(id).$attrs as ESObject;
}

export function chipRootAttr(id: string, attr: string): string {
  return String(chipRootAttrs(id)[attr]);
}

/** 沿首子节点下探，读取 fontSize/padding 等内层 attrs */
export function chipInnerLeafAttrs(id: string): ESObject {
  let cur: ESObject = parseInspector(id);
  for (let i = 0; i < 6; i++) {
    let kids: ESObject[] = cur.$children as ESObject[];
    if (!kids || kids.length === 0) {
      break;
    }
    cur = kids[0];
  }
  return cur.$attrs as ESObject;
}

export function findAttrsWithKey(id: string, attr: string): ESObject | null {
  let root: ESObject = parseInspector(id);
  let queue: ESObject[] = [root];
  let head: number = 0;
  while (head < queue.length) {
    let node: ESObject = queue[head];
    head++;
    let attrs: ESObject = node.$attrs as ESObject;
    if (attrs && attrs[attr] !== undefined) {
      return attrs;
    }
    let kids: ESObject[] = node.$children as ESObject[];
    if (kids) {
      for (let i = 0; i < kids.length; i++) {
        queue.push(kids[i]);
      }
    }
  }
  return null;
}

export function readAttr(id: string, attr: string, level: 'root' | 'inner'): ESObject {
  if (level === 'root') {
    return chipRootAttrs(id);
  }
  let found: ESObject | null = findAttrsWithKey(id, attr);
  if (found) {
    return found;
  }
  return chipInnerLeafAttrs(id);
}

export function countChildren(id: string): number {
  let kids: ESObject[] = parseInspector(id).$children as ESObject[];
  return kids ? kids.length : 0;
}

export function systemMaterialStyle(id: string): string {
  let attrs: ESObject = chipRootAttrs(id);
  if (attrs.systemMaterial) {
    return String(attrs.systemMaterial.material.immersiveOptions.style);
  }
  let inner: ESObject = chipInnerLeafAttrs(id);
  if (inner.systemMaterial) {
    return String(inner.systemMaterial.material.immersiveOptions.style);
  }
  return '';
}
