/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

function rectFromObj(obj: ESObject): number[] {
  if (obj === undefined || obj.$rect === undefined) {
    return [];
  }
  let pair: ESObject = JSON.parse('[' + obj.$rect + ']');
  let lt: ESObject = JSON.parse('[' + pair[0] + ']');
  let rb: ESObject = JSON.parse('[' + pair[1] + ']');
  return [Number(lt[0]), Number(lt[1]), Number(rb[0]), Number(rb[1])];
}

function findBarNode(obj: ESObject): ESObject | undefined {
  if (obj === undefined) {
    return undefined;
  }
  let typeName: string = `${obj.$type}`;
  if (typeName.indexOf('TabBar') >= 0 || typeName.indexOf('tabBar') >= 0) {
    return obj;
  }
  let children: ESObject = obj.$children as ESObject;
  if (children === undefined) {
    return undefined;
  }
  let arr: ESObject[] = children as ESObject[];
  for (let i = 0; i < arr.length; i++) {
    let hit: ESObject | undefined = findBarNode(arr[i]);
    if (hit !== undefined) {
      return hit;
    }
  }
  return undefined;
}

function parseRect(nodeId: string): number[] {
  try {
    let raw: string = getInspectorByKey(nodeId);
    if (raw === undefined || raw === null || raw.length < 3) {
      return [];
    }
    let obj: ESObject = JSON.parse(raw);
    let bar: ESObject | undefined = findBarNode(obj);
    if (bar !== undefined) {
      let br: number[] = rectFromObj(bar);
      if (br.length === 4) {
        return br;
      }
    }
    return rectFromObj(obj);
  } catch (err) {
    console.info('[offsetMaxWidth] parseRect ' + nodeId + ':' + err);
    return [];
  }
}

function widthOf(nodeId: string): number {
  let r: number[] = parseRect(nodeId);
  if (r.length < 4) {
    return -1;
  }
  return r[2] - r[0];
}

function readStyle(nodeId: string, styleKey: string): ESObject | undefined {
  try {
    let raw: string = getInspectorByKey(nodeId);
    if (raw === undefined || raw === null || raw.length < 3) {
      return undefined;
    }
    let obj: ESObject = JSON.parse(raw);
    if (obj === undefined || obj.$attrs === undefined) {
      return undefined;
    }
    return obj.$attrs[styleKey] as ESObject;
  } catch (err) {
    console.info('[offsetMaxWidth] readStyle ' + nodeId + ':' + err);
    return undefined;
  }
}

function isTopApiReady(nodeId: string): boolean {
  try {
    let raw: string = getInspectorByKey(nodeId);
    let obj: ESObject = JSON.parse(raw);
    let bs: string = `${obj.$attrs.barStyle}`;
    return bs.indexOf('TOP') >= 0;
  } catch (err) {
    return false;
  }
}

function approxEqual(a: number, b: number, tol: number): boolean {
  return Math.abs(a - b) <= tol;
}

export default function tabsBottomOffsetMaxWidthTest() {
  describe('TabsBottomOffsetMaxWidthTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsBottomOffsetMaxWidth',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('[TabsBottomOffsetMaxWidthTest] push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testBottomOffset033
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0033
     * @tc.desc   bottom offset Position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset033', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_xy').length === 4).assertTrue();
      expect(parseRect('btm_offset_neg').length === 4).assertTrue();
      let style: ESObject | undefined = readStyle('btm_offset_xy', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.offset !== undefined).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset034
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0034
     * @tc.desc   bottom offset same-axis mutex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset034', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_edges_tb').length === 4).assertTrue();
      expect(parseRect('btm_offset_edges_lr').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset035
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0035
     * @tc.desc   bottom offset LocalizedEdges start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset035', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_le_start').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset036
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0036
     * @tc.desc   bottom offset extreme clipped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset036', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let tabs: number[] = parseRect('btm_offset_extreme');
      expect(tabs.length === 4).assertTrue();
      expect(parseRect('btm_offset_extreme_neg').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset037
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0037
     * @tc.desc   bottom offset zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset037', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let cur: number[] = parseRect('btm_offset_zero');
      expect(cur.length === 4).assertTrue();
      let base: number[] = parseRect('btm_offset_base');
      if (base.length === 4) {
        console.info('[offsetMaxWidth] 037 dx=' + (cur[0] - base[0]) + ' dy=' + (cur[1] - base[1]));
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset038
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0038
     * @tc.desc   bottom offset NaN ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset038', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let base: number[] = parseRect('btm_offset_base');
      let cur: number[] = parseRect('btm_offset_nan');
      expect(cur.length === 4).assertTrue();
      if (base.length === 4) {
        expect(approxEqual(cur[0], base[0], 2)).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset039
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0039
     * @tc.desc   bottom offset percent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset039', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_pct').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset040
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0040
     * @tc.desc   bottom offset with barSideMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset040', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_side_xy').length === 4).assertTrue();
      let style: ESObject | undefined = readStyle('btm_offset_side_xy', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.offset !== undefined).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset041
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0041
     * @tc.desc   bottom offset with barBottomMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset041', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('btm_offset_bottom_xy').length === 4).assertTrue();
      let style: ESObject | undefined = readStyle('btm_offset_bottom_xy', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.offset !== undefined).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset042
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0042
     * @tc.desc   bottom maxWidth narrow branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset042', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_mw_base_350') > 0).assertTrue();
      expect(widthOf('btm_mw_200_350') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_mw_200_350', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
        console.info("[offsetMaxWidth] maxWidth=" + style.maxWidth);
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset043
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0043
     * @tc.desc   bottom maxWidth wide branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset043', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_mw_base_840') > 0).assertTrue();
      expect(widthOf('btm_mw_200_840') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_mw_200_840', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
        console.info("[offsetMaxWidth] maxWidth=" + style.maxWidth);
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset044
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0044
     * @tc.desc   bottom maxWidth invalid ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset044', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w0: number = widthOf('btm_offset_base');
      let wn: number = widthOf('btm_mw_neg');
      let wnan: number = widthOf('btm_mw_nan');
      expect(w0 > 0).assertTrue();
      expect(approxEqual(wn, w0, 4)).assertTrue();
      expect(approxEqual(wnan, w0, 4)).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset045
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0045
     * @tc.desc   bottom maxWidth percent 10%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset045', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_mw_pct') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_mw_pct', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset046
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0046
     * @tc.desc   bottom barWidth>maxWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset046', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_bw_mw_a') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_bw_mw_a', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
        console.info("[offsetMaxWidth] maxWidth=" + style.maxWidth);
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset047
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0047
     * @tc.desc   bottom barWidth<maxWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset047', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_bw_mw_b') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_bw_mw_b', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
        console.info("[offsetMaxWidth] maxWidth=" + style.maxWidth);
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset048
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0048
     * @tc.desc   bottom barWidth==maxWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset048', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_bw_mw_eq') > 0).assertTrue();
      let style: ESObject | undefined = readStyle('btm_bw_mw_eq', 'barFloatingStyle');
      expect(style !== undefined).assertTrue();
      if (style !== undefined) {
        expect(style.maxWidth !== undefined).assertTrue();
        console.info("[offsetMaxWidth] maxWidth=" + style.maxWidth);
      }
      done();
    });

    /**
     * @tc.name   testBottomOffset049
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0049
     * @tc.desc   bottom maxWidth+sideMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset049', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_side_mw_a') > 0).assertTrue();
      expect(widthOf('btm_side_mw_b') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testBottomOffset050
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0050
     * @tc.desc   bottom three-factor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset050', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('btm_tri_a') > 0).assertTrue();
      expect(widthOf('btm_tri_b') > 0).assertTrue();
      done();
    });
  });
}
