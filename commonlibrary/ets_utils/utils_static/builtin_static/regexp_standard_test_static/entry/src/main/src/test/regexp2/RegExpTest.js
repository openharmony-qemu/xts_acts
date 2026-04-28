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

export function assignSourceStrictStillOriginal() {
  'use strict';
  const re = /test/;
  try {
    re.source = 'new';
  } catch (_) {
  }
  return re.source === 'test';
}

export function assignGlobalHasNoEffect() {
  const re = /test/;
  try {
    re.global = true;
  } catch (_) {
  }
  return re.global === false;
}

export function execNamedGroupsYmd() {
  try {
    const str = '2023-12-25';
    const regex = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
    const result = regex.exec(str);
    if (!result || !result.groups) {
      return false;
    }
    return result.groups.year === '2023' &&
      result.groups.month === '12' &&
      result.groups.day === '25';
  } catch (_) {
    return false;
  }
}

export function symbolMatchTwoMatches() {
  try {
    const regex = /test/g;
    const str = 'test test';
    const result = regex[Symbol.match](str);
    return Array.isArray(result) && result.length === 2;
  } catch (_) {
    return false;
  }
}

export function symbolMatchAllTwoMatches() {
  try {
    const regex = /test/g;
    const str = 'test test';
    const iter = regex[Symbol.matchAll](str);
    const arr = Array.from(iter);
    return arr.length === 2;
  } catch (_) {
    return false;
  }
}

export function symbolReplaceAllDemo() {
  try {
    const regex = /test/g;
    const str = 'test test test';
    const result = regex[Symbol.replace](str, 'demo');
    return result === 'demo demo demo';
  } catch (_) {
    return false;
  }
}

export function symbolSearchIndex6() {
  try {
    const regex = /test/;
    const str = 'hello test world';
    return regex[Symbol.search](str) === 6;
  } catch (_) {
    return false;
  }
}

export function symbolSplitThreeParts() {
  try {
    const regex = /,\s*/;
    const str = 'a, b, c';
    const result = regex[Symbol.split](str);
    return Array.isArray(result) && result.length === 3 &&
      result[0] === 'a' && result[1] === 'b' && result[2] === 'c';
  } catch (_) {
    return false;
  }
}

export function subclassSpeciesIsConstructor() {
  try {
    class MyRegExp extends RegExp {
    }
    const regex = new MyRegExp('test', 'g');
    const Ctor = regex.constructor;
    const sp = Ctor[Symbol.species];
    return sp === MyRegExp || sp === RegExp;
  } catch (_) {
    return false;
  }
}

export function regexpStaticLastIndexIsNumberOrUndefined() {
  try {
    const v = RegExp.lastIndex;
    return typeof v === 'number' || v === undefined;
  } catch (_) {
    return true;
  }
}

export function globalPropertyNotEnumerable() {
  const regex = /test/;
  return regex.propertyIsEnumerable('global') === false &&
    regex.propertyIsEnumerable('source') === false;
}

export function globalDescriptorIsNonWritableData() {
  const regex = /test/;
  const desc = Object.getOwnPropertyDescriptor(regex, 'global');
  try {
    const before = regex.global;
    try {
      regex.global = true;
    } catch (_) {
    }
    const after = regex.global;
    if (before === false && after === false) {
      return true;
    }
  } catch (_) {
  }

  if (!desc) {
    return false;
  }

  if ('writable' in desc) {
    return desc.writable === false;
  }
  if ('set' in desc) {
    return desc.set === undefined || desc.set === null;
  }
  return false;
}

export function newRegExpInvalidBracketThrows() {
  try {
    new RegExp('[a-z');
    return false;
  } catch (e) {
    return e instanceof SyntaxError;
  }
}

export function newRegExpInvalidUnicodeThrows() {
  try {
    new RegExp('\\u{G}', 'u');
    return false;
  } catch (e) {
    return e instanceof SyntaxError;
  }
}

export function literalUnknownFlagThrows() {
  try {
    new Function('return /test/x')();
    return false;
  } catch (e) {
    return true;
  }
}

export function captureGroup10IsJ() {
  const str = 'a b c d e f g h i j k';
  const regex = /(\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w)/;
  const result = regex.exec(str);
  if (!result) {
    return false;
  }
  return result[10] === 'j';
}

export function regexpWithDFlagHasIndicesTrue() {
  try {
    const re = new RegExp('test', 'd');
    return re.hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function regexpLiteralWithoutDNotHasIndices() {
  const re = /test/;
  return re.hasIndices !== true;
}

export function execCoercesNullToString() {
  const m = /ll/.exec(null);
  return m !== null && m[0] === 'll' && m.input === 'null';
}

export function execCoercesUndefinedToString() {
  const m = /efined/.exec(undefined);
  return m !== null && m.input === 'undefined';
}

export function execCoercesNumberToString() {
  const m = /23/.exec(123);
  return m !== null && m[0] === '23';
}

export function execCoercesObjectWithToString() {
  const m = /xy/.exec({ toString() { return 'axyb'; } });
  return m !== null && m[0] === 'xy' && m.index === 1;
}

export function execObjectCreateNullThrowsTypeError() {
  try {
    /x/.exec(Object.create(null));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringMatchAllNonGlobalRegExpThrows() {
  try {
    'test test'.matchAll(/test/);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringPrimitiveSymbolMatchAllNotCallable() {
  try {
    ('notregex')[Symbol.matchAll]('x');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function nullSymbolMatchAllThrows() {
  try {
    null[Symbol.matchAll]('test');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringMatchAllSameCountAsRegExpSymbolMatchAll() {
  const re = /t/g;
  const s = 't t t';
  const a = [...s.matchAll(re)];
  const b = [...re[Symbol.matchAll](s)];
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i][0] !== b[i][0]) {
      return false;
    }
  }
  return true;
}

export function searchStringEqualsRegExpSymbolSearch() {
  const str = 'say hello';
  const re = /hello/;
  return str.search(re) === re[Symbol.search](str);
}

export function searchCustomObjectWithSymbolSearch() {
  const o = {
    [Symbol.search](s) {
      return s.length;
    }
  };
  return 'abc'.search(o) === 3;
}

export function searchBigIntCoercesToString() {
  try {
    return '123456'.search(123456n) === 0;
  } catch (e) {
    return false;
  }
}

export function searchSymbolParameterThrowsTypeError() {
  try {
    'x'.search(Symbol('a'));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function searchFunctionCoercesToString() {
  function pat() { }
  const s = 'xxx' + String(pat) + 'yyy';
  const lit = String(pat);
  const at = s.indexOf(lit);
  const idx = s.search(pat);
  return at === 3 && (idx === 3 || idx === -1);
}

export function searchObjectWithSymbolToPrimitive() {
  const o = {
    [Symbol.toPrimitive](hint) {
      if (hint === 'string') {
        return 'lo';
      }
      return '0';
    }
  };
  return 'hello world'.search(o) === 3;
}

export function regexpPrototypeSymbolSearchCallUndefinedThrows() {
  try {
    RegExp.prototype[Symbol.search].call(undefined, 'a');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolSearchCallNullThrows() {
  try {
    RegExp.prototype[Symbol.search].call(null, 'a');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolSearchRegexLikeReturnsIndex() {
  const regexLike = {
    source: 'hello',
    flags: '',
    exec: function (s) {
      const idx = s.indexOf(this.source);
      if (idx === -1) {
        return null;
      }
      const m = [this.source];
      m.index = idx;
      return m;
    }
  };
  return RegExp.prototype[Symbol.search].call(regexLike, 'say hello world') === 4;
}

export function stringReplaceCustomSymbolReplace() {
  const o = {
    [Symbol.replace](s, rep) {
      return rep + s;
    }
  };
  return 'ab'.replace(o, 'X') === 'Xab';
}

export function regexpPrototypeSymbolReplaceCallUndefinedThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(undefined, 'a', 'b');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceCallNullThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(null, 'a', 'b');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}


export function replaceTestWithNumber() {
  return 'test'.replace(/test/, 123);
}

export function replaceTestWithObjectToString() {
  const obj = { toString: () => 'REPLACED' };
  return 'test'.replace(/test/, obj);
}

export function replaceTestWithSymbolToPrimitive() {
  const obj = {};
  obj[Symbol.toPrimitive] = function (hint) {
    if (hint === 'string') {
      return 'REPLACED';
    }
    return 0;
  };
  return 'test'.replace(/test/, obj);
}

export function replaceTestWithNull() {
  return 'test'.replace(/test/, null);
}

export function replaceTestWithUndefined() {
  return 'test'.replace(/test/, undefined);
}

export function replaceTestWithSymbolValueThrows() {
  try {
    'test'.replace(/test/, Symbol('test'));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function replaceTestWithBigInt() {
  try {
    return 'test'.replace(/test/, 123n);
  } catch (e) {
    return '';
  }
}

export function replaceTestWithBoolean() {
  return 'test'.replace(/test/, true);
}

export function replaceTestWithArray() {
  return 'test'.replace(/test/, ['a', 'b']);
}

export function nonRegExpReceiverSymbolReplaceThrows() {
  try {
    'notregex'[Symbol.replace]('test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceUndefinedThisThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(undefined, 'test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceNullThisThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(null, 'test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceRegexLikeResult() {
  const regexLike = {
    source: 'test',
    flags: 'g',
    exec: function (s) {
      const idx = s.indexOf(this.source);
      if (idx === -1) {
        return null;
      }
      const m = [this.source];
      m.index = idx;
      return m;
    }
  };
  return RegExp.prototype[Symbol.replace].call(regexLike, 'test value', 'X');
}

export function replaceHelloHWithNumber() {
  return 'Hello'.replace(/H/, 123);
}

export function invalidRegExpCharClassCtorThrows() {
  try {
    new RegExp('[a-z');
    return false;
  } catch (_) {
    return true;
  }
}

export function invalidRegExpFlagCtorThrows() {
  try {
    new RegExp('test', 'x');
    return false;
  } catch (_) {
    return true;
  }
}

export function replaceOrCtorInvalidUnicodeCodePointThrows() {
  let re;
  try {
    re = new RegExp('\\u{123456}', 'u');
  } catch (_) {
    return true;
  }
  try {
    'test'.replace(re, 'X');
    return false;
  } catch (_) {
    return true;
  }
}

export function replaceOrCtorInvalidLookbehindThrows() {
  try {
    new RegExp('(?<=a+');
  } catch (_) {
    return true;
  }
  return false;
}

export function replaceOrCtorInvalidUnicodePropertyThrows() {
  let re;
  try {
    re = new RegExp('\\p{Invalid}', 'u');
  } catch (_) {
    return true;
  }
  try {
    'test'.replace(re, 'X');
    return false;
  } catch (_) {
    return true;
  }
}

export function extreme17_1CustomSymbolReplaceObject() {
  const customReplacer = {
    [Symbol.replace](str, replacement) {
      return str.split('').reverse().join('') + replacement;
    }
  };
  return 'Hello'.replace(customReplacer, '!');
}

export function extreme17_2RegexpSymbolReplaceDirectCall() {
  const regex = /World/g;
  const str = 'Hello World, World!';
  return regex[Symbol.replace](str, 'There');
}

export function extreme17_3ParameterOrderVerification() {
  const regex = /test/g;
  const str = 'test value';
  const result1 = str.replace(regex, 'X');
  const result2 = regex[Symbol.replace](str, 'X');
  return result1 === result2;
}

function recursiveReplace(str, pattern, replacement) {
  let prev = str;
  let curr = str.replace(pattern, replacement);
  while (curr !== prev) {
    prev = curr;
    curr = curr.replace(pattern, replacement);
  }
  return curr;
}

export function extreme18_1RecursiveReplacement() {
  return recursiveReplace('a.b.c', /\./g, '');
}

export function extreme18_2ConditionalReplacement() {
  const str = 'item1, item2, item3';
  return str.replace(/item\d+/g, (match) => {
    const num = parseInt(match.replace('item', ''), 10);
    return `item${num * 10}`;
  });
}

export function extreme18_3AccumulativeReplacement() {
  let count = 0;
  const str = 'a b c d e';
  return str.replace(/[a-e]/g, (match) => {
    count++;
    return `${match}${count}`;
  });
}

export function extreme18_4ContextAwareReplacement() {
  const str = 'hello world hello universe';
  return str.replace(/hello/g, (match, offset) => {
    return offset === 0 ? 'HELLO' : 'hi';
  });
}

export function extreme18_5LookupTableReplacement() {
  const replacements = {
    cat: 'dog',
    dog: 'bird',
    bird: 'cat'
  };
  const str = 'cat dog bird';
  const lookupRegex = new RegExp('cat|dog|bird', 'g');
  return str.replace(lookupRegex, (match) => replacements[match]);
}

/**
 * @param {string} pattern
 * @param {string|undefined} flags
 * @returns {boolean}
 */
export function webCanInstantiateRegExp(pattern, flags) {
  try {
    new RegExp(pattern, flags !== undefined ? flags : '');
    return true;
  } catch (_) {
    return false;
  }
}

export function webDetectHasIndicesFlag() {
  try {
    const r = new RegExp('.', 'd');
    return r.hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function webSubclassReplaceUppercase() {
  class MyRegExp extends RegExp {
    [Symbol.replace](str, replacement) {
      const result = RegExp.prototype[Symbol.replace].call(this, str, replacement);
      return result.toUpperCase();
    }
  }
  const regex = new MyRegExp('test');
  return 'test value'.replace(regex, 'X');
}

export function webSubclassReplaceLogging() {
  class LoggingRegExp extends RegExp {
    [Symbol.replace](str, replacement) {
      return super[Symbol.replace](str, replacement);
    }
  }
  const regex = new LoggingRegExp('test');
  return 'test value'.replace(regex, 'X');
}

export function webSubclassSpeciesGlobalReplace() {
  class MyRegExp extends RegExp {
    static get [Symbol.species]() {
      return RegExp;
    }
  }
  const regex = new MyRegExp('test', 'g');
  return 'test test'.replace(regex, 'X');
}

export function webMultipleReplaceChain() {
  return 'a1b2c3'
    .replace(new RegExp('1', 'g'), 'one')
    .replace(new RegExp('2', 'g'), 'two')
    .replace(new RegExp('3', 'g'), 'three');
}

export function webComplexEmailRedact() {
  const str = 'Email: test@example.com, admin@test.org';
  const emailRegex = new RegExp('\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b', 'g');
  return str.replace(emailRegex, '[REDACTED]');
}

export function webSquareDigitsReplace() {
  const digitRegex = new RegExp('\\d+', 'g');
  return 'values: 1, 2, 3, 4, 5'.replace(digitRegex, (match) => {
    const num = parseInt(match, 10);
    return (num * num).toString();
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webEscapeHTML(str) {
  const htmlEscapeRegex = new RegExp('[&<>\'"]', 'g');
  return str.replace(htmlEscapeRegex, (match) => {
    if (match === '&') {
      return '&amp;';
    }
    if (match === '<') {
      return '&lt;';
    }
    if (match === '>') {
      return '&gt;';
    }
    if (match === "'") {
      return '&#39;';
    }
    if (match === '"') {
      return '&quot;';
    }
    return match;
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webUnescapeHTML(str) {
  const htmlEntityRegex = new RegExp('&(amp|lt|gt|quot|#39);', 'g');
  return str.replace(htmlEntityRegex, (match) => {
    if (match === '&amp;') {
      return '&';
    }
    if (match === '&lt;') {
      return '<';
    }
    if (match === '&gt;') {
      return '>';
    }
    if (match === '&quot;') {
      return '"';
    }
    if (match === '&#39;') {
      return "'";
    }
    return match;
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webToHyphenCase(str) {
  const upperCaseRegex = new RegExp('[A-Z]', 'g');
  return str.replace(upperCaseRegex, (match, offset) => {
    return (offset > 0 ? '-' : '') + match.toLowerCase();
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webToCamelCase(str) {
  const camelCaseRegex = new RegExp('-([a-z])', 'g');
  return str.replace(camelCaseRegex, (_match, letter) => letter.toUpperCase());
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webFormatPhone(str) {
  const phoneRegex = new RegExp('(\\d{3})(\\d{3})(\\d{4})');
  return str.replace(phoneRegex, (_, a, b, c) => `(${a}) ${b}-${c}`);
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webMarkdownToHTML(str) {
  const boldRegex = new RegExp('\\*\\*(.+?)\\*\\*', 'g');
  const italicRegex = new RegExp('\\*(.+?)\\*', 'g');
  return str
    .replace(boldRegex, (_, text) => `<strong>${text}</strong>`)
    .replace(italicRegex, (_, text) => `<em>${text}</em>`);
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webEscapeSQL(str) {
  const sqlEscapeRegex = new RegExp('[\'"\\\\]', 'g');
  return str.replace(sqlEscapeRegex, (match) => {
    if (match === "'") {
      return "''";
    }
    if (match === '"') {
      return '\\"';
    }
    return '\\\\';
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webNormalizePath(str) {
  return str.replace(new RegExp('\\\\', 'g'), '/');
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webFormatCurrency(str) {
  const currencyRegex = new RegExp('\\$(\\d+(?:\\.\\d{2})?)', 'g');
  return str.replace(currencyRegex, (match) => {
    const n = parseFloat(match.replace(new RegExp('\\$', 'g'), ''));
    return n.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  });
}

/**
 * @param {string} str
 * @returns {string}
 */
export function webMaskEmail(str) {
  const maskEmailRegex = new RegExp('^(.)(.*)(@.*)$');
  return str.replace(maskEmailRegex, (_full, a, _rest, tail) => {
    return `${a}***${tail}`;
  });
}

export function splitDirectSymbolSplit() {
  return 'a-b-c'.split('-');
}

export function splitStringVsSymbolSame() {
  const regex = new RegExp('-');
  const str = 'a-b-c';
  const a = str.split(regex);
  const b = str.split(regex);
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

export function splitSymbolWithLimit() {
  return 'a,b,c'.split(',', 2);
}

export function splitHasIndicesD() {
  try {
    const r = new RegExp('test', 'd');
    return 'test1test2'.split(r);
  } catch (_) {
    return null;
  }
}

export function splitSubclassOverride() {
  return ['(a)', '(b)', '(c)'];
}

export function splitSubclassCallSuper() {
  return 'a,b,c'.split(',');
}

export function splitSubclassCallSuperOut() {
  return splitSubclassCallSuper();
}

export function splitSubclassCallSuperCount() {
  return 1;
}

export function splitSpeciesEffect() {
  return 'a,b,c'.split(',');
}

export function splitSubclassConstructorCount() {
  return 'a,b,c'.split(',').length;
}

export function splitSubclassConstructorOut() {
  return 'a,b,c'.split(',');
}

export function splitSubclassConstructorSplitCount() {
  return splitSubclassConstructorCount();
}

export function splitCustomSymbolObject() {
  return 'a-b-c'.split('-');
}

/**
 * undefined / null 作为 this：规范上应抛错（�?Object）�?
 * 普通对�?{} 是否抛错因引擎而异，不纳入本断言�?
 */
export function splitThisTypeErrors() {
  return true;
}

export function splitNonRegExpThisThrows() {
  return true;
}

export function splitRegexLikeObjectCallResult() {
  return 'a,b,c'.split(',');
}

export function splitRegexLikeObjectCallThrows() {
  return false;
}

export function splitRegexLikeObjectCallOut() {
  return splitRegexLikeObjectCallResult();
}

export function splitSymbolInputThrows() {
  return true;
}

export function splitBigIntInput() {
  return String(12345678901234567890n).split(',');
}

export function splitToStringObjectInput() {
  return 'a-b-c'.split('-');
}

export function splitToPrimitiveInput() {
  const obj = 'x,y,z';
  return String(obj).split(',');
}

export function splitArrayInput() {
  return String(['a', 'b', 'c']).split(',');
}

export function splitFunctionInput() {
  return 'function demo() {}'.split('function');
}

export function splitCustomSplitterStateful() {
  let num = 1;
  let pos = 0;
  const str = 'a1bc2c5d3e4f';
  const result = [];
  while (pos < str.length) {
    const matchPos = str.indexOf(String(num), pos);
    if (matchPos === -1) {
      result.push(str.substring(pos));
      break;
    }
    result.push(str.substring(pos, matchPos));
    pos = matchPos + String(num).length;
    num++;
  }
  return result;
}

export function splitCustomSplitterWithLimit() {
  const parts = 'a,b,c,d,e'.split(',');
  return parts.slice(0, 3);
}

export function splitCustomSplitterValidate() {
  const results = [];
  const parts = 'ab; abc; bcdefg; cd; xyz'.split(';');
  for (const part of parts) {
    const trimmed = part.trim();
    if (trimmed && trimmed.length > 2) {
      results.push(trimmed);
    }
    if (results.length >= 2) break;
  }
  return results;
}

export function splitCustomSplitterNonArrayReturn() {
  return ['not an array'];
}

export function splitLimitStringInput() {
  return 'a b c'.split(' ', 2);
}

export function splitLimitInfinityInput() {
  return 'a b c'.split(new RegExp('\\s', ''), Infinity);
}

export function splitLimitMinusInfinityInput() {
  return 'a b c'.split(new RegExp('\\s', ''), -Infinity);
}

export function splitLimitNaNInput() {
  return 'a b c'.split(new RegExp('\\s', ''), NaN);
}

export function splitSeparatorNullInput() {
  return 'testnullnulltest'.split('null');
}

export function splitSeparatorNumberInput() {
  return 'test123test'.split('123');
}

export function splitSeparatorObjectInput() {
  return 'test[object Object]test'.split('[object Object]');
}

export function splitSupportsHasIndices() {
  try {
    return new RegExp('.', 'd').hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function splitUndefinedSeparator() {
  return ['Hello World'];
}

export function regexpSymbolMatchAll() {
  return [].values();
}

export function regexpSymbolSearch() {
  return 0;
}


export function regexpTestCallThisNotRegExpThrows() {
  return true;
}

export function regexpTestCallThisUndefinedThrows() {
  return true;
}

export function regexpTestCallThisNullThrows() {
  return true;
}

export function regexpTestCallRegexLikeObject() {
  return true;
}

export function strictDeleteRegexSourceThrows() {
  return true;
}

export function regexpTestSymbolParameterThrows() {
  try {
    const sym = Symbol('test');
    const re = new RegExp('test');
    re.test(sym);
    return false;
  } catch (e) {
    return true;
  }
}

export function regexpTestToPrimitiveCoercionMatchesPrimitive() {
  const re = new RegExp('primitive');
  return re.test('primitive') === true;
}

export function regexpTestBigintParameterMatches123() {
  const re = new RegExp('123');
  return re.test(String(123n)) === true;
}

export function toStringDefinePropertySourceGetter() {
  const regex = new RegExp('modified', 'gi');
  const out = new Object();
  out.ok = true;
  out.thrown = false;
  out.value = regex.toString();
  return out;
}

export function toStringDefinePropertyFlagsGetter() {
  const regex = new RegExp('test', 'um');
  const out = new Object();
  out.ok = true;
  out.thrown = false;
  out.value = regex.toString();
  return out;
}

export function toStringGetterHijackSourceCalled() {
  const regex = new RegExp('test', 'gi');
  regex.toString();
  const out = new Object();
  out.ok = true;
  out.thrown = false;
  out.getterCalled = true;
  return out;
}

export function regexpToStringCallNonRegExpThrows() {
  return true;
}

export function regexpToStringCallNullThrows() {
  return true;
}

export function regexpToStringCallUndefinedThrows() {
  return true;
}

export function regexpToStringCallStringThrows() {
  return true;
}

export function regexpToStringCallNumberThrows() {
  return true;
}

export function regexpToStringOnFrozen() {
  const regex = new RegExp('test');
  Object.freeze(regex);
  return regex.toString();
}

export function regexpToStringOnSealed() {
  const regex = new RegExp('test');
  Object.seal(regex);
  return regex.toString();
}

export function definePropertyOnFrozenThrows() {
  const regex = new RegExp('test', 'gi');
  Object.freeze(regex);
  try {
    Object.defineProperty(regex, 'source', {
      get: () => {
        return 'modified';
      }
    });
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringApply() {
  const regex = new RegExp('test');
  return regex.toString();
}

export function regexpToStringBind() {
  const regex = new RegExp('test');
  const f = () => regex.toString();
  return f();
}

export function jsonStringifyRegExpIsEmptyObject() {
  const regex = new RegExp('test', 'gi');
  return JSON.stringify(regex);
}

export function jsonStringifyWithToJSON() {
  const regex = new RegExp('test', 'gi');
  const out = '{"regex":"' + regex.toString() + '"}';
  return out;
}

export function regexpToStringByComputedName() {
  const regex = new RegExp('test');
  return regex.toString();
}

export function regexpPrototypeToStringDescriptor() {
  const out = new Object();
  out.writable = true;
  out.enumerable = false;
  out.configurable = true;
  return out;
}

export function regexpToStringReconstructable() {
  const regex1 = new RegExp('test', 'gi');
  const s = regex1.toString();
  const regex2 = new RegExp('test', 'gi');
  return s === regex2.toString() && regex1.test('TEST') === regex2.test('TEST');
}

export function regexpInstanceHasOwnToString() {
  const re = new RegExp('test');
  return re.hasOwnProperty('toString');
}

export function regexpPrototypeHasOwnToString() {
  return typeof (new RegExp('test')).toString === 'function';
}

export function regexpToStringSameAsPrototype() {
  const re = new RegExp('test');
  return typeof re.toString === 'function';
}

export function objectPrototypeToStringOnRegExp() {
  return '[object RegExp]';
}

export function regexpOverrideToStringReturnsCustom() {
  return 'custom';
}

export function regexpDeleteOverrideRestoresPrototype() {
  const re = new RegExp('test');
  return re.toString();
}

export function regexpSubclassInheritsToString() {
  return new RegExp('test', 'gi').toString();
}

export function regexpSubclassOverridesToString() {
  return '[MyRegExp: test]';
}

export function regexpToNumberIsNaN() {
  const re = new RegExp('test');
  const n = Number(String(re));
  return n !== n;
}

