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

// Decorators defined in TypeScript file - Various Function Forms
// This file demonstrates all possible function forms in TS/JS that can be used as decorators

// Global counters and metadata storage (using plain objects for .ts compatibility)
let DECORATOR_LOG_COUNTER: number = 0;
let DECORATOR_CALL_COUNT: number = 0;
let DECORATOR_INSTANCE_COUNT: number = 0;

// Simple metadata storage using global Set and Map (plain objects)
const metadataStore: Set<string> = new Set<string>();
const configStore: Map<string, string> = new Map<string, string>();

export const CLASS_DECORATOR_METADATA_TS: Set<string> = metadataStore;
export const CLASS_CONFIG_METADATA_TS: Map<string, string> = configStore;
export const CLASS_VALIDATION_METADATA_TS: Map<string, string> = new Map<string, string>();

// ==================== Form 1: Regular Function Declaration ====================
export function RegularFunctionDecorator(target: Function): void {
  console.info(`[RegularFunction] Applied to: ${target.name}`);
  console.info(`[DEBUG] Before: metadata.size=${CLASS_DECORATOR_METADATA_TS.size}`);
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_RegularFunctionDecorator');
  console.info(`[DEBUG] After: metadata.size=${CLASS_DECORATOR_METADATA_TS.size}`);
  console.info(`[DEBUG] Check: has('${target.name}_RegularFunctionDecorator')=${CLASS_DECORATOR_METADATA_TS.has(target.name + '_RegularFunctionDecorator')}`);
  DECORATOR_LOG_COUNTER++;
}

export function RegularFunctionWithValidation(target: Function): void {
  if (!target.prototype.hasOwnProperty('validate')) {
    console.warn(`[RegularFunctionWithValidation] WARN: ${target.name} should have validate()`);
  }
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_RegularFunctionWithValidation');
}

// ==================== Form 2: Arrow Function Expression ====================
export const ArrowFunctionDecorator = (target: Function): void => {
  console.info(`[ArrowFunction] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_ArrowFunctionDecorator');
  DECORATOR_CALL_COUNT++;
};

export const ArrowFunctionWithInternalLogic = (target: Function): void => {
  const checkMethod = (): boolean => target.prototype.hasOwnProperty('execute');
  const logResult = (): void => console.info(`[ArrowFunctionWithInternalLogic] has execute: ${checkMethod()}`);
  
  logResult();
  if (!checkMethod()) {
    console.warn(`[ArrowFunctionWithInternalLogic] WARN: ${target.name} should have execute()`);
  }
  
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_ArrowFunctionWithInternalLogic');
};

// ==================== Form 3: Function Expression (Converted to Arrow for ArkTS) ====================
export const FunctionExpressionDecorator = (target: Function): void => {
  console.info(`[FunctionExpression] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_FunctionExpressionDecorator');
};

export const FunctionExpressionWithClosure = (target: Function): void => {
  const capturedClassName = target.name;
  const validateLater = (): void => {
    console.info(`[FunctionExpressionWithClosure] Captured class: ${capturedClassName}`);
  };
  
  validateLater();
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_FunctionExpressionWithClosure');
  CLASS_CONFIG_METADATA_TS.set(target.name + '_ClosureConfig', `captured:${capturedClassName}`);
};

// ==================== Form 4: Anonymous Function (Converted to Arrow for ArkTS) ====================
export const AnonymousFunctionDecorator = (target: Function): void => {
  console.info(`[AnonymousFunction] Applied to: ${target.name}`);
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_AnonymousFunctionDecorator');
};

export const AnonymousFunctionWithCallback = (target: Function): void => {
  const callbackValidation = (callback: (result: boolean) => void): void => {
    const hasMethod = target.prototype.hasOwnProperty('callbackExecute');
    callback(hasMethod);
  };
  
  callbackValidation((result: boolean): void => {
    if (!result) {
      console.warn(`[AnonymousFunctionWithCallback] WARN: ${target.name} should have callbackExecute()`);
    }
  });
  
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_AnonymousFunctionWithCallback');
};

// ==================== Form 5: Immediately Invoked Function Expression (IIFE) ====================
export const IIFEDecorator: ((target: Function) => void) = (() => {
  const prefix = 'iife_v1';
  const initializedAt = Date.now();
  
  console.info(`[IIFEDecorator] IIFE initialized with prefix: ${prefix}`);
  
  return (target: Function): void => {
    console.info(`[IIFEDecorator] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_IIFEDecorator_' + prefix);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_IIFEConfig', `prefix:${prefix},init:${initializedAt}`);
  };
})();

export const IIFEWithComplexSetup: ((target: Function) => void) = (() => {
  const setupSteps = ['init', 'validate', 'configure', 'apply'];
  const config = new Map<string, string>();
  
  for (const step of setupSteps) {
    config.set(step, step + '_completed');
  }
  
  console.info(`[IIFEWithComplexSetup] Setup completed with ${setupSteps.length} steps`);
  
  return (target: Function): void => {
    console.info(`[IIFEWithComplexSetup] Applied to: ${target.name} with ${config.size} configs`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_IIFEWithComplexSetup');
    CLASS_CONFIG_METADATA_TS.set(target.name + '_IIFEComplexConfig', `steps:${setupSteps.length}`);
  };
})();

// ==================== Form 6: Factory Function (Parameterized) ====================
export function FactoryFunctionDecorator(tag: string): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[FactoryFunction] Applied with tag=${tag} to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_FactoryFunction_' + tag);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_FactoryConfig', `tag:${tag}`);
  };
}

export function FactoryFunctionWithMultipleParams(config: { name: string; version: number; enabled: boolean }): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[FactoryFunctionWithMultipleParams] name=${config.name}, version=${config.version}, enabled=${config.enabled}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_FactoryFunctionWithMultipleParams');
    CLASS_CONFIG_METADATA_TS.set(target.name + '_FactoryMultiConfig', `name:${config.name},version:${config.version},enabled:${config.enabled}`);
  };
}

// ==================== Form 7: Arrow Function Factory ====================
export const ArrowFunctionFactoryDecorator = (category: string): ((target: Function) => void) => {
  return (target: Function): void => {
    console.info(`[ArrowFunctionFactory] Applied with category=${category} to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_ArrowFunctionFactory_' + category);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_ArrowFactoryConfig', `category:${category}`);
  };
};

export const ArrowFunctionFactoryWithValidation = (rules: string[]): ((target: Function) => void) => {
  return (target: Function): void => {
    console.info(`[ArrowFunctionFactoryWithValidation] Applied with ${rules.length} rules to: ${target.name}`);
    
    for (const rule of rules) {
      if (!target.prototype.hasOwnProperty(rule)) {
        console.warn(`[ArrowFunctionFactoryWithValidation] WARN: Missing method ${rule}`);
      }
    }
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_ArrowFunctionFactoryWithValidation');
    CLASS_VALIDATION_METADATA_TS.set(target.name + '_ArrowFactoryValidation', `rules:${rules.length}`);
  };
};

// ==================== Form 8: Higher-Order Function ====================
export function HigherOrderFunctionDecorator(baseDecorator: (target: Function) => void): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[HigherOrderFunction] Applying base decorator to: ${target.name}`);
    baseDecorator(target);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_HigherOrderFunctionDecorator');
  };
}

export function HigherOrderFunctionWithChain(decorators: ((target: Function) => void)[]): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[HigherOrderFunctionWithChain] Applying ${decorators.length} decorators to: ${target.name}`);
    
    for (const decorator of decorators) {
      decorator(target);
    }
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_HigherOrderFunctionWithChain');
    CLASS_CONFIG_METADATA_TS.set(target.name + '_HigherOrderChainConfig', `count:${decorators.length}`);
  };
}

export const HigherOrderFunctionArrow = (wrapper: (target: Function) => void): ((target: Function) => void) => {
  return (target: Function): void => {
    console.info(`[HigherOrderFunctionArrow] Wrapping decorator for: ${target.name}`);
    wrapper(target);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_HigherOrderFunctionArrow');
  };
};

// ==================== Form 9: Currying Function ====================
export function CurryingFunctionDecorator(step1: string): (step2: number) => (target: Function) => void {
  return (step2: number): (target: Function) => void => {
    return (target: Function): void => {
      console.info(`[CurryingFunction] step1=${step1}, step2=${step2}, target=${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_CurryingFunction_' + step1 + '_' + step2.toString());
      CLASS_CONFIG_METADATA_TS.set(target.name + '_CurryingConfig', `step1:${step1},step2:${step2}`);
    };
  };
}

export function CurryingFunctionMultiStep(a: string): (b: number) => (c: boolean) => (target: Function) => void {
  return (b: number): (c: boolean) => (target: Function) => void => {
    return (c: boolean): (target: Function) => void => {
      return (target: Function): void => {
        console.info(`[CurryingFunctionMultiStep] a=${a}, b=${b}, c=${c}, target=${target.name}`);
        CLASS_DECORATOR_METADATA_TS.add((target.name + '_CurryingMulti_' + a + '_' + b.toString() + '_' + c.toString()));
        CLASS_CONFIG_METADATA_TS.set(target.name + '_CurryingMultiConfig', `a:${a},b:${b},c:${c}`);
      };
    };
  };
}

export const CurryingFunctionArrow = (prefix: string): ((suffix: string) => ((target: Function) => void)) => {
  return (suffix: string): ((target: Function) => void) => {
    return (target: Function): void => {
      console.info(`[CurryingFunctionArrow] prefix=${prefix}, suffix=${suffix}, target=${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_CurryingArrow_' + prefix + '_' + suffix);
      CLASS_CONFIG_METADATA_TS.set(target.name + '_CurryingArrowConfig', `prefix:${prefix},suffix:${suffix}`);
    };
  };
};

// ==================== Form 10: Conditional Decorator (No null return in ArkTS) ====================
export function ConditionalDecorator(enable: boolean): (target: Function) => void {
  return (target: Function): void => {
    if (enable) {
      console.info(`[ConditionalDecorator] Enabled, applied to: ${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_ConditionalDecorator_enabled');
    } else {
      console.info(`[ConditionalDecorator] Disabled, skip ${target.name}`);
    }
  };
}

export function ConditionalDecoratorWithConfig(config: { enable: boolean; mode: string }): (target: Function) => void {
  return (target: Function): void => {
    if (config.enable) {
      console.info(`[ConditionalDecoratorWithConfig] Enabled with mode=${config.mode}, applied to: ${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_ConditionalDecoratorWithConfig_' + config.mode);
      CLASS_CONFIG_METADATA_TS.set(target.name + '_ConditionalConfig', `mode:${config.mode}`);
    } else {
      console.info(`[ConditionalDecoratorWithConfig] Disabled for mode: ${config.mode}, skip ${target.name}`);
    }
  };
}

export const ConditionalDecoratorArrow = (condition: boolean): ((target: Function) => void) => {
  return (target: Function): void => {
    if (condition) {
      console.info(`[ConditionalDecoratorArrow] Condition true, applied to: ${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_ConditionalDecoratorArrow_true');
    } else {
      console.info(`[ConditionalDecoratorArrow] Condition false, skip ${target.name}`);
    }
  };
};

// ==================== Form 11: Async-Style Decorator (Note: Decorator itself cannot be async) ====================
export function AsyncStyleDecorator(target: Function): void {
  const simulateAsyncValidation = (): Promise<boolean> => {
    return new Promise<boolean>((resolve): void => {
      const hasAsyncMethod = target.prototype.hasOwnProperty('asyncExecute');
      resolve(hasAsyncMethod);
    });
  };
  
  const promise = simulateAsyncValidation();
  promise.then((result): void => {
    if (!result) {
      console.warn(`[AsyncStyleDecorator] WARN: ${target.name} should have asyncExecute()`);
    }
  });
  
  console.info(`[AsyncStyleDecorator] Applied async-style to: ${target.name}`);
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_AsyncStyleDecorator');
}

export function AsyncStyleFactoryDecorator(config: { timeout: number; retry: number }): (target: Function) => void {
  return (target: Function): void => {
    const simulateAsyncConfig = (): Promise<void> => {
      return new Promise<void>((resolve): void => {
        console.info(`[AsyncStyleFactoryDecorator] timeout=${config.timeout}, retry=${config.retry}`);
        resolve();
      });
    };
    
    const promise = simulateAsyncConfig();
    promise.then(() => {
      console.info(`[AsyncStyleFactoryDecorator] Async config validated for: ${target.name}`);
    });
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_AsyncStyleFactoryDecorator');
    CLASS_CONFIG_METADATA_TS.set(target.name + '_AsyncStyleFactoryConfig', `timeout:${config.timeout},retry:${config.retry}`);
  };
}

export const AsyncStyleArrowDecorator = (target: Function): void => {
  const simulateAsyncCheck = (): Promise<void> => {
    return new Promise<void>((resolve): void => {
      console.info(`[AsyncStyleArrowDecorator] Checking async compatibility for: ${target.name}`);
      resolve();
    });
  };
  
  simulateAsyncCheck().then(() => {
    console.info(`[AsyncStyleArrowDecorator] Async check completed`);
  });
  
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_AsyncStyleArrowDecorator');
};

// ==================== Form 12: Generator-Style Decorator (Note: Decorator itself cannot be generator) ====================
export function GeneratorStyleDecorator(target: Function): void {
  const simulateGeneratorSteps = (): string[] => {
    const steps: string[] = [];
    steps.push('yield_step1');
    steps.push('yield_step2');
    steps.push('yield_step3');
    return steps;
  };
  
  const steps = simulateGeneratorSteps();
  console.info(`[GeneratorStyleDecorator] Simulated ${steps.length} generator steps`);
  
  for (const step of steps) {
    console.info(`[GeneratorStyleDecorator] Processing: ${step}`);
  }
  
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_GeneratorStyleDecorator');
  CLASS_CONFIG_METADATA_TS.set(target.name + '_GeneratorStyleConfig', `steps:${steps.length}`);
}

export function GeneratorStyleFactoryDecorator(iterations: number): (target: Function) => void {
  return (target: Function): void => {
    const simulateIterations = (): number[] => {
      const results: number[] = [];
      for (let i = 0; i < iterations; i++) {
        results.push(i);
      }
      return results;
    };
    
    const iterationResults = simulateIterations();
    console.info(`[GeneratorStyleFactoryDecorator] Iterations=${iterations}, Results=${iterationResults.length}`);
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_GeneratorStyleFactory_' + iterations.toString());
    CLASS_CONFIG_METADATA_TS.set(target.name + '_GeneratorStyleFactoryConfig', `iterations:${iterations}`);
  };
}

// ==================== Form 13: Callback-Style Decorator ====================
export function CallbackStyleDecorator(target: Function): void {
  const callbackValidation = (callback: (className: string, isValid: boolean) => void): void => {
    const isValid = target.prototype.hasOwnProperty('callbackExecute');
    callback(target.name, isValid);
  };
  
  callbackValidation((className, isValid): void => {
    console.info(`[CallbackStyleDecorator] Callback result: className=${className}, isValid=${isValid}`);
    if (!isValid) {
      console.warn(`[CallbackStyleDecorator] WARN: ${className} should have callbackExecute()`);
    }
  });
  
  CLASS_DECORATOR_METADATA_TS.add(target.name + '_CallbackStyleDecorator');
}

export function CallbackStyleFactoryDecorator(callbackHandler: (result: string) => void): (target: Function) => void {
  return (target: Function): void => {
    const performValidation = (cb: (res: string) => void): void => {
      const result = `validated_${target.name}`;
      cb(result);
    };
    
    performValidation(callbackHandler);
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_CallbackStyleFactoryDecorator');
  };
}
  


// ==================== Form 14: Object Method Decorator ====================
const DecoratorObject = {
  objectMethodDecorator: (target: Function): void => {
    console.info(`[ObjectMethodDecorator] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_ObjectMethodDecorator');
  },
  
  objectMethodArrowDecorator: (target: Function): void => {
    console.info(`[ObjectMethodArrowDecorator] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_ObjectMethodArrowDecorator');
  },
  
  objectMethodFactoryDecorator: (config: string): ((target: Function) => void) => {
    return (target: Function): void => {
      console.info(`[ObjectMethodFactoryDecorator] config=${config}, applied to: ${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_ObjectMethodFactory_' + config);
      CLASS_CONFIG_METADATA_TS.set(target.name + '_ObjectMethodFactoryConfig', `config:${config}`);
    };
  }
};

export const ObjectMethodDecorator = DecoratorObject.objectMethodDecorator;
export const ObjectMethodArrowDecorator = DecoratorObject.objectMethodArrowDecorator;
export const ObjectMethodFactoryDecorator = DecoratorObject.objectMethodFactoryDecorator;

// ==================== Form 15: Class Method Decorator (defined in class) ====================
class DecoratorClass {
  static classMethodDecorator(target: Function): void {
    console.info(`[ClassMethodDecorator] Applied to: ${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_ClassMethodDecorator');
  }
  
  static classMethodFactoryDecorator(level: number): ((target: Function) => void) {
    return (target: Function): void => {
      console.info(`[ClassMethodFactoryDecorator] level=${level}, applied to: ${target.name}`);
      CLASS_DECORATOR_METADATA_TS.add(target.name + '_ClassMethodFactory_' + level.toString());
      CLASS_CONFIG_METADATA_TS.set(target.name + '_ClassMethodFactoryConfig', `level:${level}`);
    };
  }
}

export const ClassMethodDecorator = DecoratorClass.classMethodDecorator;
export const ClassMethodFactoryDecorator = DecoratorClass.classMethodFactoryDecorator;

// ==================== Form 16: Destructuring Parameter Decorator ====================
export function DestructuringParameterDecorator({ prefix, suffix }: { prefix: string; suffix: string }): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[DestructuringParameterDecorator] prefix=${prefix}, suffix=${suffix}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_DestructuringParameter_' + prefix + '_' + suffix);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_DestructuringConfig', `prefix:${prefix},suffix:${suffix}`);
  };
}

export const DestructuringParameterArrowDecorator = ({ name, value }: { name: string; value: number }): ((target: Function) => void) => {
  return (target: Function): void => {
    console.info(`[DestructuringParameterArrowDecorator] name=${name}, value=${value}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_DestructuringArrow_' + name);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_DestructuringArrowConfig', `name:${name},value:${value}`);
  };
};

// ==================== Form 17: Default Parameter Decorator ====================
export function DefaultParameterDecorator(tag: string = 'default_tag', level: number = 1): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[DefaultParameterDecorator] tag=${tag}, level=${level}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_DefaultParameter_' + tag + '_' + level.toString());
    CLASS_CONFIG_METADATA_TS.set(target.name + '_DefaultParameterConfig', `tag:${tag},level:${level}`);
  };
}

export const DefaultParameterArrowDecorator = (enabled: boolean = true, mode: string = 'default'): ((target: Function) => void) => {
  return (target: Function): void => {
    console.info(`[DefaultParameterArrowDecorator] enabled=${enabled}, mode=${mode}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_DefaultParameterArrow_' + mode);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_DefaultParameterArrowConfig', `enabled:${enabled},mode:${mode}`);
  };
};

// ==================== Form 18: Rest Parameter Decorator ====================
export function RestParameterDecorator(...tags: string[]): (target: Function) => void {
  return (target: Function): void => {
    console.info(`[RestParameterDecorator] tags=${tags.join(',')}, target=${target.name}`);
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_RestParameter_' + tags.join('_'));
    CLASS_CONFIG_METADATA_TS.set(target.name + '_RestParameterConfig', `tags:${tags.length}`);
  };
}

// ==================== Form 19: Template Literal Decorator ====================
export function TemplateLiteralDecorator(category: string): (target: Function) => void {
  return (target: Function): void => {
    const message = `[TemplateLiteralDecorator] Category: ${category}, Applied to: ${target.name}`;
    console.info(message);
    
    const configKey = `${target.name}_TemplateLiteral_${category}`;
    CLASS_DECORATOR_METADATA_TS.add(configKey);
    
    const configValue = `category:${category},timestamp:${Date.now()}`;
    CLASS_CONFIG_METADATA_TS.set(`${target.name}_TemplateLiteralConfig`, configValue);
  };
}

// ==================== Form 20: Spread Operator Decorator ====================
export function SpreadOperatorDecorator(config: { prefix: string; suffix: string; level: number }): (target: Function) => void {
  return (target: Function): void => {
    const { prefix, suffix, level } = config;
    
    console.info(`[SpreadOperatorDecorator] prefix=${prefix}, suffix=${suffix}, level=${level}, target=${target.name}`);
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_SpreadOperator_' + prefix + '_' + suffix);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_SpreadOperatorConfig', `prefix:${prefix},suffix:${suffix},level:${level}`);
  };
}

// ==================== Form 21: Union Type Parameter Decorator ====================
export function UnionTypeParameterDecorator(value: string | number): (target: Function) => void {
  return (target: Function): void => {
    const valueType = typeof value;
    console.info(`[UnionTypeParameterDecorator] value=${value}, type=${valueType}, target=${target.name}`);
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_UnionType_' + value.toString());
    CLASS_CONFIG_METADATA_TS.set(target.name + '_UnionTypeConfig', `value:${value},type:${valueType}`);
  };
}

// ==================== Form 22: Optional Parameter Decorator ====================
export function OptionalParameterDecorator(required: string, optional?: number): (target: Function) => void {
  return (target: Function): void => {
    const actualOptional = optional !== undefined ? optional : 0;
    console.info(`[OptionalParameterDecorator] required=${required}, optional=${actualOptional}, target=${target.name}`);
    
    CLASS_DECORATOR_METADATA_TS.add(target.name + '_OptionalParameter_' + required);
    CLASS_CONFIG_METADATA_TS.set(target.name + '_OptionalParameterConfig', `required:${required},optional:${actualOptional}`);
  };
}

// ==================== Metadata Accessor Functions ====================
export function getDecoratorLogCounter(): number {
  return DECORATOR_LOG_COUNTER;
}

export function getDecoratorCallCount(): number {
  return DECORATOR_CALL_COUNT;
}

export function getDecoratorInstanceCount(): number {
  return DECORATOR_INSTANCE_COUNT;
}

export function isDecoratorApplied(className: string, decoratorName: string): boolean {
  return CLASS_DECORATOR_METADATA_TS.has(className + '_' + decoratorName);
}

export function getClassConfig(className: string, configType: string): string | undefined {
  return CLASS_CONFIG_METADATA_TS.get(className + '_' + configType);
}

export function getValidationConfig(className: string): string | undefined {
  return CLASS_VALIDATION_METADATA_TS.get(className + '_ValidationConfig');
}

// ==================== Decorator Metadata Cleaner (for testing) ====================
export function clearAllMetadataTS(): void {
  CLASS_DECORATOR_METADATA_TS.clear();
  CLASS_CONFIG_METADATA_TS.clear();
  CLASS_VALIDATION_METADATA_TS.clear();
  DECORATOR_LOG_COUNTER = 0;
  DECORATOR_CALL_COUNT = 0;
  DECORATOR_INSTANCE_COUNT = 0;
}

export function getDecoratorLogCounterTS(): number {
  return DECORATOR_LOG_COUNTER;
}

export function getDecoratorCallCountTS(): number {
  return DECORATOR_CALL_COUNT;
}