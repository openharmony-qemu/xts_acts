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
import { describe, beforeEach, expect, Level } from '@ohos/hypium-dynamic';
import { inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { EditorFixture } from './EditorFixture';
import { proxyTest as it } from './ProxyTest';

async function expectError(invoke: () => Promise<void>, code: number): Promise<void> {
  let caught: BusinessError | undefined = undefined;
  try {
    await invoke();
  } catch (error) {
    caught = error as BusinessError;
  }
  expect(caught !== undefined).assertTrue();
  if (caught !== undefined) {
    expect(caught.code).assertEqual(code);
    expect(caught.message.length > 0).assertTrue();
  }
}

function expectProxyAbility(value: inputMethodEngine.ProxyInputMethodAbility | null): void {
  expect(value !== null && value !== undefined).assertTrue();
  if (value !== null && value !== undefined) {
    expect(typeof value.onInputStart).assertEqual('function');
    expect(typeof value.onUnregister).assertEqual('function');
  }
}

function expectProxyDelegate(value: inputMethodEngine.ProxyKeyboardDelegate | null): void {
  expect(value !== null && value !== undefined).assertTrue();
  if (value !== null && value !== undefined) {
    expect(typeof value.onKeyEvent).assertEqual('function');
    expect(typeof value.onTextChange).assertEqual('function');
  }
}

export default function inAppProxyRegistration(): void {
  describe('inAppProxyRegistration', () => {
    beforeEach(async () => { await EditorFixture.cleanup(); });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0010
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0010
     * @tc.desc registerInAppProxyIme：不传 options，代理所有类型。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0010', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0020
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0020
     * @tc.desc registerInAppProxyIme：options={} 无 inputPatternTypes。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0020', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({});
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0030
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0030
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_TEXT。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0030', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_TEXT]
      });
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0040
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0040
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_NUMBER。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0040', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_NUMBER]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0050
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0050
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_PASSWORD。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0050', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_PASSWORD]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0060
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0060
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_PHONE。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0060', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_PHONE]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0070
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0070
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_DATETIME。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0070', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_DATETIME]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0080
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0080
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_EMAIL。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0080', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_EMAIL]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0090
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0090
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_URI。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0090', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_URI]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0100
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0100
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_PASSWORD_SCREEN_LOCK。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0100', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [
        inputMethodEngine.PATTERN_PASSWORD_SCREEN_LOCK] });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0110
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0110
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_PASSWORD_NUMBER。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0110', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_PASSWORD_NUMBER]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0120
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0120
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_USER_NAME。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0120', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_USER_NAME]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0130
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0130
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_NEW_PASSWORD。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0130', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_NEW_PASSWORD]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0140
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0140
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_NUMBER_DECIMAL。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0140', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_NUMBER_DECIMAL]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0150
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0150
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_ONE_TIME_CODE。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0150', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_ONE_TIME_CODE]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0160
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0160
     * @tc.desc registerInAppProxyIme：单元素 PATTERN_ONE_TIME_CODE_NUMBER。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0160', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [
        inputMethodEngine.PATTERN_ONE_TIME_CODE_NUMBER] });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0170
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0170
     * @tc.desc registerInAppProxyIme 接受合法 PATTERN_NULL（值为 -1）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0170', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_NULL]
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0180
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0180
     * @tc.desc registerInAppProxyIme：两元素 [TEXT, NUMBER]。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0180', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_TEXT,
        inputMethodEngine.PATTERN_NUMBER] });
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0190
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0190
     * @tc.desc 全部16个PATTERN常量注册，并检查真实单行/多行编辑框可绑定。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0190', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [
        inputMethodEngine.PATTERN_MULTILINE, inputMethodEngine.PATTERN_TEXT,
        inputMethodEngine.PATTERN_NUMBER, inputMethodEngine.PATTERN_PASSWORD, inputMethodEngine.PATTERN_PHONE,
        inputMethodEngine.PATTERN_DATETIME, inputMethodEngine.PATTERN_EMAIL, inputMethodEngine.PATTERN_URI,
        inputMethodEngine.PATTERN_PASSWORD_SCREEN_LOCK, inputMethodEngine.PATTERN_PASSWORD_NUMBER,
        inputMethodEngine.PATTERN_USER_NAME, inputMethodEngine.PATTERN_NEW_PASSWORD,
        inputMethodEngine.PATTERN_NUMBER_DECIMAL, inputMethodEngine.PATTERN_ONE_TIME_CODE,
        inputMethodEngine.PATTERN_ONE_TIME_CODE_NUMBER, inputMethodEngine.PATTERN_NULL] });
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
      EditorFixture.blur();
      await EditorFixture.waitUntil(() => !EditorFixture.editorFocused);
      await EditorFixture.bindRegistered('ab\ncd', 1, true);
      expect(await EditorFixture.getClient().getForward(1)).assertEqual('a');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0200
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0200
     * @tc.desc registerInAppProxyIme：重复元素 [TEXT, TEXT, TEXT]。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0200', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_TEXT,
        inputMethodEngine.PATTERN_TEXT, inputMethodEngine.PATTERN_TEXT] });
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0210
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0210
     * @tc.desc registerInAppProxyIme：空数组（spec 禁止）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0210', Level.LEVEL1, async () => {
      await expectError(() => inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [] }), 401);
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0240
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0240
     * @tc.desc registerInAppProxyIme：含非法值 999。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0240', Level.LEVEL1, async () => {
      await expectError(() => inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [999] }), 401);
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0250
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0250
     * @tc.desc registerInAppProxyIme 拒绝非法负值 -2，避免混用合法 PATTERN_NULL。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0250', Level.LEVEL1, async () => {
      await expectError(() => inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [-2] }), 401);
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0260
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0260
     * @tc.desc registerInAppProxyIme：混合合法+非法 [TEXT, 999]。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0260', Level.LEVEL1, async () => {
      await expectError(() => inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [
        inputMethodEngine.PATTERN_TEXT, 999] }), 401);
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0300
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0300
     * @tc.desc registerInAppProxyIme：register→unregister→register 循环。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0300', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      await inputMethodEngine.unregisterInAppProxyIme();
      const result = await inputMethodEngine.registerInAppProxyIme();
      expect(result).assertUndefined();
      await EditorFixture.bindRegistered();
      expect(await EditorFixture.getClient().getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0220
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0220
     * @tc.desc 显式 null options 按客户确认走默认注册路径，不抛参数异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0220', Level.LEVEL1, async () => {
      const options = JSON.parse('null') as inputMethodEngine.RegisterOptions;
      expect(options === null).assertTrue();
      expect(JSON.stringify(options)).assertEqual('null');
      console.info('====> ' + '[XTS_NULL_OPTIONS_INPUT] isNull=true serialized=null');
      await inputMethodEngine.registerInAppProxyIme(options);
      expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0270
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0270
     * @tc.desc registerInAppProxyIme：调用方非聚焦。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0270', Level.LEVEL1, async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const ability = await delegator.getCurrentTopAbility();
      try {
        await delegator.doAbilityBackground(ability);
        await EditorFixture.waitUntil(() => !EditorFixture.isWindowFocused());
        await expectError(() => inputMethodEngine.registerInAppProxyIme(), 12800027);
      } finally {
        await delegator.doAbilityForeground(ability);
        await EditorFixture.waitUntil(() => EditorFixture.isWindowFocused());
      }
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0230
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0230
     * @tc.desc registerInAppProxyIme：重复注册 last wins。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0230', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_TEXT] });
      await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_NUMBER] });
      EditorFixture.blur();
      EditorFixture.client = null;
      EditorFixture.focusNumber();
      await EditorFixture.waitUntil(() => EditorFixture.client !== null);
      expect((await EditorFixture.getClient().getEditorAttribute()).inputPattern)
        .assertEqual(inputMethodEngine.PATTERN_NUMBER);
      EditorFixture.blur();
      EditorFixture.client = null;
      EditorFixture.focus();
      // Observe a bounded event window after the editor focus request.
      await new Promise<void>((resolve) => setTimeout(resolve, 1000));
      expect(EditorFixture.client === null).assertTrue();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0290
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0290
     * @tc.desc registerInAppProxyIme：连续注册两次 last wins 回调。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0290', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_TEXT] });
      await inputMethodEngine.registerInAppProxyIme({ inputPatternTypes: [inputMethodEngine.PATTERN_NUMBER] });
      EditorFixture.blur();
      EditorFixture.client = null;
      EditorFixture.focusNumber();
      await EditorFixture.waitUntil(() => EditorFixture.client !== null);
      expect((await EditorFixture.getClient().getEditorAttribute()).inputPattern)
        .assertEqual(inputMethodEngine.PATTERN_NUMBER);
      EditorFixture.blur();
      EditorFixture.client = null;
      EditorFixture.focus();
      // Observe a bounded event window after the editor focus request.
      await new Promise<void>((resolve) => setTimeout(resolve, 1000));
      expect(EditorFixture.client === null).assertTrue();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_1270
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_1270
     * @tc.desc 核对输入法框架实际导出的输入类型常量值。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_1270', Level.LEVEL1, async () => {
      expect(inputMethodEngine.PATTERN_NULL).assertEqual(-1);
      expect(inputMethodEngine.PATTERN_TEXT).assertEqual(0);
      expect(inputMethodEngine.PATTERN_MULTILINE).assertEqual(1);
      expect(inputMethodEngine.ENTER_KEY_TYPE_NONE).assertEqual(1);
      expect(inputMethodEngine.PATTERN_NUMBER).assertEqual(2);
      expect(inputMethodEngine.PATTERN_PHONE).assertEqual(3);
      expect(inputMethodEngine.PATTERN_PASSWORD).assertEqual(7);
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0320
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0320
     * @tc.desc unregisterInAppProxyIme：未注册直接注销（幂等）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0320', Level.LEVEL1, async () => {
      const result = await inputMethodEngine.unregisterInAppProxyIme();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0310
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0310
     * @tc.desc 注销已注册代理，监听对象仍可获取，不把 getter 当成注册状态查询。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0310', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      await inputMethodEngine.unregisterInAppProxyIme();
      await inputMethodEngine.unregisterInAppProxyIme();
      expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
      expectProxyDelegate(inputMethodEngine.getProxyKeyboardDelegate());
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0330
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0330
     * @tc.desc unregisterInAppProxyIme：连续注销两次。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0330', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      await inputMethodEngine.unregisterInAppProxyIme();
      await inputMethodEngine.unregisterInAppProxyIme();
      expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
      expectProxyDelegate(inputMethodEngine.getProxyKeyboardDelegate());
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0350
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0350
     * @tc.desc getProxyInputMethodAbility：已注册返回实例。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0350', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
    });

    /**
     * @tc.name Sub_InputMethod_IME_CustomKeyboard_0360
     * @tc.number Sub_InputMethod_IME_CustomKeyboard_0360
     * @tc.desc getProxyKeyboardDelegate：已注册返回实例。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('Sub_InputMethod_IME_CustomKeyboard_0360', Level.LEVEL1, async () => {
      await inputMethodEngine.registerInAppProxyIme();
      expectProxyDelegate(inputMethodEngine.getProxyKeyboardDelegate());
    });

  });
}
