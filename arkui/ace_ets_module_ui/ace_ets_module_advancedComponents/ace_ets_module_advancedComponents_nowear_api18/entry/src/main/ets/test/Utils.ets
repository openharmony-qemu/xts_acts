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

  static navigateInspectorPath(tag: string, indices: number[]): InspectorNode {
    const root: InspectorNode = Utils.normalizeInspectorNode(
      JSON.parse(JSON.stringify(getInspectorTree())) as InspectorNode
    );
    return Utils.normalizeInspectorNode(Utils.walkInspector(tag, root, indices));
  }

  static navigateFromNode(tag: string, start: InspectorNode, indices: number[]): InspectorNode {
    return Utils.normalizeInspectorNode(Utils.walkInspector(tag, start, indices));
  }

  static logInspectorRootOutline(tag: string, maxDepth: number): void {
    const root: InspectorNode = Utils.normalizeInspectorNode(
      JSON.parse(JSON.stringify(getInspectorTree())) as InspectorNode
    );
    Utils.logNodeOutline(root, tag, 0, maxDepth, 'root');
  }

  private static emptyAttrs(): InspectorAttrs {
    return {
      backgroundBlurStyle: { value: '' },
      size: { width: '', height: '' },
    };
  }

  private static normalizeInspectorNode(node: InspectorNode): InspectorNode {
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

  static childCount(node: InspectorNode): number {
    if (!node.$children) {
      return -1;
    }
    return node.$children.length;
  }

  private static childAt(node: InspectorNode, index: number): InspectorNode | null {
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids || index >= kids.length) {
      return null;
    }
    return kids[index];
  }

  static nodeBrief(node: InspectorNode): string {
    const id: string = node.$attrs.id ?? '';
    return `type=${node.$type ?? '?'} id=${id} children=${Utils.childCount(node)}`;
  }

  static logChildrenBrief(node: InspectorNode, tag: string): void {
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids) {
      console.info(`[InspectorDebug][${tag}] no $children`);
      return;
    }
    const limit = Math.min(kids.length, 12);
    for (let i = 0; i < limit; i++) {
      console.info(`[InspectorDebug][${tag}]   [${i}] ${Utils.nodeBrief(kids[i])}`);
    }
    if (kids.length > limit) {
      console.info(`[InspectorDebug][${tag}]   ... +${kids.length - limit} more`);
    }
  }
}




