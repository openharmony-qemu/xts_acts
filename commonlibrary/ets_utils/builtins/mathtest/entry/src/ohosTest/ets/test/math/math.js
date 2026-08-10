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

export function observeMathAbsValueOfConversion() {
    const input = {
        valueOf() {
            return -7;
        }
    };
    return Math.abs(input);
}

export function observeMathFloorToStringFallback() {
    const input = {
        valueOf() {
            return {};
        },
        toString() {
            return '4.8';
        }
    };
    return Math.floor(input);
}

export function observeMathAtan2ConversionOrder() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return 1;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 1;
        }
    };
    return { result: Math.atan2(first, second), trace: trace.join(',') };
}

export function observeMathPowConversionOrder() {
    const trace = [];
    const base = {
        valueOf() {
            trace.push('base');
            return 2;
        }
    };
    const exponent = {
        valueOf() {
            trace.push('exponent');
            return 3;
        }
    };
    return { result: Math.pow(base, exponent), trace: trace.join(',') };
}

export function observeMathMaxConversionOrder() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return 3;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 7;
        }
    };
    const third = {
        valueOf() {
            trace.push('third');
            return 5;
        }
    };
    return { result: Math.max(first, second, third), trace: trace.join(',') };
}

export function observeMathMinConversionOrder() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return 3;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return -7;
        }
    };
    const third = {
        valueOf() {
            trace.push('third');
            return 5;
        }
    };
    return { result: Math.min(first, second, third), trace: trace.join(',') };
}

export function observeMathHypotConversionOrder() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return 3;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 4;
        }
    };
    return { result: Math.hypot(first, second), trace: trace.join(',') };
}

export function observeMathAbsUndefinedConversion() {
    return Math.abs(undefined);
}

export function observeMathAbsNullConversion() {
    return Math.abs(null);
}

export function observeMathAbsBooleanConversion() {
    return Math.abs(true);
}

export function observeMathAbsFalseConversion() {
    return Math.abs(false);
}

export function observeMathAbsEmptyStringConversion() {
    return Math.abs('');
}

export function observeMathAbsWhitespaceStringConversion() {
    return Math.abs('   ');
}

export function observeMathAbsInvalidStringConversion() {
    return Math.abs('not-a-number');
}

export function observeMathAbsEmptyArrayConversion() {
    return Math.abs([]);
}

export function observeMathAbsSingleElementArrayConversion() {
    return Math.abs([-6.5]);
}

export function observeMathAbsMultiElementArrayConversion() {
    return Math.abs([1, 2]);
}

export function observeMathAbsNumberObjectConversion() {
    return Math.abs(new Number(-9));
}

export function observeMathAbsValueOfPrecedence() {
    const trace = [];
    const input = {
        valueOf() {
            trace.push('valueOf');
            return -8;
        },
        toString() {
            trace.push('toString');
            return '-99';
        }
    };
    return { result: Math.abs(input), trace: trace.join(',') };
}

export function observeMathAbsSymbolToPrimitive() {
    const trace = [];
    const input = {
        [Symbol.toPrimitive](hint) {
            trace.push(hint);
            return -12;
        },
        valueOf() {
            trace.push('valueOf');
            return -99;
        }
    };
    return { result: Math.abs(input), trace: trace.join(',') };
}

export function observeMathClz32ObjectConversion() {
    const input = {
        valueOf() {
            return 4294967297;
        }
    };
    return Math.clz32(input);
}

export function observeMathImulObjectConversionOrder() {
    const trace = [];
    const left = {
        valueOf() {
            trace.push('left');
            return -6;
        }
    };
    const right = {
        valueOf() {
            trace.push('right');
            return 7;
        }
    };
    return { result: Math.imul(left, right), trace: trace.join(',') };
}

export function observeMathFroundObjectConversion() {
    const input = {
        valueOf() {
            return 1.5;
        }
    };
    return Math.fround(input);
}

export function observeMathRoundNegativeStringZero() {
    return Math.round('-0.1');
}

export function observeMathSignNegativeStringZero() {
    return Math.sign('-0');
}

export function observeMathMaxMixedPrimitiveConversion() {
    return Math.max('8', false, null);
}

export function observeMathMinUndefinedConversion() {
    return Math.min(4, undefined);
}

export function observeMathPowArrayConversion() {
    return Math.pow([2], [3]);
}

export function observeMathAtan2BooleanConversion() {
    return Math.atan2(true, false);
}

export function observeMathAbsValueOfErrorPropagation() {
    const trace = [];
    const sentinel = new Error('math-abs-sentinel');
    const input = {
        valueOf() {
            trace.push('valueOf');
            throw sentinel;
        }
    };
    try {
        Math.abs(input);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathFloorValueOfAbruptCompletion() {
    const trace = [];
    const sentinel = new Error('math-floor-sentinel');
    const input = {
        valueOf() {
            trace.push('valueOf');
            throw sentinel;
        },
        toString() {
            trace.push('toString');
            return '5.5';
        }
    };
    try {
        Math.floor(input);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathAtan2FirstErrorStopsSecond() {
    const trace = [];
    const sentinel = new Error('math-atan2-sentinel');
    const first = {
        valueOf() {
            trace.push('first');
            throw sentinel;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 1;
        }
    };
    try {
        Math.atan2(first, second);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathPowBaseErrorStopsExponent() {
    const trace = [];
    const sentinel = new Error('math-pow-sentinel');
    const base = {
        valueOf() {
            trace.push('base');
            throw sentinel;
        }
    };
    const exponent = {
        valueOf() {
            trace.push('exponent');
            return 3;
        }
    };
    try {
        Math.pow(base, exponent);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathMaxMiddleErrorStopsFollowing() {
    const trace = [];
    const sentinel = new Error('math-max-sentinel');
    const first = {
        valueOf() {
            trace.push('first');
            return 1;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            throw sentinel;
        }
    };
    const third = {
        valueOf() {
            trace.push('third');
            return 3;
        }
    };
    try {
        Math.max(first, second, third);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathHypotFirstErrorStopsSecond() {
    const trace = [];
    const sentinel = new Error('math-hypot-sentinel');
    const first = {
        valueOf() {
            trace.push('first');
            throw sentinel;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 4;
        }
    };
    try {
        Math.hypot(first, second);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathImulFirstErrorStopsSecond() {
    const trace = [];
    const sentinel = new Error('math-imul-sentinel');
    const first = {
        valueOf() {
            trace.push('first');
            throw sentinel;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 4;
        }
    };
    try {
        Math.imul(first, second);
        return {
            errorName: '',
            errorMessage: '',
            sameError: false,
            trace: trace.join(',')
        };
    } catch (error) {
        return {
            errorName: error.name,
            errorMessage: error.message,
            sameError: error === sentinel,
            trace: trace.join(',')
        };
    }
}

export function observeMathMaxConvertsAfterNaN() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return NaN;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return 2;
        }
    };
    const third = {
        valueOf() {
            trace.push('third');
            return 3;
        }
    };
    return { result: Math.max(first, second, third), trace: trace.join(',') };
}

export function observeMathHypotConvertsAfterInfinity() {
    const trace = [];
    const first = {
        valueOf() {
            trace.push('first');
            return Infinity;
        }
    };
    const second = {
        valueOf() {
            trace.push('second');
            return NaN;
        }
    };
    const third = {
        valueOf() {
            trace.push('third');
            return 3;
        }
    };
    return { result: Math.hypot(first, second, third), trace: trace.join(',') };
}

function observePropertyDescriptor(owner, key) {
    const descriptor = Object.getOwnPropertyDescriptor(owner, key);
    return {
        value: descriptor.value,
        writable: descriptor.writable,
        enumerable: descriptor.enumerable,
        configurable: descriptor.configurable
    };
}

export function observeMathPiDescriptor() {
    return observePropertyDescriptor(Math, 'PI');
}

export function observeMathAbsDescriptor() {
    const descriptor = observePropertyDescriptor(Math, 'abs');
    return {
        sameFunction: descriptor.value === Math.abs,
        writable: descriptor.writable,
        enumerable: descriptor.enumerable,
        configurable: descriptor.configurable
    };
}

export function observeMathToStringTagDescriptor() {
    const descriptor = observePropertyDescriptor(Math, Symbol.toStringTag);
    return {
        value: descriptor.value,
        writable: descriptor.writable,
        enumerable: descriptor.enumerable,
        configurable: descriptor.configurable
    };
}

export function observeMathPrototypeIdentity() {
    return Object.getPrototypeOf(Math) === Object.prototype;
}

export function observeMathObjectString() {
    return Object.prototype.toString.call(Math);
}

export function observeMathConstantsAreOwnProperties() {
    const names = ['E', 'LN10', 'LN2', 'LOG10E', 'LOG2E', 'PI', 'SQRT1_2', 'SQRT2'];
    return names.every((name) => Object.prototype.hasOwnProperty.call(Math, name));
}

export function observeMathConstantTypes() {
    const values = [Math.E, Math.LN10, Math.LN2, Math.LOG10E, Math.LOG2E, Math.PI, Math.SQRT1_2, Math.SQRT2];
    return values.every((value) => typeof value === 'number');
}

export function observeMathConstantReadStability() {
    const first = [Math.E, Math.LN10, Math.LN2, Math.LOG10E, Math.LOG2E, Math.PI, Math.SQRT1_2, Math.SQRT2];
    const second = [Math.E, Math.LN10, Math.LN2, Math.LOG10E, Math.LOG2E, Math.PI, Math.SQRT1_2, Math.SQRT2];
    return first.every((value, index) => value === second[index]);
}

export function observeDetachedMathAbs() {
    const detached = Math.abs;
    return detached(-13);
}

export function observeDetachedMathPow() {
    const detached = Math.pow;
    return detached(3, 4);
}

export function observeMathMethodLengths() {
    return {
        random: Math.random.length,
        abs: Math.abs.length,
        pow: Math.pow.length,
        max: Math.max.length
    };
}

export function observeMathAbsFunctionMetadata() {
    return {
        name: Math.abs.name,
        hasPrototype: Object.prototype.hasOwnProperty.call(Math.abs, 'prototype')
    };
}
