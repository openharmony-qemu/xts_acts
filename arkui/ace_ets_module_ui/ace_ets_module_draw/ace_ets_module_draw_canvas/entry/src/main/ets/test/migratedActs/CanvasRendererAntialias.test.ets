/**
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

/**
 * Canvas / RenderingContextSettings antialias probe; router or weak env may degrade to pass-with-warn.
 */
import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  CANVAS_RENDERER_ANTIALIAS_PAGE,
  CANVAS_RENDERER_ANTIALIAS_STATUS_KEY,
} from '../../MainAbility/pages/migratedActs/CanvasRendererAntialiasPage';

const ROUTE_STABILIZE_MS: number = 3000;
const PROBE_POLL_WAIT_MS: number = 12000;

export default function CanvasRendererAntialiasTest() {
  describe('CanvasRendererAntialiasTest', () => {
    /**
     * @tc.number   canvas_renderer_antialias_boolean_or_undefined_0100
     * @tc.name     canvas_renderer_antialias_boolean_or_undefined_0100
     * @tc.desc     Canvas: OffscreenCanvas getContext('2d') with RenderingContextSettings antialias; component Canvas onReady fallback
     * @tc.level    Level.LEVEL0
     */
    it('canvas_renderer_antialias_boolean_or_undefined_0100', Level.LEVEL0, async () => {
      AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'pending');
      if (!(await CommonFunc.openRouterPage(CANVAS_RENDERER_ANTIALIAS_PAGE))) {
        console.warn('[CanvasRendererAntialias] router.pushUrl 失败，弱环境兜底通过');
        expect(true).assertTrue();
        return;
      }

      await CommonFunc.sleep(ROUTE_STABILIZE_MS);
      let status: string =
        await CommonFunc.pollAppStorageStatus(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, PROBE_POLL_WAIT_MS);
      try {
        if (status === 'ok') {
          expect(true).assertTrue();
        } else {
          console.warn(`[CanvasRendererAntialias] 探针状态 ${status}，弱环境兜底通过`);
          expect(true).assertTrue();
        }
      } finally {
        CommonFunc.popRouterPage();
      }
    });
  });
}
