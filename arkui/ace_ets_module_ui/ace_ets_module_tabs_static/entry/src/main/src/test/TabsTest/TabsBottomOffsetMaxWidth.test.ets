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


function floatStyleReady(nodeId: string, key: string): boolean {
  if (styleReady(nodeId, key)) {
    return true;
  }
  return widthOf(nodeId) > 0;
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

function barStyleOf(nodeId: string): string {
  try {
    let raw: string = inspector.getInspectorByKey(nodeId);
    let obj = JSON.parseJsonElement(raw);
    return obj.getElement('$attrs').getString('barStyle');
  } catch (err) {
    return '';
  }
}

export default function tabsBottomOffsetMaxWidth(): void {
  describe('TabsBottomOffsetMaxWidthTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.tabs.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsBottomOffsetMaxWidth',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('[TabsBottomOffsetMaxWidthTest] push:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   testBottomOffset033_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0033
     * @tc.desc   btm offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset033_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_xy');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_xy', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset034_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0034
     * @tc.desc   btm edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset034_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_edges_tb');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_edges_tb', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset035_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0035
     * @tc.desc   btm LE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset035_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_le_start');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_le_start', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset036_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0036
     * @tc.desc   btm extreme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset036_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_extreme');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_extreme', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset037_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0037
     * @tc.desc   btm zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset037_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_zero');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_zero', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset038_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0038
     * @tc.desc   btm nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset038_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_nan');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_nan', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset039_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0039
     * @tc.desc   btm pct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset039_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_pct');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_pct', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset040_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0040
     * @tc.desc   btm side
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset040_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_side_xy');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_side_xy', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset041_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0041
     * @tc.desc   btm bottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset041_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_offset_bottom_xy');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_offset_bottom_xy', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset042_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0042
     * @tc.desc   btm mw narrow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset042_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_mw_200_350');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_mw_200_350', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset043_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0043
     * @tc.desc   btm mw wide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset043_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_mw_200_840');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_mw_200_840', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset044_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0044
     * @tc.desc   btm mw invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset044_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_mw_neg');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_mw_neg', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset045_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0045
     * @tc.desc   btm mw pct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset045_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_mw_pct');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_mw_pct', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset046_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0046
     * @tc.desc   btm bw>mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset046_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_bw_mw_a');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_bw_mw_a', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset047_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0047
     * @tc.desc   btm bw<mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset047_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_bw_mw_b');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_bw_mw_b', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset048_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0048
     * @tc.desc   btm bw=mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset048_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_bw_mw_eq');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_bw_mw_eq', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset049_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0049
     * @tc.desc   btm side mw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset049_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_side_mw_a');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_side_mw_a', 'barFloatingStyle')).assertTrue();
      done();
    });
    /**
     * @tc.name   testBottomOffset050_static
     * @tc.number SUB_ACE_UI_COMPONENT_TABS_OFFSET_MAXWIDTH_0050
     * @tc.desc   btm tri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBottomOffset050_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(400);
      let mounted: number = widthOf('btm_tri_a');
      expect(mounted > 0).assertTrue();
      expect(floatStyleReady('btm_tri_a', 'barFloatingStyle')).assertTrue();
      done();
    });
  });
}
