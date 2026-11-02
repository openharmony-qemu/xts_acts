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
import { inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { EditorFixture } from './EditorFixture';

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

export default function inAppProxyEditing(): void {
  describe('inAppProxyEditing', () => {
    beforeEach(async () => { await EditorFixture.cleanup(); });
    afterEach(async () => { await EditorFixture.cleanup(); });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0610
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0610
     * @tc.desc deleteForward：length=1 删除1字符。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0610', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.deleteForward(1);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abdef');
      expect(EditorFixture.text).assertEqual('abdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0620
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0620
     * @tc.desc deleteForward：length=0（不删，下界）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0620', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.deleteForward(0);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abcdef');
      expect(EditorFixture.text).assertEqual('abcdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0630
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0630
     * @tc.desc deleteForward：length=-1（负数）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0630', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.deleteForward(-1), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0640
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0640
     * @tc.desc deleteBackward：deleteBackward length=1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0640', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.deleteBackward(1);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abcef');
      expect(EditorFixture.text).assertEqual('abcef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0650
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0650
     * @tc.desc deleteBackward：length=0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0650', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.deleteBackward(0);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abcdef');
      expect(EditorFixture.text).assertEqual('abcdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0660
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0660
     * @tc.desc deleteBackward：length=-1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0660', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.deleteBackward(-1), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0710
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0710
     * @tc.desc getForward：length=3 取3字符。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0710', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0720
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0720
     * @tc.desc getForward：length=0（返回空串，下界）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0720', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getForward(0)).assertEqual('');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0730
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0730
     * @tc.desc getForward：length=-1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0730', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(async () => { await client.getForward(-1); }, 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0750
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0750
     * @tc.desc getBackward：getBackward length=3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0750', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getBackward(3)).assertEqual('def');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0760
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0760
     * @tc.desc getBackward：length=0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0760', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getBackward(0)).assertEqual('');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0770
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0770
     * @tc.desc getBackward：length=-1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0770', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(async () => { await client.getBackward(-1); }, 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0740
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0740
     * @tc.desc getForward：返回值类型验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0740', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0670
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0670
     * @tc.desc insertText：正常文本。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0670', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const inserted = 'hello';
      await client.insertText(inserted);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abc' + inserted + 'def');
      expect(EditorFixture.text).assertEqual('abc' + inserted + 'def');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0680
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0680
     * @tc.desc insertText：空字符串。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0680', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const inserted = '';
      await client.insertText(inserted);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abc' + inserted + 'def');
      expect(EditorFixture.text).assertEqual('abc' + inserted + 'def');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0690
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0690
     * @tc.desc insertText：特殊字符。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0690', Level.LEVEL1, async () => {
      await EditorFixture.bind('abcdef', 3, true);
      const client = EditorFixture.getClient();
      const inserted = '你好👋\n\t';
      await client.insertText(inserted);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abc' + inserted + 'def');
      expect(EditorFixture.text).assertEqual('abc' + inserted + 'def');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0700
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0700
     * @tc.desc insertText 插入 xyz 后真实编辑框文本按光标位置更新。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0700', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const inserted = 'xyz';
      await client.insertText(inserted);
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abc' + inserted + 'def');
      expect(EditorFixture.text).assertEqual('abc' + inserted + 'def');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0820
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0820
     * @tc.desc moveCursor：direction=1 上。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0820', Level.LEVEL1, async () => {
      await EditorFixture.bind('11\n11\n11', 4, true);
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(4);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      await EditorFixture.waitUntil(() => EditorFixture.cursor === 1);
      expect(await client.getTextIndexAtCursor()).assertEqual(1);
      expect(EditorFixture.text).assertEqual('11\n11\n11');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0830
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0830
     * @tc.desc moveCursor：direction=2 下。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0830', Level.LEVEL1, async () => {
      await EditorFixture.bind('11\n11\n11', 4, true);
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(4);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      await EditorFixture.waitUntil(() => EditorFixture.cursor === 7);
      expect(await client.getTextIndexAtCursor()).assertEqual(7);
      expect(EditorFixture.text).assertEqual('11\n11\n11');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0840
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0840
     * @tc.desc moveCursor：direction=3 左。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0840', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      await EditorFixture.waitUntil(() => EditorFixture.cursor === 2);
      expect(await client.getTextIndexAtCursor()).assertEqual(2);
      expect(EditorFixture.text).assertEqual('abcdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0850
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0850
     * @tc.desc moveCursor：direction=4 右。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0850', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      await EditorFixture.waitUntil(() => EditorFixture.cursor === 4);
      expect(await client.getTextIndexAtCursor()).assertEqual(4);
      expect(EditorFixture.text).assertEqual('abcdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0860
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0860
     * @tc.desc moveCursor：direction=0（非法）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0860', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.moveCursor(0 as inputMethodEngine.Direction), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0870
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0870
     * @tc.desc moveCursor：direction=5（超出范围）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0870', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.moveCursor(5 as inputMethodEngine.Direction), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0880
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0880
     * @tc.desc moveCursor：direction=-1（负数）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0880', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.moveCursor(-1 as inputMethodEngine.Direction), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0780
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0780
     * @tc.desc getEditorAttribute：无参调用。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0780', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const attribute = await client.getEditorAttribute();
      expect(attribute !== null && attribute !== undefined).assertTrue();
      expect(attribute.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(attribute.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0790
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0790
     * @tc.desc getEditorAttribute：返回值非 null。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0790', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const attribute = await client.getEditorAttribute();
      expect(attribute !== null && attribute !== undefined).assertTrue();
      expect(attribute.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(attribute.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0810
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0810
     * @tc.desc getEditorAttribute：返回值属性验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0810', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const attribute = await client.getEditorAttribute();
      expect(attribute !== null && attribute !== undefined).assertTrue();
      expect(attribute.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(attribute.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0930
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0930
     * @tc.desc getTextIndexAtCursor：无参调用。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0930', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0940
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0940
     * @tc.desc getTextIndexAtCursor：返回值≥0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0940', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0890
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0890
     * @tc.desc selectByRange：合法 Range。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0890', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.selectByRange({ start: 0, end: 5 });
      await client.insertText('X');
      await EditorFixture.waitUntil(() => EditorFixture.text === 'Xf');
      expect(EditorFixture.text).assertEqual('Xf');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0900
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0900
     * @tc.desc selectByRange：Range start==end（空选区）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0900', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.selectByRange({ start: 2, end: 2 });
      await client.insertText('X');
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abXcdef');
      expect(EditorFixture.text).assertEqual('abXcdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0910
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0910
     * @tc.desc selectByRange：resolve 验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0910', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.selectByRange({ start: 0, end: 5 });
      await client.insertText('X');
      await EditorFixture.waitUntil(() => EditorFixture.text === 'Xf');
      expect(EditorFixture.text).assertEqual('Xf');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0920
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0920
     * @tc.desc selectByMovement 接受含 direction 的 Movement 对象并改变真实选区。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0920', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.selectByMovement({ direction: inputMethodEngine.CURSOR_LEFT });
      await client.insertText('X');
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abXdef');
      expect(EditorFixture.text).assertEqual('abXdef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0950
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0950
     * @tc.desc sendExtendAction：合法 ExtendAction。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0950', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await client.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => EditorFixture.text === 'X');
      expect(EditorFixture.text).assertEqual('X');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0570
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0570
     * @tc.desc UNSPECIFIED和NONE均不提交文本，以DONE的真实onSubmit作为正向见证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0570', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const before = EditorFixture.submissions.length;
      await client.sendKeyFunction(inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED);
      await client.sendKeyFunction(inputMethodEngine.ENTER_KEY_TYPE_NONE);
      await client.sendKeyFunction(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      await EditorFixture.waitUntil(() => EditorFixture.submissions.length > before);
      const received = EditorFixture.submissions.slice(before);
      expect(received.length).assertEqual(1);
      expect(received[0].action).assertEqual(EnterKeyType.Done);
      expect(received[0].text).assertEqual('abcdef');
      expect(EditorFixture.text).assertEqual('abcdef');
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0580
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0580
     * @tc.desc DONE 触发真实编辑框 onSubmit，返回操作类型和提交前的完整文本。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0580', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const before = EditorFixture.submissions.length;
      await client.sendKeyFunction(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      await EditorFixture.waitUntil(() => EditorFixture.submissions.length > before);
      const received = EditorFixture.submissions.slice(before);
      expect(received.length).assertEqual(1);
      expect(received[0].action).assertEqual(EnterKeyType.Done);
      expect(received[0].text).assertEqual('abcdef');
      expect(EditorFixture.text).assertEqual('abcdef');
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0590
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0590
     * @tc.desc sendKeyFunction rejects 9, outside exported ENTER_KEY_TYPE constants.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0590', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.sendKeyFunction(9), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0600
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0600
     * @tc.desc sendKeyFunction rejects a negative action with 401.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0600', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      await expectError(() => client.sendKeyFunction(-1), 401);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0960
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0960
     * @tc.desc hideSelf 通知真实 ArkUI 编辑框；按当前进程及唯一标记核对接收和应用日志。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0960', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const controller = EditorFixture.controller;
      if (controller === null) {
        throw new Error('Proxy keyboard controller unavailable');
      }
      const observed = await EditorFixture.hideAndObserve(controller);
      expect(observed.receivedNotifications > 0).assertTrue();
      expect(observed.adapterNotifications > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0980
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0980
     * @tc.desc hideSelf 后重新绑定编辑框，两次均核对各自独立标记内的实际接收日志。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0980', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const controller = EditorFixture.controller;
      if (controller === null) {
        throw new Error('Proxy keyboard controller unavailable');
      }
      const first = await EditorFixture.hideAndObserve(controller);
      expect(first.receivedNotifications > 0 && first.adapterNotifications > 0).assertTrue();
      EditorFixture.blur();
      await inputMethodEngine.unregisterInAppProxyIme();
      await EditorFixture.bind();
      const nextController = EditorFixture.controller;
      if (nextController === null) {
        throw new Error('No controller after rebinding');
      }
      const next = await EditorFixture.hideAndObserve(nextController);
      expect(next.receivedNotifications > 0 && next.adapterNotifications > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0970
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0970
     * @tc.desc 连续两次 hideSelf 分别收到真实编辑框通知，第一次通知后客户端仍可读。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0970', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const controller = EditorFixture.controller;
      if (controller === null) {
        throw new Error('Proxy keyboard controller unavailable');
      }
      const first = await EditorFixture.hideAndObserve(controller);
      expect(first.receivedNotifications > 0 && first.adapterNotifications > 0).assertTrue();
      expect(await client.getTextIndexAtCursor()).assertEqual(3);
      const next = await EditorFixture.hideAndObserve(controller);
      expect(next.receivedNotifications > 0 && next.adapterNotifications > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0990
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0990
     * @tc.desc hideSelf：reject 路径-detail。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0990', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const controller = EditorFixture.controller;
      if (controller === null) {
        throw new Error('Proxy keyboard controller unavailable');
      }
      EditorFixture.blur();
      await inputMethodEngine.unregisterInAppProxyIme();
      await expectError(() => controller.hideSelf(), 12800003);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0800
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0800
     * @tc.desc getEditorAttribute：保持代理注册，仅失焦且经事件及实际焦点确认。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0800', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const driver = await Driver.create();
      await EditorFixture.waitUntil(() => EditorFixture.editorFocused);
      const focusedEditor = await driver.waitForComponent(ON.id('proxyEditor').focused(true), 3000);
      expect(await focusedEditor.isFocused()).assertTrue();
      const blurBefore = EditorFixture.editorBlurEvents;
      const sinkBefore = EditorFixture.sinkFocusEvents;
      EditorFixture.blur();
      await EditorFixture.waitUntil(() => !EditorFixture.editorFocused &&
        EditorFixture.editorBlurEvents > blurBefore && EditorFixture.sinkFocusEvents > sinkBefore);
      const sink = await driver.waitForComponent(ON.id('focusSink').focused(true), 3000);
      const editor = await driver.waitForComponent(ON.id('proxyEditor').focused(false), 3000);
      expect(await sink.isFocused()).assertTrue();
      expect(await editor.isFocused()).assertFalse();
      await expectError(async () => { await client.getEditorAttribute(); }, 12800003);
    });

  });
}
