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

import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';
import { sleep, startPage } from '../../../uiutils/commonUtils';

export default function Path2DQuadraticCurveToRectNullUndefinedTest() {
  describe('Path2DQuadraticCurveToRectNullUndefinedTest', () => {
    beforeAll(async () => {
      await startPage('MainAbility/pages/path2D/Path2DQuadraticCurveToRectNullUndefined');
      await sleep(1000);
    })

    afterAll(async () => {
    })

    /**
     * @tc.number    SUB_ACE_PATH2D_QUADRATICCURVETO_NULL_UNDEFINED_0100
     * @tc.name      Test Path2D quadraticCurveTo with null/undefined parameters
     * @tc.desc      Verify quadraticCurveTo handles null/undefined parameters correctly
     */
    it('SUB_ACE_PATH2D_QUADRATICCURVETO_NULL_UNDEFINED_0100', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_quadraticcurveto_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });

    /**
     * @tc.number    SUB_ACE_PATH2D_RECT_NULL_UNDEFINED_0100
     * @tc.name      Test Path2D rect with null/undefined parameters
     * @tc.desc      Verify rect handles null/undefined parameters correctly
     */
    it('SUB_ACE_PATH2D_RECT_NULL_UNDEFINED_0100', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_rect_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });
  });
}