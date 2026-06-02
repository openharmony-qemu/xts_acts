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

interface MaterialMatch {
  path: number[];
  type: string;
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
    const root: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
    Utils.logInspectorRootOutline(`${logTag}_tree`, 3);
    const overlay = Utils.childAt(root, 1);
    if (!overlay) {
      console.error(`[DialogMaterial][${logTag}] no overlay at $children[1]`);
      Utils.logChildrenBrief(root, `${logTag}_root`);
      return '';
    }
    const matches: MaterialMatch[] = [];
    Utils.collectSystemMaterialNodes(overlay, [1], matches);
    if (matches.length === 0) {
      console.error(`[DialogMaterial][${logTag}] no systemMaterial node found`);
      Utils.logChildrenBrief(overlay, `${logTag}_overlay`);
      return '';
    }
    matches.sort((a: MaterialMatch, b: MaterialMatch) => b.path.length - a.path.length);
    for (let i = 0; i < matches.length; i++) {
      const m = matches[i];
      console.info(`[DialogMaterial][${logTag}] candidate path=[${m.path.join(',')}] type=${m.type}`);
    }
    const best = matches[0];
    console.info(`[DialogMaterial][${logTag}] selected path=[${best.path.join(',')}] type=${best.type}`);
    return best.type;
  }

  static logInspectorRootOutline(tag: string, maxDepth: number): void {
    const root: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
    Utils.logNodeOutline(root, tag, 0, maxDepth, 'root');
  }

  static childCount(node: ESObject): number {
    if (!node.$children) {
      return -1;
    }
    return (node.$children as ESObject[]).length;
  }

  static logChildrenBrief(node: ESObject, tag: string): void {
    const kids = node.$children as ESObject[] | undefined;
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

  static nodeBrief(node: ESObject): string {
    const id = node.$attrs?.id ?? '';
    const mat = node.$attrs?.systemMaterial?.material?.type ?? '';
    return `type=${node.$type ?? '?'} id=${id} material=${mat} children=${Utils.childCount(node)}`;
  }

  private static childAt(node: ESObject, index: number): ESObject | null {
    const kids = node.$children as ESObject[] | undefined;
    if (!kids || index >= kids.length) {
      return null;
    }
    return kids[index];
  }

  private static collectSystemMaterialNodes(
    node: ESObject, path: number[], out: MaterialMatch[]
  ): void {
    const materialType = node?.$attrs?.systemMaterial?.material?.type as string | undefined;
    if (materialType) {
      out.push({ path: path.slice(), type: materialType });
    }
    const kids = node.$children as ESObject[] | undefined;
    if (!kids) {
      return;
    }
    for (let i = 0; i < kids.length; i++) {
      Utils.collectSystemMaterialNodes(kids[i], [...path, i], out);
    }
  }

  private static logNodeOutline(
    node: ESObject, tag: string, depth: number, maxDepth: number, path: string
  ): void {
    if (depth > maxDepth) {
      return;
    }
    console.info(`[InspectorDebug][${tag}] ${path} ${Utils.nodeBrief(node)}`);
    const kids = node.$children as ESObject[] | undefined;
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

