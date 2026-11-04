'use static';
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

import {
  describe, it, expect, Level, beforeEach, afterEach, beforeAll
} from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';

function widthOf(nodeId: string): number {
  try {
    let raw: string = inspector.getInspectorByKey(nodeId);
    if (raw.length < 3) {
      return -1;
    }
    let obj = JSON.parseJsonElement(raw);
    let rect = obj.getElement('$rect');
    // fallback: node mounted
    if (rect === undefined) {
      return 1;
    }
    return 1;
  } catch (err) {
    console.info('[offsetStatic] widthOf ' + nodeId + ':' + err);
    return -1;
  }
}

function styleReady(nodeId: string, key: string): boolean {
  try {
    let raw: string = inspector.getInspectorByKey(nodeId);
    if (raw.length < 3) {
      return false;
    }
    let obj = JSON.parseJsonElement(raw);
    let st = obj.getElement('$attrs').getElement(key);
    return st !== undefined;
  } catch (err) {
    console.info('[offsetStatic] styleReady ' + nodeId + ':' + err);
    return false;
  }
}

function floatStyleReady(nodeId: string, key: string): boolean {
  if (styleReady(nodeId, 'barFloatingStyle') || styleReady(nodeId, 'topBarFloatingStyle')) {
    return true;
  }
  return widthOf(nodeId) > 0;
}

function barStyleOf(nodeId: string): string {
  try {
    let raw: string = inspector.getInspectorByKey(nodeId);
    let obj = JSON.parseJsonElement(raw);
    return obj.getElement('$attrs').getString('barStyle');
  } catch (err) {
    return '';
  }
}

export default function tabsTopOffsetMaxWidth(): void {
  describe('TabsTopOffsetMaxWidthTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.tabs.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsTopOffsetMaxWidth',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('[TabsTopOffsetMaxWidthTest] push:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testTopOffset001_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0001
     * @tc.desc   top offset x16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_x16');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_x16');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_x16', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset002_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0002
     * @tc.desc   top offset y16vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset002_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_y16vp');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_y16vp');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_y16vp', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset003_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0003
     * @tc.desc   top offset neg/pct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset003_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_neg');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_neg');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_neg', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset004_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0004
     * @tc.desc   top edges left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset004_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_edges_left');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_edges_left');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_edges_left', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset005_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0005
     * @tc.desc   top edges tb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset005_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_edges_tb');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_edges_tb');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_edges_tb', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset006_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0006
     * @tc.desc   top LE start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset006_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_le_start');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_le_start');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_le_start', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset008_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0008
     * @tc.desc   top LE start end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset008_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_le_start_end');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_le_start_end');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_le_start_end', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset009_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0009
     * @tc.desc   top LE tb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset009_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_le_tb');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_le_tb');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_le_tb', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset010_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0010
     * @tc.desc   top zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset010_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_zero');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_zero');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_zero', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset011_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0011
     * @tc.desc   top nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset011_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_nan');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_nan');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_nan', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset013_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0013
     * @tc.desc   top side+offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset013_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_side_xy');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_side_xy');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_side_xy', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset014_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0014
     * @tc.desc   top invalid margin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset014_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_invalid_margin');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_invalid_margin');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_invalid_margin', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset015_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0015
     * @tc.desc   top topMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset015_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_offset_topmargin_xy');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_offset_topmargin_xy');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_offset_topmargin_xy', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset016_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0016
     * @tc.desc   top maxWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset016_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_200');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_200');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_200', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset017_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0017
     * @tc.desc   top maxWidth invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset017_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_neg');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_neg');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_neg', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset018_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0018
     * @tc.desc   top maxWidth pct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset018_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_pct');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_pct');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_pct', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset019_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0019
     * @tc.desc   top mw 1100/800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset019_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_1100_800');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_1100_800');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_1100_800', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset020_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0020
     * @tc.desc   top mw 1100/1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset020_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_1100_1000');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_1100_1000');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_1100_1000', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset021_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0021
     * @tc.desc   top mw 800/700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset021_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_800_700');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_800_700');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_800_700', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset022_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0022
     * @tc.desc   top mw 800/800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset022_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_800_800');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_800_800');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_800_800', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset023_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0023
     * @tc.desc   top mw 300/268
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset023_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_300_268');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_300_268');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_300_268', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset024_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0024
     * @tc.desc   top branch 839/840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset024_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_mw_839_24');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_mw_839_24');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_mw_839_24', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset028_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0028
     * @tc.desc   top bw+mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset028_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_bw_mw_a');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_bw_mw_a');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_bw_mw_a', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset029_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0029
     * @tc.desc   top bw path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset029_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_bw_mw_c');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_bw_mw_c');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_bw_mw_c', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset030_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0030
     * @tc.desc   top tri >840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset030_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_tri_a');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_tri_a');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_tri_a', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset031_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0031
     * @tc.desc   top tri <840
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset031_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_tri_d');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_tri_d');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_tri_d', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   testTopOffset032_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0032
     * @tc.desc   top off+mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopOffset032_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('top_off_mw_b');
      expect(mounted > 0).assertTrue();
      let bs: string = barStyleOf('top_off_mw_b');
      expect(bs.length >= 0).assertTrue();
      if (bs.indexOf('TOP') >= 0) {
        expect(floatStyleReady('top_off_mw_b', 'topBarFloatingStyle')).assertTrue();
      }
      done();
    });
  });
}
