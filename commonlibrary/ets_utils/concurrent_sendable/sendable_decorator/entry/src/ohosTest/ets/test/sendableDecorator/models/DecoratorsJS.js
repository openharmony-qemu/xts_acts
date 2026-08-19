/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 */

// Decorators defined in JavaScript file - Various Function Forms (JS Style)
// This file demonstrates all possible function forms in JS that can be used as decorators


// Global counters and metadata storage (JS style)
let decorator_log_counter = 0;
let decorator_call_count = 0;
let decorator_instance_count = 0;

export const CLASS_DECORATOR_METADATA_JS = new Map();
export const CLASS_CONFIG_METADATA_JS = new Map();

// ==================== Form 1: Regular Function Declaration (JS) ====================
export function RegularFunctionDecoratorJS(target) {
  console.info(`[RegularFunctionJS] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_RegularFunctionDecoratorJS', true);
  decorator_log_counter++;
}

export function RegularFunctionWithValidationJS(target) {
  if (!target.prototype.hasOwnProperty('validate')) {
    console.warn(`[RegularFunctionWithValidationJS] WARN: ${target.name} should have validate()`);
  }
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_RegularFunctionWithValidationJS', true);
}

// ==================== Form 2: Arrow Function Expression (JS) ====================
export const ArrowFunctionDecoratorJS = (target) => {
  console.info(`[ArrowFunctionJS] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_ArrowFunctionDecoratorJS', true);
  decorator_call_count++;
};

export const ArrowFunctionWithInternalLogicJS = (target) => {
  const checkMethod = () => target.prototype.hasOwnProperty('execute');
  const logResult = () => console.info(`[ArrowFunctionWithInternalLogicJS] has execute: ${checkMethod()}`);
  
  logResult();
  if (!checkMethod()) {
    console.warn(`[ArrowFunctionWithInternalLogicJS] WARN: ${target.name} should have execute()`);
  }
  
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_ArrowFunctionWithInternalLogicJS', true);
};

// ==================== Form 3: Function Expression (JS) ====================
export const FunctionExpressionDecoratorJS = function(target) {
  console.info(`[FunctionExpressionJS] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_FunctionExpressionDecoratorJS', true);
};

export const FunctionExpressionWithClosureJS = function(target) {
  const capturedClassName = target.name;
  const validateLater = function() {
    console.info(`[FunctionExpressionWithClosureJS] Captured class: ${capturedClassName}`);
  };
  
  validateLater();
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_FunctionExpressionWithClosureJS', true);
  CLASS_CONFIG_METADATA_JS.set(target.name + '_ClosureConfigJS', `captured:${capturedClassName}`);
};

// ==================== Form 4: Anonymous Function (JS) ====================
export const AnonymousFunctionDecoratorJS = function(target) {
  console.info(`[AnonymousFunctionJS] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_AnonymousFunctionDecoratorJS', true);
};

export const AnonymousFunctionWithCallbackJS = function(target) {
  const callbackValidation = function(callback) {
    const hasMethod = target.prototype.hasOwnProperty('callbackExecute');
    callback(target.name, hasMethod);
  };
  
  callbackValidation(function(className, isValid) {
    console.info(`[AnonymousFunctionWithCallbackJS] Callback result: className=${className}, isValid=${isValid}`);
    if (!isValid) {
      console.warn(`[AnonymousFunctionWithCallbackJS] WARN: ${className} should have callbackExecute()`);
    }
  });
  
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_AnonymousFunctionWithCallbackJS', true);
};

// ==================== Form 5: IIFE (JS) ====================
export const IIFEDecoratorJS = (function() {
  const prefix = 'iife_js_v1';
  const initializedAt = Date.now();
  
  console.info(`[IIFEDecoratorJS] IIFE initialized with prefix: ${prefix}`);
  
  return function(target) {
    console.info(`[IIFEDecoratorJS] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_IIFEDecoratorJS_' + prefix, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_IIFEConfigJS', `prefix:${prefix},init:${initializedAt}`);
  };
})();

export const IIFEWithComplexSetupJS = (function() {
  const setupSteps = ['init', 'validate', 'configure', 'apply'];
  const config = new Map();
  
  for (const step of setupSteps) {
    config.set(step, step + '_completed');
  }
  
  console.info(`[IIFEWithComplexSetupJS] Setup completed with ${setupSteps.length} steps`);
  
  return function(target) {
    console.info(`[IIFEWithComplexSetupJS] Applied to: ${target.name} with ${config.size} configs`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_IIFEWithComplexSetupJS', true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_IIFEComplexConfigJS', `steps:${setupSteps.length}`);
  };
})();

// ==================== Form 6: Factory Function (JS) ====================
export function FactoryFunctionDecoratorJS(tag) {
  return function(target) {
    console.info(`[FactoryFunctionJS] Applied with tag=${tag} to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_FactoryFunctionJS_' + tag, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_FactoryConfigJS', `tag:${tag}`);
  };
}

export function FactoryFunctionWithMultipleParamsJS(config) {
  return function(target) {
    console.info(`[FactoryFunctionWithMultipleParamsJS] name=${config.name}, version=${config.version}, enabled=${config.enabled}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_FactoryFunctionWithMultipleParamsJS', true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_FactoryMultiConfigJS', `name:${config.name},version:${config.version},enabled:${config.enabled}`);
  };
}

// ==================== Form 7: Arrow Function Factory (JS) ====================
export const ArrowFunctionFactoryDecoratorJS = (category) => {
  return (target) => {
    console.info(`[ArrowFunctionFactoryJS] Applied with category=${category} to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ArrowFunctionFactoryJS_' + category, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_ArrowFactoryConfigJS', `category:${category}`);
  };
};

export const ArrowFunctionFactoryWithValidationJS = (rules) => {
  return (target) => {
    console.info(`[ArrowFunctionFactoryWithValidationJS] Applied with ${rules.length} rules to: ${target.name}`);
    
    for (const rule of rules) {
      if (!target.prototype.hasOwnProperty(rule)) {
        console.warn(`[ArrowFunctionFactoryWithValidationJS] WARN: Missing method ${rule}`);
      }
    }
    
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ArrowFunctionFactoryWithValidationJS', true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_ArrowFactoryValidationJS', `rules:${rules.length}`);
  };
};

// ==================== Form 8: Higher-Order Function (JS) ====================
export function HigherOrderFunctionDecoratorJS(baseDecorator) {
  return function(target) {
    console.info(`[HigherOrderFunctionJS] Applying base decorator to: ${target.name}`);
    baseDecorator(target);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_HigherOrderFunctionDecoratorJS', true);
  };
}

export function HigherOrderFunctionWithChainJS(decorators) {
  return function(target) {
    console.info(`[HigherOrderFunctionWithChainJS] Applying ${decorators.length} decorators to: ${target.name}`);
    
    for (const decorator of decorators) {
      decorator(target);
    }
    
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_HigherOrderFunctionWithChainJS', true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_HigherOrderChainConfigJS', `count:${decorators.length}`);
  };
}

export const HigherOrderFunctionArrowJS = (wrapper) => {
  return (target) => {
    console.info(`[HigherOrderFunctionArrowJS] Wrapping decorator for: ${target.name}`);
    wrapper(target);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_HigherOrderFunctionArrowJS', true);
  };
};

// ==================== Form 9: Currying Function (JS) ====================
export function CurryingFunctionDecoratorJS(step1) {
  return function(step2) {
    return function(target) {
      console.info(`[CurryingFunctionJS] step1=${step1}, step2=${step2}, target=${target.name}`);
      CLASS_DECORATOR_METADATA_JS.set(target.name + '_CurryingFunctionJS_' + step1 + '_' + step2, true);
      CLASS_CONFIG_METADATA_JS.set(target.name + '_CurryingConfigJS', `step1:${step1},step2:${step2}`);
    };
  };
}

export function CurryingFunctionMultiStepJS(a) {
  return function(b) {
    return function(c) {
      return function(target) {
        console.info(`[CurryingFunctionMultiStepJS] a=${a}, b=${b}, c=${c}, target=${target.name}`);
        CLASS_DECORATOR_METADATA_JS.set(target.name + '_CurryingMultiJS_' + a + '_' + b + '_' + c, true);
        CLASS_CONFIG_METADATA_JS.set(target.name + '_CurryingMultiConfigJS', `a:${a},b:${b},c:${c}`);
      };
    };
  };
}

export const CurryingFunctionArrowJS = (prefix) => {
  return (suffix) => {
    return (target) => {
      console.info(`[CurryingFunctionArrowJS] prefix=${prefix}, suffix=${suffix}, target=${target.name}`);
      CLASS_DECORATOR_METADATA_JS.set(target.name + '_CurryingArrowJS_' + prefix + '_' + suffix, true);
      CLASS_CONFIG_METADATA_JS.set(target.name + '_CurryingArrowConfigJS', `prefix:${prefix},suffix:${suffix}`);
    };
  };
};

// ==================== Form 10: Conditional Decorator (JS) ====================
export function ConditionalDecoratorJS(enable) {
  if (!enable) {
    console.info(`[ConditionalDecoratorJS] Disabled, returning skip decorator`);
    return function(target) {
      console.info(`[ConditionalDecoratorJS] Skip disabled decorator for: ${target.name}`);
    };
  }
  
  return function(target) {
    console.info(`[ConditionalDecoratorJS] Enabled, applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ConditionalDecoratorJS_enabled', true);
  };
}

export const ConditionalDecoratorArrowJS = (condition) => {
  if (!condition) {
    console.info(`[ConditionalDecoratorArrowJS] Condition false, skip decorator`);
    return (target) => {
      console.info(`[ConditionalDecoratorArrowJS] Skip decorator for: ${target.name}`);
    };
  }
  
  return (target) => {
    console.info(`[ConditionalDecoratorArrowJS] Condition true, applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ConditionalDecoratorArrowJS_true', true);
  };
};

// ==================== Form 11: Async-Style Decorator (JS) ====================
export function AsyncStyleDecoratorJS(target) {
  const simulateAsyncValidation = () => {
    return new Promise((resolve) => {
      const hasAsyncMethod = target.prototype.hasOwnProperty('asyncExecute');
      resolve(hasAsyncMethod);
    });
  };
  
  const promise = simulateAsyncValidation();
  promise.then((result) => {
    if (!result) {
      console.warn(`[AsyncStyleDecoratorJS] WARN: ${target.name} should have asyncExecute()`);
    }
  });
  
  console.info(`[AsyncStyleDecoratorJS] Applied async-style to: ${target.name}`);
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_AsyncStyleDecoratorJS', true);
}

export const AsyncStyleArrowDecoratorJS = (target) => {
  const simulateAsyncCheck = () => {
    return new Promise((resolve) => {
      console.info(`[AsyncStyleArrowDecoratorJS] Checking async compatibility for: ${target.name}`);
      resolve();
    });
  };
  
  simulateAsyncCheck().then(() => {
    console.info(`[AsyncStyleArrowDecoratorJS] Async check completed`);
  });
  
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_AsyncStyleArrowDecoratorJS', true);
};

// ==================== Form 12: Generator-Style Decorator (JS) ====================
export function GeneratorStyleDecoratorJS(target) {
  const simulateGeneratorSteps = function*() {
    yield 'yield_step1';
    yield 'yield_step2';
    yield 'yield_step3';
  };
  
  const steps = [];
  const generator = simulateGeneratorSteps();
  for (const step of generator) {
    steps.push(step);
  }
  
  console.info(`[GeneratorStyleDecoratorJS] Simulated ${steps.length} generator steps`);
  
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_GeneratorStyleDecoratorJS', true);
  CLASS_CONFIG_METADATA_JS.set(target.name + '_GeneratorStyleConfigJS', `steps:${steps.length}`);
}

// ==================== Form 13: Callback-Style Decorator (JS) ====================
export function CallbackStyleDecoratorJS(target) {
  const callbackValidation = function(callback) {
    const isValid = target.prototype.hasOwnProperty('callbackExecute');
    callback(target.name, isValid);
  };
  
  callbackValidation(function(className, isValid) {
    console.info(`[CallbackStyleDecoratorJS] Callback result: className=${className}, isValid=${isValid}`);
    if (!isValid) {
      console.warn(`[CallbackStyleDecoratorJS] WARN: ${className} should have callbackExecute()`);
    }
  });
  
  CLASS_DECORATOR_METADATA_JS.set(target.name + '_CallbackStyleDecoratorJS', true);
}

// ==================== Form 14: Object Method Decorator (JS) ====================
const DecoratorObjectJS = {
  objectMethodDecorator: function(target) {
    console.info(`[ObjectMethodDecoratorJS] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ObjectMethodDecoratorJS', true);
  },
  
  objectMethodArrowDecorator: (target) => {
    console.info(`[ObjectMethodArrowDecoratorJS] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ObjectMethodArrowDecoratorJS', true);
  }
};

export const ObjectMethodDecoratorJS = DecoratorObjectJS.objectMethodDecorator;
export const ObjectMethodArrowDecoratorJS = DecoratorObjectJS.objectMethodArrowDecorator;

// ==================== Form 15: Class Method Decorator (JS) ====================
class DecoratorClassJS {
  static classMethodDecorator(target) {
    console.info(`[ClassMethodDecoratorJS] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_ClassMethodDecoratorJS', true);
  }
}

export const ClassMethodDecoratorJS = DecoratorClassJS.classMethodDecorator;

// ==================== Form 16: Destructuring Parameter (JS) ====================
export function DestructuringParameterDecoratorJS({ prefix, suffix }) {
  return function(target) {
    console.info(`[DestructuringParameterDecoratorJS] prefix=${prefix}, suffix=${suffix}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_DestructuringParameterJS_' + prefix + '_' + suffix, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_DestructuringConfigJS', `prefix:${prefix},suffix:${suffix}`);
  };
}

export const DestructuringParameterArrowDecoratorJS = ({ name, value }) => {
  return (target) => {
    console.info(`[DestructuringParameterArrowDecoratorJS] name=${name}, value=${value}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_DestructuringArrowJS_' + name, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_DestructuringArrowConfigJS', `name:${name},value:${value}`);
  };
};

// ==================== Form 17: Default Parameter (JS) ====================
export function DefaultParameterDecoratorJS(tag = 'default_tag_js', level = 1) {
  return function(target) {
    console.info(`[DefaultParameterDecoratorJS] tag=${tag}, level=${level}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_DefaultParameterJS_' + tag + '_' + level, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_DefaultParameterConfigJS', `tag:${tag},level:${level}`);
  };
}

export const DefaultParameterArrowDecoratorJS = (enabled = true, mode = 'default_js') => {
  return (target) => {
    console.info(`[DefaultParameterArrowDecoratorJS] enabled=${enabled}, mode=${mode}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_DefaultParameterArrowJS_' + mode, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_DefaultParameterArrowConfigJS', `enabled:${enabled},mode:${mode}`);
  };
};

// ==================== Form 18: Rest Parameter (JS) ====================
export function RestParameterDecoratorJS(...tags) {
  return function(target) {
    console.info(`[RestParameterDecoratorJS] tags=${tags.join(',')}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_RestParameterJS_' + tags.join('_'), true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_RestParameterConfigJS', `tags:${tags.length}`);
  };
}

// ==================== Form 19: Template Literal (JS) ====================
export function TemplateLiteralDecoratorJS(category) {
  return function(target) {
    const message = `[TemplateLiteralDecoratorJS] Category: ${category}, Applied to: ${target.name}`;
    console.info(message);
    
    CLASS_DECORATOR_METADATA_JS.set(`${target.name}_TemplateLiteralJS_${category}`, true);
    CLASS_CONFIG_METADATA_JS.set(`${target.name}_TemplateLiteralConfigJS`, `category:${category},timestamp:${Date.now()}`);
  };
}

// ==================== Form 20: Spread Operator (JS) ====================
export function SpreadOperatorDecoratorJS(config) {
  return function(target) {
    const { prefix, suffix, level } = config;
    const combinedConfig = { ...config, targetName: target.name };
    
    console.info(`[SpreadOperatorDecoratorJS] spread=${JSON.stringify(combinedConfig)}`);
    
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_SpreadOperatorJS_' + prefix + '_' + suffix, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_SpreadOperatorConfigJS', `prefix:${prefix},suffix:${suffix},level:${level}`);
  };
}

// ==================== Form 21: Union Type (JS - Dynamic) ====================
export function UnionTypeParameterDecoratorJS(value) {
  return function(target) {
    const valueType = typeof value;
    console.info(`[UnionTypeParameterDecoratorJS] value=${value}, type=${valueType}, target=${target.name}`);
    
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_UnionTypeJS_' + value, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_UnionTypeConfigJS', `value:${value},type:${valueType}`);
  };
}

// ==================== Form 22: Optional Parameter (JS) ====================
export function OptionalParameterDecoratorJS(required, optional) {
  const actualOptional = optional !== undefined ? optional : 0;
  
  return function(target) {
    console.info(`[OptionalParameterDecoratorJS] required=${required}, optional=${actualOptional}, target=${target.name}`);
    
    CLASS_DECORATOR_METADATA_JS.set(target.name + '_OptionalParameterJS_' + required, true);
    CLASS_CONFIG_METADATA_JS.set(target.name + '_OptionalParameterConfigJS', `required:${required},optional:${actualOptional}`);
  };
}

// ==================== Metadata Accessor Functions (JS) ====================
export function getDecoratorLogCounterJS() {
  return decorator_log_counter;
}

export function getDecoratorCallCountJS() {
  return decorator_call_count;
}

export function isDecoratorAppliedJS(className, decoratorName) {
  return CLASS_DECORATOR_METADATA_JS.has(className + '_' + decoratorName);
}

export function clearAllMetadataJS() {
  CLASS_DECORATOR_METADATA_JS.clear();
  CLASS_CONFIG_METADATA_JS.clear();
  decorator_log_counter = 0;
  decorator_call_count = 0;
  decorator_instance_count = 0;
}