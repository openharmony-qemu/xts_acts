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

'use static'

import {
  Entry,
  Component,
  Column,
  Scroll,
  SymbolGlyph,
  ReplaceSymbolEffect,
  ReplaceEffectType,
  EffectScope,
  $r
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SymbolGlyphIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('SymbolGlyphIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SEQUENTIAL), false)
          .key('symbolGlyphSequential')

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE), false)
          .key('symbolGlyphCrossFade')

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.SLASH_OVERLAY), false)
          .key('symbolGlyphSlashOverlay')
      }
      .width('100%')
      .padding({ top: 10, bottom: 10, left: 10, right: 10 })
    }
    .width('100%')
    .height('100%')
  }
}
