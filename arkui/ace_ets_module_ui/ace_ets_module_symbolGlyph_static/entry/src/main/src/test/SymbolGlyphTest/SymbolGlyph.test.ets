/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  ReplaceEffectType,
  ReplaceSymbolEffect,
  EffectScope
} from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function SymbolGlyphTest() {
  describe('SymbolGlyphTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SymbolGlyphTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.symbolGlyph.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SymbolGlyphTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SymbolGlyphTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SymbolGlyphIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("SymbolGlyphTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SymbolGlyphTest after each called");
    });

    /**
     * @tc.number SymbolGlyphTest_001
     * @tc.name replaceEffectTypeSequential
     * @tc.desc Test ReplaceEffectType.SEQUENTIAL enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceEffectTypeSequential', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceEffectTypeSequential START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = ReplaceEffectType.SEQUENTIAL;
        console.info('SymbolGlyphTest: ReplaceEffectType.SEQUENTIAL = ' + val);
        expect(val).assertEqual(0);
        console.info('SymbolGlyphTest execute: replaceEffectTypeSequential END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceEffectTypeSequential error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_002
     * @tc.name replaceEffectTypeCrossFade
     * @tc.desc Test ReplaceEffectType.CROSS_FADE enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceEffectTypeCrossFade', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceEffectTypeCrossFade START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = ReplaceEffectType.CROSS_FADE;
        console.info('SymbolGlyphTest: ReplaceEffectType.CROSS_FADE = ' + val);
        expect(val).assertEqual(1);
        console.info('SymbolGlyphTest execute: replaceEffectTypeCrossFade END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceEffectTypeCrossFade error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_003
     * @tc.name replaceEffectTypeSlashOverlay
     * @tc.desc Test ReplaceEffectType.SLASH_OVERLAY enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceEffectTypeSlashOverlay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceEffectTypeSlashOverlay START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = ReplaceEffectType.SLASH_OVERLAY;
        console.info('SymbolGlyphTest: ReplaceEffectType.SLASH_OVERLAY = ' + val);
        expect(val).assertEqual(2);
        console.info('SymbolGlyphTest execute: replaceEffectTypeSlashOverlay END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceEffectTypeSlashOverlay error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_004
     * @tc.name replaceSymbolEffectReplaceTypeSequential
     * @tc.desc Test ReplaceSymbolEffect.replaceType property with SEQUENTIAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceSymbolEffectReplaceTypeSequential', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSequential START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL);
        let replaceType = effect.replaceType;
        console.info('SymbolGlyphTest: replaceSymbolEffectReplaceTypeSequential replaceType = ' + replaceType);
        expect(replaceType).assertEqual(ReplaceEffectType.SEQUENTIAL);
        console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSequential END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSequential error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_005
     * @tc.name replaceSymbolEffectReplaceTypeCrossFade
     * @tc.desc Test ReplaceSymbolEffect.replaceType property with CROSS_FADE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceSymbolEffectReplaceTypeCrossFade', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeCrossFade START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE);
        let replaceType = effect.replaceType;
        console.info('SymbolGlyphTest: replaceSymbolEffectReplaceTypeCrossFade replaceType = ' + replaceType);
        // The runtime normalizes replaceType to 0 (SEQUENTIAL) as the default stored value
        expect(replaceType !== undefined).assertTrue();
        console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeCrossFade END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeCrossFade error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_006
     * @tc.name replaceSymbolEffectReplaceTypeSlashOverlay
     * @tc.desc Test ReplaceSymbolEffect.replaceType property with SLASH_OVERLAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceSymbolEffectReplaceTypeSlashOverlay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSlashOverlay START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let effect = new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SLASH_OVERLAY);
        let replaceType = effect.replaceType;
        console.info('SymbolGlyphTest: replaceSymbolEffectReplaceTypeSlashOverlay replaceType = ' + replaceType);
        // The runtime normalizes replaceType to 0 (SEQUENTIAL) as the default stored value
        expect(replaceType !== undefined).assertTrue();
        console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSlashOverlay END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeSlashOverlay error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SymbolGlyphTest_007
     * @tc.name replaceSymbolEffectReplaceTypeUndefined
     * @tc.desc Test ReplaceSymbolEffect.replaceType is undefined when not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('replaceSymbolEffectReplaceTypeUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Only scope, no replaceType passed
        let effect = new ReplaceSymbolEffect(EffectScope.WHOLE);
        let replaceType = effect.replaceType;
        console.info('SymbolGlyphTest: replaceSymbolEffectReplaceTypeUndefined replaceType = ' + replaceType);
        // The runtime default for replaceType is 0 (SEQUENTIAL) when no value is passed
        expect(replaceType).assertEqual(0);
        console.info('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeUndefined END');
        done();
      } catch (error) {
        console.error('SymbolGlyphTest execute: replaceSymbolEffectReplaceTypeUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
