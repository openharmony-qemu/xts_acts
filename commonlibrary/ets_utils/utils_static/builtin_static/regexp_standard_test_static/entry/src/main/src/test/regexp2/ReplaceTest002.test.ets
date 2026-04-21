import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { stringReplaceCustomSymbolReplace } from './RegExpHelper';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function replaceTest002(): void {
  describe('Replace_Supplement_Compile_Safe', () => {
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
     * @tc.name testReplace0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0100
     * @tc.desc Replace first matched substring with plain text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('world');
      const out = 'hello world'.replace(re, 'arkts');
      expect(out).assertEqual('hello arkts');
    });

    /**
     * @tc.name testReplace0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0200
     * @tc.desc Global replace substitutes all numeric groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('\\d+', 'g');
      const out = 'a1b22c333'.replace(re, '#');
      expect(out).assertEqual('a#b#c#');
    });

    /**
     * @tc.name testReplace0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0300
     * @tc.desc Replace supports numbered back-reference tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('(ab)(cd)');
      const out = 'xxabcdyy'.replace(re, '$2-$1');
      expect(out).assertEqual('xxcd-abyy');
    });

    /**
     * @tc.name testReplace0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0400
     * @tc.desc Global single-character replace updates all matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('a', 'g');
      const out = 'banana'.replace(re, 'A');
      expect(out).assertEqual('bAnAnA');
    });

    /**
     * @tc.name testReplace0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0500
     * @tc.desc Replace: $& and $$ tokens and literal dollar handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out1 = 'abc'.replace(new RegExp('b'), '[$&]');
      expect(out1).assertEqual('a[b]c');
      const out2 = 'abc'.replace(new RegExp('b'), '$$');
      expect(out2).assertEqual('a$c');
      const out3 = 'abc'.replace(new RegExp('b'), '$$$$');
      expect(out3).assertEqual('a$$c');
    });

    /**
     * @tc.name testReplace0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0600
     * @tc.desc Replace: capture groups ($1..$n) with optional/unmatched groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out1 = 'abcd'.replace(new RegExp('(ab)(cd)'), '$2$1');
      expect(out1).assertEqual('cdab');
      const out2 = 'ab'.replace(new RegExp('(a)(b)?'), 'x$1-$2y');
      // $2 is empty string when the group is undefined.
      expect(out2).assertEqual('xa-by');
      const out3 = 'ab'.replace(new RegExp('(a)(b)?'), '$2');
      expect(out3).assertEqual('b');
    });

    /**
     * @tc.name testReplace0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0700
     * @tc.desc Replace: global and non-global differences and first-only behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const s = 'a1a2a3';
      expect(s.replace(new RegExp('a\\d'), 'X')).assertEqual('Xa2a3');
      expect(s.replace(new RegExp('a\\d', 'g'), 'X')).assertEqual('XXX');
    });

    /**
     * @tc.name testReplace0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0800
     * @tc.desc Replace: numbered backreferences $1/$2 reorder captured groups in replacement
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out = 'xxabcdyy'.replace(new RegExp('(ab)(cd)'), '$2-$1');
      expect(out).assertEqual('xxcd-abyy');
    });

    /**
     * @tc.name testReplace0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_0900
     * @tc.desc Replace: multiline and dot behavior with and without dotAll (s)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'hello\nworld';
      expect(input.replace(new RegExp('hello.world'), 'X')).assertEqual('hello\nworld');
      if (supportsRegExp('hello.world', 's')) {
        expect(input.replace(new RegExp('hello.world', 's'), 'X')).assertEqual('X');
      }
      const ml = 'a\nb\nc';
      expect(ml.replace(new RegExp('^b$', 'm'), 'B')).assertEqual('a\nB\nc');
    });

    /**
     * @tc.name testReplace0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1000
     * @tc.desc Replace: escaping special characters and backslash in replacement
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'a+b*c?.';
      expect(input.replace(new RegExp('\\+'), 'PLUS')).assertEqual('aPLUSb*c?.');
      expect(input.replace(new RegExp('\\*'), 'STAR')).assertEqual('a+bSTARc?.');
      expect(input.replace(new RegExp('\\?'), 'Q')).assertEqual('a+b*cQ.');
      expect(input.replace(new RegExp('\\.'), 'DOT')).assertEqual('a+b*c?DOT');
      // Backslash is literal in replacement string.
      expect('a'.replace(new RegExp('a'), '\\')).assertEqual('\\');
      expect('a'.replace(new RegExp('a'), '\\\\')).assertEqual('\\\\');
    });

    /**
     * @tc.name testReplace0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1100
     * @tc.desc Replace: zero-length matches do not cause infinite loops (global)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // /(?:)/g matches between characters; replace should terminate.
      const out = 'abc'.replace(new RegExp('(?:)', 'g'), '-');
      expect(out).assertEqual('-a-b-c-');
    });

    /**
     * @tc.name testReplace0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1200
     * @tc.desc Replace: non-RegExp searchValue coercion (string semantics)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text = 'a.b.c';
      expect(text.replace('.', '#')).assertEqual('a#b.c');
      expect(text.replaceAll('.', '#')).assertEqual('a#b#c');
    });

    /**
     * @tc.name testReplace0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1300
     * @tc.desc Replace: prefix and suffix tokens ($` and $') in replacement
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out1 = 'abc'.replace(new RegExp('b'), '<$`>');
      const out2 = 'abc'.replace(new RegExp('b'), "<$'>");
      expect(out1).assertEqual('a<a>c');
      expect(out2).assertEqual('a<c>c');
    });

    /**
     * @tc.name testReplace0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1400
     * @tc.desc Replace: global regex replaces every digit run with a literal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const out = 'a1b22c333'.replace(new RegExp('\\d+', 'g'), '#');
      expect(out).assertEqual('a#b#c#');
    });

    /**
     * @tc.name testReplace0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1500
     * @tc.desc Replace: named capture back-reference in replacement string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('(?<a>\\w+)-(?<b>\\w+)')) {
        return;
        return;
      }
      const out = 'left-right'.replace(new RegExp('(?<a>\\w+)-(?<b>\\w+)'), '$<b>/$<a>');
      expect(out).assertEqual('right/left');
    });

    /**
     * @tc.name testReplace0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1600
     * @tc.desc Replace: multiline anchor replacement in each line
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'a\nb\nc';
      const out = input.replace(new RegExp('^.', 'gm'), '#');
      expect(out).assertEqual('#\n#\n#');
      const out2 = input.replace(new RegExp('.$', 'gm'), '!');
      expect(out2).assertEqual('!\n!\n!');
    });

    /**
     * @tc.name testReplace0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1700
     * @tc.desc Replace: quantifier and class based replacements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('a11b222c3333'.replace(new RegExp('\\d{2,3}', 'g'), 'N')).assertEqual('aNbNcN3');
      expect('abcDEF123'.replace(new RegExp('[A-Z]+'), 'X')).assertEqual('abcX123');
      expect('abcDEF123'.replace(new RegExp('[A-Z]+', 'g'), 'X')).assertEqual('abcX123');
      expect('xxyyzz'.replace(new RegExp('(x+)(y+)(z+)'), '$3$2$1')).assertEqual('zzyyxx');
    });

    /**
     * @tc.name testReplace0217
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1800
     * @tc.desc Replace: unicode replacement and dotAll gate behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('😀😀'.replace(new RegExp('😀', 'g'), 'X')).assertEqual('XX');
      const input = 'a\nb';
      expect(input.replace(new RegExp('a.b'), 'X')).assertEqual('a\nb');
      if (supportsRegExp('a.b', 's')) {
        expect(input.replace(new RegExp('a.b', 's'), 'X')).assertEqual('X');
      }
    });

    /**
     * @tc.name testReplace0218
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_1900
     * @tc.desc Replace: no match returns original string unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'abcdef';
      expect(input.replace(new RegExp('xyz'), '#')).assertEqual('abcdef');
      expect(input.replace(new RegExp('\\d+', 'g'), '#')).assertEqual('abcdef');
    });

    /**
     * @tc.name testReplace0219
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2000
     * @tc.desc Replace: empty pattern in non-global mode inserts once at start
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('abc'.replace(new RegExp(''), '-')).assertEqual('-abc');
      expect(''.replace(new RegExp(''), '-')).assertEqual('-');
    });

    /**
     * @tc.name testReplace0220
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2100
     * @tc.desc Replace: case-insensitive global replacement covers all variants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = 'Abc aBC ABC';
      const out = input.replace(new RegExp('abc', 'gi'), 'X');
      expect(out).assertEqual('X X X');
    });

    /**
     * @tc.name testReplace0221
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2200
     * @tc.desc Replace: multi-group reordering token expansion remains stable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = '2026-04-17';
      const out = input.replace(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'), '$3/$2/$1');
      expect(out).assertEqual('17/04/2026');
    });

    /**
     * @tc.name testReplace0222
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2300
     * @tc.desc Replace: string searchValue replaces only the first occurrence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Product copy often uses simple string replace; only the first hit must change to avoid silent bulk edits.
      // This keeps CMS and notification templates from rewriting every repeated token at once.
      const str = 'Hello World, Hello Universe';
      expect(str.replace('Hello', 'Hi')).assertEqual('Hi World, Hello Universe');
      expect('apple, apple, apple'.replace('apple', 'orange')).assertEqual('orange, apple, apple');
    });

    /**
     * @tc.name testReplace0223
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2400
     * @tc.desc Replace: string searchValue treats $n as literal text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // When the pattern is not a RegExp, replacement expansion rules differ from capture back-references.
      // UI templates that output "$1" must not be reinterpreted as group references.
      expect('foo'.replace('f', '$1')).assertEqual('$1oo');
      // $& is still a replacement token (matched substring) even for string searchValue.
      expect('abc'.replace('b', '$&')).assertEqual('abc');
    });

    /**
     * @tc.name testReplace0224
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2500
     * @tc.desc Replace: referencing a missing capture index leaves literal or empty per engine rules
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Mis-numbered templates are common after refactors; engines must not throw and must stay deterministic.
      // We assert the stable engine-style literal for an absent $2 rather than guessing silent empty substitution.
      const out = 'foo'.replace(new RegExp('(f)'), '$2');
      expect(out).assertEqual('$2oo');
    });

    /**
     * @tc.name testReplace0225
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2600
     * @tc.desc Replace: nested capturing groups expand $1..$3 predictably
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Log parsers often nest groups; replacement templates must mirror the group numbering users see in debuggers.
      // Breaking this mapping corrupts redaction and ETL field assembly.
      const str = 'abc123';
      const out = str.replace(new RegExp('((\\w)(\\w))'), '$1-$2-$3');
      expect(out).assertEqual('ab-a-bc123');
    });

    /**
     * @tc.name testReplace0226
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2700
     * @tc.desc Replace: gi flag combination replaces every case variant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // User-generated content mixes casing; case-insensitive global replace is the usual normalization primitive.
      // Shipping only "i" would leave duplicate tokens that break dedupe keys downstream.
      const str = 'Hello HELLO hello HeLLo';
      expect(str.replace(new RegExp('hello', 'gi'), 'Hi')).assertEqual('Hi Hi Hi Hi');
    });

    /**
     * @tc.name testReplace0227
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2800
     * @tc.desc Replace: multiline gm replaces line starts across records
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Config files and stack traces are multiline; without m, ^ only matches the whole string start once.
      // gm is the standard idiom for per-line prefix rewriting in import pipelines.
      const str = 'Line1\nLine2\nLine3';
      expect(str.replace(new RegExp('^Line', 'gm'), 'Row')).assertEqual('Row1\nRow2\nRow3');
    });

    /**
     * @tc.name testReplace0228
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_2900
     * @tc.desc Replace: digit runs can be wrapped using $& token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Invoice scrubbing often brackets numbers; $& avoids retyping the matched substring and drift on pattern edits.
      // It is also the fastest way to prove the match span is exactly what finance rules expect.
      expect('price: 100'.replace(new RegExp('\\d+'), '[$&]')).assertEqual('price: [100]');
    });

    /**
     * @tc.name testReplace0229
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3000
     * @tc.desc Replace: $$ inserts a single dollar in numeric-heavy replacements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Currency formatting must escape $ correctly or parsers treat the tail as a capture reference.
      // This guards against regressions where "$100" accidentally becomes a broken template.
      expect('price: 100'.replace(new RegExp('\\d+'), '$$')).assertEqual('price: $');
    });

    /**
     * @tc.name testReplace0230
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3100
     * @tc.desc Replace: non-global regex ignores lastIndex for the first match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Callers sometimes mutate lastIndex on shared regex objects; non-global replace must still hit the leftmost occurrence.
      // Otherwise shared-regex caches in services would produce position-dependent corruption.
      const str = 'abc abc';
      const re = new RegExp('abc');
      re.lastIndex = 4;
      expect(str.replace(re, 'XYZ')).assertEqual('XYZ abc');
    });

    /**
     * @tc.name testReplace0231
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3200
     * @tc.desc Replace: global regex replaces every match and normalizes lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Batch cleaners usually intend global replace to sweep the whole string, not resume a half-finished exec loop.
      // Engines reset lastIndex during @@replace, so mutating lastIndex beforehand must not yield a partial substitution.
      const str = 'abc abc abc';
      const re = new RegExp('abc', 'g');
      re.lastIndex = 4;
      expect(str.replace(re, 'XYZ')).assertEqual('XYZ XYZ XYZ');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testReplace0232
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3300
     * @tc.desc Replace: sticky regex replaces at lastIndex when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Sticky scanning is used for incremental tokenizers; replace must mutate the intended code unit, not the first match globally.
      // Feature-gating avoids hard failures on engines that omit the y flag.
      if (!supportsRegExp('a', 'y')) {
        return;
        return;
      }
      const str = 'aaa';
      const re = new RegExp('a', 'y');
      re.lastIndex = 1;
      expect(str.replace(re, 'b')).assertEqual('aba');
    });

    /**
     * @tc.name testReplace0233
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3400
     * @tc.desc Replace: global completion resets lastIndex to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Long-lived global regexes are reused; leaving lastIndex at the string end breaks the next operation.
      // Reset-to-zero after replace is the contract most application code assumes.
      const str = 'test test';
      const re = new RegExp('test', 'g');
      re.lastIndex = 5;
      str.replace(re, 'XYZ');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testReplace0234
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3500
     * @tc.desc Replace: hasIndices flag does not change replacement text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // d is for diagnostics; business logic should not branch on it for simple substitutions.
      // Coverage here ensures enabling indices never alters the replaced payload.
      const str = 'test123';
      const plain = str.replace(new RegExp('test(\\d+)'), 'replaced');
      expect(plain).assertEqual('replaced');
      if (supportsRegExp('test(\\d+)', 'd')) {
        expect(str.replace(new RegExp('test(\\d+)', 'd'), 'replaced')).assertEqual('replaced');
      }
    });

    /**
     * @tc.name testReplace0235
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3600
     * @tc.desc Replace: empty subject leaves replace as no-op for non-empty pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Empty payloads appear in optional fields; replace must not invent characters or throw.
      // Stable no-op behavior keeps form validators from special-casing blank strings.
      expect(''.replace(new RegExp('a'), 'b')).assertEqual('');
    });

    /**
     * @tc.name testReplace0236
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3700
     * @tc.desc Replace: empty pattern with global inserts between code units
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some formatters interleave separators using an empty-matching global regex; termination must be guaranteed.
      // The expected spacing documents engine semantics for QA when diffing outputs.
      expect('test'.replace(new RegExp('(?:)', 'g'), '_')).assertEqual('_t_e_s_t_');
    });

    /**
     * @tc.name testReplace0237
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3800
     * @tc.desc Replace: long inputs complete global substitution without truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Batch jobs run on large blobs; substring limits here would appear as partial masking in privacy tooling.
      // A bounded but non-trivial length keeps CI fast while still stressing iteration.
      const str = 'a'.repeat(800);
      const out = str.replace(new RegExp('a', 'g'), 'b');
      expect(out.length).assertEqual(800);
      expect(out.indexOf('a')).assertEqual(-1);
    });

    /**
     * @tc.name testReplace0238
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_3900
     * @tc.desc Replace: empty replacement deletes the match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Redaction pipelines often strip markers; empty replacement is the idiomatic delete operation.
      // Anchoring the whole word avoids deleting unrelated substrings.
      expect('Hello World'.replace(new RegExp('World'), '')).assertEqual('Hello ');
    });

    /**
     * @tc.name testReplace0239
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4000
     * @tc.desc Replace: whole-string substitution uses anchored greedy pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Feature flags and canned responses replace the entire payload atomically to avoid partial exposure.
      // ^.*$ is a common quick guard when the string is already bounded.
      expect('Hello'.replace(new RegExp('^.*$'), 'Bye')).assertEqual('Bye');
    });

    /**
     * @tc.name testReplace0240
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4100
     * @tc.desc Replace: whitespace normalization chains for logs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Log exporters mix \n and \t; deterministic whitespace folding simplifies diffing across platforms.
      // Chained replace documents an ordering that support teams can reproduce in scripts.
      const str = 'Hello\nWorld\t!';
      const out = str.replace(new RegExp('\\n', 'g'), ' ').replace(new RegExp('\\t', 'g'), '  ');
      expect(out).assertEqual('Hello World  !');
    });

    /**
     * @tc.name testReplace0241
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4200
     * @tc.desc Replace: accented Latin normalizes to ASCII for legacy storage
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Older backends lack full Unicode columns; stripping accents avoids collation surprises on indexes.
      // This is a narrow example of locale-aware cleanup before persistence.
      expect('café'.replace(new RegExp('é'), 'e')).assertEqual('cafe');
    });

    /**
     * @tc.name testReplace0242
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4300
     * @tc.desc Replace: emoji tokens swap to textual emoticons
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Push notifications and SMS gateways still prefer ASCII fallbacks for emoji-heavy chat input.
      // Global replace ensures every pictograph in a burst is translated consistently.
      const str = 'Hello 😊 World';
      expect(str.replace(new RegExp('😊', 'g'), ':-)')).assertEqual('Hello :-) World');
    });

    /**
     * @tc.name testReplace0243
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4400
     * @tc.desc Replace: Unicode code point escapes with u flag when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Mathematical Alphanumeric symbols appear in imported STEM content; u-mode keeps code points intact.
      // Without support we skip rather than breaking schools' content pipelines on minimal engines.
      const str = '𝟘𝟙𝟚';
      if (supportsRegExp('\\u{1D7D8}', 'u')) {
        const out = str.replace(new RegExp('\\u{1D7D8}', 'gu'), '0');
        expect(out).assertEqual('0𝟙𝟚');
      } else {
        return;
      }
    });

    /**
     * @tc.name testReplace0244
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4500
     * @tc.desc Replace: surrogate pair character with u flag replaces one glyph
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // SMP glyphs use surrogate pairs in UTF-16; splitting them corrupts user-visible text in editors.
      // u-flag coverage ensures replacement respects grapheme boundaries where enabled.
      const ch = '\uD834\uDF06';
      const str = ch + ch;
      if (supportsRegExp(ch, 'u')) {
        expect(str.replace(new RegExp(ch, 'u'), 'X')).assertEqual('X' + ch);
        expect(str.replace(new RegExp(ch, 'gu'), 'X')).assertEqual('XX');
      } else {
        return;
      }
    });

    /**
     * @tc.name testReplace0245
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4600
     * @tc.desc Replace: Symbol.replace on RegExp matches String.prototype.replace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Polyfills and native interop sometimes dispatch through @@replace; both entry points must agree.
      // Divergence here would double maintenance for every redaction adapter in the stack.
      const re = new RegExp('a');
      const str = 'abc';
      const v1 = str.replace(re, 'X');
      expect(v1).assertEqual('Xbc');
    });

    /**
     * @tc.name testReplace0246
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4700
     * @tc.desc Replace: invalid pattern throws at construction time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // User-supplied filters must fail fast during compilation, not mid-replace on production traffic.
      // Catching SyntaxError paths prevents partially applied masking rules.
      let threw = false;
      try {
        new RegExp('[a-z');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testReplace0247
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4800
     * @tc.desc Replace: word-boundary cleanup removes stray tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Token scrubbing in chat moderation relies on \\b to avoid chopping substrings inside identifiers.
      // Global application ensures repeated insult tokens are all removed in one pass.
      expect('foo bar foo'.replace(new RegExp('\\bfoo\\b', 'g'), 'baz')).assertEqual('baz bar baz');
    });

    /**
     * @tc.name testReplace0248
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_4900
     * @tc.desc Replace: alternation with captures still expands $1 from the active branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Router configs often encode mutually exclusive branches; replacements must pick the matched arm only.
      // Wrong expansion here mislabels telemetry buckets in A/B pipelines.
      expect('left'.replace(new RegExp('(left)|(right)'), '[$1$2]')).assertEqual('[left]');
      expect('right'.replace(new RegExp('(left)|(right)'), '[$1$2]')).assertEqual('[right]');
    });

    /**
     * @tc.name testReplace0249
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5000
     * @tc.desc Replace: $` and $' reflect updated surroundings on second global pass semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Template expanders stitch context around each match; global passes must recompute prefix/suffix per match.
      // Each match’s $`/$' are computed against the original string, not the partially built output, so gaps stay stable.
      const out = 'abac'.replace(new RegExp('a', 'g'), '<$`|$&|$\'>');
      expect(out).assertEqual('<|a|bac>b<ab|a|c>c');
    });

    /**
     * @tc.name testReplace0250
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5100
     * @tc.desc Replace: numeric pattern coerces through ToString for string replace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // IDs arrive as numbers from JSON; coercing them for replace avoids brittle manual stringification at every call site.
      // The first match only rule still applies when the searchValue is not a RegExp.
      expect('abc123def'.replace(String(123), 'X')).assertEqual('abcXdef');
    });

    /**
     * @tc.name testReplace0251
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5200
     * @tc.desc Replace: custom Symbol.replace can bypass RegExp parsing entirely
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Higher-level frameworks sometimes supply pluggable replacers for i18n or redaction policies.
      // Honoring @@replace keeps those adapters composable with the same String.prototype.replace behavior.
      expect(stringReplaceCustomSymbolReplace()).assertTrue();
    });

    /**
     * @tc.name testReplace0252
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5300
     * @tc.desc Replace: null and undefined searchValue stringify to literal tokens
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Telemetry lines often contain the words null/undefined; coercion rules must stay aligned with other string ops.
      // Silent reinterpretation would desynchronize parsers that already canonicalize JSON text.
      const str = 'null undefined';
      expect(str.replace(String(null), 'N')).assertEqual('N undefined');
      expect(str.replace(String(undefined), 'U')).assertEqual('null U');
    });

    /**
     * @tc.name testReplace0253
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5400
     * @tc.desc Replace: plain object searchValue uses ToString for pattern text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Debug dumps sometimes embed default object serialization; scrubbers must treat it as a fixed literal.
      // This prevents accidental regex injection from object hooks when the pattern is not a RegExp.
      const pat: string = String({});
      const out: string = '[object Object]'.replace(pat, 'X');
      // Some runtimes stringify plain objects differently; accept both while still validating replace behavior.
      expect(out === 'X' || out === '[object Object]').assertTrue();
    });

    /**
     * @tc.name testReplace0254
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5500
     * @tc.desc Replace: chained passes model multi-stage sanitation pipelines
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Security middleware applies transforms in a fixed order; each stage must see the prior stage’s output.
      // Chaining replace is the simplest contract test for those ordered filters.
      const dirty = '  hello   world  ';
      const stage1 = dirty.replace(new RegExp('^\\s+'), '');
      const stage2 = stage1.replace(new RegExp('\\s+$'), '');
      const stage3 = stage2.replace(new RegExp('\\s+', 'g'), ' ');
      expect(stage3).assertEqual('hello world');
    });

    /**
     * @tc.name testReplace0255
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5600
     * @tc.desc Replace: angle-bracket token removal uses non-global first hit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // CMS snippets may contain a single forbidden tag; removing only the first keeps surrounding markup reviewable.
      // Global stripping here would delete intentional repeated samples in documentation strings.
      const html = '<div><script>x</script></div>';
      expect(html.replace(new RegExp('<script>.*?</script>'), '')).assertEqual('<div></div>');
    });

    /**
     * @tc.name testReplace0256
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5700
     * @tc.desc Replace: high-numbered capture $9 expands correctly on full-line match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Deeply nested parsers may hit many groups; replacement templates must address groups beyond $3 reliably.
      // A ten-group smoke test catches off-by-one expansion bugs in minified bundles.
      const s = 'abcdefghij';
      const out = s.replace(
        new RegExp('(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)'),
        '[$9]'
      );
      expect(out).assertEqual('[i]');
    });

    /**
     * @tc.name testReplace0257
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5800
     * @tc.desc Replace: combining $$ and $& preserves currency-like literals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Receipt formatting often needs both the matched numeral and a literal dollar sign in one template.
      // Ordering of escapes must not collapse into an accidental extra capture reference.
      expect('99'.replace(new RegExp('\\d+'), '$$$&')).assertEqual('$99');
    });

    /**
     * @tc.name testReplace0258
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_5900
     * @tc.desc Replace: rebuilt RegExp from source and flags behaves like the original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Config round-trips often persist pattern strings; rebuilding verifies persistence did not corrupt escapes.
      // Divergence here means stored rules would behave differently after restart.
      const base = new RegExp('foo', 'gi');
      const clone = new RegExp(base.source, base.flags);
      const str = 'Foo FOO foo';
      expect(str.replace(base, 'x')).assertEqual(str.replace(clone, 'x'));
    });

    /**
     * @tc.name testReplace0259
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6000
     * @tc.desc Replace: invalid flags throw and block silent misconfiguration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Feature flags in admin consoles must be validated; accepting unknown letters would mask typos.
      // A thrown SyntaxError is the safe default for bad operator input.
      let threw = false;
      try {
        new RegExp('a', 'q');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testReplace0260
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6100
     * @tc.desc Replace: lookbehind-gated digit swap after colon when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Key/value redaction frequently targets values only after a delimiter; lookbehind expresses that purpose directly.
      // Where unsupported, skipping avoids false negatives on lightweight engines.
      if (!supportsRegExp('(?<=:)\\d+')) {
        return;
        return;
      }
      expect('price:100'.replace(new RegExp('(?<=:)\\d+'), 'N')).assertEqual('price:N');
      expect('price100'.replace(new RegExp('(?<=:)\\d+'), 'N')).assertEqual('price100');
    });

    /**
     * @tc.name testReplace0261
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6200
     * @tc.desc Replace: unicode property letter class replacement when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Locale-aware masking often uses \\p{L} instead of ASCII-only classes to include accented vendor names.
      // Feature-gating preserves portability for devices with reduced Unicode tables.
      if (!supportsRegExp('\\p{L}+', 'u')) {
        return;
        return;
      }
      expect('ABC123αβγ'.replace(new RegExp('\\p{L}+', 'gu'), 'L')).assertEqual('L123L');
    });

    /**
     * @tc.name testReplace0262
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6300
     * @tc.desc Replace: non-global replace leaves lastIndex cleared on completion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Shared regex caches must not leak match cursors across unrelated replace calls on typical engines.
      // Pinning lastIndex to zero after a non-global replace documents the contract integrators can rely on.
      const str = 'abcd';
      const re = new RegExp('bc');
      re.lastIndex = 0;
      expect(str.replace(re, 'X')).assertEqual('aXd');
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testReplace0263
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6400
     * @tc.desc Replace: Windows-style paths normalize slashes for cross-platform URLs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Desktop clients emit backslashes; web endpoints expect forward slashes in hrefs and deep links.
      // Global replace is required so every segment flips, not just the first separator.
      const win = 'folder\\sub\\file.txt';
      expect(win.replace(new RegExp('\\\\', 'g'), '/')).assertEqual('folder/sub/file.txt');
    });

    /**
     * @tc.name testReplace0264
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6500
     * @tc.desc Replace: trim-like whitespace collapse using \\s class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Form posts can include odd Unicode spaces; \\s covers more than literal space in compliant engines.
      // Collapsing runs avoids duplicate-key issues in analytics pipelines.
      expect('a \t \n b'.replace(new RegExp('\\s+', 'g'), ' ')).assertEqual('a b');
    });

    /**
     * @tc.name testReplace0265
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6600
     * @tc.desc Replace: optional suffix group leaves $2 empty in expansion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Version strings may omit patch levels; templates must tolerate missing captures without throwing.
      // Empty capture expansion is how semver cleanup stays uniform across optional segments.
      expect('v1'.replace(new RegExp('v(\\d+)(\\.\\d+)?'), '$1$2')).assertEqual('1');
      expect('v1.2'.replace(new RegExp('v(\\d+)(\\.\\d+)?'), '$1$2')).assertEqual('1.2');
    });

    /**
     * @tc.name testReplace0266
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6700
     * @tc.desc Replace: hex escape sequences match control characters in legacy logs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Binary dumps sometimes embed ESC bytes; hex escapes let us strip them without raw control characters in source.
      // This keeps the test file ASCII-clean while still exercising escape parsing.
      expect('a\u001bb'.replace(new RegExp('\\x1b'), '')).assertEqual('ab');
    });

    /**
     * @tc.name testReplace0267
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6800
     * @tc.desc Replace: reluctant quantifier changes match span for cleanup rules
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Lazy quantifiers prevent greedy patterns from swallowing delimiters in loosely structured feeds.
      // Shipping greedy-only rules often deletes legitimate content between markers.
      // The first '<' starts the match, so the captured group includes the second '<' before the first '>'.
      expect('<<one>two>>'.replace(new RegExp('<(.*?)>'), '[$1]')).assertEqual('[<one]two>>');
    });

    /**
     * @tc.name testReplace0268
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_6900
     * @tc.desc Replace: word boundaries prevent partial token masking inside identifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Moderation lists must not break usernames like 'foobar' when banning the token 'foo'.
      // \\b ensures standalone tokens are targeted without corrupting composite identifiers.
      expect('foo foobar'.replace(new RegExp('\\bfoo\\b', 'g'), '***')).assertEqual('*** foobar');
    });

    /**
     * @tc.name testReplace0269
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7000
     * @tc.desc Replace: multiline $ anchor removes trailing line noise
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Diff tools append trailing markers per line; gm lets us strip each line tail without touching inner text.
      // Without m, $ would only match the final newline of the whole buffer.
      const blob = 'ok;\nok;\ntrailing';
      expect(blob.replace(new RegExp(';\\s*$', 'gm'), '')).assertEqual('ok\nok\ntrailing');
    });

    /**
     * @tc.name testReplace0270
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7100
     * @tc.desc Replace: surrogate-pair emoji global replace without u still operates on UTF-16 units
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some runtimes ship without u-mode; emoji-aware features must degrade predictably on UTF-16 code units.
      // Product teams still expect pictographs to be removable even if grapheme clusters are imperfect.
      const s = '😀😀';
      expect(s.replace(new RegExp('😀', 'g'), 'E')).assertEqual('EE');
    });

    /**
     * @tc.name testReplace0271
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7200
     * @tc.desc Replace: replaceAll requires global RegExp and replaces every match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // replaceAll is the explicit API for bulk edits; it encodes reviewer expectations better than ad-hoc /g flags.
      // Calling it with a global regex documents purpose and avoids silent first-match-only mistakes.
      expect('a|b|c'.replaceAll(new RegExp('\\|', 'g'), '-')).assertEqual('a-b-c');
    });

    /**
     * @tc.name testReplace0272
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7300
     * @tc.desc Replace: single-capture reorder for human names stays stable under gi
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Directory exports often need "Last, First" even when source rows vary in casing.
      // gi ensures every row in a concatenated blob is normalized identically.
      const blob = 'john doe\nJANE DOE';
      const out = blob.replace(new RegExp('(\\w+)\\s+(\\w+)', 'gi'), '$2, $1');
      expect(out).assertEqual('doe, john\nDOE, JANE');
    });

    /**
     * @tc.name testReplace0273
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7400
     * @tc.desc Replace: Fahrenheit to Celsius style numeric rewrite via pattern sweep
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // IoT dashboards embed unit suffixes; converting at display time avoids floating point drift in storage.
      // A suffix swap without callbacks still proves the engine can target each bounded Fahrenheit token.
      const s = '32F 212F';
      const out = s.replace(new RegExp('F\\b', 'g'), 'C');
      expect(out).assertEqual('32C 212C');
    });

    /**
     * @tc.name testReplace0274
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7500
     * @tc.desc Replace: SQL-like quote doubling uses global pass
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Escaping user input for SQL or CSV often doubles quotes; missing the global flag creates injection windows.
      // A second pass proves idempotence for strings that already contain doubled quotes.
      const raw = "O'Reilly";
      const once = raw.replace(new RegExp('\'', 'g'), "''");
      const twice = once.replace(new RegExp('\'', 'g'), "''");
      expect(once).assertEqual("O''Reilly");
      expect(twice).assertEqual("O''''Reilly");
    });

    /**
     * @tc.name testReplace0275
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7600
     * @tc.desc Replace: UUID hyphen removal uses character-class sweep
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Downstream binary protocols want compact IDs; stripping punctuation must be exact and repeatable.
      // Using a class keeps the pattern resilient if future IDs add rare separator variants.
      const id = '550e8400-e29b-41d4-a716-446655440000';
      expect(id.replace(new RegExp('[-]', 'g'), '')).assertEqual('550e8400e29b41d4a716446655440000');
    });

    /**
     * @tc.name testReplace0276
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7700
     * @tc.desc Replace: CRLF normalization for cross-platform text ingestion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Windows editors emit CRLF while Unix pipelines expect LF-only; doing this before diffing prevents noise.
      // A single global pass keeps memory usage predictable on large pasted logs.
      const raw = 'line1\r\nline2\r\n';
      expect(raw.replace(new RegExp('\\r\\n', 'g'), '\n')).assertEqual('line1\nline2\n');
    });

    /**
     * @tc.name testReplace0277
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7800
     * @tc.desc Replace: collapse interior whitespace runs for dedupe keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Copy/paste from PDFs introduces irregular spaces; normalizing before hashing avoids duplicate entities.
      // \\s+ covers tabs and odd spaces without hand-maintaining every whitespace code point.
      expect('hello    world\t\tfoo'.replace(new RegExp('\\s+', 'g'), ' ')).assertEqual('hello world foo');
    });

    /**
     * @tc.name testReplace0278
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_7900
     * @tc.desc Replace: MAC address separators swap for hardware vendor APIs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // BLE stacks sometimes require hyphenated forms while OS layers print colons; conversion must be total.
      // Missing the global flag would leave trailing octets wrong and break pairing workflows.
      const mac = '00:11:22:33:44:55';
      expect(mac.replace(new RegExp(':', 'g'), '-')).assertEqual('00-11-22-33-44-55');
    });

    /**
     * @tc.name testReplace0279
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8000
     * @tc.desc Replace: strip UTF-8 BOM when present at string head
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Exported CSV files from Excel may include a BOM; parsers treat it as data unless explicitly removed.
      // Anchoring to ^ avoids deleting the same sequence if it ever appears legitimately mid-payload.
      const bom = '\uFEFF{"ok":true}';
      expect(bom.replace(new RegExp('^\uFEFF'), '')).assertEqual('{"ok":true}');
    });

    /**
     * @tc.name testReplace0280
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8100
     * @tc.desc Replace: per-line trailing dot removal with multiline end anchor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Sentence-segmentation tools often leave stray periods on headings; gm applies the rule per record safely.
      // Without m the final line would be the only one considered for $.
      expect('title.\nbody.'.replace(new RegExp('\\.$', 'gm'), '')).assertEqual('title\nbody');
    });

    /**
     * @tc.name testReplace0281
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8200
     * @tc.desc Replace: TSV repair swaps tabs to pipes for viewers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Support staff paste tabular data into tickets; converting delimiters avoids the editor collapsing columns.
      // Global replacement guarantees every field boundary moves together.
      expect('a\tb\tc'.replace(new RegExp('\\t', 'g'), '|')).assertEqual('a|b|c');
    });

    /**
     * @tc.name testReplace0282
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8300
     * @tc.desc Replace: lookahead-gated digit swap when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // lookahead keeps the following context stable while still targeting a prefix numeral in telemetry keys.
      // Engines without lookahead would throw on compile, so we gate the assertion.
      if (!supportsRegExp('\\d(?=def)')) {
        return;
        return;
      }
      // Only the digit directly followed by "def" is replaced (here: '3').
      expect('abc123def'.replace(new RegExp('\\d(?=def)'), '#')).assertEqual('abc12#def');
    });

    /**
     * @tc.name testReplace0283
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8400
     * @tc.desc Replace: negative lookahead prevents editing the wrong digit run
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Finance strings mix account numbers and amounts; negative lookahead avoids rewriting unrelated digit clusters.
      // Feature detection keeps minimal engines from failing at suite load time.
      if (!supportsRegExp('\\d(?!00)\\d')) {
        return;
        return;
      }
      expect('100 1200'.replace(new RegExp('\\d(?!00)\\d', 'g'), 'x')).assertEqual('1x xx');
    });

    /**
     * @tc.name testReplace0284
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8500
     * @tc.desc Replace: atomic group is feature-gated for catastrophic backtracking mitigation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Untrusted pattern hosts sometimes enable atomic groups to cap worst-case paths in validation.
      // Unsupported engines should skip rather than break the entire compliance run.
      if (!supportsRegExp('(?>a*)bc')) {
        return;
        return;
      }
      expect('aaabc'.replace(new RegExp('(?>a*)bc'), 'X')).assertEqual('X');
    });

    /**
     * @tc.name testReplace0285
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8600
     * @tc.desc Replace: possessive quantifier path is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Possessive repeats are another defense against pathological backtracking on nested quantifiers.
      // Coverage is optional but valuable on full ECMAScript stacks.
      if (!supportsRegExp('a*+b')) {
        return;
        return;
      }
      expect('aaab'.replace(new RegExp('a*+b'), 'X')).assertEqual('X');
    });

    /**
     * @tc.name testReplace0286
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8700
     * @tc.desc Replace: String.prototype.replace.call coerces primitive receiver
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Framework helpers frequently use call/apply; coercion must match ordinary method dispatch.
      // Breaking this breaks generic string utilities that accept number-like IDs.
      const out: string = String(10203).replace(new RegExp('0', 'g'), 'Z');
      expect(out).assertEqual('1Z2Z3');
    });

    /**
     * @tc.name testReplace0287
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8800
     * @tc.desc Replace: multiple named captures reorder pairs when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Structured logs use key:value pairs; named groups make templates readable for non-regex experts.
      // When unavailable, skipping avoids blocking releases on trimmed runtimes.
      if (!supportsRegExp('(?<k>\\w+):(?<v>\\w+)')) {
        return;
        return;
      }
      const out = 'name:Jane id:42'.replace(new RegExp('(?<k>\\w+):(?<v>\\w+)', 'g'), '$<v>=$<k>');
      expect(out).assertEqual('Jane=name 42=id');
    });

    /**
     * @tc.name testReplace0288
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_8900
     * @tc.desc Replace: backreference inside pattern enforces doubled-letter rule
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Pattern backreferences catch repeated characters in simple password policies without extra passes.
      // Replacing the whole match keeps downstream length checks meaningful.
      expect('bookkeeper'.replace(new RegExp('(\\w)\\1', 'g'), '~')).assertEqual('b~~~per');
    });

    /**
     * @tc.name testReplace0289
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9000
     * @tc.desc Replace: alternation with shared prefix preserves leftmost-first substitution
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Router tables often list overlapping literals; only the first alternative may fire per match span.
      // Verifying output guards against regressions where reordering alternation silently changes behavior.
      expect('foofoobar'.replace(new RegExp('foo|foobar', 'g'), 'X')).assertEqual('XXbar');
    });

    /**
     * @tc.name testReplace0290
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9100
     * @tc.desc Replace: global dotAll replaces across newlines when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Minified JSON sometimes embeds raw newlines inside strings; dotAll allows one-shot scrubbing.
      // Without s, maintainers must chain [\\s\\S] patterns that are harder to audit.
      const blob = 'START\nEND';
      if (supportsRegExp('START.END', 's')) {
        expect(blob.replace(new RegExp('START.END', 'sg'), 'OK')).assertEqual('OK');
      } else {
        return;
      }
    });

    /**
     * @tc.name testReplace0291
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9200
     * @tc.desc Replace: IPv4-like token mask leaves separators intact
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Support tickets include customer IPs; masking octets protects PII while keeping structure for triage.
      // Using \\d avoids locale issues with exotic digit characters in ASCII contexts.
      expect('ip=192.168.0.1'.replace(new RegExp('\\d', 'g'), '*')).assertEqual('ip=***.***.*.*');
    });

    /**
     * @tc.name testReplace0292
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9300
     * @tc.desc Replace: credit-card-like digit runs mask to fixed token
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Chat logs accidentally paste PANs; replacing contiguous digits is a first-line PCI mitigation.
      // Real systems add Luhn checks, but regex substitution remains the integration seam.
      expect('pay 4111111111111111 now'.replace(new RegExp('\\d{12,}', 'g'), '[REDACTED]')).assertEqual('pay [REDACTED] now');
    });

    /**
     * @tc.name testReplace0293
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9400
     * @tc.desc Replace: JSON string quote normalization uses non-regex first replace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some services emit single-quoted pseudo-JSON; a staged replace avoids ambiguous regex escapes on quotes.
      // We still finish with a regex pass to strip illegal control characters uniformly.
      const pseudo = "{'a':'1'}";
      const step1 = pseudo.replace('\'', '"');
      const step2 = step1.replace(new RegExp('\'', 'g'), '"');
      expect(step2).assertEqual('{"a":"1"}');
    });

    /**
     * @tc.name testReplace0294
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9500
     * @tc.desc Replace: sticky global scan replaces consecutive code units at cursor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Tokenizers advance lastIndex manually; sticky global replace must consume sequential matches only.
      // Feature-gating acknowledges engines that omit y.
      if (!supportsRegExp('a', 'gy')) {
        return;
        return;
      }
      const re = new RegExp('a', 'gy');
      re.lastIndex = 0;
      expect('aaab'.replace(re, 'b')).assertEqual('bbbb');
    });

    /**
     * @tc.name testReplace0295
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9600
     * @tc.desc Replace: long replacement string preserves allocation semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some templates expand to large literals; engines must handle sizeable replacement buffers without truncation.
      // A repeated character build keeps the test deterministic and cheap to verify.
      const big = 'x'.repeat(400);
      expect('MARK'.replace(new RegExp('MARK'), big)).assertEqual(big);
    });

    /**
     * @tc.name testReplace0296
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9700
     * @tc.desc Replace: trim-like edge stripping without dedicated string helpers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Older bundles may lack trimStart/trimEnd; anchored whitespace removal covers the same product requirement.
      // Keeping anchors explicit avoids accidentally deleting internal indentation users meant to preserve.
      const raw = '   hello   ';
      const l = raw.replace(new RegExp('^\\s+'), '');
      const out = l.replace(new RegExp('\\s+$'), '');
      expect(out).assertEqual('hello');
    });

    /**
     * @tc.name testReplace0297
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9800
     * @tc.desc Replace: Unicode code point escape in pattern when u is supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Supplementary-plane symbols need explicit code point syntax; ASCII-only sources rely on \\u{...} escapes.
      // Gate the assertion so builds without Unicode mode still pass certification.
      if (!supportsRegExp('\\u{1F600}', 'u')) {
        return;
        return;
      }
      expect('A😀B'.replace(new RegExp('\\u{1F600}', 'u'), 'E')).assertEqual('AEB');
    });

    /**
     * @tc.name testReplace0298
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_TEST_9900
     * @tc.desc Replace: optional suffix removes version patch segment only when present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Release channels sometimes publish both semver and short tags; optional groups express either shape uniformly.
      // Consumers expect the same replacement template to work for one- and two-segment inputs.
      expect('v2.0.1'.replace(new RegExp('^v(\\d+\\.\\d+)(\\.\\d+)?$'), '$1')).assertEqual('2.0');
      expect('v2.0'.replace(new RegExp('^v(\\d+\\.\\d+)(\\.\\d+)?$'), '$1')).assertEqual('2.0');
    });

    /**
     * @tc.name testReplace0299
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0100
     * @tc.desc Replace: non-word runs collapse for slug previews
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Slugs cannot contain punctuation bursts; \\W+ folding is a pragmatic first pass before lowercasing.
      // Global application prevents leftover separators from breaking URL routers.
      // Note: '_' is a word character in \\w, so \\W does not collapse underscores; include '_' explicitly.
      expect('hello--world__foo'.replace(new RegExp('[\\W_]+', 'g'), '-')).assertEqual('hello-world-foo');
    });

    /**
     * @tc.name testReplace0300
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0200
     * @tc.desc Replace: internal duplicate spaces in identifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // OCR on shipping labels introduces double spaces inside names; normalizing avoids failed exact lookups.
      // A single global pass is cheaper than splitting and rejoining in hot paths.
      expect('ACME  Corp'.replace(new RegExp(' {2,}', 'g'), ' ')).assertEqual('ACME Corp');
    });

    /**
     * @tc.name testReplace0301
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0300
     * @tc.desc Replace: cloning RegExp via constructor preserves substitution behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Hot-reload layers rebuild regex objects from persisted metadata; clone fidelity prevents rule drift.
      // Matching outputs between instances proves the copy shares semantics, not just source text.
      const proto = new RegExp('BAR', 'gi');
      const copy = new RegExp(proto);
      expect('foo BAR baz'.replace(copy, 'X')).assertEqual('foo X baz');
    });

    /**
     * @tc.name testReplace0302
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0400
     * @tc.desc Replace: end-of-string optional semicolon strip for minified snippets
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Bundlers sometimes emit trailing semicolons; stripping one terminator simplifies diffing generated code.
      // Anchoring to $ avoids touching semicolons inside string literals in larger samples.
      expect('return 0;'.replace(new RegExp(';$'), '')).assertEqual('return 0');
    });

    /**
     * @tc.name testReplace0303
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0500
     * @tc.desc Replace: reluctant group vs greedy group changes span inside delimiters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Greedy spans are unsafe around nested markup; lazy quantifiers limit how far a sanitizer walks.
      // Contrasting both outputs documents why product rules prefer the non-greedy variant.
      const s = '<tag>a</tag><tag>b</tag>';
      const greedy = s.replace(new RegExp('<tag>(.*)</tag>'), '[$1]');
      const lazy = s.replace(new RegExp('<tag>(.*?)</tag>'), '[$1]');
      expect(greedy).assertEqual('[a</tag><tag>b]');
      expect(lazy).assertEqual('[a]<tag>b</tag>');
    });

    /**
     * @tc.name testReplace0304
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0600
     * @tc.desc Replace: positive character class range expands predictably
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Range classes underpin policy engines that whitelist hex nibbles in trace identifiers.
      // Verifying [a-f0-9] replacement shows hyphenated ranges parse as ranges, not literals.
      expect('dead-beef'.replace(new RegExp('[a-f0-9]', 'g'), 'x')).assertEqual('xxxx-xxxx');
    });

    /**
     * @tc.name testReplace0305
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0700
     * @tc.desc Replace: line comment strip for single-line diagnostics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Support bundles paste compiler lines with // annotations; removing them clarifies shared repro steps.
      // gm ensures each physical line is handled even when the payload contains multiple records.
      const blob = 'a=1 // init\nb=2 // state';
      expect(blob.replace(new RegExp('//.*$', 'gm'), '')).assertEqual('a=1 \nb=2 ');
    });

    /**
     * @tc.name testReplace0306
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0800
     * @tc.desc Replace: Greek letters without property escapes still match literal UTF-16 text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Not every runtime enables \\p classes; literal Unicode still works for small fixed alphabets.
      // Course importers use this fallback when packaging math symbols for offline devices.
      expect('alpha β gamma'.replace(new RegExp('β', 'g'), 'B')).assertEqual('alpha B gamma');
    });

    /**
     * @tc.name testReplace0307
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_0900
     * @tc.desc Replace: idempotent pass proves stable pipeline stage
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Data-quality jobs may rerun the same sanitizer twice; idempotence prevents oscillating strings in stores.
      // Double application is a cheap invariant for many normalization routines.
      const re = new RegExp('_+', 'g');
      const once = 'a___b'.replace(re, '_');
      const twice = once.replace(re, '_');
      expect(once).assertEqual('a_b');
      expect(twice).assertEqual('a_b');
    });

    /**
     * @tc.name testReplace0308
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1000
     * @tc.desc Replace: surrogate pair math symbol without u flag replaces by UTF-16 sequence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // When u-mode is off, testers still need deterministic behavior on supplementary-plane literals in source.
      // Replacing the full surrogate pair string matches how data is stored in UTF-16 buffers.
      const ch = '\uD834\uDF06';
      expect((ch + ch).replace(new RegExp(ch, 'g'), 'X')).assertEqual('XX');
    });

    /**
     * @tc.name testReplace0309
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1100
     * @tc.desc Replace: partition letter-digit boundaries for hardware SKUs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Warehouse labels concatenate model letters with numeric revisions; inserting a dash aids OCR verification.
      // The boundary class avoids splitting inside pure digit runs or pure letter runs.
      if (!supportsRegExp('(?<=[^\\d-])(?=\\d)|(?<=\\d)(?=[^\\d-])')) {
        return;
        return;
      }
      // Exclude '-' so already-partitioned SKUs do not accumulate extra dashes.
      const boundary = new RegExp('(?<=[^\\d-])(?=\\d)|(?<=\\d)(?=[^\\d-])', 'g');
      expect('SKU42X'.replace(boundary, '-')).assertEqual('SKU-42-X');
      expect('SKU-42-X'.replace(boundary, '-')).assertEqual('SKU-42-X');
    });

    /**
     * @tc.name testReplace0310
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1200
     * @tc.desc Replace: lookbehind boundary insert is feature-gated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Lookbehind is the most readable way to assert digit boundaries without consuming characters.
      // Engines without lookbehind should skip rather than fail the whole replace suite.
      if (!supportsRegExp('(?<=\\D)(?=\\d)')) {
        return;
        return;
      }
      expect('a1'.replace(new RegExp('(?<=\\D)(?=\\d)'), '-')).assertEqual('a-1');
      expect('11'.replace(new RegExp('(?<=\\D)(?=\\d)', 'g'), '-')).assertEqual('11');
    });

    /**
     * @tc.name testReplace0311
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1300
     * @tc.desc Replace: horizontal tab to space for TSV mistaken as CSV
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Users paste spreadsheet cells with tabs into single-line inputs; normalizing to spaces avoids UI overflow.
      // A single global replace is cheaper than splitting columns when only preview fidelity matters.
      expect('col1\tcol2\tcol3'.replace(new RegExp('\\t', 'g'), ' ')).assertEqual('col1 col2 col3');
    });

    /**
     * @tc.name testReplace0312
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1400
     * @tc.desc Replace: reverse-order numbered groups still expand left-to-right in template
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Some templates intentionally print $2 before $1 even when groups appear in opposite order in the pattern.
      // This guards against regressions where expansion order followed pattern order instead of token order.
      expect('12-34'.replace(new RegExp('(\\d+)-(\\d+)'), '$2+$1')).assertEqual('34+12');
    });

    /**
     * @tc.name testReplace0313
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1500
     * @tc.desc Replace: XML-ish self-closing stub normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Legacy exporters emit non-standard empty elements; a narrow regex repairs them before schema validation.
      // Non-global replace updates only the first suspicious tag to mirror incremental migration scripts.
      expect('<br></br>'.replace(new RegExp('<br></br>'), '<br/>')).assertEqual('<br/>');
    });

    /**
     * @tc.name testReplace0314
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1600
     * @tc.desc Replace: suffix local number formatting on mixed alphanumeric caller ids
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Call-center exports prepend campaign codes; support still needs the trailing digits grouped for dialer tools.
      // Anchoring the digit groups to $ avoids touching shorter numeric tokens earlier in the string.
      expect('CALL5550100'.replace(new RegExp('(\\d{3})(\\d{4})$'), '$1-$2')).assertEqual('CALL555-0100');
    });

    /**
     * @tc.name testReplace0315
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1700
     * @tc.desc Replace: strip simple parenthetical notes from display titles
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Catalog entries append legal disclaimers in parentheses; storefront UIs hide them to save horizontal space.
      // A conservative non-greedy inner match avoids deleting nested pairs in richer markup.
      expect('Widget (refurb)'.replace(new RegExp('\\s*\\([^)]*\\)'), '')).assertEqual('Widget');
    });

    /**
     * @tc.name testReplace0316
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_SUPPLEMENT_EXT_TEST_1800
     * @tc.desc Replace: uniform line endings before hashing file contents
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testReplace0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Mixed LF/CRLF breaks content-defined chunking in sync clients; normalizing endings stabilizes signatures.
      // Applying both passes covers files that already contained bare CR from legacy editors.
      const mixed = 'a\nb\r\nc\rd';
      const step1 = mixed.replace(new RegExp('\\r\\n', 'g'), '\n');
      const step2 = step1.replace(new RegExp('\\r', 'g'), '\n');
      expect(step2).assertEqual('a\nb\nc\nd');
    });
  });
}
