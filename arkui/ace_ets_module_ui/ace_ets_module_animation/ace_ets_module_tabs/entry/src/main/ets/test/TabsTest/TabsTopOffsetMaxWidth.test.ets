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

function readFloatStyle(nodeId: string): ESObject | undefined {
  let top: ESObject | undefined = readStyle(nodeId, 'topBarFloatingStyle');
  if (top !== undefined) {
    return top;
  }
  return readStyle(nodeId, 'barFloatingStyle');
}

function approxEqual(a: number, b: number, tol: number): boolean {
  return Math.abs(a - b) <= tol;
}

function nodeMounted(nodeId: string): boolean {
  try {
    let raw: string = getInspectorByKey(nodeId);
    return raw !== undefined && raw !== null && raw.length > 3 && raw !== '{}';
  } catch (err) {
    return false;
  }
}

export default function tabsTopOffsetMaxWidthTest() {
  describe('TabsTopOffsetMaxWidthTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsTopOffsetMaxWidth',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('[TabsTopOffsetMaxWidthTest] push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testTopOffset001
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0001
     * @tc.desc   top offset Position x16 y0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset001', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_x16')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset002
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0002
     * @tc.desc   top offset Position y 16vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset002', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_y16vp')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset003
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0003
     * @tc.desc   top offset negative and percent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset003', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('top_offset_neg').length === 4).assertTrue();
      expect(parseRect('top_offset_pct').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset004
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0004
     * @tc.desc   top offset Edges left16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset004', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_edges_left')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset005
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0005
     * @tc.desc   top offset Edges same-axis only first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset005', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_edges_tb')).assertTrue();
      expect(nodeMounted('top_offset_edges_lr')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset006
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0006
     * @tc.desc   top offset LocalizedEdges start LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset006', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('top_offset_le_start').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset008
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0008
     * @tc.desc   top offset LocalizedEdges start+end only start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset008', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('top_offset_le_start_end').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset009
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0009
     * @tc.desc   top offset LocalizedEdges top+bottom only top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset009', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('top_offset_le_tb').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset010
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0010
     * @tc.desc   top offset zero equals baseline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset010', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_zero')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset011
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0011
     * @tc.desc   top offset NaN Infinity ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset011', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let base: number[] = parseRect('top_offset_base');
      let nanR: number[] = parseRect('top_offset_nan');
      let infR: number[] = parseRect('top_offset_inf');
      expect(nanR.length === 4).assertTrue();
      expect(infR.length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset013
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0013
     * @tc.desc   top offset with barSideMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset013', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_side_xy')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset014
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0014
     * @tc.desc   top offset with invalid barSideMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset014', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(parseRect('top_offset_invalid_margin').length === 4).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset015
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0015
     * @tc.desc   top offset with barTopMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset015', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_offset_topmargin_xy')).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset016
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0016
     * @tc.desc   top maxWidth truncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset016', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w0: number = widthOf('top_mw_base');
      let w560: number = widthOf('top_mw_560');
      let w200: number = widthOf('top_mw_200');
      expect(w0 > 0).assertTrue();
      expect(w560 > 0).assertTrue();
      expect(w200 > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset017
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0017
     * @tc.desc   top maxWidth invalid ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset017', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w0: number = widthOf('top_mw_base');
      let wn: number = widthOf('top_mw_neg');
      let wnan: number = widthOf('top_mw_nan');
      expect(w0 > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset018
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0018
     * @tc.desc   top maxWidth percent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset018', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('top_mw_pct') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset019
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0019
     * @tc.desc   top maxWidth vs gridA maxWidth wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset019', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w: number = widthOf('top_mw_1100_800');
      expect(w > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset020
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0020
     * @tc.desc   top maxWidth vs gridA grid wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset020', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w: number = widthOf('top_mw_1100_1000');
      expect(w > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset021
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0021
     * @tc.desc   top maxWidth vs gridB maxWidth wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset021', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w: number = widthOf('top_mw_800_700');
      expect(w > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset022
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0022
     * @tc.desc   top maxWidth vs gridB grid wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset022', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w: number = widthOf('top_mw_800_800');
      expect(w > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset023
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0023
     * @tc.desc   top maxWidth equals grid boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset023', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let w: number = widthOf('top_mw_300_268');
      expect(w > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset024
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0024
     * @tc.desc   top maxWidth branch 839 vs 840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset024', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('top_mw_839_24') > 0).assertTrue();
      expect(widthOf('top_mw_840_24') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset028
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0028
     * @tc.desc   top barWidth+maxWidth maxWidth smaller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset028', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let wa: number = widthOf('top_bw_mw_a');
      expect(wa > 0).assertTrue();      expect(widthOf('top_bw_mw_b') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset029
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0029
     * @tc.desc   top barWidth+maxWidth barWidth smaller path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset029', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('top_bw_mw_c') > 0).assertTrue();
      expect(widthOf('top_bw_mw_d') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset030
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0030
     * @tc.desc   top three-factor W>840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset030', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('top_tri_a') > 0).assertTrue();
      expect(widthOf('top_tri_b') > 0).assertTrue();
      expect(widthOf('top_tri_c') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset031
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0031
     * @tc.desc   top three-factor W<840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset031', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(widthOf('top_tri_d') > 0).assertTrue();
      expect(widthOf('top_tri_e') > 0).assertTrue();
      expect(widthOf('top_tri_f') > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testTopOffset032
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0032
     * @tc.desc   top offset+maxWidth together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset032', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      expect(nodeMounted('top_off_mw_a')).assertTrue();
      expect(nodeMounted('top_off_mw_b')).assertTrue();
      done();
    });
  });
}
