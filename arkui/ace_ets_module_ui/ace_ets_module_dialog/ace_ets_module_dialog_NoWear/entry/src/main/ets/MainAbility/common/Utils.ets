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
import { Driver } from '@ohos.UiTest';
import RectValue, { PointValue } from './Rect';

type InspectorNode = Record<string, Object>;

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

  static parseInspectorKey(key: string): InspectorNode {
    const emptyAttrs: InspectorNode = {} as InspectorNode;
    const empty: InspectorNode = { '$attrs': emptyAttrs } as InspectorNode;
    const raw: string = getInspectorByKey(key);
    if (!Utils.isKeyReadableRaw(raw)) {
      return empty;
    }
    try {
      return JSON.parse(raw) as InspectorNode;
    } catch (_e) {
      return empty;
    }
  }

  static isKeyReadable(key: string): boolean {
    return Utils.isKeyReadableRaw(getInspectorByKey(key));
  }

  private static isKeyReadableRaw(raw: string): boolean {
    if (!raw || raw.length === 0 || raw.indexOf('Empty Text') >= 0) {
      return false;
    }
    try {
      const obj: InspectorNode = JSON.parse(raw) as InspectorNode;
      return (obj as Record<string, InspectorNode>)['$rect'] !== undefined;
    } catch (_e) {
      return false;
    }
  }

  static getRectCenter(key: string): PointValue {
    const rect: RectValue = Utils.getComponentRect(key);
    const pt: PointValue = new PointValue();
    pt.x = Math.round((rect.left + rect.right) / 2);
    pt.y = Math.round((rect.top + rect.bottom) / 2);
    return pt;
  }

  static getSelectMenuItemPoint(selectKey: string, itemIndex: number): PointValue {
    const rect: RectValue = Utils.getComponentRect(selectKey);
    const itemHeight: number = 56;
    const pt: PointValue = new PointValue();
    pt.x = Math.round((rect.left + rect.right) / 2);
    pt.y = Math.round(rect.bottom + 16 + itemIndex * itemHeight + itemHeight / 2);
    return pt;
  }

  static async openSelectMenu(selectKey: string, waitMs: number = 2000): Promise<void> {
    const driver: Driver = await Driver.create();
    const pt: PointValue = Utils.getRectCenter(selectKey);
    await driver.click(pt.x, pt.y);
    await Utils.sleep(waitMs);
  }

  static async longPressAt(x: number, y: number, holdMs: number = 1200): Promise<void> {
    const downPoint: TouchObject = {
      id: 1, x: x, y: y, displayX: x, displayY: y,
      windowX: x, windowY: y, screenX: x, screenY: y, type: TouchType.Down
    };
    sendTouchEvent(downPoint);
    await Utils.sleep(holdMs);
    const upPoint: TouchObject = {
      id: 1, x: x, y: y, displayX: x, displayY: y,
      windowX: x, windowY: y, screenX: x, screenY: y, type: TouchType.Up
    };
    sendTouchEvent(upPoint);
    await Utils.sleep(300);
  }

  static findRectCenterForTextInTree(expected: string): PointValue | undefined {
    const raw: InspectorNode = JSON.parse(JSON.stringify(getInspectorTree())) as InspectorNode;
    return Utils.searchTextRect(raw as Record<string, InspectorNode>, expected);
  }

  private static searchTextRect(node: Record<string, InspectorNode>, expected: string): PointValue | undefined {
    const hit: PointValue | undefined = Utils.textRectFromNode(node, expected);
    if (hit !== undefined) {
      return hit;
    }
    const kids: InspectorNode[] = Utils.childNodes(node);
    for (let i: number = 0; i < kids.length; i++) {
      const inner: PointValue | undefined =
        Utils.searchTextRect(kids[i] as Record<string, InspectorNode>, expected);
      if (inner !== undefined) {
        return inner;
      }
    }
    return undefined;
  }

  private static textRectFromNode(node: Record<string, InspectorNode>, expected: string): PointValue | undefined {
    const rect: PointValue | undefined =
      Utils.centerFromRectField(node['$rect'] as InspectorNode | undefined);
    if (rect === undefined) {
      return undefined;
    }
    if (!Utils.nodeTextMatches(node, expected)) {
      return undefined;
    }
    return rect;
  }

  private static nodeTextMatches(node: Record<string, InspectorNode>, expected: string): boolean {
    const attrs: InspectorNode | undefined = node['$attrs'] as InspectorNode | undefined;
    if (attrs) {
      const keys: string[] = ['content', 'text', 'label', 'name'];
      for (let i: number = 0; i < keys.length; i++) {
        const val: Object | undefined = (attrs as Record<string, Object>)[keys[i]];
        if (typeof val === 'string') {
          const text: string = val as string;
          if (text === expected || text.indexOf(expected) >= 0) {
            return true;
          }
        }
      }
    }
    return JSON.stringify(node).indexOf(expected) >= 0;
  }

  private static centerFromRectField(rectField: InspectorNode | undefined): PointValue | undefined {
    if (rectField === undefined || rectField === null) {
      return undefined;
    }
    try {
      const rectStr: string = JSON.stringify(rectField);
      const left: number = JSON.parse('[' + JSON.parse('[' + rectStr + ']')[0] + ']')[0];
      const top: number = JSON.parse('[' + JSON.parse('[' + rectStr + ']')[0] + ']')[1];
      const right: number = JSON.parse('[' + JSON.parse('[' + rectStr + ']')[1] + ']')[0];
      const bottom: number = JSON.parse('[' + JSON.parse('[' + rectStr + ']')[1] + ']')[1];
      const pt: PointValue = new PointValue();
      pt.x = Math.round((left + right) / 2);
      pt.y = Math.round((top + bottom) / 2);
      return pt;
    } catch (_e) {
      return undefined;
    }
  }

  private static childNodes(node: Record<string, InspectorNode>): InspectorNode[] {
    const ch: InspectorNode | undefined = node['$children'] as InspectorNode | undefined;
    if (!ch) {
      return [];
    }
    if (Array.isArray(ch)) {
      return ch as InspectorNode[];
    }
    const out: InspectorNode[] = [];
    const names: string[] = Object.keys(ch as Record<string, InspectorNode>);
    for (let i: number = 0; i < names.length; i++) {
      const one: InspectorNode | undefined = (ch as Record<string, InspectorNode>)[names[i]];
      if (one !== undefined && one !== null && typeof one === 'object') {
        out.push(one);
      }
    }
    return out;
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




