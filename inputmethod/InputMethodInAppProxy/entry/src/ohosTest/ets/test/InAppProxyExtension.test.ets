    afterEach(async () => { await EditorFixture.cleanup(); });
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import { EditorFixture } from './EditorFixture';
import { extensionProbe } from './ExtensionFixture';

export default function inAppProxyExtension(): void {
  describe('inAppProxyExtension', () => {
    beforeEach(async () => { await EditorFixture.cleanup(); });
    afterEach(async () => { await EditorFixture.cleanup(); });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0280
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0280
     * @tc.desc registerInAppProxyIme：调用方是输入法扩展。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0280', Level.LEVEL1, async () => {
      const rows = await extensionProbe();
      const row = rows.find((value) => value.operation === 'register');
      expect(row !== undefined).assertTrue();
      if (row !== undefined) {
        expect(row.code).assertEqual(12800028);
        expect(row.message.length > 0).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0340
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0340
     * @tc.desc 输入法扩展调用注销接口的幂等清理行为。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0340', Level.LEVEL1, async () => {
      const rows = await extensionProbe();
      const row = rows.find((value) => value.operation === 'unregister');
      expect(row !== undefined).assertTrue();
      if (row !== undefined) {
        expect(row.code).assertEqual(0);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0370
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0370
     * @tc.desc getProxyInputMethodAbility：从 Extension 调用。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0370', Level.LEVEL1, async () => {
      const rows = await extensionProbe();
      const row = rows.find((value) => value.operation === 'ability');
      expect(row !== undefined).assertTrue();
      if (row !== undefined) {
        expect(row.code).assertEqual(12800028);
        expect(row.message.length > 0).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0380
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0380
     * @tc.desc getProxyKeyboardDelegate：从 Extension 调用。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0380', Level.LEVEL1, async () => {
      const rows = await extensionProbe();
      const row = rows.find((value) => value.operation === 'delegate');
      expect(row !== undefined).assertTrue();
      if (row !== undefined) {
        expect(row.code).assertEqual(12800028);
        expect(row.message.length > 0).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0390
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0390
     * @tc.desc getProxyInputMethodAbility：throw 路径验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0390', Level.LEVEL1, async () => {
      const rows = await extensionProbe();
      const row = rows.find((value) => value.operation === 'ability');
      expect(row !== undefined).assertTrue();
      if (row !== undefined) {
        expect(row.code).assertEqual(12800028);
        expect(row.message.length > 0).assertTrue();
      }
    });
  });
}
