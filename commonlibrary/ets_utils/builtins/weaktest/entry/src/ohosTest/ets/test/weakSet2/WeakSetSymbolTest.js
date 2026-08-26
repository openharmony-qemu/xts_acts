/* Copyright (c) 2026 Huawei Device Co., Ltd. */
const WEAKSET_SYMBOL_A = Object(Symbol('weakset-test'));
const WEAKSET_SYMBOL_B = Object(Symbol.for('weakset-global-key'));
const WEAKSET_SYMBOL_C = Object(Symbol.iterator);
const WEAKSET_SYMBOL_D = Object(Symbol());
const WEAKSET_SYMBOL_E = Object(Symbol.for(''));
const WEAKSET_SYMBOL_F = Object(Symbol('weakset-id'));
const WEAKSET_SYMBOL_VALID_VALUES = [WEAKSET_SYMBOL_A, WEAKSET_SYMBOL_B, WEAKSET_SYMBOL_C, WEAKSET_SYMBOL_D, WEAKSET_SYMBOL_E, WEAKSET_SYMBOL_F, WEAKSET_SYMBOL_A];
export function getWeakSetSymbolValidValues() { return WEAKSET_SYMBOL_VALID_VALUES; }
