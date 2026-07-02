'use static';
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

import inspector from '@ohos.arkui.inspector';

function attrToString(attrs: jsonx.JsonElement, attr: string): string {
  let el = attrs.tryGetElement(attr);
  if (!el) {
    return '';
  }
  let jt = el.jsonType;
  if (jt == jsonx.JsonType.JsonString) {
    return el.asString();
  }
  if (jt == jsonx.JsonType.JsonTrue) {
    return 'true';
  }
  if (jt == jsonx.JsonType.JsonFalse) {
    return 'false';
  }
  if (jt == jsonx.JsonType.JsonNumber) {
    return el.asLong().toString();
  }
  return '';
}

function childNodes(node: jsonx.JsonElement): jsonx.JsonElement[] {
  let kids = node.tryGetArray('$children');
  return kids ? kids : [];
}

function nodeId(node: jsonx.JsonElement): string {
  let topId = node.tryGetElement('$ID');
  if (topId) {
    let jt = topId.jsonType;
    if (jt == jsonx.JsonType.JsonString) {
      return topId.asString();
    }
    if (jt == jsonx.JsonType.JsonNumber) {
      return topId.asLong().toString();
    }
  }
  let attrs = node.tryGetElement('$attrs');
  if (!attrs) {
    return '';
  }
  let idEl = attrs.tryGetElement('id');
  if (idEl) {
    return idEl.asString();
  }
  return '';
}

function findNodeById(node: jsonx.JsonElement, targetId: string): jsonx.JsonElement | null {
  if (nodeId(node) === targetId) {
    return node;
  }
  let kids = childNodes(node);
  let len = kids.length;
  for (let i = 0; i < len; i++) {
    let hit = findNodeById(kids[i], targetId);
    if (hit) {
      return hit;
    }
  }
  return null;
}

function parseNode(id: string): jsonx.JsonElement {
  let raw: string = inspector.getInspectorByKey(id);
  if (raw.length > 0) {
    return JSON.parseJsonElement(raw);
  }
  try {
    return parseFromTree(id);
  } catch (_treeErr) {
    throw new Error(`inspector empty for id=${id}`);
  }
}

function parseFromTree(id: string): jsonx.JsonElement {
  let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
  let hit = findNodeById(tree, id);
  if (!hit) {
    throw new Error(`inspector empty for id=${id}`);
  }
  return hit;
}

function innerLeafAttrs(id: string): jsonx.JsonElement {
  let cur = parseNode(id);
  for (let i = 0; i < 6; i++) {
    let kids = childNodes(cur);
    if (kids.length === 0) {
      break;
    }
    cur = kids[0];
  }
  let attrs = cur.tryGetElement('$attrs');
  if (attrs) {
    return attrs;
  }
  return cur;
}

function findAttrsInNode(node: jsonx.JsonElement, attr: string) {
  let attrs = node.tryGetElement('$attrs');
  if (attrs && attrToString(attrs, attr) !== '') {
    return attrs;
  }
  let kids = childNodes(node);
  let len = kids.length;
  for (let j = 0; j < len; j++) {
    let found = findAttrsInNode(kids[j], attr);
    if (found) {
      return found;
    }
  }
  return null;
}

export function readAttrString(id: string, attr: string, level: 'root' | 'inner'): string {
  let node = parseNode(id);
  if (level === 'root') {
    let attrs = node.tryGetElement('$attrs');
    if (attrs) {
      return attrToString(attrs, attr);
    }
    return '';
  }
  let found = findAttrsInNode(node, attr);
  if (found) {
    return attrToString(found, attr);
  }
  return attrToString(innerLeafAttrs(id), attr);
}

export function countChildren(id: string): number {
  return childNodes(parseNode(id)).length;
}

export function hasInspectorTree(id: string): boolean {
  let raw: string = inspector.getInspectorByKey(id);
  if (raw.length > 0 && raw.indexOf('$attrs') >= 0) {
    return true;
  }
  try {
    parseFromTree(id);
    return true;
  } catch (_e) {
    return false;
  }
}
