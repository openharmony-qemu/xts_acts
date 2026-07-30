/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import componentRect from '@ohos.arkui.componentUtils'
import { RectValue } from '../MainAbility/common/Utils';

export interface InspectorBlurStyle {
  value: string;
}

export interface InspectorSize {
  width: string;
  height: string;
}

export interface InspectorAttrs {
  id?: string;
  content?: string;
  src?: string;
  systemMaterial?: Object | null;
  borderRadius?: Object;
  accessibilityLevel?: string;
  accessibilityDescription?: string;
  accessibilityText?: string;
  backgroundColor?: string;
  padding?: string;
  fontColor?: string;
  backgroundBlurStyle: InspectorBlurStyle;
  fontSize?: string;
  fontWeight?: string;
  size: InspectorSize;
}

export interface InspectorNode {
  $type?: string;
  $attrs: InspectorAttrs;
  $children?: InspectorNode[];
}

export default class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static sleep(time: number) {
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string) {
    let strJson: string = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    Utils.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0]
    Utils.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1]
    Utils.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0]
    Utils.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1]
    return Utils.rect_value = {
      left: Utils.rect_left, top: Utils.rect_top, right: Utils.rect_right, bottom: Utils.rect_bottom
    }
  }

  static async swipe(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to swipe')
    Utils.drags(downX, downY, upX, upY, steps, false)
  }

  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
    Utils.drags(downX, downY, upX, upY, steps, true)
  }

  static async drags(downX: number, downY: number, upX: number, upY: number, steps: number, drag: boolean) {
    let xStep: number;
    let yStep: number;
    let swipeSteps: number;
    let ret: boolean;
    xStep = 0;
    yStep = 0;
    ret = false;
    swipeSteps = steps;
    if (swipeSteps == 0) {
      swipeSteps = 1;
    }
    xStep = (upX - downX) / swipeSteps;
    yStep = (upY - downY) / swipeSteps;
    console.info('move step is: ' + 'xStep: ' + xStep + '    yStep: ' + yStep)
    let downPonit: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      type: TouchType.Down,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('down touch started: ' + JSON.stringify(downPonit))
    sendTouchEvent(downPonit);
    console.info('start to move')
    if (drag) {
      await Utils.sleep(500)
    }
    for (let i = 1; i <= swipeSteps; i++) {
      let movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        type: TouchType.Move,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      await Utils.sleep(5)
    }
    console.info('start to up')
    if (drag) {
      await Utils.sleep(100)
    }
    let upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      type: TouchType.Up,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    await Utils.sleep(500)
  }

  static parseInspectorRoot(): InspectorNode {
    const raw: ESObject = getInspectorTree() as ESObject;
    if (raw === null || raw === undefined) {
      return { $attrs: Utils.emptyAttrs() };
    }
    if (typeof raw === 'string') {
      const text: string = raw as string;
      if (text.length === 0 || text.indexOf('Empty Text') >= 0) {
        return { $attrs: Utils.emptyAttrs() };
      }
      try {
        return Utils.normalizeInspectorNode(JSON.parse(text) as InspectorNode);
      } catch (_e) {
        return { $attrs: Utils.emptyAttrs() };
      }
    }
    return Utils.normalizeInspectorNode(raw as InspectorNode);
  }

  static resolveEnableStateAnimationAttr(
    componentKey: string, mirrorKey: string, tag: string
  ): boolean | undefined {
    let strJson: string = getInspectorByKey(componentKey);
    console.info(`[${tag}] getInspectorByKey(${componentKey}) len=${strJson.length}`);
    let fromTree: boolean | undefined = undefined;
    if (strJson.length > 0 && strJson.indexOf('Empty Text') < 0) {
      fromTree = Utils.parseEnableStateInKeyJson(strJson);
    }
    let source: string = 'subtree_$attrs.enableStateAnimation';
    if (fromTree === undefined) {
      fromTree = Utils.parseMirrorBoolFromKey(mirrorKey);
      source = 'FALLBACK:mirror_Text.content';
      console.info(`[${tag}] ${source} value=${fromTree}`);
    } else {
      console.info(`[${tag}] ${source} value=${fromTree}`);
    }
    return fromTree;
  }

  static parseEnableStateInKeyJson(strJson: string): boolean | undefined {
    if (!strJson || strJson.indexOf('Empty Text') >= 0) {
      return undefined;
    }
    try {
      return Utils.findEnableStateInRecord(JSON.parse(strJson) as Record<string, ESObject>);
    } catch (_e) {
      return undefined;
    }
  }

  static parseMirrorBoolFromKey(mirrorKey: string): boolean | undefined {
    const strJson: string = getInspectorByKey(mirrorKey);
    if (!strJson || strJson.trim() === '' || strJson.indexOf('Empty Text') >= 0) {
      return undefined;
    }
    try {
      const root: Record<string, ESObject> = JSON.parse(strJson) as Record<string, ESObject>;
      const attrsHolder: ESObject | undefined = root['$attrs'] as ESObject | undefined;
      if (!attrsHolder) {
        return undefined;
      }
      const raw: ESObject | undefined = (attrsHolder as Record<string, ESObject>)['content'];
      return Utils.normalizeMirrorContentBool(raw);
    } catch (_e) {
      return undefined;
    }
  }

  private static normalizeMirrorContentBool(raw: ESObject | undefined): boolean | undefined {
    if (typeof raw !== 'string') {
      return undefined;
    }
    if (raw === '1' || raw === 'true') {
      return true;
    }
    if (raw === '0' || raw === 'false') {
      return false;
    }
    return undefined;
  }

  static navigateInspectorPath(tag: string, indices: number[]): InspectorNode {
    const root: InspectorNode = Utils.parseInspectorRoot();
    return Utils.normalizeInspectorNode(Utils.walkInspector(tag, root, indices));
  }

  static findContentInRoot(expected: string): string | undefined {
    return Utils.findContentInNode(Utils.parseInspectorRoot(), expected);
  }

  private static findContentInNode(node: InspectorNode, expected: string): string | undefined {
    if (node.$attrs.content === expected) {
      return node.$attrs.content;
    }
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids) {
      return undefined;
    }
    for (let i: number = 0; i < kids.length; i++) {
      const hit: string | undefined = Utils.findContentInNode(kids[i], expected);
      if (hit !== undefined) {
        return hit;
      }
    }
    return undefined;
  }

  static navigateFromNode(tag: string, start: InspectorNode, indices: number[]): InspectorNode {
    return Utils.normalizeInspectorNode(Utils.walkInspector(tag, start, indices));
  }

  static logInspectorRootOutline(tag: string, maxDepth: number): void {
    const root: InspectorNode = Utils.parseInspectorRoot();
    Utils.logNodeOutline(root, tag, 0, maxDepth, 'root');
  }

  private static emptyAttrs(): InspectorAttrs {
    return {
      backgroundBlurStyle: { value: '' },
      size: { width: '', height: '' },
    };
  }

  private static normalizeInspectorNode(node: InspectorNode | undefined | null): InspectorNode {
    if (!node) {
      return { $attrs: Utils.emptyAttrs() };
    }
    const attrs: InspectorAttrs = node.$attrs ?? Utils.emptyAttrs();
    if (!attrs.backgroundBlurStyle) {
      attrs.backgroundBlurStyle = { value: '' };
    }
    if (!attrs.size) {
      attrs.size = { width: '', height: '' };
    }
    node.$attrs = attrs;
    return node;
  }

  private static walkInspector(tag: string, start: InspectorNode, indices: number[]): InspectorNode {
    console.info(`[InspectorDebug][${tag}] start ${Utils.nodeBrief(start)}`);
    let node: InspectorNode = start;
    let pathStr = 'root';
    for (let i = 0; i < indices.length; i++) {
      const idx: number = indices[i];
      const next: InspectorNode | null = Utils.childAt(node, idx);
      if (!next) {
        console.error(
          `[InspectorDebug][${tag}] FAIL step=${i} path=${pathStr} idx=${idx} len=${Utils.childCount(node)}`
        );
        Utils.logChildrenBrief(node, `${tag}_fail_step${i}`);
        return node;
      }
      node = next;
      pathStr += `.$children[${idx}]`;
      console.info(`[InspectorDebug][${tag}] step ${i}: ${pathStr} ${Utils.nodeBrief(node)}`);
    }
    console.info(`[InspectorDebug][${tag}] target attrs=${JSON.stringify(node.$attrs)}`);
    return node;
  }

  private static logNodeOutline(
    node: InspectorNode, tag: string, depth: number, maxDepth: number, path: string
  ): void {
    if (depth > maxDepth) {
      return;
    }
    console.info(`[InspectorDebug][${tag}] ${path} ${Utils.nodeBrief(node)}`);
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids) {
      return;
    }
    for (let i = 0; i < kids.length; i++) {
      Utils.logNodeOutline(kids[i], tag, depth + 1, maxDepth, `${path}.$children[${i}]`);
    }
  }

  static childCount(node: InspectorNode | undefined | null): number {
    if (!node || !node.$children) {
      return -1;
    }
    return node.$children.length;
  }

  private static childAt(node: InspectorNode | undefined | null, index: number): InspectorNode | null {
    if (!node) {
      return null;
    }
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids || index >= kids.length || index < 0) {
      return null;
    }
    const child: InspectorNode | undefined = kids[index];
    if (!child) {
      return null;
    }
    return child;
  }

  static nodeBrief(node: InspectorNode | undefined | null): string {
    if (!node) {
      return 'type=? id= children=-1';
    }
    const id: string = node.$attrs.id ?? '';
    return `type=${node.$type ?? '?'} id=${id} children=${Utils.childCount(node)}`;
  }

  static logChildrenBrief(node: InspectorNode | undefined | null, tag: string): void {
    if (!node) {
      console.info(`[InspectorDebug][${tag}] node is null`);
      return;
    }
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids) {
      console.info(`[InspectorDebug][${tag}] no $children`);
      return;
    }
    const limit = Math.min(kids.length, 12);
    for (let i = 0; i < limit; i++) {
      const child: InspectorNode | undefined = kids[i];
      if (!child) {
        console.info(`[InspectorDebug][${tag}]   [${i}] <undefined>`);
        continue;
      }
      console.info(`[InspectorDebug][${tag}]   [${i}] ${Utils.nodeBrief(child)}`);
    }
    if (kids.length > limit) {
      console.info(`[InspectorDebug][${tag}]   ... +${kids.length - limit} more`);
    }
  }

  static readEnableStateFromKey(key: string): boolean | undefined {
    const strJson: string = getInspectorByKey(key);
    if (!strJson || strJson.length === 0 || strJson.indexOf('Empty Text') >= 0) {
      return undefined;
    }
    try {
      return Utils.findEnableStateInRecord(JSON.parse(strJson) as Record<string, ESObject>);
    } catch (_e) {
      return undefined;
    }
  }

  static findEnableStateInRoot(): boolean | undefined {
    const root: InspectorNode = Utils.parseInspectorRoot();
    if (Utils.hasEnableStateTrue(root as Record<string, ESObject>)) {
      return true;
    }
    return Utils.findEnableStateInRecord(root as Record<string, ESObject>);
  }

  static hasEnableStateTrue(node: Record<string, ESObject>): boolean {
    if (Utils.readEnableStateFromAttrs(node) === true) {
      return true;
    }
    const kids: ESObject[] = Utils.getInspectorChildRecords(node);
    for (let i: number = 0; i < kids.length; i++) {
      if (Utils.hasEnableStateTrue(kids[i] as Record<string, ESObject>)) {
        return true;
      }
    }
    return false;
  }

  static findEnableStateInRecord(node: Record<string, ESObject>): boolean | undefined {
    const hit: boolean | undefined = Utils.readEnableStateFromAttrs(node);
    if (hit !== undefined) {
      return hit;
    }
    const kids: ESObject[] = Utils.getInspectorChildRecords(node);
    for (let i: number = 0; i < kids.length; i++) {
      const inner: boolean | undefined =
        Utils.findEnableStateInRecord(kids[i] as Record<string, ESObject>);
      if (inner !== undefined) {
        return inner;
      }
    }
    return undefined;
  }

  private static readEnableStateFromAttrs(node: Record<string, ESObject>): boolean | undefined {
    const attrsHolder: ESObject | undefined = node['$attrs'] as ESObject | undefined;
    if (!attrsHolder) {
      return undefined;
    }
    const attrs: Record<string, ESObject> = attrsHolder as Record<string, ESObject>;
    return Utils.normalizeEnableStateRaw(attrs['enableStateAnimation']);
  }

  private static normalizeEnableStateRaw(raw: ESObject | undefined): boolean | undefined {
    if (raw === undefined || raw === null) {
      return undefined;
    }
    if (typeof raw === 'boolean') {
      return raw;
    }
    if (typeof raw === 'string') {
      if (raw === 'true') {
        return true;
      }
      if (raw === 'false') {
        return false;
      }
    }
    return undefined;
  }

  private static getInspectorChildRecords(node: Record<string, ESObject>): ESObject[] {
    let ch: ESObject | undefined = node['$children'] as ESObject | undefined;
    if (!ch) {
      ch = node['children'] as ESObject | undefined;
    }
    if (!ch) {
      return [];
    }
    if (Array.isArray(ch)) {
      return ch as ESObject[];
    }
    const names: string[] = Object.keys(ch as Record<string, ESObject>);
    const out: ESObject[] = [];
    for (let i: number = 0; i < names.length; i++) {
      const one: ESObject | undefined = (ch as Record<string, ESObject>)[names[i]];
      if (one !== undefined && one !== null && typeof one === 'object') {
        out.push(one);
      }
    }
    return out;
  }
}




