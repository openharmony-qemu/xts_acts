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

type InspectorAttrs = Record<string, Object>;
type InspectorNode = Record<string, Object>;

function asRecord(value: Object | undefined): Record<string, Object> | undefined {
  if (!value) {
    return undefined;
  }
  return value as Record<string, Object>;
}

function asNodeList(value: Object | undefined): InspectorNode[] {
  if (!value) {
    return [];
  }
  return value as InspectorNode[];
}

function nestedSystemMaterialStyle(attrs: InspectorAttrs): string {
  let sm = asRecord(attrs['systemMaterial']);
  if (!sm) {
    return '';
  }
  let material = asRecord(sm['material']);
  if (!material) {
    return '';
  }
  let options = asRecord(material['immersiveOptions']);
  if (!options) {
    return '';
  }
  return String(options['style']);
}

export function parseInspector(id: string): InspectorNode {
  return JSON.parse(getInspectorByKey(id)) as InspectorNode;
}

export function chipRootAttrs(id: string): InspectorAttrs {
  return parseInspector(id)['$attrs'] as InspectorAttrs;
}

export function chipRootAttr(id: string, attr: string): string {
  return String(chipRootAttrs(id)[attr]);
}

/** 沿首子节点下探，读取 fontSize/padding 等内层 attrs */
export function chipInnerLeafAttrs(id: string): InspectorAttrs {
  let cur: InspectorNode = parseInspector(id);
  for (let i = 0; i < 6; i++) {
    let kids = asNodeList(cur['$children']);
    if (kids.length === 0) {
      break;
    }
    cur = kids[0];
  }
  return cur['$attrs'] as InspectorAttrs;
}

export function findAttrsWithKey(id: string, attr: string): InspectorAttrs | null {
  let root: InspectorNode = parseInspector(id);
  let queue: InspectorNode[] = [root];
  let head: number = 0;
  while (head < queue.length) {
    let node: InspectorNode = queue[head];
    head++;
    let attrs = asRecord(node['$attrs']);
    if (attrs && attrs[attr] !== undefined) {
      return attrs;
    }
    let kids = asNodeList(node['$children']);
    for (let i = 0; i < kids.length; i++) {
      queue.push(kids[i]);
    }
  }
  return null;
}

export function readAttr(id: string, attr: string, level: 'root' | 'inner'): InspectorAttrs {
  if (level === 'root') {
    return chipRootAttrs(id);
  }
  let found: InspectorAttrs | null = findAttrsWithKey(id, attr);
  if (found) {
    return found;
  }
  return chipInnerLeafAttrs(id);
}

export function countChildren(id: string): number {
  return asNodeList(parseInspector(id)['$children']).length;
}

export function systemMaterialStyle(id: string): string {
  let rootStyle = nestedSystemMaterialStyle(chipRootAttrs(id));
  if (rootStyle !== '') {
    return rootStyle;
  }
  return nestedSystemMaterialStyle(chipInnerLeafAttrs(id));
}
