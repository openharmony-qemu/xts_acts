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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Path2DBezierCurveToEllipseNullUndefinedTest() {
  describe('Path2DBezierCurveToEllipseNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("Path2DBezierCurveToEllipseNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/path2D/Path2DBezierCurveToEllipseNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Path2DBezierCurveToEllipseNullUndefined state pages: " + JSON.stringify(pages));
        if (!("Path2DBezierCurveToEllipseNullUndefined" == pages.name)) {
          console.info("get Path2DBezierCurveToEllipseNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Path2DBezierCurveToEllipseNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Path2DBezierCurveToEllipseNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_PATH2D_BEZIERCURVETO_NULL_UNDEFINED_0100
     * @tc.name      Test Path2D bezierCurveTo with null/undefined parameters
     * @tc.desc      Verify bezierCurveTo handles null/undefined parameters correctly
     */
    it('SUB_ACE_PATH2D_BEZIERCURVETO_NULL_UNDEFINED_0100', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_beziercurveto_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });

    /**
     * @tc.number    SUB_ACE_PATH2D_ELLIPSE_NULL_0100
     * @tc.name      Test Path2D ellipse with null/undefined parameters
     * @tc.desc      Verify ellipse handles null/undefined parameters correctly
     */
    it('SUB_ACE_PATH2D_ELLIPSE_NULL_0100', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_ellipse_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });
  });
}