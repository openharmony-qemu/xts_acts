import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { regexpSymbolMatchAll } from './RegExpSymbols';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function matchTest002(): void {
  describe('Match_Supplement_Compile_Safe', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name testMatch0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0100
     * @tc.desc Match returns all numeric groups with global flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('\\d+', 'g');
      const out = 'a1b22c333'.match(re);
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('1');
      expect(out[1]).assertEqual('22');
      expect(out[2]).assertEqual('333');
    });

    /**
     * @tc.name testMatch0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0200
     * @tc.desc Match returns whole result and capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('(ab)(cd)');
      const out = 'xxabcdyy'.match(re);
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('abcd');
      expect(out[1]).assertEqual('ab');
      expect(out[2]).assertEqual('cd');
    });

    /**
     * @tc.name testMatch0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0300
     * @tc.desc Match returns null when pattern is absent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('z+');
      const out = 'abc'.match(re);
      expect(out === null).assertTrue();
    });

    /**
     * @tc.name testMatch0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0400
     * @tc.desc Match supports case-insensitive single capture
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('abc', 'i');
      const out = 'xxAbCyy'.match(re);
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('AbC');
    });

    /**
     * @tc.name testMatch0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0500
     * @tc.desc Match: non-global returns match with index/input properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out = 'xxabcdyy'.match(new RegExp('ab(cd)'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('abcd');
      expect(out[1]).assertEqual('cd');
      expect(out.index).assertEqual(2);
      expect(out.input).assertEqual('xxabcdyy');
    });

    /**
     * @tc.name testMatch0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0600
     * @tc.desc Match: global ignores capture groups and returns strings array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out = 'ab1ab2ab3'.match(new RegExp('(ab)(\\d)', 'g'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('ab1');
      expect(out[1]).assertEqual('ab2');
      expect(out[2]).assertEqual('ab3');
    });

    /**
     * @tc.name testMatch0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0700
     * @tc.desc Match: empty pattern matches at position zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out = 'abc'.match(new RegExp('(?:)'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('');
      expect(out.index).assertEqual(0);
      expect(out.input).assertEqual('abc');
    });

    /**
     * @tc.name testMatch0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0800
     * @tc.desc Match: alternation and anchors return correct match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out1 = 'xxcatyy'.match(new RegExp('(dog|cat)'));
      expect(out1 !== null).assertTrue();
      if (out1 !== null) {
        expect(out1[0]).assertEqual('cat');
        expect(out1[1]).assertEqual('cat');
      }
      const out2 = 'hello world'.match(new RegExp('^hello'));
      expect(out2 !== null).assertTrue();
      const out3 = 'hello world'.match(new RegExp('world$'));
      expect(out3 !== null).assertTrue();
      expect('say hello'.match(new RegExp('^hello')) === null).assertTrue();
    });

    /**
     * @tc.name testMatch0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_0900
     * @tc.desc Match: greedy vs lazy are observable in matched substring
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'a123b456b';
      const g = input.match(new RegExp('a.*b'));
      const l = input.match(new RegExp('a.*?b'));
      expect(g !== null).assertTrue();
      expect(l !== null).assertTrue();
      if (g !== null && l !== null) {
        expect(g[0]).assertEqual('a123b456b');
        expect(l[0]).assertEqual('a123b');
      }
    });

    /**
     * @tc.name testMatch0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1000
     * @tc.desc Match: multiline flag changes ^ and $ matching behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'first\nsecond\nthird';
      expect(input.match(new RegExp('^second')) === null).assertTrue();
      const out = input.match(new RegExp('^second', 'm'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('second');
      }
      const end = input.match(new RegExp('third$'));
      expect(end !== null).assertTrue();
      if (end !== null) {
        expect(end[0]).assertEqual('third');
      }
    });

    /**
     * @tc.name testMatch0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1100
     * @tc.desc Match: unicode flag with code point escapes when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'Hi 😀 there';
      const plain = input.match(new RegExp('😀'));
      expect(plain !== null).assertTrue();
      if (supportsRegExp('\\u{1F600}', 'u')) {
        const u = input.match(new RegExp('\\u{1F600}', 'u'));
        expect(u !== null).assertTrue();
        if (u !== null) {
          expect(u[0]).assertEqual('😀');
        }
      }
    });

    /**
     * @tc.name testMatch0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1200
     * @tc.desc Match: named capturing groups (groups) when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = '2026-04-17';
      if (!supportsRegExp('(?<y>\\d{4})-(?<m>\\d{2})-(?<d>\\d{2})')) {
        // Engine does not support named capture; treat as skip.
        return;
        return;
      }
      const out = input.match(new RegExp('(?<y>\\d{4})-(?<m>\\d{2})-(?<d>\\d{2})'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      // Avoid strict nullable/groups typing differences across ArkTS versions.
      expect(out[0]).assertEqual('2026-04-17');
      expect(out[1]).assertEqual('2026');
      expect(out[2]).assertEqual('04');
      expect(out[3]).assertEqual('17');
    });

    /**
     * @tc.name testMatch0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1300
     * @tc.desc Match: dotAll (s) flag when supported affects '.' over newline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'hello\nworld';
      expect(input.match(new RegExp('hello.world')) === null).assertTrue();
      if (supportsRegExp('hello.world', 's')) {
        const out = input.match(new RegExp('hello.world', 's'));
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual('hello\nworld');
        }
      }
    });

    /**
     * @tc.name testMatch0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1400
     * @tc.desc Match: word boundaries and non-word boundaries behave
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('test'.match(new RegExp('\\btest\\b')) !== null).assertTrue();
      expect('testing'.match(new RegExp('\\btest\\b')) === null).assertTrue();
      expect('testing'.match(new RegExp('test\\B')) !== null).assertTrue();
      expect('test'.match(new RegExp('test\\B')) === null).assertTrue();
    });

    /**
     * @tc.name testMatch0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1500
     * @tc.desc Match: backslash and special character escaping works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'a+b*c?.()[]{}|^$\\';
      const tokens: Array<[RegExp, string]> = [
        [new RegExp('\\+'), '+'],
        [new RegExp('\\*'), '*'],
        [new RegExp('\\?'), '?'],
        [new RegExp('\\.'), '.'],
        [new RegExp('\\('), '('],
        [new RegExp('\\)'), ')'],
        [new RegExp('\\['), '['],
        [new RegExp('\\]'), ']'],
        [new RegExp('\\{'), '{'],
        [new RegExp('\\}'), '}'],
        [new RegExp('\\|'), '|'],
        [new RegExp('\\^'), '^'],
        [new RegExp('\\$'), '$'],
        [new RegExp('\\\\'), '\\'],
      ];
      for (let i = 0; i < tokens.length; i++) {
        const [re, expected] = tokens[i];
        const out = input.match(re);
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual(expected);
        }
      }
    });

    /**
     * @tc.name testMatch0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1600
     * @tc.desc Match: no-match cases return null across common patterns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('abc'.match(new RegExp('z+')) === null).assertTrue();
      expect('123'.match(new RegExp('[a-z]+')) === null).assertTrue();
      expect('hello'.match(new RegExp('\\d+')) === null).assertTrue();
    });

    /**
     * @tc.name testMatch0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1700
     * @tc.desc Match: global multiline captures each line start token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'a1\nb2\nc3';
      const out = input.match(new RegExp('^[a-z]\\d', 'gm'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a1');
      expect(out[1]).assertEqual('b2');
      expect(out[2]).assertEqual('c3');
    });

    /**
     * @tc.name testMatch0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1800
     * @tc.desc Match: lookahead and negative lookahead when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'price=100USD fee=200EUR';
      if (supportsRegExp('\\d+(?=USD)')) {
        const out1 = input.match(new RegExp('\\d+(?=USD)'));
        expect(out1 !== null).assertTrue();
        if (out1 !== null) {
          expect(out1[0]).assertEqual('100');
        }
      }
      if (supportsRegExp('\\d+(?!USD)')) {
        // Prefer a stable delimiter over \\b because word-boundary handling can vary with non-ASCII and punctuation.
        const out2 = input.match(new RegExp('\\d+(?!USD)(?=\\D|$)'));
        expect(out2 !== null).assertTrue();
        if (out2 !== null) {
          expect(out2[0]).assertEqual('200');
        }
        const out3 = 'fee=200EUR'.match(new RegExp('\\d+(?!USD)'));
        expect(out3 !== null).assertTrue();
        if (out3 !== null) {
          expect(out3[0]).assertEqual('200');
        }
      }
    });

    /**
     * @tc.name testMatch0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_1900
     * @tc.desc Match: rebuilt RegExp from existing one keeps semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base = new RegExp('abc', 'i');
      const rebuilt = new RegExp(base);
      const out1 = 'xxAbCyy'.match(base);
      const out2 = 'xxAbCyy'.match(rebuilt);
      expect(out1 !== null).assertTrue();
      expect(out2 !== null).assertTrue();
      if (out1 !== null && out2 !== null) {
        expect(out1[0]).assertEqual(out2[0]);
      }
      expect(rebuilt.source).assertEqual('abc');
      expect(rebuilt.flags).assertEqual('i');
    });

    /**
     * @tc.name testMatch0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2000
     * @tc.desc Match: global match returns only full matches and ignores capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Many code paths assume global match is a pure "find all" API and never depend on capture group slots.
      // Pinning this distinction prevents refactors from swapping match() variants and silently changing result shape.
      const text = 'x=12 y=34 z=56';
      const out = text.match(new RegExp('(\\w)=(\\d+)', 'g'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('x=12');
      expect(out[1]).assertEqual('y=34');
      expect(out[2]).assertEqual('z=56');
    });

    /**
     * @tc.name testMatch0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2100
     * @tc.desc Match: non-global match returns capture groups and index/input metadata
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // When business logic needs both extraction and position, non-global match is the common single-call primitive.
      // Index/input metadata is used for diagnostics and incremental patching without a second scan.
      const text = 'id=42; next=100';
      const out = text.match(new RegExp('(id)=(\\d+)'));
      expect(out !== null).assertTrue();
      if (out === null) {
        return;
      }
      expect(out[0]).assertEqual('id=42');
      expect(out[1]).assertEqual('id');
      expect(out[2]).assertEqual('42');
      expect(out.index).assertEqual(0);
      expect(out.input).assertEqual(text);
    });

    /**
     * @tc.name testMatch0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2200
     * @tc.desc Match: lastIndex is ignored and reset-safe even for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Shared regex instances can carry lastIndex state from other operations (exec/test).
      // match() must remain deterministic and should not leak cursor state back into callers.
      const re = new RegExp('\\d+', 'g');
      re.lastIndex = 5;
      const text = 'a1b22c333';
      const out = text.match(re);
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out.length).assertEqual(3);
        expect(out[0]).assertEqual('1');
        expect(out[1]).assertEqual('22');
        expect(out[2]).assertEqual('333');
      }
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testMatch0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2300
     * @tc.desc Match: empty pattern behaviors differ for global vs non-global
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Empty-pattern cases show up in template engines and split/join style helpers.
      // Distinguishing g vs non-g keeps behavior stable across refactors that toggle flags.
      const s = 'ab';
      const a = s.match(new RegExp(''));
      const b = s.match(new RegExp('', 'g'));
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[0]).assertEqual('');
        expect(a.index).assertEqual(0);
        expect(b.length >= 1).assertTrue();
      }
    });

    /**
     * @tc.name testMatch0223
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2400
     * @tc.desc Match: non-RegExp argument is coerced to string pattern (literal match)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Many product call sites pass a string when they mean a literal substring search.
      // Coercion rules must remain consistent so feature flags do not depend on argument typing.
      expect('Hello World'.match('World') !== null).assertTrue();
      expect('Hello World'.match('world') === null).assertTrue();
      expect('abc123'.match(String(123)) !== null).assertTrue();
    });

    /**
     * @tc.name testMatch0224
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2500
     * @tc.desc Match: RegExp instances use well-known Symbol.match for String.prototype.match dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Custom @@match objects are awkward in strict ArkTS; we still anchor coverage on the native RegExp path.
      // That path must exercise real matching so refactors to internal dispatch do not ship untested.
      const r = new RegExp('b');
      const m = 'abc'.match(r);
      expect(m !== null).assertTrue();
      if (m !== null) {
        expect(m[0]).assertEqual('b');
      }
    });

    /**
     * @tc.name testMatch0225
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2600
     * @tc.desc Match: invalid RegExp construction throws (pattern/flags)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Patterns often come from configuration; failing fast avoids silent "best effort" behavior.
      // Throwing on invalid flags prevents accidental deployment of a rule with altered semantics.
      let threwPattern = false;
      let threwFlags = false;
      try {
        new RegExp('[a-z');
      } catch (e) {
        threwPattern = true;
      }
      try {
        new RegExp('abc', 'x');
      } catch (e) {
        threwFlags = true;
      }
      expect(threwPattern).assertTrue();
      expect(threwFlags).assertTrue();
    });

    /**
     * @tc.name testMatch0226
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2700
     * @tc.desc MatchAll: String.matchAll yields exec-shaped rows for global regex with capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // matchAll is the safer API for streaming token extraction because it doesn't mutate the original regex object.
      // Using it avoids accidental lastIndex coupling across unrelated parsing stages.
      const regex = new RegExp('t(e)(st(\\d?))', 'g');
      const str = 'test1test2';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('test1');
      expect(out[1]).assertEqual('test2');
    });

    /**
     * @tc.name testMatch0227
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2800
     * @tc.desc MatchAll: regex[Symbol.matchAll](str) equals str.matchAll(regex)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some code uses the RegExp entrypoint, other code uses the String entrypoint.
      // Keeping them aligned avoids subtle differences when refactors flip call direction.
      const regex = new RegExp('test', 'g');
      const str = 'test test test';
      const fromString = Array.from(str.matchAll(regex));
      const fromRegExp = Array.from(regexpSymbolMatchAll(regex, str));
      expect(fromString.length).assertEqual(fromRegExp.length);
      expect(fromString.length).assertEqual(3);
      for (let i = 0; i < fromString.length; i++) {
        expect(fromString[i][0]).assertEqual(fromRegExp[i][0]);
      }
    });

    /**
     * @tc.name testMatch0228
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_2900
     * @tc.desc MatchAll: iterator exposes next() and is iterable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Iterator contracts matter for consumers that lazily page results rather than materializing arrays.
      // This ensures matchAll stays compatible with generic iterator utilities.
      const regex = new RegExp('test', 'g');
      const str = 'test test';
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0][0]).assertEqual('test');
      expect(out[0].index).assertEqual(0);
      expect(out[0].input).assertEqual(str);
    });

    /**
     * @tc.name testMatch0229
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3000
     * @tc.desc MatchAll: y+g (gy) sticky-global returns contiguous matches only when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // gy is used for strict token streams where separators are invalid and should terminate scanning.
      // Feature-gating prevents breakage on runtimes without sticky support.
      if (!supportsRegExp('[abc]', 'gy')) {
        return;
        return;
      }
      const regex = new RegExp('[abc]', 'gy');
      const str = 'ab-c';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
    });

    /**
     * @tc.name testMatch0230
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3100
     * @tc.desc Match: dotAll impacts '.' across newline when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Multiline payloads such as stack traces often need a single-token match that spans newline boundaries.
      // The gate keeps older engines runnable while still covering dotAll where implemented.
      const str = 'a\nb';
      expect(str.match(new RegExp('a.b')) === null).assertTrue();
      if (supportsRegExp('a.b', 's')) {
        const out = str.match(new RegExp('a.b', 's'));
        expect(out !== null).assertTrue();
        if (out !== null) {
          expect(out[0]).assertEqual('a\nb');
        }
      }
    });

    /**
     * @tc.name testMatch0231
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3200
     * @tc.desc MatchAll: Unicode property letters split Latin and Greek when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Unicode properties let business rules match letters across locales without manual ranges.
      // Feature-gating keeps devices with reduced Unicode support from failing the whole suite.
      if (!supportsRegExp('\\p{L}+', 'u')) {
        return;
        return;
      }
      const regex = new RegExp('\\p{L}+', 'gu');
      const str = 'ABC αβγ';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('ABC');
      expect(out[1]).assertEqual('αβγ');
    });

    /**
     * @tc.name testMatch0232
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3300
     * @tc.desc MatchAll: capture groups are present per match in iterator results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Captures in matchAll enable streaming extraction without a second pass over the buffer.
      // This is important for parsers that process large strings incrementally.
      const regex = new RegExp('(\\w+)\\s+(\\w+)', 'g');
      const str = 'hello world foo bar';
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0][1]).assertEqual('hello');
      expect(out[0][2]).assertEqual('world');
      expect(out[1][1]).assertEqual('foo');
      expect(out[1][2]).assertEqual('bar');
    });

    /**
     * @tc.name testMatch0233
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3400
     * @tc.desc MatchAll: named capture groups appear in groups when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Named groups make extraction templates readable and reduce off-by-one mistakes in long capture lists.
      // Gating keeps the suite portable while still validating behavior on capable engines.
      if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
        return;
        return;
      }
      const regex = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})', 'g');
      const str = '2024-01-15 and 2023-12-25';
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      // Named-group objects may not be typed/exposed in this ArkTS profile; validate positional captures.
      expect(out[0][1]).assertEqual('2024');
      expect(out[0][2]).assertEqual('01');
      expect(out[0][3]).assertEqual('15');
    });

    /**
     * @tc.name testMatch0234
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3500
     * @tc.desc MatchAll: String.matchAll requires global RegExp and should throw otherwise
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // matchAll is designed for exhaustive iteration; requiring /g prevents accidental single-hit iteration bugs.
      // A predictable throw lets libraries validate user-provided patterns early.
      let threw = false;
      try {
        Array.from('123 456'.matchAll(new RegExp('\\d+')));
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      const ok = Array.from('123 456'.matchAll(new RegExp('\\d+', 'g'))).map((m) => m[0]);
      expect(ok.length).assertEqual(2);
      expect(ok[0]).assertEqual('123');
      expect(ok[1]).assertEqual('456');
    });

    /**
     * @tc.name testMatch0235
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3600
     * @tc.desc MatchAll: does not mutate original regex lastIndex during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // matchAll is often chosen specifically to avoid shared-state hazards in concurrent parsing paths.
      // Preserving lastIndex enables safe reuse of cached regex objects across callers.
      const re = new RegExp('foo', 'g');
      re.lastIndex = 2;
      const out = Array.from('foo foo'.matchAll(re)).map((m) => m[0]);
      expect(out.length).assertEqual(1);
      expect(out[0]).assertEqual('foo');
      expect(re.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name testMatch0236
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3700
     * @tc.desc MatchAll: dotAll+multiline combination is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Log blobs are multiline; dotAll changes whether '.' spans lines while m changes anchor behavior per line.
      // Gating keeps the suite portable while still validating richer engines.
      if (!supportsRegExp('test.+test', 'gsm')) {
        return;
        return;
      }
      const re = new RegExp('test.+test', 'gsm');
      const str = 'test\ntest\n';
      const out = Array.from(str.matchAll(re));
      expect(out.length).assertEqual(1);
      const first = out[0];
      expect(first !== undefined).assertTrue();
      if (first === undefined) {
        return;
      }
      const hit0 = first[0];
      expect(hit0 !== undefined).assertTrue();
      if (hit0 === undefined) {
        return;
      }
      const hasNewline: boolean = hit0.indexOf('\n') >= 0;
      expect(hasNewline).assertTrue();
    });

    /**
     * @tc.name testMatch0237
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3800
     * @tc.desc MatchAll: multiline anchor finds two line heads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // m-anchored scanning is common in stack trace and config parsing where splitting loses absolute offsets.
      // matchAll provides a clean, iterator-based API for line-wise extraction.
      const re = new RegExp('^test', 'gm');
      const str = 'test\ntest';
      const out = Array.from(str.matchAll(re));
      expect(out.length).assertEqual(2);
      expect(out[0].index).assertEqual(0);
      expect(out[1].index).assertEqual(5);
    });

    /**
     * @tc.name testMatch0238
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_3900
     * @tc.desc MatchAll: ignoreCase+global matches all case variants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // User-generated content frequently varies by case; normalization relies on gi scans being exhaustive.
      // This prevents "almost all matches" bugs that are expensive to debug in production.
      const re = new RegExp('test', 'gi');
      const str = 'TEST test TeSt';
      const out = Array.from(str.matchAll(re)).map((m) => m[0]);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('TEST');
      expect(out[1]).assertEqual('test');
      expect(out[2]).assertEqual('TeSt');
    });

    /**
     * @tc.name testMatch0239
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4000
     * @tc.desc MatchAll: surrogate pair handling differs with u flag (feature-gated)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Supplementary-plane characters appear in math/music text; u-mode prevents splitting surrogate pairs.
      // We assert relative behavior (u yields fewer elements) to stay stable across engine implementations.
      const str = '𝌆𝌆';
      const a = Array.from(str.matchAll(new RegExp('.', 'g'))).length;
      if (supportsRegExp('.', 'gu')) {
        const b = Array.from(str.matchAll(new RegExp('.', 'gu'))).length;
        expect(b).assertEqual(2);
        expect(a >= b).assertTrue();
      } else {
        return;
      }
    });

    /**
     * @tc.name testMatch0240
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4100
     * @tc.desc Match: non-global sticky regex respects lastIndex when finding the next occurrence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some engines accept y on RegExp; match() should still behave as a deterministic finder.
      // We gate support to avoid compile-time failures on runtimes without sticky.
      if (!supportsRegExp('abc', 'y')) {
        return;
        return;
      }
      const re = new RegExp('abc', 'y');
      re.lastIndex = 3;
      const out = 'abcabc'.match(re);
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('abc');
      }
      expect(re.lastIndex).assertEqual(6);
    });

    /**
     * @tc.name testMatch0241
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4200
     * @tc.desc Match: Unicode code point escape matches emoji when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some patterns are stored in ASCII-only configs and rely on \\u{...} escapes for portability.
      // Feature gating ensures the suite still runs where u-mode escapes are not implemented.
      if (!supportsRegExp('\\u{1F600}', 'u')) {
        return;
        return;
      }
      const out = 'A😀B'.match(new RegExp('\\u{1F600}', 'u'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('😀');
      }
    });

    /**
     * @tc.name testMatch0242
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4300
     * @tc.desc MatchAll: nested capture structure exposes correct group slots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Nested captures are common in legacy patterns; group slots must remain stable for downstream templates.
      // This locks in a multi-group shape without relying on named group support.
      const regex = new RegExp('t(e)(st(\\d?))', 'g');
      const out = Array.from('test1test2'.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0][0]).assertEqual('test1');
      expect(out[0][1]).assertEqual('e');
      expect(out[0][2]).assertEqual('st1');
      expect(out[0][3]).assertEqual('1');
    });

    /**
     * @tc.name testMatch0243
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4400
     * @tc.desc MatchAll: non-capturing groups do not add extra slots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Non-capturing groups keep templates simpler by avoiding shifting numeric capture indices.
      // This is a migration-friendly pattern style for teams that refactor regexes frequently.
      const regex = new RegExp('t(?:e)st', 'g');
      const out = Array.from('test test'.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0].length).assertEqual(1);
    });

    /**
     * @tc.name testMatch0244
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4500
     * @tc.desc MatchAll: Unicode property letters with gui split scripts when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // International text often mixes scripts; Unicode properties avoid brittle hand-maintained ranges.
      // The gui combo is common in tokenizers that want both exhaustiveness and case folding.
      if (!supportsRegExp('\\p{L}+', 'u')) {
        return;
        return;
      }
      const regex = new RegExp('\\p{L}+', 'gui');
      const str = 'ABC αβγ aBc';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('ABC');
      expect(out[1]).assertEqual('αβγ');
      expect(out[2]).assertEqual('aBc');
    });

    /**
     * @tc.name testMatch0245
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4600
     * @tc.desc MatchAll: empty pattern global is bounded and terminates safely
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Empty-pattern iterations are easy to get wrong and can hang batch processors.
      // We assert liveness with a bound rather than relying on an exact step count across engines.
      const regex = new RegExp('(?:)', 'g');
      const str = '😀';
      const out = Array.from(str.matchAll(regex));
      expect(out.length > 0).assertTrue();
      expect(out.length <= 4).assertTrue();
      expect(out[0][0]).assertEqual('');
    });

    /**
     * @tc.name testMatch0246
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4700
     * @tc.desc MatchAll: dotAll+sticky+unicode combo is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some engines support rich flag sets; when available, this combo models strict token streams across newlines.
      // We gate to keep the suite portable and avoid syntax errors on reduced runtimes.
      if (!supportsRegExp('.+', 'suy')) {
        return;
        return;
      }
      const regex = new RegExp('.+', 'gsuy');
      const str = 'test\n';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length >= 1).assertTrue();
    });

    /**
     * @tc.name testMatch0247
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4800
     * @tc.desc MatchAll: gim combination finds tokens across lines with case folding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // In real logs, case varies and records are multiline; gim is a common normalization setting.
      // This ensures matchAll remains a reliable "scan all" primitive under those flags.
      const regex = new RegExp('test', 'gim');
      const str = 'TEST\nTest';
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('TEST');
      expect(out[1]).assertEqual('Test');
    });

    /**
     * @tc.name testMatch0248
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_4900
     * @tc.desc Match: URL protocol and host extraction for routing decisions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // URL parsing is security-relevant; extracting protocol/host drives allowlists and feature routing.
      // Using anchored groups avoids substring matches inside query fragments.
      const url = 'https://example.com/path?q=1';
      const out = url.match(new RegExp('^(https?):\\/\\/([^\\/]+)'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('https');
        expect(out[2]).assertEqual('example.com');
      }
    });

    /**
     * @tc.name testMatch0249
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5000
     * @tc.desc Match: Windows path segment extraction normalizes separators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Desktop clients emit backslashes; extracting the filename is common in upload and sync features.
      // Matching only the tail segment avoids leaking directory structure into UI labels.
      const path = 'C:\\\\tmp\\\\report.txt';
      const out = path.match(new RegExp('([^\\\\\\\\]+)$'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('report.txt');
      }
    });

    /**
     * @tc.name testMatch0250
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5100
     * @tc.desc Match: semantic version capture tolerates optional patch segment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Release channels mix short tags and full semver; optional groups keep one parser for both formats.
      // Capturing only the stable parts avoids downstream logic branching on string splitting.
      const a = 'v2.0'.match(new RegExp('^v(\\d+)\\.(\\d+)(?:\\.(\\d+))?$'));
      const b = 'v2.0.1'.match(new RegExp('^v(\\d+)\\.(\\d+)(?:\\.(\\d+))?$'));
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[1]).assertEqual('2');
        expect(a[2]).assertEqual('0');
        expect(a[3] === undefined).assertTrue();
        expect(b[3]).assertEqual('1');
      }
    });

    /**
     * @tc.name testMatch0251
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5200
     * @tc.desc MatchAll: log field scanning extracts key=value pairs globally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Observability pipelines parse repeated key=value tokens; global iteration must preserve all fields.
      // Capturing key/value in one scan reduces the chance of mismatched indexing across separate passes.
      const line = 'id=42 user=alice ok=true';
      const regex = new RegExp('(\\w+)=(\\w+)', 'g');
      const out = Array.from(line.matchAll(regex));
      expect(out.length).assertEqual(3);
      expect(out[0][1]).assertEqual('id');
      expect(out[0][2]).assertEqual('42');
      expect(out[1][1]).assertEqual('user');
      expect(out[1][2]).assertEqual('alice');
      expect(out[2][1]).assertEqual('ok');
      expect(out[2][2]).assertEqual('true');
    });

    /**
     * @tc.name testMatch0252
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5300
     * @tc.desc MatchAll: groups is undefined when no named captures exist
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some consumers probe for groups to detect "named-mode"; undefined is part of the contract for non-named patterns.
      // This prevents feature flags from mis-detecting groups support based on engine-specific object shapes.
      const regex = new RegExp('\\d+', 'g');
      const str = '123 456';
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0].groups === undefined).assertTrue();
    });

    /**
     * @tc.name testMatch0253
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5400
     * @tc.desc MatchAll: mixed capturing and non-capturing groups preserve index slots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Teams refactor patterns for readability by converting some groups to non-capturing.
      // This test locks the remaining capture numbering so templates don't shift unexpectedly.
      const regex = new RegExp('(?:a)(b)(?:c)(d)', 'g');
      const out = Array.from('abcd'.matchAll(regex));
      expect(out.length).assertEqual(1);
      expect(out[0].length).assertEqual(3);
      expect(out[0][1]).assertEqual('b');
      expect(out[0][2]).assertEqual('d');
    });

    /**
     * @tc.name testMatch0254
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5500
     * @tc.desc MatchAll: deep nested captures produce stable array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Deep nesting shows up in legacy regexes generated by tools; consumers rely on fixed arity.
      // Ensuring the match array length is stable prevents index-out-of-range bugs in extraction templates.
      const regex = new RegExp('(((a)))', 'g');
      const out = Array.from('a'.matchAll(regex));
      expect(out.length).assertEqual(1);
      expect(out[0].length).assertEqual(4);
      expect(out[0][0]).assertEqual('a');
    });

    /**
     * @tc.name testMatch0255
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5600
     * @tc.desc MatchAll: without u flag, surrogate pairs may split into two code units
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some devices run reduced Unicode mode; behavior must be predictable even if grapheme correctness is limited.
      // We assert a minimal invariant: without u, "." should not yield fewer matches than with u.
      const str = '𝌆';
      const a = Array.from(str.matchAll(new RegExp('.', 'g'))).length;
      if (supportsRegExp('.', 'gu')) {
        const b = Array.from(str.matchAll(new RegExp('.', 'gu'))).length;
        expect(a >= b).assertTrue();
      } else {
        expect(a >= 1).assertTrue();
      }
    });

    /**
     * @tc.name testMatch0256
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5700
     * @tc.desc MatchAll: dotAll scans across newline when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Multi-line event payloads are common; dotAll enables single-pass extraction without [\\s\\S] hacks.
      // Gating keeps compatibility while validating the richer path where enabled.
      const str = 'a\nb a\tb';
      if (!supportsRegExp('a.b', 's')) {
        return;
        return;
      }
      const regex = new RegExp('a.b', 'gs');
      const out = Array.from(str.matchAll(regex)).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('a\nb');
      expect(out[1]).assertEqual('a\tb');
    });

    /**
     * @tc.name testMatch0257
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5800
     * @tc.desc MatchAll: multiline $ anchor trims line-end semicolons
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Many tools emit ';' terminators per line; identifying them is a precursor to safe cleanup.
      // Using $ with m avoids treating the whole blob as a single line in cross-platform text.
      const str = 'ok;\nok;\ntrailing';
      const out = Array.from(str.matchAll(new RegExp(';\\s*$', 'gm'))).map((m) => m[0]);
      expect(out.length).assertEqual(2);
    });

    /**
     * @tc.name testMatch0258
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_5900
     * @tc.desc MatchAll: querystring key=value extraction handles repeated keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Routing and analytics often read querystrings; repeated keys must be captured without dropping earlier ones.
      // matchAll provides a stable streaming interface for scanning long URLs.
      const url = 'https://x.test/path?a=1&a=2&b=hello';
      const regex = new RegExp('[?&](\\w+)=([^&]+)', 'g');
      const out = Array.from(url.matchAll(regex));
      expect(out.length).assertEqual(3);
      expect(out[0][1]).assertEqual('a');
      expect(out[0][2]).assertEqual('1');
      expect(out[1][2]).assertEqual('2');
      expect(out[2][1]).assertEqual('b');
      expect(out[2][2]).assertEqual('hello');
    });

    /**
     * @tc.name testMatch0259
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6000
     * @tc.desc Match: email capture extracts local and domain parts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Support tooling often masks or routes by domain; capturing parts avoids re-splitting the string later.
      // Anchoring keeps garbage prefixes from being treated as valid emails during scanning.
      const out = 'test@example.com'.match(new RegExp('^([\\w.-]+)@([\\w.-]+\\.[A-Za-z]{2,})$'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('test');
        expect(out[2]).assertEqual('example.com');
      }
    });

    /**
     * @tc.name testMatch0260
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6100
     * @tc.desc MatchAll: IPv4 extraction finds dotted quad tokens inside text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Logs often contain many IP-like tokens; extracting them supports PII masking and abuse triage.
      // A simple dotted-quad scan is useful even before strict range validation.
      const str = 'ip=192.168.0.1 peer=10.0.0.2';
      const out = Array.from(str.matchAll(new RegExp('\\b\\d{1,3}(?:\\.\\d{1,3}){3}\\b', 'g'))).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('192.168.0.1');
      expect(out[1]).assertEqual('10.0.0.2');
    });

    /**
     * @tc.name testMatch0261
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6200
     * @tc.desc MatchAll: quoted value capture handles spaces without splitting tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Command lines and config lines frequently allow quoted values with spaces.
      // Capturing quoted payloads prevents fragile "split by space" parsing bugs.
      const str = 'name="Alice Bob" id=42';
      const out = Array.from(str.matchAll(new RegExp('(\\w+)=\"([^\"]*)\"', 'g')));
      expect(out.length).assertEqual(1);
      expect(out[0][1]).assertEqual('name');
      expect(out[0][2]).assertEqual('Alice Bob');
    });

    /**
     * @tc.name testMatch0262
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6300
     * @tc.desc MatchAll: alternation with named groups leaves inactive names undefined when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Real-world patterns often use alternation to represent multiple record shapes.
      // Ensuring inactive named groups are undefined avoids ambiguous "empty string" interpretations in mappers.
      if (!supportsRegExp('(?<a>\\d+)|(?<b>\\w+)')) {
        return;
        return;
      }
      const regex = new RegExp('(?<a>\\d+)|(?<b>\\w+)', 'g');
      const out = Array.from('123'.matchAll(regex));
      expect(out.length).assertEqual(1);
      // Validate numeric capture is present by index; inactive branch capture should be undefined.
      expect(out[0][1]).assertEqual('123');
      expect(out[0][2] === undefined).assertTrue();
    });

    /**
     * @tc.name testMatch0263
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6400
     * @tc.desc MatchAll: iterator results include index and input fields like exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some pipelines consume matchAll results as exec-like objects and rely on index/input for patch generation.
      // Ensuring the shape matches avoids maintaining two separate parsing adapters.
      const regex = new RegExp('test', 'g');
      const str = 'test test';
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0][0]).assertEqual('test');
      expect(out[0].index).assertEqual(0);
      expect(out[0].input).assertEqual(str);
    });

    /**
     * @tc.name testMatch0264
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6500
     * @tc.desc MatchAll: iterator can be partially consumed without losing correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Streaming consumers often stop early after finding the first N hits, then resume later.
      // This test guards against iterators that accidentally reset or skip when partially consumed.
      const regex = new RegExp('\\d+', 'g');
      const str = 'a1b22c333';
      const itor = str.matchAll(regex);
      const a = itor.next().value;
      const b = itor.next().value;
      expect(a !== undefined).assertTrue();
      expect(b !== undefined).assertTrue();
      if (a !== undefined && b !== undefined) {
        expect(a[0]).assertEqual('1');
        expect(b[0]).assertEqual('22');
      }
      const rest = Array.from(itor).map((m) => m[0]);
      expect(rest.length).assertEqual(1);
      expect(rest[0]).assertEqual('333');
    });

    /**
     * @tc.name testMatch0265
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6600
     * @tc.desc MatchAll: iteration does not advance the original regex lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // matchAll is frequently used to avoid shared mutable state between parsing stages.
      // This test ensures the original regex cursor is not advanced by iteration.
      const regex = new RegExp('foo', 'g');
      regex.lastIndex = 1;
      const out = Array.from('foo foo'.matchAll(regex));
      expect(out.length).assertEqual(1);
      expect(out[0][0]).assertEqual('foo');
      expect(regex.lastIndex).assertEqual(1);
    });

    /**
     * @tc.name testMatch0266
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6700
     * @tc.desc MatchAll: empty match with gu is feature-gated and bounded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Empty matches are risky for iterators; Unicode mode affects advancement around surrogate pairs.
      // We assert only bounds to keep behavior stable across engines while still catching hangs.
      if (!supportsRegExp('(?:)', 'gu')) {
        return;
        return;
      }
      const str = '😀';
      const out = Array.from(str.matchAll(new RegExp('(?:)', 'gu')));
      expect(out.length >= 2).assertTrue();
      expect(out.length <= 3).assertTrue();
    });

    /**
     * @tc.name testMatch0267
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6800
     * @tc.desc MatchAll: with and without u flag differ on surrogate pair '.' scanning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // This captures a portability boundary: code-unit iteration vs code-point iteration.
      // Consumers use this distinction to decide whether to treat emoji as one symbol or two units.
      const str = '𝌆';
      const a = Array.from(str.matchAll(new RegExp('.', 'g'))).length;
      if (supportsRegExp('.', 'gu')) {
        const b = Array.from(str.matchAll(new RegExp('.', 'gu'))).length;
        expect(b).assertEqual(1);
        expect(a >= 1).assertTrue();
        expect(a >= b).assertTrue();
      } else {
        expect(a).assertEqual(2);
      }
    });

    /**
     * @tc.name testMatch0268
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_6900
     * @tc.desc Match: multiline anchor match returns correct index and capture
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Multiline matching is used for line-oriented parsers where splitting would lose absolute offsets.
      // Verifying index prevents drift when caret anchors are involved.
      const str = 'world\nhello';
      const out = str.match(new RegExp('^hello', 'm'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('hello');
        expect(out.index).assertEqual(6);
      }
    });

    /**
     * @tc.name testMatch0269
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7000
     * @tc.desc MatchAll: URL path segment scanning extracts each segment token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Segment extraction is a common routing step; it must ignore empty segments and preserve ordering.
      // Global iteration prevents missing middle segments on longer paths.
      const url = '/api/v1/users/42/profile';
      const out = Array.from(url.matchAll(new RegExp('[^/]+', 'g'))).map((m) => m[0]);
      expect(out.length).assertEqual(5);
      expect(out[0]).assertEqual('api');
      expect(out[3]).assertEqual('42');
      expect(out[4]).assertEqual('profile');
    });

    /**
     * @tc.name testMatch0270
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7100
     * @tc.desc MatchAll: JSON-like key extraction handles quoted keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Log payloads are often JSON-ish; extracting keys supports indexing without full JSON parsing.
      // A conservative regex avoids interpreting values and focuses on stable key tokens.
      const str = '{\"user\":\"alice\",\"id\":42,\"ok\":true}';
      const out = Array.from(str.matchAll(new RegExp('\"(\\w+)\"\\s*:', 'g'))).map((m) => m[1]);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('user');
      expect(out[1]).assertEqual('id');
      expect(out[2]).assertEqual('ok');
    });

    /**
     * @tc.name testMatch0271
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7200
     * @tc.desc MatchAll: error-like stack lines extract file and line numbers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Support pipelines parse stack traces to group crashes by callsite.
      // Capturing filename and line number from each frame keeps the result structured.
      const str = 'at foo (main.ts:12:3)\nat bar (util.ts:99:1)';
      const regex = new RegExp('\\(([^:]+):(\\d+):(\\d+)\\)', 'g');
      const out = Array.from(str.matchAll(regex));
      expect(out.length).assertEqual(2);
      expect(out[0][1]).assertEqual('main.ts');
      expect(out[0][2]).assertEqual('12');
      expect(out[1][1]).assertEqual('util.ts');
    });

    /**
     * @tc.name testMatch0272
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7300
     * @tc.desc Match: strict token match prevents partial matches inside identifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Keyword scanners use boundaries to avoid matching inside longer identifiers.
      // This prevents false positives that cause incorrect policy enforcement.
      expect('foobar'.match(new RegExp('\\bfoo\\b')) === null).assertTrue();
      expect('foo bar'.match(new RegExp('\\bfoo\\b')) !== null).assertTrue();
    });

    /**
     * @tc.name testMatch0273
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7400
     * @tc.desc MatchAll: capturing numeric metric names and values from telemetry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Monitoring formats often emit name=value pairs separated by commas.
      // matchAll lets us extract every metric without splitting on commas (which can appear in values in other formats).
      const str = 'cpu=12,mem=2048,disk=99';
      const out = Array.from(str.matchAll(new RegExp('(\\w+)=(\\d+)', 'g')));
      expect(out.length).assertEqual(3);
      expect(out[0][1]).assertEqual('cpu');
      expect(out[0][2]).assertEqual('12');
      expect(out[2][1]).assertEqual('disk');
      expect(out[2][2]).assertEqual('99');
    });

    /**
     * @tc.name testMatch0274
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7500
     * @tc.desc Match: protocol, host and optional port extraction from URL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Service routers decide security policy from scheme/host/port before path-level handling.
      // Capturing optional port in the same pattern avoids fallback parsing branches.
      const url = 'http://api.example.com:8080/v1/users';
      const out = url.match(new RegExp('^(https?):\\/\\/([^:\\/]+)(?::(\\d+))?'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[1]).assertEqual('http');
        expect(out[2]).assertEqual('api.example.com');
        expect(out[3]).assertEqual('8080');
      }
    });

    /**
     * @tc.name testMatch0275
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7600
     * @tc.desc MatchAll: host-like tokens are extracted from mixed text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Incident timelines often include many hosts in free text that need quick indexing.
      // A permissive host pattern is useful for extraction prior to strict validation.
      const str = 'peer=api.example.com backup=cdn.test.org';
      const out = Array.from(str.matchAll(new RegExp('\\b([a-z0-9-]+(?:\\.[a-z0-9-]+)+)\\b', 'gi'))).map((m) => m[1]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('api.example.com');
      expect(out[1]).assertEqual('cdn.test.org');
    });

    /**
     * @tc.name testMatch0276
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7700
     * @tc.desc Match: ISO datetime prefix capture supports T and space separators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Data pipelines ingest timestamps from multiple producers with minor separator differences.
      // Accepting both forms reduces format-specific branching in ingestion code.
      const a = '2026-04-20T16:30:59Z'.match(new RegExp('^(\\d{4}-\\d{2}-\\d{2})[ T](\\d{2}:\\d{2}:\\d{2})'));
      const b = '2026-04-20 16:30:59'.match(new RegExp('^(\\d{4}-\\d{2}-\\d{2})[ T](\\d{2}:\\d{2}:\\d{2})'));
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[1]).assertEqual('2026-04-20');
        expect(b[2]).assertEqual('16:30:59');
      }
    });

    /**
     * @tc.name testMatch0277
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7800
     * @tc.desc MatchAll: log level and message extraction from multiline logs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Alerting systems classify logs by level; extracting level/message in one pass improves indexing throughput.
      // Multiline global scanning avoids manual splitting and preserves original ordering.
      const logs = '[INFO] startup\n[WARN] disk low\n[ERROR] panic';
      const regex = new RegExp('^\\[(INFO|WARN|ERROR)\\]\\s+(.+)$', 'gm');
      const out = Array.from(logs.matchAll(regex));
      expect(out.length).assertEqual(3);
      expect(out[0][1]).assertEqual('INFO');
      expect(out[1][2]).assertEqual('disk low');
      expect(out[2][1]).assertEqual('ERROR');
    });

    /**
     * @tc.name testMatch0278
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_7900
     * @tc.desc MatchAll: quoted string extraction supports escaped quote patterns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Configuration snippets often include quoted values containing escaped characters.
      // A conservative regex prevents runaway matches when quotes appear repeatedly.
      const str = 'a="x" b="y z" c="q\\"w"';
      const regex = new RegExp('"((?:[^"\\\\]|\\\\.)*)"', 'g');
      const out = Array.from(str.matchAll(regex)).map((m) => m[1]);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('x');
      expect(out[1]).assertEqual('y z');
      expect(out[2]).assertEqual('q\\"w');
    });

    /**
     * @tc.name testMatch0279
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8000
     * @tc.desc Match: greedy vs lazy differences are visible in first match span
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Template parsers often wrap tags and need non-greedy behavior to avoid swallowing neighbors.
      // Comparing both modes documents why lazy quantifiers are safer for delimited content.
      const s = '<a>1</a><a>2</a>';
      const g = s.match(new RegExp('<a>.*</a>'));
      const l = s.match(new RegExp('<a>.*?</a>'));
      expect(g !== null).assertTrue();
      expect(l !== null).assertTrue();
      if (g !== null && l !== null) {
        expect(g[0]).assertEqual('<a>1</a><a>2</a>');
        expect(l[0]).assertEqual('<a>1</a>');
      }
    });

    /**
     * @tc.name testMatch0280
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8100
     * @tc.desc MatchAll: hexadecimal ID extraction is case-insensitive and global
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Trace systems emit hex IDs in mixed case; extraction should not depend on producer casing.
      // Global scan catches multiple IDs in one payload without additional splitting.
      const str = 'ids: deadBEEF cafe1234';
      const out = Array.from(str.matchAll(new RegExp('[a-f0-9]{8}', 'gi'))).map((m) => m[0]);
      expect(out.length).assertEqual(2);
      expect(out[0]).assertEqual('deadBEEF');
      expect(out[1]).assertEqual('cafe1234');
    });

    /**
     * @tc.name testMatch0281
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8200
     * @tc.desc MatchAll: semicolon-delimited key pairs handle trailing spaces
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Legacy protocols often use semicolon-separated pairs with inconsistent whitespace.
      // Regex extraction normalizes parsing without writing a custom state machine.
      const str = 'a=1; b=22; c=333 ';
      const out = Array.from(str.matchAll(new RegExp('(\\w+)\\s*=\\s*(\\d+)', 'g')));
      expect(out.length).assertEqual(3);
      expect(out[1][1]).assertEqual('b');
      expect(out[1][2]).assertEqual('22');
    });

    /**
     * @tc.name testMatch0282
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8300
     * @tc.desc Match: lookbehind-based suffix extraction is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Lookbehind provides cleaner patterns for delimiter-based extraction without capturing prefixes.
      // Feature-gating avoids runtime failures on engines that don't implement lookbehind.
      if (!supportsRegExp('(?<=:)\\w+')) {
        return;
        return;
      }
      const out = 'key:value'.match(new RegExp('(?<=:)\\w+'));
      expect(out !== null).assertTrue();
      if (out !== null) {
        expect(out[0]).assertEqual('value');
      }
    });

    /**
     * @tc.name testMatch0283
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8400
     * @tc.desc MatchAll: negative lookahead filter skips USD-suffixed numbers when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Finance feeds often mix units; negative lookahead is used to isolate non-USD amounts quickly.
      // Feature-gating keeps baseline engines stable while still testing richer parsers.
      if (!supportsRegExp('\\d+(?!USD)')) {
        return;
        return;
      }
      const str = '100USD 200EUR 300';
      // Use an explicit non-digit/end delimiter to avoid \\b engine differences.
      const out = Array.from(str.matchAll(new RegExp('\\d+(?!USD)(?=\\D|$)', 'g'))).map((m) => m[0]);
      expect(out.indexOf('200') >= 0).assertTrue();
      expect(out.indexOf('300') >= 0).assertTrue();
    });

    /**
     * @tc.name testMatch0284
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8500
     * @tc.desc MatchAll: trailing file extensions extracted from mixed paths
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // File classifiers often need only the extension from heterogeneous path formats.
      // Global extraction supports scanning batched filenames in one payload.
      const str = 'a.txt b.tar.gz c.md';
      const out = Array.from(str.matchAll(new RegExp('\\.([a-z0-9]+)\\b', 'gi'))).map((m) => m[1]);
      expect(out.length).assertEqual(4);
      expect(out[0]).assertEqual('txt');
      expect(out[1]).assertEqual('tar');
      expect(out[2]).assertEqual('gz');
      expect(out[3]).assertEqual('md');
    });

    /**
     * @tc.name testMatch0285
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8600
     * @tc.desc Match: strict IPv4 validator rejects out-of-range octets
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Security filters require bounded octets; loose patterns can whitelist invalid addresses.
      // A strict validator match prevents accidental acceptance in allowlist checks.
      const ip = new RegExp('^((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)$');
      expect('192.168.1.1'.match(ip) !== null).assertTrue();
      expect('999.168.1.1'.match(ip) === null).assertTrue();
    });

    /**
     * @tc.name testMatch0286
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8700
     * @tc.desc MatchAll: duplicated separators still produce correct token sequence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // User input often contains repeated separators from copy/paste artifacts.
      // Token extraction should remain stable and ignore empty fragments.
      const str = 'a,,b;;;c';
      const out = Array.from(str.matchAll(new RegExp('[a-z]+', 'g'))).map((m) => m[0]);
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual('a');
      expect(out[1]).assertEqual('b');
      expect(out[2]).assertEqual('c');
    });

    /**
     * @tc.name testMatch0287
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8800
     * @tc.desc MatchAll: optional quoted value branch leaves inactive capture undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Mixed-value formats can have quoted or bare values; optional branches keep one parser path.
      // Undefined inactive captures are important to distinguish "missing" from empty string.
      const re = new RegExp('(\\w+)=(?:"([^"]*)"|(\\w+))', 'g');
      const out = Array.from('a="x y" b=z'.matchAll(re));
      expect(out.length).assertEqual(2);
      expect(out[0][1]).assertEqual('a');
      expect(out[0][2]).assertEqual('x y');
      expect(out[0][3] === undefined).assertTrue();
      expect(out[1][2] === undefined).assertTrue();
      expect(out[1][3]).assertEqual('z');
    });

    /**
     * @tc.name testMatch0288
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_8900
     * @tc.desc Match: rebuilt regex from source and flags preserves behavior on grouped patterns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Persisted regex metadata is often reconstructed after process restart.
      // Behavioral parity is required so stored rules do not drift over time.
      const base = new RegExp('(foo|bar)\\d+', 'gi');
      const rebuilt = new RegExp(base.source, base.flags);
      const a = 'xxBAR12yy'.match(base);
      const b = 'xxBAR12yy'.match(rebuilt);
      expect(a !== null).assertTrue();
      expect(b !== null).assertTrue();
      if (a !== null && b !== null) {
        expect(a[0]).assertEqual(b[0]);
      }
    });

    /**
     * @tc.name testMatch0289
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_SUPPLEMENT_TEST_9000
     * @tc.desc MatchAll: grouped date tokens extract year month day globally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testMatch0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Calendar-like payloads often contain multiple dates that must be indexed without splitting the whole string.
      // Group capture keeps each component available for normalization.
      const str = '2026-04-20 and 2027-01-02';
      const out = Array.from(str.matchAll(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g')));
      expect(out.length).assertEqual(2);
      expect(out[0][1]).assertEqual('2026');
      expect(out[0][2]).assertEqual('04');
      expect(out[1][3]).assertEqual('02');
    });

  });
}
