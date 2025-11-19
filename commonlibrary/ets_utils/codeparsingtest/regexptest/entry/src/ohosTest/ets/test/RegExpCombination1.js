'use strict'

export function RegExpCombination1Test053() {
    const re53 = /\s/g;
    const str53 = "a b\tc\nd";
    let match53_1 = str53.match(re53);
    let match53_2 = str53.match(re53);
    return [match53_1, re53.lastIndex, match53_2.length];
}

export function RegExpCombination1Test080() {
    const re80 = /(?<num>\d+)/g; // 命名分组num
    const str80 = "123 456";
    let replace80_1 = str80.replace(re80, "[$<num>]");
    let replace80_2 = str80.replace(re80, (_, num) => `{${num}}`); // 回调参数
    return [replace80_1, replace80_2];
}

export function RegExpCombination1Test120() {
    const re120 = /(q)(r)/g;
    const str120 = "qrqr";
    let log120 = [];
    str120.replace(re120, (match, g1, g2, index) => {
        log120.push(`${match}:${g1}:${g2}:${index}`);
        return "";
    });
    return log120;
}

