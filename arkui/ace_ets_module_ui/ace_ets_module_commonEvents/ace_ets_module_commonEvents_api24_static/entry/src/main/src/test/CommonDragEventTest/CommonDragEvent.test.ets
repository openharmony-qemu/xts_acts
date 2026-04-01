/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

'use static';

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import { Driver, Point } from '@kit.TestKit';

async function dragFromProbeHost(): Promise<void> {
  let rect = Utils.getComponentRect('commonDragHost');
  let cx: int = Math.floor((rect.left + rect.right) / 2) as int;
  let cy: int = Math.floor((rect.top + rect.bottom) / 2) as int;
  let toX: int = (cx + 60) as int;
  const driver = Driver.create();
  await driver.dragBetween({ x: cx, y: cy } as Point, { x: toX, y: cy } as Point, 3500, 1600);
  await Utils.sleep(500);
}

export default function CommonDragEventTest(): void {
  describe('CommonDragEventTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let ro: router.RouterOptions = { url: 'MainAbility/pages/CommonDragEventProbe/CommonDragEventProbe' };
      let r = AppStorage.get<Router>('router') as Router;
      r.clear();
      r.replaceUrl(ro);
      await Utils.sleep(600);
    });

    /**
     * @tc.number CommonDragEventTest_001
     * @tc.name SUB_ArkUI_Common_DragEvent_GetDragSource_2400
     * @tc.desc DragEvent.getDragSource：探测页 onDragStart 真实调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_DragEvent_GetDragSource_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await dragFromProbeHost();
      let src = AppStorage.get<string>('de_get_drag_src');
      let srcOk: boolean = src != null && src.length > 0;
      expect(srcOk).assertTrue();
      done();
    });

    /**
     * @tc.number CommonDragEventTest_002
     * @tc.name SUB_ArkUI_Common_DragEvent_IsRemote_2500
     * @tc.desc DragEvent.isRemote：真实 onDragStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_DragEvent_IsRemote_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await dragFromProbeHost();
      let remote = AppStorage.get<string>('de_is_remote');
      let remoteOk: boolean = remote === '0' || remote === '1';
      expect(remoteOk).assertTrue();
      done();
    });

    /**
     * @tc.number CommonDragEventTest_003
     * @tc.name SUB_ArkUI_Common_DragEvent_SetDataLoadParams_2600
     * @tc.desc DragEvent.setDataLoadParams：onDragStart 内真实调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_DragEvent_SetDataLoadParams_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await dragFromProbeHost();
      expect(AppStorage.get<string>('de_set_dataload')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonDragEventTest_004
     * @tc.name SUB_ArkUI_Common_DragEvent_GetGlobalDisplayX_2700
     * @tc.desc DragEvent.getGlobalDisplayX：真实 onDragStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_DragEvent_GetGlobalDisplayX_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await dragFromProbeHost();
      let v = AppStorage.get<string>('de_gdx');
      let gdxOk: boolean = v != null && v.length > 0;
      expect(gdxOk).assertTrue();
      expect(Number(v)).assertLargerOrEqual(0);
      done();
    });

    /**
     * @tc.number CommonDragEventTest_005
     * @tc.name SUB_ArkUI_Common_DragEvent_GetGlobalDisplayY_2800
     * @tc.desc DragEvent.getGlobalDisplayY：真实 onDragStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_DragEvent_GetGlobalDisplayY_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await dragFromProbeHost();
      let v = AppStorage.get<string>('de_gdy');
      let gdyOk: boolean = v != null && v.length > 0;
      expect(gdyOk).assertTrue();
      expect(Number(v)).assertLargerOrEqual(0);
      done();
    });
  });
}
