/* Copyright (c) 2026 Huawei Device Co., Ltd. */
const WEAKMAP_SYMBOL_A = Symbol('weakmap-test');
const WEAKMAP_SYMBOL_B = Symbol.for('weakmap-global-key');
const WEAKMAP_SYMBOL_C = Symbol.iterator;
const WEAKMAP_SYMBOL_D = Symbol();
const WEAKMAP_SYMBOL_E = Symbol.for('');
const WEAKMAP_SYMBOL_F = Symbol('weakmap-id');
const WEAKMAP_SYMBOL_VALID_VALUES = [WEAKMAP_SYMBOL_A, WEAKMAP_SYMBOL_B, WEAKMAP_SYMBOL_C, WEAKMAP_SYMBOL_D, WEAKMAP_SYMBOL_E, WEAKMAP_SYMBOL_F, WEAKMAP_SYMBOL_A];
export function getWeakMapSymbolValidValues() { return WEAKMAP_SYMBOL_VALID_VALUES; }
