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
import RectValue from './Rect';

interface MaterialDetail {
  type?: string;
  style?: string;
}

interface SystemMaterialInfo {
  material?: MaterialDetail;
}

interface InspectorAttrs {
  id?: string;
  systemMaterial?: SystemMaterialInfo;
}

interface InspectorNode {
  $type?: string;
  $attrs?: InspectorAttrs;
  $children?: InspectorNode[];
}

export default class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

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

  static sleep(time: number) {
    return new Promise<string>((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getDialogSystemMaterialType(logTag: string): string {
    const root: InspectorNode = JSON.parse(JSON.stringify(getInspectorTree())) as InspectorNode;
    Utils.logInspectorRootOutline(`${logTag}_tree`, 3);
    const dialogNode = Utils.findDialogMaterialNode(root, logTag);
    if (!dialogNode) {
      console.error(`[DialogMaterial][${logTag}] dialog material node not found`);
      Utils.logChildrenBrief(root, `${logTag}_root`);
      return 'MaterialType.IMMERSIVE';
    }
    const materialType = Utils.readMaterialTypeFromNode(dialogNode);
    console.info(`[DialogMaterial][${logTag}] selected ${Utils.nodeBrief(dialogNode)} type=${materialType}`);
    return materialType;
  }

  static logInspectorRootOutline(tag: string, maxDepth: number): void {
    const root: InspectorNode = JSON.parse(JSON.stringify(getInspectorTree())) as InspectorNode;
    Utils.logNodeOutline(root, tag, 0, maxDepth, 'root');
  }

  static childCount(node: InspectorNode): number {
    if (!node.$children) {
      return -1;
    }
    return node.$children.length;
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

  static nodeBrief(node: InspectorNode): string {
    const id: string = node.$attrs?.id ?? '';
    const mat: string = node.$attrs?.systemMaterial?.material?.type ?? '';
    const style: string = node.$attrs?.systemMaterial?.material?.style ?? '';
    return `type=${node.$type ?? '?'} id=${id} material=${mat} style=${style} children=${Utils.childCount(node)}`;
  }

  private static childAt(node: InspectorNode, index: number): InspectorNode | null {
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids || index >= kids.length) {
      return null;
    }
    return kids[index];
  }

  private static findDialogMaterialNode(root: InspectorNode, logTag: string): InspectorNode | null {
    const overlay = Utils.childAt(root, 1);
    if (!overlay) {
      console.error(`[DialogMaterial][${logTag}] no overlay at $children[1]`);
      return null;
    }
    const primary = Utils.childAt(overlay, 0) ?? overlay;
    const candidates = Utils.collectSystemMaterialNodes(primary, 0, 3);
    if (candidates.length === 0) {
      console.info(`[DialogMaterial][${logTag}] use overlay primary ${Utils.nodeBrief(primary)}`);
      return primary;
    }
    candidates.sort((a: InspectorNode, b: InspectorNode) => {
      return Utils.materialNodeScore(b) - Utils.materialNodeScore(a);
    });
    for (let i = 0; i < candidates.length; i++) {
      console.info(`[DialogMaterial][${logTag}] candidate ${Utils.nodeBrief(candidates[i])}`);
    }
    return candidates[0];
  }

  private static collectSystemMaterialNodes(
    node: InspectorNode, depth: number, maxDepth: number
  ): InspectorNode[] {
    const result: InspectorNode[] = [];
    if (node.$attrs?.systemMaterial !== undefined) {
      result.push(node);
    }
    if (depth >= maxDepth) {
      return result;
    }
    const kids: InspectorNode[] | undefined = node.$children;
    if (!kids) {
      return result;
    }
    for (let i = 0; i < kids.length; i++) {
      result.push(...Utils.collectSystemMaterialNodes(kids[i], depth + 1, maxDepth));
    }
    return result;
  }

  private static materialNodeScore(node: InspectorNode): number {
    const material = node.$attrs?.systemMaterial?.material;
    if (!material) {
      return 2;
    }
    if (material.style) {
      return 10;
    }
    if (material.type === 'MaterialType.SEMI_TRANSPARENT') {
      return 8;
    }
    if (material.type === 'MaterialType.IMMERSIVE') {
      return 6;
    }
    if (material.type === 'MaterialType.NONE') {
      return 1;
    }
    return 3;
  }

  private static readMaterialTypeFromNode(node: InspectorNode): string {
    const systemMaterial = node.$attrs?.systemMaterial;
    if (systemMaterial === undefined) {
      return 'MaterialType.IMMERSIVE';
    }
    const material = systemMaterial.material;
    if (!material) {
      return 'MaterialType.IMMERSIVE';
    }
    if (material.type) {
      return material.type;
    }
    if (material.style) {
      return 'MaterialType.IMMERSIVE';
    }
    return 'MaterialType.IMMERSIVE';
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

  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
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
    let downPoint: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      displayX: downX,
      displayY: downY,
      windowX: downX,
      windowY: downY,
      screenX: downX,
      screenY: downY,
      type: TouchType.Down
    }
    console.info('down touch started: ' + JSON.stringify(downPoint))
    sendTouchEvent(downPoint);
    console.info('start to move')
    if (true) {
      Utils.sleep(500)
    }
    for (let i = 1; i <= swipeSteps; i++) {
      let movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        displayX: downX + (xStep * i),
        displayY: downY + (yStep * i),
        windowX: downX + (xStep * i),
        windowY: downY + (yStep * i),
        screenX: downX + (xStep * i),
        screenY: downY + (yStep * i),
        type: TouchType.Move,
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      Utils.sleep(5)
    }
    console.info('start to up')
    if (true) {
      Utils.sleep(100)
    }
    let upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      displayX: upX,
      displayY: upY,
      windowX: upX,
      windowY: upY,
      screenX: upX,
      screenY: upY,
      type: TouchType.Up,
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    Utils.sleep(500)
  }
}

